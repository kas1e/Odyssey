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
#ifndef FontDescription_h
#define FontDescription_h
/**
 *  @file  FontDescription.t
 *  FontDescription description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:06 $
 */
#include "BALBase.h"

#include "FontFamily.h"
#include "FontRenderingMode.h"

namespace WKAL {

enum FontWeight {
    FontWeight100,
    FontWeight200,
    FontWeight300,
    FontWeight400,
    FontWeight500,
    FontWeight600,
    FontWeight700,
    FontWeight800,
    FontWeight900,
    FontWeightNormal = FontWeight400,
    FontWeightBold = FontWeight700
};

class FontDescription : public WKALBase {
public:
    enum GenericFamilyType { NoFamily, StandardFamily, SerifFamily, SansSerifFamily, 
                             MonospaceFamily, CursiveFamily, FantasyFamily };

    /**
     * FontDescription default constructor
     * @code
     * FontDescription *fd = new FontDescription();
     * @endcode
     */
    FontDescription();

    /**
     * operator== 
     * @param[in] : FontDescription
     * @param[out] : false if it's not equal
     * @code
     * bool eq = fd == fdOther;
     * @endcode
     */
    bool operator==(const FontDescription&) const;

    /**
     * operator!=
     * @param[in] : FontDescription
     * @param[out] : false if it's equal
     * @code
     * bool di = fd != fdOther;
     * @endcode
     */
    bool operator!=(const FontDescription& other) const ;
    
    /**
     * get font family
     * @param[out] : font family
     * @code
     * FontFamily fa = fd->family();
     * @endcode
     */
    const FontFamily& family() const ;

    /**
     * get first family
     * @param[out] : font family
     * @code
     * FontFamily fa = fd->firstFamily();
     * @endcode
     */
    FontFamily& firstFamily() ;

    /**
     * get specified size
     * @param[out] : size
     * @code
     * float size = fd->specifiedSize();
     * @endcode
     */
    float specifiedSize() const ;

    /**
     * get computed size
     * @param[out] : computed size
     * @code
     * float size = fd->computedSize();
     * @endcode
     */
    float computedSize() const ;

    /**
     * get italic status
     * @param[out] : status
     * @code
     * bool it = fd->italic()
     * @endcode
     */
    bool italic() const ;

    /**
     * get computed pixel size
     * @param[out] : computed pixel size
     * @code
     * int cps = fd->computedPixelSize();
     * @endcode
     */
    int computedPixelSize() const ;

    /**
     * get smallCaps status
     * @param[out] : status
     * @code
     * bool sc = fd->smallCaps();
     * @endcode
     */
    bool smallCaps() const ;

    /**
     * get if it's absolute size 
     * @param[out] : absolute size status
     * @code
     * bool as = fd->isAbsoluteSize();
     * @endcode
     */
    bool isAbsoluteSize() const ;

    /**
     * get the font weight
     * @param[out] : font weight
     * @code
     * FontWeight fw = fd->weight();
     * @endcode
    */
    FontWeight weight() const ;

    /**
     * get the font lighter weight
     * @param[out] : font lighter weight
     * @code
     * FontWeight fw = fd->lighterWeight();
     * @endcode
     */
    FontWeight lighterWeight() const;

    /**
     * get font bolder Weight 
     * @param[out] : font bolder Weight
     * @code
     * FontWeight fw = fd->bolderWeight();
     * @endcode
     */
    FontWeight bolderWeight() const;

    /**
     * get generic font family
     * @param[out] : generic font family
     * @code
     * GenericFamilyType gff = fd->genericFamily();
     * @endcode
     */
    GenericFamilyType genericFamily() const ;

    /**
     * test if you use printer font
     * @param[out] : true or false
     * @code
     * bool upf = fd->usePrinterFont();
     * @endcode
     */
    bool usePrinterFont() const ;

    /**
     * iget font rendering mode
     * @param[out] : font rendering mode
     * @code
     * FontRenderingMode frm = fd->renderingMode();
     * @endcode
     */
    FontRenderingMode renderingMode() const ;

    /**
     * get keyword size
     * @param[out] : keyword size
     * @code
     * int ks = fd->keywordSize();
     * @endcode
     */
    int keywordSize() const ;

    /**
     * get font traits mask 
     * @param[out] : font traits mask
     * @code
     * FontTraitsMask m = fd->traitsMask();
     * @endcode
     */
    FontTraitsMask traitsMask() const;
    

    /**
     * set font family
     * @param[in] : font family
     * @code
     * fd->setFamily(fa);
     * @endcode
     */
    void setFamily(const FontFamily& family) ;

    /**
     * set computed size
     * @param[in] : computed size
     * @code
     * fd->setComputedSize(12.0);
     * @endcode
     */
    void setComputedSize(float s) ;

    /**
     * set specified size
     * @param[in] : specified size
     * @code
     * fd->setSpecifiedSize(12.0);
     * @endcode
     */
    void setSpecifiedSize(float s) ;

    /**
     * set italic status
     * @param[in] : status
     * @code
     * fd->setItalic(false);
     * @endcode
     */
    void setItalic(bool i) ;

    /**
     * set SmallCaps status
     * @param[in] : status
     * @code
     * fd->setSmallCaps(true);
     * @endcode
     */
    void setSmallCaps(bool c) ;

    /**
     * set absolute size status
     * @param[in] : status
     * @code
     * fd->setIsAbsoluteSize(false);
     * @endcode
     */
    void setIsAbsoluteSize(bool s) ;

    /**
     * set font weight
     * @param[in] : font weight
     * @code
     * fd->setWeight(w);
     * @endcode
     */
    void setWeight(FontWeight w) ;

    /**
     * set generic font family description
     * @param[in] : generic font family
     * @code
     * fd->setGenericFamily(gf);
     * @endcode
     */
    void setGenericFamily(GenericFamilyType genericFamily) ;

    /**
     * set if you use printer font
     * @param[in] : status
     * @code
     * fd->setUsePrinterFont(true);
     * @endcode
     */
    void setUsePrinterFont(bool p) ;

    /**
     * set font rendering mode
     * @param[in] : font rendering mode
     * @code
     * fd->setRenderingMode(mode);
     * @endcode
     */
    void setRenderingMode(FontRenderingMode mode) ;

    /**
     * set keyword size
     * @param[in] : size
     * @code
     * fd->setKeywordSize(12);
     * @endcode
     */
    void setKeywordSize(int s) ;

private:
    FontFamily m_familyList; // The list of font families to be used.

    float m_specifiedSize;   // Specified CSS value. Independent of rendering issues such as integer
                             // rounding, minimum font sizes, and zooming.
    float m_computedSize;    // Computed size adjusted for the minimum font size and the zoom factor.  

    bool m_italic : 1;
    bool m_smallCaps : 1;
    bool m_isAbsoluteSize : 1;   // Whether or not CSS specified an explicit size
                                 // (logical sizes like "medium" don't count).
    unsigned m_weight : 8; // FontWeight
    unsigned m_genericFamily : 3; // GenericFamilyType
    bool m_usePrinterFont : 1;

    unsigned m_renderingMode : 1;  // Used to switch between CG and GDI text on Windows.

    int m_keywordSize : 4; // We cache whether or not a font is currently represented by a CSS keyword (e.g., medium).  If so,
                           // then we can accurately translate across different generic families to adjust for different preference settings
                           // (e.g., 13px monospace vs. 16px everything else).  Sizes are 1-8 (like the HTML size values for <font>).
};

    /**
     * operator== 
     * @param[in] : FontDescription&
     * @param[out] : true if it's equal
     * @code
     * bool eq = fd == fdOther;
     * @endcode
     */
inline bool FontDescription::operator==(const FontDescription& other) const;

}

#endif



