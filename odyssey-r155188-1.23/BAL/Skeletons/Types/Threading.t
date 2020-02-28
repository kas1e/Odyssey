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
#ifndef Threading_h
#define Threading_h
/**
 *  @file  Threading.t
 *  Threading description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#include <wtf/Assertions.h>
#include <wtf/Locker.h>
#include <wtf/Noncopyable.h>

// On wx/Win, including windows.h here causes multiply-defined symbol errors
// for libjpeg and wx, and also wx needs to include windows.h itself first for wx
// includes to work right. So until we can find a better solution to this problem,
// on wx, we workaround including windows.h here.

#include <pthread.h>



#include <stdint.h>

// For portability, we do not use thread-safe statics natively supported by some compilers (e.g. gcc).
#define AtomicallyInitializedStatic(T, name) \
    WTF::atomicallyInitializedStaticMutex->lock(); \
    static T name; \
    WTF::atomicallyInitializedStaticMutex->unlock();

namespace WTF {

typedef uint32_t ThreadIdentifier;
    /**
     *   description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
typedef void* (*ThreadFunction)(void* argument);

// Returns 0 if thread creation failed
    /**
     *  createThread description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
ThreadIdentifier createThread(ThreadFunction, void*, const char* threadName);
    /**
     *  currentThread description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
ThreadIdentifier currentThread();
    /**
     *  isMainThread description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
bool isMainThread();
    /**
     *  waitForThreadCompletion description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
int waitForThreadCompletion(ThreadIdentifier, void**);
    /**
     *  detachThread description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
void detachThread(ThreadIdentifier);

typedef pthread_mutex_t PlatformMutex;
typedef pthread_cond_t PlatformCondition;
typedef GMutex* PlatformMutex;
typedef GCond* PlatformCondition;
typedef void* PlatformMutex;
typedef void* PlatformCondition;
    
class Mutex : public OWBALBase, Noncopyable {
public:
    /**
     *  Mutex description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    Mutex();
    /**
     *  ~Mutex description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    ~Mutex();

    /**
     *  lock description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void lock();
    /**
     *  tryLock description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool tryLock();
    /**
     *  unlock description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void unlock();

public:
    /**
     *  impl description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    PlatformMutex& impl() ;
private:
    PlatformMutex m_mutex;
};

typedef Locker<Mutex> MutexLocker;

class ThreadCondition : public OWBALBase, Noncopyable {
public:
    /**
     *  ThreadCondition description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    ThreadCondition();
    /**
     *  ~ThreadCondition description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    ~ThreadCondition();
    
    /**
     *  wait description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void wait(Mutex& mutex);
    // Returns true if the condition was signaled before the timeout, false if the timeout was reached
    /**
     *  timedWait description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool timedWait(Mutex&, double interval);
    /**
     *  signal description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void signal();
    /**
     *  broadcast description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void broadcast();
    
private:
    PlatformCondition m_condition;
};


template<class T> class ThreadSafeShared : public OWBALBase, Noncopyable {
public:

    /**
     *  atomicIncrement description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline void atomicIncrement(int volatile* addend) ;


    /**
     *  atomicDecrement description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline int atomicDecrement(int volatile* addend) ;

    /**
     *  ThreadSafeShared description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    ThreadSafeShared(int initialRefCount = 1);

    /**
     *  ref description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void ref();

    /**
     *  deref description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void deref();

    /**
     *  hasOneRef description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool hasOneRef();

    /**
     *  refCount description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    int refCount() const;

private:
    int m_refCount;
#if !USE(LOCKFREE_THREADSAFESHARED)
    mutable Mutex m_mutex;
#endif
};

// This function must be called from the main thread. It is safe to call it repeatedly.
// Darwin is an exception to this rule: it is OK to call it from any thread, the only requirement is that the calls are not reentrant.
    /**
     *  initializeThreading description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
void initializeThreading();

extern Mutex* atomicallyInitializedStaticMutex;

} // namespace WTF

using WTF::Mutex;
using WTF::MutexLocker;
using WTF::ThreadCondition;
using WTF::ThreadIdentifier;
using WTF::ThreadSafeShared;

using WTF::createThread;
using WTF::currentThread;
using WTF::isMainThread;
using WTF::detachThread;
using WTF::waitForThreadCompletion;

#endif // Threading_h


