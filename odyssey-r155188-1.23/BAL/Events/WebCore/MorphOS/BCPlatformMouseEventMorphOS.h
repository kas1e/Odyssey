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

#ifndef PlatformMouseEvent_h
#define PlatformMouseEvent_h

#include "IntPoint.h"
#include "PlatformEvent.h"
#include <wtf/Platform.h>
#include "BALBase.h"

namespace WebCore {
    
    // These button numbers match the ones used in the DOM API, 0 through 2, except for NoButton which isn't specified.
    enum MouseButton { NoButton = -1, LeftButton, MiddleButton, RightButton };
    
    class PlatformMouseEvent : public PlatformEvent{
    public:
        PlatformMouseEvent()
	    : PlatformEvent(PlatformEvent::MouseMoved)
	    , m_button(NoButton)
            , m_clickCount(0)
            , m_timestamp(0)
            , m_modifierFlags(0)
        {
        }

    PlatformMouseEvent(const IntPoint& position, const IntPoint& globalPosition, MouseButton button, PlatformEvent::Type type,
		       int clickCount, bool shiftKey, bool ctrlKey, bool altKey, bool metaKey, double timestamp)
	: PlatformEvent(type, shiftKey, ctrlKey, altKey, metaKey, timestamp)
	    , m_position(position)
	    , m_globalPosition(globalPosition)
	    , m_button(button)
            , m_clickCount(clickCount)
            , m_modifierFlags(0)
        {
        }

	const IntPoint& position() const { return m_position; }
	const IntPoint& globalPosition() const { return m_globalPosition; }
#if ENABLE(POINTER_LOCK)
        int movementX() const { return m_movementDelta.x(); }
        int movementY() const { return m_movementDelta.y(); }
        const IntPoint& movementDelta() const { return m_movementDelta; }
#endif
        MouseButton button() const { return m_button; }
        int clickCount() const { return m_clickCount; }
        unsigned modifierFlags() const { return m_modifierFlags; }

        PlatformMouseEvent(BalEventButton*);

    private:
        IntPoint m_position;
        IntPoint m_globalPosition;
        MouseButton m_button;
        int m_clickCount;
	double m_timestamp;
        unsigned m_modifierFlags;
#if ENABLE(POINTER_LOCK)
	IntPoint m_movementDelta;
#endif
    };

} // namespace WebCore

#endif // PlatformMouseEvent_h
