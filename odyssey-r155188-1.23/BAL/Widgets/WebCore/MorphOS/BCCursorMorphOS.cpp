/*
 * Copyright (C) 2009 Joerg Strohmayer.
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

#include <wtf/Assertions.h>
#include <cstdio>
#include "BALBase.h"
#include "Cursor.h"
#include "NotImplemented.h"
#include <Image.h>
#include <string.h>
#include <proto/intuition.h>
#include <proto/icon.h>
#include <intuition/pointerclass.h>
#include <workbench/icon.h>

namespace WebCore {

static const CONST_STRPTR pointerFiles[en_SIZE][2] =
{
   { "PROGDIR:Resources/pointerCursor",                  0 },
   { "PROGDIR:Resources/crossCursor",                    "ENV:Sys/def_crosspointer" },
   { "PROGDIR:Resources/handCursor",                     "ENV:Sys/def_linkpointer" },
   { "PROGDIR:Resources/moveCursor",                     "ENV:Sys/def_handpointer" },
   { "PROGDIR:Resources/iBeamCursor",                    "ENV:Sys/def_textpointer" },
   { "PROGDIR:Resources/waitCursor",                     0 },
   { "PROGDIR:Resources/helpCursor",                     "ENV:Sys/def_helppointer" },
   { "PROGDIR:Resources/eastResizeCursor",               "ENV:Sys/def_eastresizepointer" },
   { "PROGDIR:Resources/northResizeCursor",              "ENV:Sys/def_northresizepointer" },
   { "PROGDIR:Resources/northEastResizeCursor",          "ENV:Sys/def_northeastresizepointer" },
   { "PROGDIR:Resources/northWestResizeCursor",          "ENV:Sys/def_northwestresizepointer" },
   { "PROGDIR:Resources/southResizeCursor",              "ENV:Sys/def_southresizepointer" },
   { "PROGDIR:Resources/southEastResizeCursor",          "ENV:Sys/def_southeastresizepointer" },
   { "PROGDIR:Resources/southWestResizeCursor",          "ENV:Sys/def_southwestresizepointer" },
   { "PROGDIR:Resources/westResizeCursor",               "ENV:Sys/def_westresizepointer" },
   { "PROGDIR:Resources/northSouthResizeCursor",         "ENV:Sys/def_northsouthresizepointer" },
   { "PROGDIR:Resources/eastWestResizeCursor",           "ENV:Sys/def_eastwestresizepointer" },
   { "PROGDIR:Resources/northEastSouthWestResizeCursor", "ENV:Sys/def_northeastsouthwestresizepointer" },
   { "PROGDIR:Resources/northWestSouthEastResizeCursor", "ENV:Sys/def_northwestsoutheastresizepointer" },
   { "PROGDIR:Resources/columnResizeCursor",             "ENV:Sys/def_columnresizepointer" },
   { "PROGDIR:Resources/rowResizeCursor",                "ENV:Sys/def_rowresizepointer" },
   { "PROGDIR:Resources/middlePanningCursor",            0 }, // missing
   { "PROGDIR:Resources/eastPanningCursor",              0 }, // missing
   { "PROGDIR:Resources/northPanningCursor",             0 }, // missing
   { "PROGDIR:Resources/northEastPanningCursor",         0 }, // missing
   { "PROGDIR:Resources/northWestPanningCursor",         0 }, // missing
   { "PROGDIR:Resources/southPanningCursor",             0 }, // missing
   { "PROGDIR:Resources/southEastPanningCursor",         0 }, // missing
   { "PROGDIR:Resources/southWestPanningCursor",         0 }, // missing
   { "PROGDIR:Resources/westPanningCursor",              0 }, // missing
   { "PROGDIR:Resources/verticalTextCursor",             "ENV:Sys/def_verticaltextpointer" },
   { "PROGDIR:Resources/cellCursor",                     "ENV:Sys/def_cellpointer" },
   { "PROGDIR:Resources/contextMenuCursor",              "ENV:Sys/def_contextmenupointer.info" },
   { "PROGDIR:Resources/noDropCursor",                   "ENV:Sys/def_nodroppointer" },
   { "PROGDIR:Resources/notAllowedCursor",               "ENV:Sys/def_notallowedpointer" },
   { "PROGDIR:Resources/progressCursor",                 "ENV:Sys/def_progresspointer" },
   { "PROGDIR:Resources/aliasCursor",                    "ENV:Sys/def_aliaspointer" },
   { "PROGDIR:Resources/zoomInCursor",                   "ENV:Sys/def_zoominpointer" },
   { "PROGDIR:Resources/zoomOutCursor",                  "ENV:Sys/def_zoomoutpointer" },
   { "PROGDIR:Resources/copyCursor",                     "ENV:Sys/def_copypointer" },
   { "PROGDIR:Resources/noneCursor",                     "ENV:Sys/def_nonepointer" },
   { "PROGDIR:Resources/grabCursor",                     0 }, // missing
   { "PROGDIR:Resources/grabbingCursor",                 0 }  // missing
//   { "PROGDIR:Resources/scrollAllCursor",                "ENV:Sys/def_scrollallpointer" },
};

Cursor::Cursor(Image* image, const IntPoint& point)
    : m_impl(0)
    , m_dispose(false)
    , m_data(0)
{
    int32 width = image->width(), height = image->height();
    cairo_surface_t* surface = image->nativeImageForCurrentFrame().leakRef(); 
    if (width > 0 && width <= 64 && height > 0 && height <= 64 && surface) {
        int32 xoffset = point.x(), yoffset = point.y();

        if (xoffset < 0 || xoffset >= width)
            xoffset = 0;
        if (yoffset < 0 || yoffset >= height)
            yoffset = 0;

        m_data = calloc(width * height * 4 + 32 / 8 * 64 + sizeof(BitMap), 1);
        if (m_data) {
            m_dispose = true;

            for (int y=0 ; y < image->height() ; y++)
            {
                uint8* data = cairo_image_surface_get_data(surface) + y * cairo_image_surface_get_stride(surface);
                memcpy((uint8*)m_data + y * cairo_image_surface_get_stride(surface), data, width * 4);
            }

            PLANEPTR singleColourPlane = (PLANEPTR)((uint32)m_data + width * height * 4);
            BitMap* singleColourBitMap = (BitMap*)((uint32)m_data + width * height * 4 + 32 / 8 * 64);
            singleColourBitMap->BytesPerRow = 32 / 8;
            singleColourBitMap->Rows = height;
            singleColourBitMap->Depth = 1;
            singleColourBitMap->Planes[0] /*= singleColourBitMap->Planes[1]*/ = singleColourPlane;

            uint32* data32 = (uint32*)m_data;
            for (int y = 0 ; y < height ; y++)
                for (int x = 0 ; x < width && x < 32 ; x++)
                    if (0xFF000000 == (data32[y * width + x] & 0xFF000000))
                        singleColourPlane[y * 32 / 8 + x / 8] |= 1 << (7 - (x & 7));

            m_impl = NewObject(NULL, POINTERCLASS,
                                           POINTERA_BitMap, singleColourBitMap,
                                           POINTERA_XOffset, -xoffset,
                                           POINTERA_YOffset, -yoffset,
                                           POINTERA_WordWidth, 32 / 16,
                                           POINTERA_XResolution, POINTERXRESN_SCREENRES,
                                           POINTERA_YResolution, POINTERYRESN_SCREENRESASPECT,
                                           POINTERA_ImageData, m_data,
                                           POINTERA_Width, width,
                                           POINTERA_Height, height,
                                           TAG_DONE);
        }
    }
    else 
        {};//fprintf(stderr, "%s %ldx%ld %p\n", __PRETTY_FUNCTION__, width, height, surface);
}

Cursor::Cursor(PlatformCursor c)
    : m_impl(c)
    , m_dispose(false)
    , m_data(0)
{
    //fprintf(stderr, "%s (%p)\n", __PRETTY_FUNCTION__, c);
}

Cursor::Cursor(enPointers num)
    : m_impl(0)
    , m_dispose(true)
    , m_data(0)
{
    DiskObject *icon = 0;
    CONST_STRPTR name = pointerFiles[num][0];

    if (name)
        icon = GetIconTags(name, ICONGETA_UseFriendBitMap, TRUE, TAG_DONE);

    if (!icon) {
        name = pointerFiles[num][1];
        if (name)
            icon = GetIconTags(name, ICONGETA_UseFriendBitMap, TRUE, TAG_DONE);
    }

    if (icon) {
        uint32 format = IDFMT_BITMAPPED;
        if (1 == IconControl(icon, ICONCTRLA_GetImageDataFormat, &format, TAG_DONE))
            if (IDFMT_DIRECTMAPPED == format) {
                int32 width = 0, height = 0;
                uint8* data = 0;
                IconControl(icon,
                                   ICONCTRLA_GetWidth, &width,
                                   ICONCTRLA_GetHeight, &height,
                                   ICONCTRLA_GetImageData1, &data,
                                   TAG_DONE);
                if (width > 0 && width <= 64 && height > 0 && height <= 64 && data) {
                    int32 xoffset = 0, yoffset = 0;
                    STRPTR tooltype;

                    tooltype = FindToolType(icon->do_ToolTypes, "XOFFSET");
                    if (tooltype)
                        xoffset = atoi(tooltype);
                    tooltype = FindToolType(icon->do_ToolTypes, "YOFFSET");
                    if (tooltype)
                        yoffset = atoi(tooltype);

                    if (xoffset < 0 || xoffset >= width)
                        xoffset = 0;
                    if (yoffset < 0 || yoffset >= height)
                        yoffset = 0;

                    m_data = calloc(width * height * 4 + 32 / 8 * 64 + sizeof(BitMap), 1);
                    if (m_data) {
                        memcpy(m_data, data, width * height * 4);

                        PLANEPTR singleColourPlane = (PLANEPTR)((uint32)m_data + width * height * 4);
                        BitMap* singleColourBitMap = (BitMap*)((uint32)m_data + width * height * 4 + 32 / 8 * 64);
                        singleColourBitMap->BytesPerRow = 32 / 8;
                        singleColourBitMap->Rows = height;
                        singleColourBitMap->Depth = 1;
                        singleColourBitMap->Planes[0] /*= singleColourBitMap->Planes[1]*/ = singleColourPlane;

                        uint32* data32 = (uint32*)data;
                        for (int y = 0 ; y < height ; y++)
                            for (int x = 0 ; x < width && x < 32 ; x++)
                                if (0xFF000000 == (data32[y * width + x] & 0xFF000000))
                                    singleColourPlane[y * 32 / 8 + x / 8] |= 1 << (7 - (x & 7));

                        m_impl = NewObject(NULL, POINTERCLASS,
                                                       POINTERA_BitMap, singleColourBitMap,
                                                       POINTERA_XOffset, -xoffset,
                                                       POINTERA_YOffset, -yoffset,
                                                       POINTERA_WordWidth, 32 / 16,
                                                       POINTERA_XResolution, POINTERXRESN_SCREENRES,
                                                       POINTERA_YResolution, POINTERYRESN_SCREENRESASPECT,
                                                       POINTERA_ImageData, m_data,
                                                       POINTERA_Width, width,
                                                       POINTERA_Height, height,
                                                       TAG_DONE);
                    }
                }
            }

        FreeDiskObject(icon);
    }
}

Cursor::~Cursor()
{
    if (m_dispose) {
        DisposeObject((Object *)m_impl);
        free(m_data);
    }
}

Cursor& Cursor::operator=(const Cursor& other)
{
    //fprintf(stderr, "%s\n", __PRETTY_FUNCTION__);
    m_impl = other.m_impl;
    return *this;
}

const Cursor& pointerCursor()
{
    static Cursor c(en_pointerCursor);
    return c;
}

const Cursor& crossCursor()
{
    static Cursor c(en_crossCursor);
    return c;
}

const Cursor& handCursor()
{
    static Cursor c(en_handCursor);
    return c;
}

const Cursor& moveCursor()
{
    static Cursor c(en_moveCursor);
    return c;
}

const Cursor& iBeamCursor()
{
    static Cursor c(en_iBeamCursor);
    return c;
}

const Cursor& waitCursor()
{
    static Cursor c(en_waitCursor);
    return c;
}

const Cursor& helpCursor()
{
    static Cursor c(en_helpCursor);
    return c;
}

const Cursor& eastResizeCursor()
{
    static Cursor c(en_eastResizeCursor);
    return c;
}

const Cursor& northResizeCursor()
{
    static Cursor c(en_northResizeCursor);
    return c;
}

const Cursor& northEastResizeCursor()
{
    static Cursor c(en_northEastResizeCursor);
    return c;
}

const Cursor& northWestResizeCursor()
{
    static Cursor c(en_northWestResizeCursor);
    return c;
}

const Cursor& southResizeCursor()
{
    static Cursor c(en_southResizeCursor);
    return c;
}

const Cursor& southEastResizeCursor()
{
    static Cursor c(en_southEastResizeCursor);
    return c;
}

const Cursor& southWestResizeCursor()
{
    static Cursor c(en_southWestResizeCursor);
    return c;
}

const Cursor& westResizeCursor()
{
    static Cursor c(en_westResizeCursor);
    return c;
}

const Cursor& northSouthResizeCursor()
{
    static Cursor c(en_northSouthResizeCursor);
    return c;
}

const Cursor& eastWestResizeCursor()
{
    static Cursor c(en_eastWestResizeCursor);
    return c;
}

const Cursor& northEastSouthWestResizeCursor()
{
    static Cursor c(en_northEastSouthWestResizeCursor);
    return c;
}

const Cursor& northWestSouthEastResizeCursor()
{
    static Cursor c(en_northWestSouthEastResizeCursor);
    return c;
}
const Cursor& columnResizeCursor()
{
    static Cursor c(en_columnResizeCursor);
    return c;
}

const Cursor& rowResizeCursor()
{
    static Cursor c(en_rowResizeCursor);
    return c;
}

const Cursor& middlePanningCursor()
{
    static Cursor c(en_middlePanningCursor);
    return c;
}

const Cursor& eastPanningCursor()
{
    static Cursor c(en_eastPanningCursor);
    return c;
}

const Cursor& northPanningCursor()
{
    static Cursor c(en_northPanningCursor);
    return c;
}

const Cursor& northEastPanningCursor()
{
    static Cursor c(en_northEastPanningCursor);
    return c;
}

const Cursor& northWestPanningCursor()
{
    static Cursor c(en_northWestPanningCursor);
    return c;
}

const Cursor& southPanningCursor()
{
    static Cursor c(en_southPanningCursor);
    return c;
}

const Cursor& southEastPanningCursor()
{
    static Cursor c(en_southEastPanningCursor);
    return c;
}

const Cursor& southWestPanningCursor()
{
    static Cursor c(en_southWestPanningCursor);
    return c;
}

const Cursor& westPanningCursor()
{
    static Cursor c(en_westPanningCursor);
    return c;
}

const Cursor& verticalTextCursor()
{
    static Cursor c(en_verticalTextCursor);
    return c;
}

const Cursor& cellCursor()
{
    static Cursor c(en_cellCursor);
    return c;
}

const Cursor& contextMenuCursor()
{
    static Cursor c(en_contextMenuCursor);
    return c;
}

const Cursor& noDropCursor()
{
    static Cursor c(en_noDropCursor);
    return c;
}

const Cursor& copyCursor()
{
    static Cursor c(en_copyCursor);
    return c;
}

const Cursor& progressCursor()
{
    static Cursor c(en_progressCursor);
    return c;
}

const Cursor& aliasCursor()
{
    static Cursor c(en_aliasCursor);
    return c;
}

const Cursor& noneCursor()
{
    static Cursor c(en_noneCursor);
    return c;
}

const Cursor& notAllowedCursor()
{
    static Cursor c(en_notAllowedCursor);
    return c;
}

const Cursor& zoomInCursor()
{
    static Cursor c(en_zoomInCursor);
    return c;
}

const Cursor& zoomOutCursor()
{
    static Cursor c(en_zoomOutCursor);
    return c;
}

const Cursor& grabCursor()
{
    static Cursor c(en_grabCursor);
    return c;
}

const Cursor& grabbingCursor()
{
    static Cursor c(en_grabbingCursor);
    return c;
}

}
