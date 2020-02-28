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
#ifndef Cursor_h
#define Cursor_h
/**
 *  @file  Cursor.t
 *  Cursor description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:12 $
 */
#include "BALBase.h"

#include <wtf/Platform.h>




namespace WKAL {

    class Image;
    class IntPoint;


    class Cursor : public WKALBase {
    public:
    /**
     * Cursor default constructor
     * @code
     * Cursor c;
     * @endcode
     */
        Cursor();

    /**
     * Cursor constructor
     * @param[in] : image
     * @param[in] : position
     * @code
     * Cursor *c = new Cursor(i, h);
     * @endcode
     */
        Cursor(Image*, const IntPoint& hotspot);

    /**
     * Cursor constructor by copy
     * @param[in] : Cursor
     * @code
     * Cursor *c = new Cursor(c1);
     * @endcode
     */
        Cursor(const Cursor&);

    /**
     * Cursor destructor
     * @code
     * delete c;
     * @endcode
     */
        ~Cursor();

    /**
     * operator= 
     * @param[in] : Cursor
     * @param[out] : Cursor
     * @code
     * Cursor c = c1;
     * @endcode
     */
        Cursor& operator=(const Cursor&);

    /**
     * Cursor constructor 
     * @param[in] : platform cursor
     * @code
     * Cursor *c = new Cursor(pc);
     * @endcode
     */
        Cursor(PlatformCursor);

    /**
     * get platform cursor
     * @param[out] : platform cursor
     * @code
     * PlatformCursor pc = c->impl();
     * @endcode
     */
        PlatformCursor impl() const ;

     private:
        PlatformCursor m_impl;
    };

    /**
     *  pointerCursor
     */
    const Cursor& pointerCursor();

    /**
     * crossCursor
     */
    const Cursor& crossCursor();

    /**
     * handCursor
     */
    const Cursor& handCursor();

    /**
     * moveCursor 
     */
    const Cursor& moveCursor();

    /**
     * iBeamCursor
     */
    const Cursor& iBeamCursor();

    /**
     * waitCursor
     */
    const Cursor& waitCursor();

    /**
     *  helpCursor
     */
    const Cursor& helpCursor();

    /**
     * eastResizeCursor 
     */
    const Cursor& eastResizeCursor();

    /**
     * northResizeCursor
     */
    const Cursor& northResizeCursor();

    /**
     * northEastResizeCursor 
     */
    const Cursor& northEastResizeCursor();

    /**
     * northWestResizeCursor
     */
    const Cursor& northWestResizeCursor();

    /**
     * southResizeCursor
     */
    const Cursor& southResizeCursor();

    /**
     * southEastResizeCursor
     */
    const Cursor& southEastResizeCursor();

    /**
     * southWestResizeCursor
     */
    const Cursor& southWestResizeCursor();

    /**
     * westResizeCursor
     */
    const Cursor& westResizeCursor();

    /**
     * northSouthResizeCursor
     */
    const Cursor& northSouthResizeCursor();

    /**
     * eastWestResizeCursor
     */
    const Cursor& eastWestResizeCursor();

    /**
     * northEastSouthWestResizeCursor
     */
    const Cursor& northEastSouthWestResizeCursor();

    /**
     * northWestSouthEastResizeCursor
     */
    const Cursor& northWestSouthEastResizeCursor();

    /**
     * columnResizeCursor
     */
    const Cursor& columnResizeCursor();

    /**
     * rowResizeCursor 
     */
    const Cursor& rowResizeCursor();


    /**
     * middlePanningCursor
     */
    const Cursor& middlePanningCursor();


    /**
     * eastPanningCursor 
     */
    const Cursor& eastPanningCursor();


    /**
     * northPanningCursor
     */
    const Cursor& northPanningCursor();


    /**
     * northEastPanningCursor 
     */
    const Cursor& northEastPanningCursor();


    /**
     * northWestPanningCursor
     */
    const Cursor& northWestPanningCursor();


    /**
     * southPanningCursor
     */
    const Cursor& southPanningCursor();


    /**
     * southEastPanningCursor
     */
    const Cursor& southEastPanningCursor();


    /**
     * southWestPanningCursor
     */
    const Cursor& southWestPanningCursor();


    /**
     * westPanningCursor
     */
    const Cursor& westPanningCursor();

    /**
     * verticalTextCursor
     */
    const Cursor& verticalTextCursor();

    /**
     * cellCursor
     */
    const Cursor& cellCursor();

    /**
     * contextMenuCursor
     */
    const Cursor& contextMenuCursor();

    /**
     * noDropCursor 
     */
    const Cursor& noDropCursor();

    /**
     * notAllowedCursor
     */
    const Cursor& notAllowedCursor();

    /**
     * progressCursor
     */
    const Cursor& progressCursor();

    /**
     * aliasCursor
     */
    const Cursor& aliasCursor();

    /**
     * zoomInCursor
     */
    const Cursor& zoomInCursor();

    /**
     * zoomOutCursor 
     */
    const Cursor& zoomOutCursor();

    /**
     * copyCursor 
     */
    const Cursor& copyCursor();

    /**
     * noneCursor
     */
    const Cursor& noneCursor();

} // namespace WKAL

#endif // Curs
