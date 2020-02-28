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
#ifndef Timer_h
#define Timer_h
/**
 *  @file  Timer.t
 *  Timer description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:10 $
 */
#include "BALBase.h"

#include <wtf/Noncopyable.h>
#include <wtf/Vector.h>

namespace WebCore {

// Time intervals are all in seconds.

class TimerHeapElement;

class TimerBase : public WebCoreBase, Noncopyable {
public:
    /**
     * TimerBase default constructor
     * @code
     * TimerBase tb;
     * @endcode
     */
    TimerBase();

    /**
     * TimerBase destructor
     */
    virtual ~TimerBase();

    /**
     * start timer
     * @param[in] : next fire interval
     * @param[in] : repeat interval
     * @code
     * tb.start(n, r);
     * @endcode
     */
    void start(double nextFireInterval, double repeatInterval);

    /**
     * start timer repeating
     * @param[in] : repeat interval
     * @code
     * tb.startRepeating(r);
     * @endcode
     */
    void startRepeating(double repeatInterval) ;

    /**
     * start timer one shot
     * @param[in] : interval
     * @code
     * tb.startOneShot(i);
     * @endcode
     */
    void startOneShot(double interval) ;

    /**
     * stop timer
     * @code
     * tb.stop();
     * @endcode
     */
    void stop();

    /**
     * test if the timer is active
     * @param[out] : status
     * @code
     * bool i = tb.isActive();
     * @endcode
     */
    bool isActive() const;

    /**
     * get next fire interval
     * @param[out] : fire interval
     * @code
     * double n = tb.nextFireInterval();
     * @endcode
     */
    double nextFireInterval() const;

    /**
     * get repeat interval
     * @param[out] : repeat interval
     * @code
     * double r = tb.repeatInterval();
     * @endcode
     */
    double repeatInterval() const ;

    /**
     * augment repeat interval
     * @param[in] : delta
     * @code
     * tb.augmentRepeatInterval(d);
     * @endcode
     */
    void augmentRepeatInterval(double delta) ;

    /**
     * fire timers in nested event loop
     * @code
     * TimerBase::fireTimersInNestedEventLoop();
     * @endcode
     */
    static void fireTimersInNestedEventLoop();

private:
    /**
     *  fired
     */
    virtual void fired() = 0;

    /**
     * checkConsistency 
     */
    void checkConsistency() const;

    /**
     *  checkHeapIndex 
     */
    void checkHeapIndex() const;

    /**
     * setNextFireTime
     */
    void setNextFireTime(double);

    /**
     *  inHeap
     */
    bool inHeap() const ;

    /**
     *  heapDecreaseKey 
     */
    void heapDecreaseKey();

    /**
     *  heapDelete
     */
    void heapDelete();

    /**
     *  heapDeleteMin 
     */
    void heapDeleteMin();

    /**
     *  heapIncreaseKey
     */
    void heapIncreaseKey();

    /**
     *  heapInsert
     */
    void heapInsert();

    /**
     *  heapPop 
     */
    void heapPop();

    /**
     *  heapPopMin 
     */
    void heapPopMin();

    /**
     *  collectFiringTimers 
     */
    static void collectFiringTimers(double fireTime, Vector<TimerBase*>&);

    /**
     *  fireTimers 
     */
    static void fireTimers(double fireTime, const Vector<TimerBase*>&);

    /**
     *  sharedTimerFired
     */
    static void sharedTimerFired();

    double m_nextFireTime; // 0 if inactive
    double m_repeatInterval; // 0 if not repeating
    int m_heapIndex; // -1 if not in heap
    unsigned m_heapInsertionOrder; // Used to keep order among equal-fire-time timers

    /**
     *  updateSharedTimer 
     */
    friend void updateSharedTimer();

    /**
     *  setDeferringTimers 
     */
    friend void setDeferringTimers(bool);
    friend class TimerHeapElement;

    /**
     *  operator< 
     */
    friend bool operator<(const TimerHeapElement&, const TimerHeapElement&);
};

template <typename TimerFiredClass> class Timer : public WebCoreBase, public TimerBase {
public:
    /**
     * timer function template
     */
    typedef void (TimerFiredClass::*TimerFiredFunction)(Timer*);

    /**
     * Timer constructor
     * @param[in] : timer fired class
     * @param[in] : timer fired function
     */
    Timer(TimerFiredClass* o, TimerFiredFunction f);

private:
    /**
     *  fired
     */
    virtual void fired() ;

    TimerFiredClass* m_object;
    TimerFiredFunction m_function;
};


    /**
     * Set to true to prevent any timers from firing.
     * When set back to false, timers that were deferred will fire.
     */
bool isDeferringTimers();

    /**
     * setDeferringTimers
     */
void setDeferringTimers(bool);

}

#endif




