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
#ifndef TextRun_h
#define TextRun_h
/**
 *  @file  TextRun.t
 *  TextRun description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:06 $
 */
#include "BALBase.h"

#include "PlatformString.h"

namespace WKAL {

class RenderObject;
class SVGPaintServer;

class TextRun : public WKALBase {
public:
    /**
     * TextRun constructor
     */
    TextRun(const UChar* c, int len, bool allowTabs = false, int xpos = 0, int padding = 0, bool rtl = false, bool directionalOverride = false,
              bool applyRunRounding = true, bool applyWordRounding = true);

    /**
     * TextRun constructor
     */
    TextRun(const String& s, bool allowTabs = false, int xpos = 0, int padding = 0, bool rtl = false, bool directionalOverride = false,
              bool applyRunRounding = true, bool applyWordRounding = true);

    /**
     * operator[]
     */
    UChar operator[](int i) const ;

    /**
     * get textRun data 
     */
    const UChar* data(int i) const ;

    /**
     * get textRun characters
     */
    const UChar* characters() const ;

    /**
     * get textRun length
     */
    int length() const ;

    /**
     * set text
     */
    void setText(const UChar* c, int len) ;

    /**
     * allow tabs 
     */
    bool allowTabs() const ;

    /**
     * get x position
     */
    int xPos() const ;

    /**
     * get padding 
     */
    int padding() const ;

    /**
     * get if the textRun is rigth to left
     */
    bool rtl() const ;

    /**
     * get if the textRun is left to rigth
     */
    bool ltr() const ;

    /**
     * directional override
     */
    bool directionalOverride() const ;

    /**
     * apply run rounding 
     */
    bool applyRunRounding() const ;

    /**
     * apply word rounding
     */
    bool applyWordRounding() const ;

    /**
     * get if the spacing is disabled
     */
    bool spacingDisabled() const ;

    /**
     * disable spacing
     */
    void disableSpacing() ;

    /**
     * disable rounding hacks
     */
    void disableRoundingHacks() ;

    /**
     * set rigth to left 
     */
    void setRTL(bool b) ;

    /**
     * set directional override
     */
    void setDirectionalOverride(bool override) ;

#if ENABLE(SVG_FONTS)
    /**
     * get referencing renderObject 
     */
    RenderObject* referencingRenderObject() const ;

    /**
     * set referencing RenderObject
     */
    void setReferencingRenderObject(RenderObject* object) ;

    /**
     * get active PaintServer 
     */
    SVGPaintServer* activePaintServer() const ;

    /**
     * set active PaintServer 
     */
    void setActivePaintServer(SVGPaintServer* object) ;
#endif

private:
    const UChar* m_characters;
    int m_len;

    int m_xpos;
    int m_padding;
    bool m_allowTabs;
    bool m_rtl;
    bool m_directionalOverride;
    bool m_applyRunRounding;
    bool m_applyWordRounding;
    bool m_disableSpacing;

#if ENABLE(SVG_FONTS)
    RenderObject* m_referencingRenderObject;
    SVGPaintServer* m_activePaintServer;
#endif
};

}

#endif




