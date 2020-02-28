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
#ifndef PlatformMouseEvent_h
#define PlatformMouseEvent_h
/**
 *  @file  PlatformMouseEvent.t
 *  PlatformMouseEvent description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:05 $
 */
#include "BALBase.h"

#include "IntPoint.h"
#include <wtf/Platform.h>






namespace WKAL {
    
    // These button numbers match the ones used in the DOM API, 0 through 2, except for NoButton which isn't specified.
    enum MouseButton { NoButton = -1, LeftButton, MiddleButton, RightButton };
    enum MouseEventType { MouseEventMoved, MouseEventPressed, MouseEventReleased, MouseEventScroll };
    
    class PlatformMouseEvent : public WKALBase {
    public:
    /**
     * PlatformMouseEvent default constructor
     * @code
     * PlatformMouseEvent pme = new PlatformMouseEvent();
     * @endcode
     */
        PlatformMouseEvent();

    /**
     * PlatformMouseEvent constructor
     * @param[in] : event position (x, y)
     * @param[in] : global event position (x, y)
     * @param[in] : button type (NoButton, LeftButton, MiddleButton, RightButton) 
     * @param[in] : event type (MouseEventMoved, MouseEventPressed, MouseEventReleased, MouseEventScroll)
     * @param[in] : click count ( 1 simple click, 2 double click...)
     * @param[in] : shift modifier
     * @param[in] : ctrl modifier
     * @param[in] : alt modifier
     * @param[in] : meta modifier
     * @param[in] : timestamp
     * @code
     * PlatformMouseEvent pme = new PlatformMouseEvent(IntPoint(0,0), IntPoint(0,0), NoButton, MouseEventMoved, 0, false, false, false, false, currentTime());
     * @endcode
     */
        PlatformMouseEvent(const IntPoint& pos, const IntPoint& globalPos, MouseButton button, MouseEventType eventType,
                           int clickCount, bool shift, bool ctrl, bool alt, bool meta, double timestamp);

    /**
     * get event position
     * @param[out] : event position
     * @code
     * IntPoint p = ev->pos()
     * @endcode
     */
        const IntPoint& pos() const ;

    /**
     * get x position
     * @param[out] : x position
     * @code
     * int x = ev->x();
     * @endcode
     */
        int x() const ;

    /**
     * get y position
     * @param[out] : y position
     * @code
     * int y = ev->y();
     * @endcode
     */
        int y() const ;

    /**
     * get global x position
     * @param[out] : global x position
     * @code
     * int x = ev->globalX();
     * @endcode
     */
        int globalX() const ;

    /**
     * get global y position
     * @param[out] : global y position
     * @code
     * int y = ev->globalY();
     * @endcode
     */
        int globalY() const ;

    /**
     * get mouse button
     * @param[out] : mouse button
     * @code
     * MouseButton mb = ev->button();
     * @endcode
     */
        MouseButton button() const ;

    /**
     * get mouse event type
     * @param[out] : event type
     * @code
     * MouseEventType met = ev->eventType();
     * @endcode
     */
        MouseEventType eventType() const ;

    /**
     * get the click count
     * @param[out] : click count
     * @code
     * int cc = ev->clickCount();
     * @endcode
     */
        int clickCount() const ;

    /**
     * get shift modifier
     * @param[out] : shift modifier
     * @code
     * bool sm = ev->shiftKey();
     * @endcode
     */
        bool shiftKey() const ;
    /**
     * get ctrl modifier
     * @param[out] : ctrl modifier
     * @code
     * bool cm = ev->ctrlKey();
     * @endcode
     */
        bool ctrlKey() const ;

    /**
     * get alt modifier
     * @param[out] : alt modifier
     * @code
     * bool am = ev->altKey();
     * @endcode
     */
        bool altKey() const ;

    /**
     * get meta modifier
     * @param[out] : meta modifier
     * @code
     * bool mm = ev->metaKey();
     * @endcode
     */
        bool metaKey() const ;

    /**
     * get all modifier values
     * @param[out] : modifier values
     * @code
     * unsigned am = ev->modifierFlags();
     * @endcode
     */
        unsigned modifierFlags() const ;
        
    /**
     * get timestamp value
     * @param[out] : time in second
     * @code
     * @endcode
     */
        double timestamp() const ;

    /**
     *  PlatformMouseEvent constructor
     * @param[in] : platform mouse button event
     * @code
     * PlatformMouseEvent pme = new PlatformMouseEvent(platformButtonEvent)
     * @endcode
     */
        PlatformMouseEvent(BalEventButton*);
    /**
     *  PlatformMouseEvent constructor
     * @param[in] : platform mouse motion event
     * @code
     * PlatformMouseEvent pme = new PlatformMouseEvent(platformMotionEvent)
     * @endcode
     */
        PlatformMouseEvent(BalEventMotion*);



    private:
        IntPoint m_position;
        IntPoint m_globalPosition;
        MouseButton m_button;
        MouseEventType m_eventType;
        int m_clickCount;
        bool m_shiftKey;
        bool m_ctrlKey;
        bool m_altKey;
        bool m_metaKey;
        double m_timestamp; // unit: seconds
        unsigned m_modifierFlags;
    };


} // namespace WKAL

#endif // PlatformMouseEvent_h




