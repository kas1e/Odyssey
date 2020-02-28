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
#ifndef GlyphBuffer_h
#define GlyphBuffer_h
/**
 *  @file  GlyphBuffer.t
 *  GlyphBuffer description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:06 $
 */
#include "BALBase.h"

#include "FloatSize.h"


#include <wtf/Vector.h>

namespace WKAL {

typedef unsigned short Glyph;
class SimpleFontData;


class GlyphBuffer : public WKALBase {
public:
    /**
     * get empty status
     * @param[out] : status
     * @code
     * empty = gb->isEmpty();
     * @endcode
     */
    bool isEmpty() const ;

    /**
     * get glyph buffer size 
     * @param[out] : size
     * @code
     * int s = gb->size();
     * @endcode
     */
    int size() const ;
    
    /**
     * clear glyph buffer
     * @code
     * gb->clear();
     * @endcode
     */
    void clear();

    /**
     * get glyph 
     * @param[in] : offset
     * @param[out] : glyph
     * @code
     * GlyphBufferGlyph *gl = gb->glyphs(3);
     * @endcode
     */
    GlyphBufferGlyph* glyphs(int from) ;

    /**
     * get glyphBuffer advance
     * @param[in] : offset
     * @param[out] : glyphBuffer advance
     * @code
     * GlyphBufferAdvance *gba = gb->advances(2);
     * @endcode
     */
    GlyphBufferAdvance* advances(int from) ;

    /**
     * get glyph
     * @param[in] : offset
     * @param[out] : glyph
     * @code
     * const GlyphBufferGlyph *gl = gb->glyphs(3);
     * @endcode
     */
    const GlyphBufferGlyph* glyphs(int from) const ;

    /**
     * get glyphBuffer advance
     * @param[in] : offset
     * @param[out] : glyphBuffer advance
     * @code
     * const GlyphBufferAdvance *gba = gb->advances(2);
     * @endcode
     */
    const GlyphBufferAdvance* advances(int from) const ;

    /**
     * get fontData at index
     * @param[in] : index
     * @param[out] : font data
     * @code
     * SimpleFontData *sfd = gb->fontDataAt(2);
     * @endcode
     */
    const SimpleFontData* fontDataAt(int index) const ;
    
    /**
     * swap two glyph in glyphBuffer
     * @param[in] : index first glyph
     * @param[in] : index second glyph
     * @code
     * gb->swap(2, 13);
     * @endcode
     */
    void swap(int index1, int index2);

    /**
     * get glyph at index
     * @param[in] : index
     * @param[out] : glyph
     * @code
     * Glyph g = gb->glyphAt(3);
     * @endcode
     */
    Glyph glyphAt(int index) const;

    /**
     * advance at index
     * @param[in] : index
     * @param[out] : advance x value
     * @code
     * float f = gb->advanceAt(3);
     * @endcode
     */
    float advanceAt(int index) const;

    /**
     * offset at index
     * @param[in] : index
     * @param[out] : position
     * @code
     * FloatSize fs = gb->offsetAt(3);
     * @endcode
     */
    FloatSize offsetAt(int index) const;

    /**
     * add glyph
     * @param[in] : glyph
     * @param[in] : font data
     * @param[in] : width
     * @param[in] : offset
     * @code
     * gb->add(g, fd, 12);
     * @endcode
     */
    void add(Glyph glyph, const SimpleFontData* font, float width, const FloatSize* offset = 0);
    /**
     * Add glyph
     * @param[in] : glyph
     * @param[in] : font data
     * @param[in] : advance
     * @code
     * gb->add(g, fd, a);
     * @endcode
     */
    void add(Glyph glyph, const SimpleFontData* font, GlyphBufferAdvance advance);
    
    
private:
    Vector<const SimpleFontData*, 2048> m_fontData;
    Vector<GlyphBufferGlyph, 2048> m_glyphs;
    Vector<GlyphBufferAdvance, 2048> m_advances;
};

}
#endif



