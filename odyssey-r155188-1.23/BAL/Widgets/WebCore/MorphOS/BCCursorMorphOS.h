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

#include "BALBase.h"
#include "Image.h"
#include "IntPoint.h"
#include <wtf/RefPtr.h>

namespace WebCore {

    enum enPointers
    {
        en_pointerCursor,
        en_crossCursor,
        en_handCursor,
        en_moveCursor,
        en_iBeamCursor,
        en_waitCursor,
        en_helpCursor,
        en_eastResizeCursor,
        en_northResizeCursor,
        en_northEastResizeCursor,
        en_northWestResizeCursor,
        en_southResizeCursor,
        en_southEastResizeCursor,
        en_southWestResizeCursor,
        en_westResizeCursor,
        en_northSouthResizeCursor,
        en_eastWestResizeCursor,
        en_northEastSouthWestResizeCursor,
        en_northWestSouthEastResizeCursor,
        en_columnResizeCursor,
        en_rowResizeCursor,
        en_middlePanningCursor,
        en_eastPanningCursor,
        en_northPanningCursor,
        en_northEastPanningCursor,
        en_northWestPanningCursor,
        en_southPanningCursor,
        en_southEastPanningCursor,
        en_southWestPanningCursor,
        en_westPanningCursor,
        en_verticalTextCursor,
        en_cellCursor,
        en_contextMenuCursor,
        en_noDropCursor,
        en_notAllowedCursor,
        en_progressCursor,
        en_aliasCursor,
        en_zoomInCursor,
        en_zoomOutCursor,
        en_copyCursor,
        en_noneCursor,
        en_grabCursor,
        en_grabbingCursor,
        en_SIZE
    };

    class Image;
    class IntPoint;

    class Cursor {
    public:
        Cursor()
        : m_impl(0)
        , m_dispose(false)
        , m_data(0)
        { }

        Cursor(Image*, const IntPoint& hotspot);

        Cursor(const Cursor& other)
        : m_impl(other.m_impl)
        , m_dispose(false)
        , m_data(0)
        { }

        Cursor(enPointers);
        ~Cursor();
        Cursor& operator=(const Cursor&);

        Cursor(PlatformCursor);
        PlatformCursor impl() const { return m_impl; }

     private:
        PlatformCursor m_impl;
        bool m_dispose;
        void* m_data;
    };

    const Cursor& pointerCursor();
    const Cursor& crossCursor();
    const Cursor& handCursor();
    const Cursor& moveCursor();
    const Cursor& iBeamCursor();
    const Cursor& waitCursor();
    const Cursor& helpCursor();
    const Cursor& eastResizeCursor();
    const Cursor& northResizeCursor();
    const Cursor& northEastResizeCursor();
    const Cursor& northWestResizeCursor();
    const Cursor& southResizeCursor();
    const Cursor& southEastResizeCursor();
    const Cursor& southWestResizeCursor();
    const Cursor& westResizeCursor();
    const Cursor& northSouthResizeCursor();
    const Cursor& eastWestResizeCursor();
    const Cursor& northEastSouthWestResizeCursor();
    const Cursor& northWestSouthEastResizeCursor();
    const Cursor& columnResizeCursor();
    const Cursor& rowResizeCursor();
    const Cursor& middlePanningCursor();
    const Cursor& eastPanningCursor();
    const Cursor& northPanningCursor();
    const Cursor& northEastPanningCursor();
    const Cursor& northWestPanningCursor();
    const Cursor& southPanningCursor();
    const Cursor& southEastPanningCursor();
    const Cursor& southWestPanningCursor();
    const Cursor& westPanningCursor();
    const Cursor& verticalTextCursor();
    const Cursor& cellCursor();
    const Cursor& contextMenuCursor();
    const Cursor& noDropCursor();
    const Cursor& notAllowedCursor();
    const Cursor& progressCursor();
    const Cursor& aliasCursor();
    const Cursor& zoomInCursor();
    const Cursor& zoomOutCursor();
    const Cursor& copyCursor();
    const Cursor& noneCursor();
    const Cursor& grabCursor();
    const Cursor& grabbingCursor();

} // namespace WebCore

#endif // Cursor_h
