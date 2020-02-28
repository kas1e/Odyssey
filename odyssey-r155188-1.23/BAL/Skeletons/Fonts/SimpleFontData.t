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
#ifndef SimpleFontData_h
#define SimpleFontData_h
/**
 *  @file  SimpleFontData.t
 *  SimpleFontData description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:06 $
 */
#include "BALBase.h"

#include "FontData.h"
#include "FontPlatformData.h"
#include "GlyphPageTreeNode.h"
#include "GlyphWidthMap.h"
#include <wtf/OwnPtr.h>




namespace WKAL {

class FontDescription;
class FontPlatformData;
class SharedBuffer;
class SVGFontData;
class WidthMap;

enum Pitch { UnknownPitch, FixedPitch, VariablePitch };

class SimpleFontData : public WKALBase, public FontData {
public:
    /**
     * SimpleFontData constructor
     * @param[in] : font platform data
     * @param[in] : is a custom font
     * @param[in] : is loading
     * @param[in] : svg font data
     * @code
     * SimpleFontData *sfd = new SimpleFontData(fpd);
     * @endcode
     */
    SimpleFontData(const FontPlatformData&, bool customFont = false, bool loading = false, SVGFontData* data = 0);

    /**
     * SimpleFontData destructor
     * @code
     * delete sfd;
     * @endcode
     */
    virtual ~SimpleFontData();

public:
    /**
     * get the font platform data
     * @param[out] : font platform data
     * @code
     * FontPlatformData fpd = sfd->platformData();
     * @endcode
     */
    const FontPlatformData& platformData() const ;

    /**
     * get smallCaps font data 
     * @param[in] : font description
     * @param[out] : simple font data
     * @code
     * SimpleFontData *sfdsm = sfd->smallCapsFontData(fd);
     * @endcode
     */
    SimpleFontData* smallCapsFontData(const FontDescription& fontDescription) const;

    /**
     * get ascent value
     * @param[out] : ascent value
     * @code
     * int a = sfd->ascent();
     * @endcode
     */
    int ascent() const ;

    /**
     * get descent value
     * @param[out] : descent value
     * @code
     * int d = sfd->descent();
     * @endcode
     */
    int descent() const ;

    /**
     * get lineSpacing value
     * @param[out] : lineSpacing value
     * @code
     * int ls = sfd->lineSpacing();
     * @endcode
     */
    int lineSpacing() const ;

    /**
     * get lineGap value
     * @param[out] : lineGap value
     * @code
     * int lg = sfd->lineGap();
     * @endcode
     */
    int lineGap() const ;

    /**
     * get xHeight value
     * @param[out] : xHeight value
     * @code
     * float xh = sfd->xHeight();
     * @endcode
     */
    float xHeight() const ;

    /**
     * get unitsPerEm value
     * @param[out] : unitsPerEm value
     * @code
     * unsigned u = sfd->unitsPerEm();
     * @endcode
     */
    unsigned unitsPerEm() const ;

    /**
     * get width for a glyph 
     * @param[in] : glyph
     * @param[out] : width
     * @code
     * float w = sfd->widthForGlyph(g);
     * @endcode
     */
    float widthForGlyph(Glyph) const;

    /**
     * get platform width for a glyph
     * @param[in] : glyph
     * @param[out] : width
     * @code
     * float w = sfd->platformWidthForGlyph(g);
     * @endcode
     */
    float platformWidthForGlyph(Glyph) const;

    /**
     * get font data for a character
     * @param[in] : character
     * @param[out] : font data
     * @code
     * SimpleFontData *sfdc = sfd->fontDataForCharacter(c);
     * @endcode
     */
    virtual const SimpleFontData* fontDataForCharacter(UChar32) const;

    /**
     * get if the SimpleFontData contains characters
     * @param[in] : characters
     * @param[in] : characters length
     * @param[out] : true if the SimpleFontData contains characters
     * @code
     * bool c = sfd->containsCharacters(c, 12);
     * @endcode
     */
    virtual bool containsCharacters(const UChar*, int length) const;

    /**
     * determine pitch
     * @code
     * sfd->determinePitch();
     * @endcode
     */
    void determinePitch();

    /**
     * get pitch value
     * @param[out] : pitch value
     * @code
     * Pitch p = sfd->pitch();
     * @endcode
     */
    Pitch pitch() const ;

#if ENABLE(SVG_FONTS)
    /**
     * get svg font data
     * @param[out] : svg font data
     * @code
     * SVGFontData *sfd = sfd->svgFontData();
     * @endcode
     */
    SVGFontData* svgFontData() const ;

    /**
     * test if the SimpleFontData is a SVGFont
     * @param[out] : true if the SimpleFontData is a SVGFont
     * @code
     * bool svgf = sfd->isSVGFont();
     * @endcode
     */
    bool isSVGFont() const ;
#else
    /**
     * test if the SimpleFontData is a SVGFont
     * @param[out] : true if the SimpleFontData is a SVGFont
     * @code
     * bool svgf = sfd->isSVGFont();
     * @endcode
     */
    bool isSVGFont() const ;
#endif

    /**
     * test if the SimpleFontData is a custom font
     * @param[out] : true if the SimpleFontData is a custom font
     * @code
     * bool cf = sfd->isCustomFont();
     * @endcode
     */
    virtual bool isCustomFont() const ;

    /**
     * test if the SimpleFontData is loading
     * @param[out] : true if the SimpleFontData is loading
     * @code
     * bool l = sfd->isLoading();
     * @endcode
     */
    virtual bool isLoading() const ;

    /**
     * test if the SimpleFontData is segmented
     * @param[out] : true if the SimpleFontData is segmented
     * @code
     * bool s = sfd->isSegmented();
     * @endcode
     */
    virtual bool isSegmented() const;

    /**
     * get missing GlyphData
     * @param[out] : missing GlyphData
     * @code
     * GlyphData gd = sfd->missingGlyphData();
     * @endcode
     */
    const GlyphData& missingGlyphData() const ;

    /**
     * set platform font 
     * @param[in] : platform font
     * @code
     * sfd->setFont(balFont);
     * @endcode
     */
    void setFont(BalFont*) const;


private:
    /**
     * platform init
     */
    void platformInit();

    /**
     * platform destroy
     */
    void platformDestroy();
    
    /**
     * common init
     */
    void commonInit();


public:
    int m_ascent;
    int m_descent;
    int m_lineSpacing;
    int m_lineGap;
    float m_xHeight;
    unsigned m_unitsPerEm;

    FontPlatformData m_font;

    mutable GlyphWidthMap m_glyphToWidthMap;

    bool m_treatAsFixedPitch;

#if ENABLE(SVG_FONTS)
    OwnPtr<SVGFontData> m_svgFontData;
#endif

    bool m_isCustomFont;  // Whether or not we are custom font loaded via @font-face
    bool m_isLoading; // Whether or not this custom font is still in the act of loading.

    Glyph m_spaceGlyph;
    float m_spaceWidth;
    float m_adjustedSpaceWidth;

    GlyphData m_missingGlyphData;

    mutable SimpleFontData* m_smallCapsFontData;



};

} // namespace WKAL

#endif // SimpleFontData_h




