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
/**
 *  @file  PlatformWheelEvent.t
 *  PlatformWheelEvent description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:05 $
 */
#include "BALBase.h"

#include "IntPoint.h"






namespace WKAL {

    class PlatformWheelEvent : public WKALBase {
    public:
    /**
     * get event position
     * @param[out] : position
     * @code
     * IntPoint p = ev->pos();
     * @endcode
     */
        const IntPoint& pos() const ;

    /**
     * get event global position
     * @param[out] : global position
     * @code
     * IntPoint p = ev->globalPos();
     * @endcode
     */
        const IntPoint& globalPos() const ;

    /**
     * get delta x value
     * @param[out] : delta x value
     * @code
     * float dx  = ev->deltaX();
     * @endcode
     */
        float deltaX(bool withScrollSensibilityFactor = true) const ;

    /**
     * get delta y value
     * @param[out] :  delta y value
     * @code
     * float dy = ev->deltaY();
     * @endcode
     */
        float deltaY(bool withScrollSensibilityFactor = true) const ;


    /**
     * Check wether horizontal scroll is enabled.
     * @param[out] : returns true if horizontal scroll is enabled.
     * @code
     * @endcode
     */
        bool isPageXScrollModeEnabled() const ;


    /**
     * Check wether vertical scroll is enabled.
     * @param[out] : returns true if vertical scroll is enabled.
     * @code
     * @endcode
     */
        bool isPageYScrollModeEnabled() const ;

    /**
     * get if the event is accepted
     * @param[out] : accepted value
     * @code
     * bool ia = ev->isAccepted();
     * @endcode
     */
        bool isAccepted() const ;

    /**
     * get shitf modifier
     * @param[out] : shift value
     * @code
     * bool sm = ev->shiftKey();
     * @endcode
     */
        bool shiftKey() const ;

    /**
     * get ctrl modifier
     * @param[out] : ctrl value
     * @code
     * bool cm = ev->ctrlKey();
     * @endcode
     */
        bool ctrlKey() const ;

    /**
     * get alt modifier
     * @param[out] : alt value
     * @code
     * bool cm = ev->altKey();
     * @endcode
     */
        bool altKey() const ;

    /**
     * get meta modifier
     * @param[out] : meta value
     * @code
     * bool cm = ev->metaKey();
     * @endcode
     */
        bool metaKey() const ;

    /**
     * get x position
     * @param[out] : x position
     * @code
     * int x = ev->x():
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
     * get x global position
     * @param[out] : x global position
     * @code
     * int gx = ev->globalX();
     * @endcode
     */
        int globalX() const ;

    /**
     * get y global position
     * @param[out] : y global position
     * @code
     * int gy = ev->globalY();
     * @endcode
     */
        int globalY() const ;

    /**
     * accept the wheel event
     * @code
     * ev->accept();
     * @endcode
     */
        void accept() ;

    /**
     * ignore the wheel event
     * @code
     * ev->ignore();
     * @endcode
     */
        void ignore() ;
        
    /**
     * test if the wheel is continuous
     * @param[out] : continuous value
     * @code
     * bool cv = ev->isContinuous();
     * @endcode
     */
        bool isContinuous() const ;

    /**
     * get the continuous delta x value
     * @param[out] : continuous delta x value
     * @code
     * float x = ev->continuousDeltaX();
     * @endcode
     */
        float continuousDeltaX() const ;

    /**
     * get the continuous delta y value
     * @param[out] : continuous delta y value
     * @code
     * float y = ev->continuousDeltaY();
     * @endcode
     */
        float continuousDeltaY() const ;

    /**
     *  PlatformWheelEvent constructor
     * @param[in] : platform scroll event
     * @code
     * PlatformWheelEvent ev = new PlatformWheelEvent(platformScrollEvent);
     * @endcode
     */
        PlatformWheelEvent(BalEventScroll*);

    private:
        IntPoint m_position;
        IntPoint m_globalPosition;
        float m_deltaX;
        float m_deltaY;
        bool m_isAccepted;
        bool m_shiftKey;
        bool m_ctrlKey;
        bool m_altKey;
        bool m_metaKey;
        bool m_isContinuous;
        float m_continuousDeltaX;
        float m_continuousDeltaY;
    };

} // namespace WKAL

#endif // PlatformWheelEvent_h


