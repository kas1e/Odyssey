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
#ifndef Font_h
#define Font_h
/**
 *  @file  Font.t
 *  Font description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:06 $
 */
#include "BALBase.h"

#include "TextRun.h"
#include "FontDescription.h"
#include <wtf/HashMap.h>


namespace WKAL {

class FloatPoint;
class FloatRect;
class FontData;
class FontFallbackList;
class FontPlatformData;
class FontSelector;
class GlyphBuffer;
class GlyphPageTreeNode;
class GraphicsContext;
class IntPoint;
class SimpleFontData;
class SVGFontElement;

struct GlyphData;

class Font : public WKALBase {
public:
    /**
     *  Font default constructor
     */
    Font();

    /**
     * Font constructor
     * @param[in] : FontDescription
     * @param[in] : letter spacing
     * @param[in] : word spacing
     * @code
     * Font *f = new Font(fd, 12, 12 );
     * @endcode
     */
    Font(const FontDescription&, short letterSpacing, short wordSpacing);

    /**
     * This constructor is only used if the platform wants to start with a native font
     */
    Font(const FontPlatformData&, bool isPrinting); // This constructor is only used if the platform wants to start with a native font.

    /**
     * Font destructor
     * @code
     * delete font;
     * @endcode
     */
    ~Font();

    /**
     * constructor by copy
     */
    Font(const Font&);

    /**
     * operator=
     * @param[in] : Font
     * @param[out] : Font
     * @code
     * Font f = currentFont;
     * @endcode
     */
    Font& operator=(const Font&);

    /**
     * operator== 
     */
    bool operator==(const Font& other) const;

    /**
     * operator!= 
     * @param[in] : Font
     * @param[out] : return true if the fonts are different
     * @code
     * bool d = f != currentFont;
     * @endcode
     */
    bool operator!=(const Font& other) const ;

    /**
     * get fontDescription
     */
    const FontDescription& fontDescription() const ;

    **
     * get font pixel size
     * @param[out] : pixel size
     * @code
     * int ps = f->pixelSize();
     * @endcode
     */
    int pixelSize() const ;

    /**
     * get font size
     */
    float size() const ;

    /**
     * update font
     * @param[in] : FontSelector
     * @code
     * f->update(fontSelector);
     * @endcode
     */
    void update(PassRefPtr<FontSelector>) const;

    /**
     * drawText
     */
    void drawText(GraphicsContext*, const TextRun&, const FloatPoint&, int from = 0, int to = -1) const;

    /**
     * return font width
     * @param[in] : TextRun
     * @param[out] : width
     * @code
     * int w = f->width(textRun);
     * @endcode
     */
    int width(const TextRun&) const;

    /**
     * return float width
     * @param[in] : TextRun
     * @param[out] : float width
     * @code
     * float w = f->floatWidth(textRun);
     * @endcode
     */
    float floatWidth(const TextRun&) const;

    /**
     * return float width
     * @param[in] : TextRun
     * @param[in] : extra chars available
     * @param[in] : chars consumed
     * @param[in] : glyph name
     * @param[out] : float width
     * @code
     * float w = f->floatWidth(textRun, 0, chars, name);
     * @endcode
     */
    float floatWidth(const TextRun& run, int extraCharsAvailable, int& charsConsumed, String& glyphName) const;

    /**
     * get offset for a position
     */
    int offsetForPosition(const TextRun&, int position, bool includePartialGlyphs) const;

    **
     * get selection for text
     * @param[in] : TextRun
     * @param[in] : start point
     * @param[in] : height
     * @param[in] : start glyph range
     * @param[in] : end glyph range
     * @param[out] : float rect
     * @code
     * FloatRect f = f->selectionRectForText(textRun, IntPoint(0,0), 18);
     * @endcode
     */
    FloatRect selectionRectForText(const TextRun&, const IntPoint&, int h, int from = 0, int to = -1) const;

    /**
     * test if the font is smallCaps
     */
    bool isSmallCaps() const ;

    /**
     * get word spacing value
     * @param[out] : word spacing value
     * @code
     * short ws = f->wordSpacing();
     * @endcode
     */
    short wordSpacing() const ;

    /**
     * get letter spacing value
     * @param[out] : letter spacing value
     * @code
     * short ls = f->letterSpacing();
     * @endcode
     */
    short letterSpacing() const ;

    /**
     * set word spacing value
     * @param[in] : word spacing value
     * @code
     * f->setWordSpacing(12);
     * @endcode
     */
    void setWordSpacing(short s) ;

    /**
     * set letter spacing value
     * @param[in] : letter spacing value
     * @code
     * f->setLetterSpacing(12);
     * @endcode
     */
    void setLetterSpacing(short s) ;

    /**
     * test if the pitch is fixed
     * @param[out] : true if the pitch is fixed
     * @code
     * bool fp = f->isFixedPitch();
     * @endcode
     */
    bool isFixedPitch() const;

    /**
     * test if the font is printer
     * @param[out] : true if the font is printer
     * @code
     * bool pf = f->isPrinterFont();
     * @endcode
     */
    bool isPrinterFont() const ;
    
    /**
     * get the font rendering mode
     * @param[out] : font rendering mode
     * @code
     * FontRenderingMode frm = f->renderingMode();
     * @endcode
     */
    FontRenderingMode renderingMode() const ;

    /**
     * get first font family
     * @param[out] : font family
     * @code
     * FontFamily ff = f->firstFamily();
     * @endcode
     */
    FontFamily& firstFamily() ;

    /**
     * get font family
     * @param[out] : font family
     * @code
     * FontFamily ff = f->family();
     * @endcode
     */
    const FontFamily& family() const ;

    /**
     * get the italic status
     * @param[out] : italic status
     * @code
     * bool it = f->italic();
     * @endcode
     */
    bool italic() const ;

    /**
     * get the font weight
     * @param[out] : font weight
     * @code
     * FontWeight fw = f->weight();
     * @endcode
     */
    FontWeight weight() const ;

    /**
     * get it's a platform font
     * @param[out] : true if it's a platform font
     * @code
     * bool pf = f->isPlatformFont();
     * @endcode
     */
    bool isPlatformFont() const ;


    // Metrics that we query the FontFallbackList for.
    /**
     * get ascent value
     * @param[out] : ascent value
     * @code
     * int a = f->ascent();
     * @endcode
     */
    int ascent() const;

    /**
     * get descent value
     * @param[out] : descent value
     * @code
     * int d = f->descent();
     * @endcode
     */
    int descent() const;

    /**
     * get height value
     * @param[out] : height value
     * @code
     * int h = f->height();
     * @endcode
     */
    int height() const ;

    /**
     * get lineSpacing value
     * @param[out] : lineSpacing value
     * @code
     * int ls = f->lineSpacing();
     * @endcode
     */
    int lineSpacing() const;


    /**
     *  lineGap
     * @param[out] : line gap value
     */
    int lineGap() const;

    /**
     * get xHeight value
     * @param[out] : xHeight value
     * @code
     * float x = f->xHeight();
     * @endcode
     */
    float xHeight() const;

    /**
     * get unitsPerEm value
     * @param[out] : untiPerEm value
     * @code
     * unsigned u = f->unitsPerEm();
     * @endcode
     */
    unsigned unitsPerEm() const;

    /**
     * get spaceWidth value
     * @param[out] : spaceWidth value
     * @code
     * int sw = f->spaceWidth();
     * @endcode
     */
    int spaceWidth() const;

    /**
     * get tabWidth value
     * @param[out] : tabWidth value
     * @code
     * int tw = f->tabWidth();
     * @endcode
     */
    int tabWidth() const ;

    /**
     * get primary font value
     * @param[out] : primary font
     * @code
     * SimpleFontData *sfd = f->primaryFont();
     * @endcode
     */
    const SimpleFontData* primaryFont() const ;

    /**
     * get fontData value at position
     * @param[in] : position value
     * @param[out] : font data
     * @code
     * FontData *fd = f->fontDataAt(0);
     * @endcode
     */
    const FontData* fontDataAt(unsigned) const;

    /**
     * get  glyph data for a character
     * @param[in] : character
     * @param[in] : mirror
     * @param[in] : force small caps
     * @param[out] : glyph data
     * @code
     * GlyphData gd = f->glyphDataForCharacter(c, false);
     * @endcode
     */
    const GlyphData& glyphDataForCharacter(UChar32, bool mirror, bool forceSmallCaps = false) const;

    // Used for complex text, and does not utilize the glyph map cache.
    /**
     * get font data for a characters
     * @param[in] : characters
     * @param[in] : length
     * @param[out] : font data
     * @code
     * FontData *fd = f->fontDataForCharacters(c, 12);
     * @endcode
     */
    const FontData* fontDataForCharacters(const UChar*, int length) const;

private:
    /**
     * test if you can use glyph cache
     * @param[in] : TextRun
     * @param[out] : true if you can
     * @code
     * bool u = f->canUseGlyphCache(textRun);
     * @endcode
     */
    bool canUseGlyphCache(const TextRun&) const;

    /**
     * draw simple text
     * @param[in] : graphics context
     * @param[in] : textRun
     * @param[in] : start point
     * @param[in] : start glyph range
     * @param[in] : end glyph range
     * @code
     * f->drawSimpleText(gc, textRun, FloatPoint(0,0), 0, 12);
     * @endcode
     */
    void drawSimpleText(GraphicsContext*, const TextRun&, const FloatPoint&, int from, int to) const;
#if ENABLE(SVG_FONTS)
    /**
     * draw text using SVG font
     * @param[in] : graphics contect
     * @param[in] : textRun
     * @param[in] : start point
     * @param[in] : start glyph range
     * @param[in] : end glyph range
     * @code
     * f->drawTextUsingSVGFont(gc, textRun, FloatPoint(0,0), 0, 12);
     * @endcode
     */
    void drawTextUsingSVGFont(GraphicsContext*, const TextRun&, const FloatPoint&, int from, int to) const;

    /**
     * get float width using SVG font 
     * @param[in] : textRun
     * @param[out] : float width
     * @code
     * float w = f->floatWidthUsingSVGFont(textRun);
     * @endcode
     */
    float floatWidthUsingSVGFont(const TextRun&) const;

    /**
     * get float width using SVG font 
     * @param[in] : textRun
     * @param[in] : extra char available
     * @param[in] : character consumed
     * @param[in] : glyph name
     * @param[out] : float width
     * @code
     * float w = f->floatWidthUsingSVGFont(textRun, 0, chars, glyphName);
     * @endcode
     */
    float floatWidthUsingSVGFont(const TextRun&, int extraCharsAvailable, int& charsConsumed, String& glyphName) const;

    /**
     * get  selection rect for text using SVG font
     * @param[in] : textRun
     * @param[in] : start point
     * @param[in] : heigth
     * @param[in] : start glyph range
     * @param[in] : end glyph range
     * @param[out] : float rect
     * @code
     * FloatRect r = selectionRectForTextUsingSVGFont(textRun, IntPoint(0, 0), 10, 0, 12);
     * @endcode
     */
    FloatRect selectionRectForTextUsingSVGFont(const TextRun&, const IntPoint&, int h, int from, int to) const;

    /**
     * get offset for a position for a text using SVG font
     * @param[in] : textRun
     * @param[in] : position
     * @param[in] : include partial glyphs
     * @param[out] : offset
     * @code
     * int o = f->offsetForPositionForTextUsingSVGFont(textRun, 0, true);
     * @endcode
     */
    int offsetForPositionForTextUsingSVGFont(const TextRun&, int position, bool includePartialGlyphs) const;
#endif
    /**
     * draw glyphs
     * @param[in] : graphics context
     * @param[in] : font data
     * @param[in] : glyph buffer
     * @param[in] : start glyph range
     * @param[in] : end glyph range
     * @param[in] : start point
     * @code
     * f->drawGlyphs(gc, s, g, 0, 12, FloatPoint(0,0));
     * @endcode
     */
    void drawGlyphs(GraphicsContext*, const SimpleFontData*, const GlyphBuffer&, int from, int to, const FloatPoint&) const;

    /**
     * draw glyph buffer 
     * @param[in] : graphics context
     * @param[in] : glyph buffer
     * @param[in] : textRun
     * @param[in] : start point
     * @code
     * f->drawGlyphBuffer(gc, gb, textRun, FloatPoint(0,0));
     * @endcode
     */
    void drawGlyphBuffer(GraphicsContext*, const GlyphBuffer&, const TextRun&, const FloatPoint&) const;

    /**
     * draw complex text 
     * @param[in] : graphics context
     * @param[in] : textRun
     * @param[in] : start point
     * @param[in] : start glyph range
     * @param[in] : end glyph range
     * @code
     * f->drawComplexText(gc, textRun, FloatPoint(0,0), 0, 12);
     * @endcode
     */
    void drawComplexText(GraphicsContext*, const TextRun&, const FloatPoint&, int from, int to) const;

    /**
     * get float width for a simple text
     * @param[in] : textRun
     * @param[in] : glyph buffer
     * @param[out] : float width
     * @code
     * float w = f->floatWidthForSimpleText(textRun, gb);
     * @endcode
     */
    float floatWidthForSimpleText(const TextRun&, GlyphBuffer*) const;

    /**
     * get float width for complex text
     * @param[in] : textRun
     * @param[out] : float width
     * @code
     * float w = f->floatWidthForComplexText(textRun);
     * @endcode
     */
    float floatWidthForComplexText(const TextRun&) const;

    /**
     * get offset for a position for a simple text
     * @param[in] : textRun
     * @param[in] : position
     * @param[in] : include partial glyphs
     * @param[out] : offset
     * @code
     * int o = f->offsetForPositionForSimpleText(textRun, 0, true);
     * @endcode
     */
    int offsetForPositionForSimpleText(const TextRun&, int position, bool includePartialGlyphs) const;

    /**
     * get offset for a position for a complex text
     * @param[in] : textRun
     * @param[in] : position
     * @param[in] : include partial glyphs
     * @param[out] : offset
     * @code
     * int o = f->offsetForPositionForSimpleText(textRun, 0, true);
     * @endcode
     */
    int offsetForPositionForComplexText(const TextRun&, int position, bool includePartialGlyphs) const;

    /**
     * get selection rect for a simple text
     * @param[in] : textRun
     * @param[in] : start point
     * @param[in] : height
     * @param[in] : start glyph range
     * @param[in] : end glyph range
     * @param[out] : float rect
     * @code
     * FloatRect fr = f->selectionRectForSimpleText(textRun, IntPoint&(0,0), 10, 0, 12);
     * @endcode
     */
    FloatRect selectionRectForSimpleText(const TextRun&, const IntPoint&, int h, int from, int to) const;

    /**
     * get selection rect for a complex text
     * @param[in] : textRun
     * @param[in] : start point
     * @param[in] : height
     * @param[in] : start glyph range
     * @param[in] : end glyph range
     * @param[out] : float rect
     * @code
     * FloatRect fr = f->selectionRectForSimpleText(textRun, IntPoint&(0,0), 10, 0, 12);
     * @endcode
     */
    FloatRect selectionRectForComplexText(const TextRun&, const IntPoint&, int h, int from, int to) const;

    /**
     * cache primary font
     * @code
     * f->cachePrimaryFont();
     * @endcode
     */
    void cachePrimaryFont() const;

    friend struct WidthIterator;

    // Useful for debugging the different font rendering code paths.
public:
    enum CodePath { Auto, Simple, Complex };

    /**
     * set code path
     * @param[in] : code path
     * @code
     * f->setCodePath(Auto);
     * @endcode
     */
    static void setCodePath(CodePath);

    static CodePath codePath;

    static const uint8_t gRoundingHackCharacterTable[256];

    /**
     * get is rounding hack character
     * @param[in] : character
     * @param[out] : true or false
     * @code
     * bool r = f->isRoundingHackCharacter(c);
     * @endcode
     */
    static bool isRoundingHackCharacter(UChar32 c);

    /**
     * get fontSelector 
     * @param[out] : font selector
     * @code
     * FontSelector *fs = f->fontSelector();
     * @endcode
     */
    FontSelector* fontSelector() const;

    /**
     * test if font treat character as space
     * @param[in] : character
     * @param[out] : true or false
     * @code
     * bool t = f->treatAsSpace(c);
     * @endcode
     */
    static bool treatAsSpace(UChar c) ;

    /**
     * test if font treat character as zero width space
     * @param[in] : character
     * @param[out] : true or false
     * @code
     * bool t = f->treatAsZeroWidthSpace(c);
     * @endcode
     */
    static bool treatAsZeroWidthSpace(UChar c) ;

#if ENABLE(SVG_FONTS)
    /**
     * test if font is SVG font
     * @param[out] : true or false
     * @code
     * bool svgFont = f->isSVGFont();
     * @endcode
     */
    bool isSVGFont() const;

    /**
     * get svg font element
     * @param[out] : svg font element
     * @code
     * SVGFontElement *e = f->svgFont();
     * @endcode
     */
    SVGFontElement* svgFont() const;
#endif

private:
    FontDescription m_fontDescription;
    mutable RefPtr<FontFallbackList> m_fontList;
    mutable HashMap<int, GlyphPageTreeNode*> m_pages;
    mutable GlyphPageTreeNode* m_pageZero;
    mutable const SimpleFontData* m_cachedPrimaryFont;
    short m_letterSpacing;
    short m_wordSpacing;
    bool m_isPlatformFont;
};

}

#endif



