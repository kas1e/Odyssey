/*
 * Copyright (C) 2009-2013 Fabien Coeurjoly.
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

#ifndef SharedTimer_h
#define SharedTimer_h

#include "wtf/Platform.h"

namespace WebCore {

    // Each thread has its own single instance of shared timer, which implements this interface.
    // This instance is shared by all timers in the thread.
    // Not intended to be used directly; use the Timer class instead.
    class SharedTimer {
    public:
      virtual ~SharedTimer() {}
      virtual void setFiredFunction(void (*)()) = 0;

      // The fire time is in seconds relative to the current monotonic clock time.
      virtual void setFireInterval(double) = 0;
      virtual void stop() = 0;
    };

    // Single timer, shared to implement all the timers managed by the Timer class.
    // Not intended to be used directly; use the Timer class instead.

    void setSharedTimerFiredFunction(void (*)());

    void setSharedTimerFireInterval(double interval);
    void stopSharedTimer();

    void fireTimerIfNeeded();

    // Implementation of SharedTimer for the main thread.
    class MainThreadSharedTimer : public SharedTimer {
    public:
      virtual void setFiredFunction(void (*function)())
        {
	  setSharedTimerFiredFunction(function);
        }

      virtual void setFireInterval(double interval)
        {
	  setSharedTimerFireInterval(interval);
        }

      virtual void stop()
        {
	  stopSharedTimer();
        }
    };
}

#endif
