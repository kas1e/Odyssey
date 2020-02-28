/*
 * Copyright (C) 2008 Pleyo.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1.  Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 * 2.  Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 * 3.  Neither the name of Pleyo nor the names of
 *     its contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY PLEYO AND ITS CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL PLEYO OR ITS CONTRIBUTORS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#include "config.h"
#include "SharedTimer.h"

#include "Assertions.h"
#include "CurrentTime.h"
#include "Threading.h"

#include <errno.h>
#include <semaphore.h>
#include <signal.h>
#include <sys/time.h>

// Override LOG_ERROR macro definition from Assertions.h, so we make sure
// error messages get logged to the console, even for a release builds
#if defined(LOG_ERROR)
#undef LOG_ERROR
#endif

#define LOG_ERROR(...)                      WTFReportError(__FILE__, __LINE__, WTF_PRETTY_FUNCTION, __VA_ARGS__)
#define LOG_SYSCALL_ERROR(unused)           LOG_ERROR("Call failed w/ error #%d: %s", errno, strerror(errno))

#define LOG_ERROR_ON_FAILURE(x)             do { if ((x) == -1) { LOG_SYSCALL_ERROR(); } } while(0)
#define LOG_ERROR_ON_FAILURE_AND_EXIT(x)    do { if ((x) == -1) { LOG_SYSCALL_ERROR(); exit(1); } } while(0)

namespace WebCore {

static sem_t threadReadySem;
static sem_t timerSignaledSem;

void (*sharedTimerFiredFunction)() = NULL;
void (*timerEventCallback)() = NULL;

void fireTimerIfNeeded()
{
    ASSERT(sharedTimerFiredFunction);
    sharedTimerFiredFunction();
}

void setTimerEventCallback(void(*callbackFunc)())
{
    ASSERT(callbackFunc);
    
    if (timerEventCallback == NULL)
        timerEventCallback = callbackFunc;
}

static void signalHandler(int signo)
{
    ASSERT(signo == SIGALRM);
    
    // Only async-signal safe system calls should be used here
    LOG_ERROR_ON_FAILURE(sem_post(&timerSignaledSem));
}

static void* timerThreadEntryPoint(void* data)
{
    ASSERT(timerEventCallback);
    
    LOG_ERROR_ON_FAILURE_AND_EXIT(sem_init(&timerSignaledSem, 0, 0));
    
    struct sigaction sa;
    sigemptyset(&sa.sa_mask);
    sa.sa_handler = signalHandler;
    sa.sa_flags = 0;
    
    // Set a signal handler for SIGALRM signals
    LOG_ERROR_ON_FAILURE_AND_EXIT(sigaction(SIGALRM, &sa, 0));
    
    // Signal the timer thread is now ready to handle timer events
    LOG_ERROR_ON_FAILURE(sem_post(&threadReadySem));
    
    // Wait indefinitely for signaled timer events
    while(true) {
        if (!sem_wait(&timerSignaledSem))
            timerEventCallback();
        else if (errno != EINTR)
            LOG_SYSCALL_ERROR();
    }
}

// Creates a separate thread to handle dispatching timer events. That 'timer' thread registers a signal
// handler for SIGALRM signals and then waits on a semaphore indefinitely. The semaphore is unlocked when
// the signal handler is invoked. The timer thread subsequently gets unblocked from the semaphore wait
// and then invokes the 'timerEventCallback' callback which is used to indicate that a timer event has
// occurred. Upon timer notice, the platform should invoke the fireTimerIfNeeded() routine which basically
// invokes the 'sharedTimerFiredFunction' callback, which is the actual WebCore callback routine to
// execute upon timer expiration.
void setSharedTimerFiredFunction(void (*callbackFunc)())
{
    ASSERT(callbackFunc);
    
    if (timerEventCallback == NULL) {
        LOG_ERROR("timerEventCallback is NULL");
        exit(1);
    }
    
    if (sharedTimerFiredFunction == NULL) {
        sharedTimerFiredFunction = callbackFunc;
        
        LOG_ERROR_ON_FAILURE_AND_EXIT(sem_init(&threadReadySem, 0, 0));
        
        ASSERT(isMainThread());
        
        // Create a separate thread to signal timer events through the timerEventCallback function
        ThreadIdentifier timerThreadID = createThread(timerThreadEntryPoint, NULL, "WebCore: Timers");
        
        if (!timerThreadID) {
            LOG_ERROR("Timer thread creation failed\n");
            exit(1);
        }
        
        // Synchronously wait for the timer thread to signal it's now ready to handle timer signals -
        // this prevents dropping early timer requests from WebCore
        LOG_ERROR_ON_FAILURE(sem_wait(&threadReadySem));

        detachThread(timerThreadID);
    }
}

// The fire time is relative to the classic POSIX epoch of January 1, 1970,
// as the result of currentTime() is.
void setSharedTimerFireTime(double fireTime) 
{
    ASSERT(sharedTimerFiredFunction);

    double interval = fireTime - currentTime();

    struct itimerval timer;
    timer.it_interval.tv_sec = 0;
    timer.it_interval.tv_usec = 0;
    
    if (interval <= 0.000001) {
        // Ensure the minimal setitimer resolution
        timer.it_value.tv_sec = 0;
        timer.it_value.tv_usec = 1;
    } else {
        timer.it_value.tv_sec = static_cast<long>(interval);
        timer.it_value.tv_usec = static_cast<long>((interval - timer.it_value.tv_sec) * 1000000.0);
    }
    
    ASSERT(timer.it_value.tv_sec || timer.it_value.tv_usec);
    LOG_ERROR_ON_FAILURE(setitimer(ITIMER_REAL, &timer, NULL));
}

void stopSharedTimer()
{
    struct itimerval timer;
    memset(&timer, 0, sizeof(timer));
    
    LOG_ERROR_ON_FAILURE(setitimer(ITIMER_REAL, &timer, NULL));
}

}
