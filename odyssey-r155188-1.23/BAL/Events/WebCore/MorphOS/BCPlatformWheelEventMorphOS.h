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

#ifndef PlatformWheelEvent_h
#define PlatformWheelEvent_h

#include "IntPoint.h"
#include "PlatformEvent.h"
#include "BALBase.h"

#undef accept

namespace WebCore {

// Wheel events come in two flavors:
// The ScrollByPixelWheelEvent is a fine-grained event that specifies the precise number of pixels to scroll.  It is sent directly by MacBook touchpads on OS X,
// and synthesized in other cases where platforms generate line-by-line scrolling events.
// The ScrollByPageWheelEvent indicates that the wheel event should scroll an entire page.  In this case WebCore's built in paging behavior is used to page
// up and down (you get the same behavior as if the user was clicking in a scrollbar track to page up or page down).  Page scrolling only works in the vertical direction.
 enum PlatformWheelEventGranularity { ScrollByPageWheelEvent, ScrollByPixelWheelEvent, ScrollByPixelVelocityWheelEvent };
 
class PlatformWheelEvent : public PlatformEvent {
    public:
        PlatformWheelEvent copyTurningVerticalTicksIntoHorizontalTicks() const
        {
	    PlatformWheelEvent copy = *this;

	    copy.m_deltaX = copy.m_deltaY;
	    copy.m_deltaY = 0;
	    copy.m_wheelTicksX = copy.m_wheelTicksY;
	    copy.m_wheelTicksY = 0;

	    return copy;
	}

        const IntPoint& position() const { return m_position; } // PlatformWindow coordinates.
        const IntPoint& globalPosition() const { return m_globalPosition; } // Screen coordinates.

        float deltaX() const { return m_deltaX; }
        float deltaY() const { return m_deltaY; }

        float wheelTicksX() const { return m_wheelTicksX; }
        float wheelTicksY() const { return m_wheelTicksY; }

        PlatformWheelEventGranularity granularity() const { return m_granularity; }

	bool directionInvertedFromDevice() const { return m_directionInvertedFromDevice; }

	void setUseLatchedEventNode(bool b) { m_useLatchedEventNode = b; }
	bool useLatchedEventNode() const { return m_useLatchedEventNode; } 

        PlatformWheelEvent(BalEventScroll*);

    private:
        IntPoint m_position;
        IntPoint m_globalPosition;
        float m_deltaX;
        float m_deltaY;
        float m_wheelTicksX;
        float m_wheelTicksY;
        PlatformWheelEventGranularity m_granularity;
	bool m_directionInvertedFromDevice;
	bool m_useLatchedEventNode; 
    };

} // namespace WebCore

#endif // PlatformWheelEvent_h
