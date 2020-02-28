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
#ifndef FontData_h
#define FontData_h
/**
 *  @file  FontData.t
 *  FontData description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:06 $
 */
#include "BALBase.h"

#include <wtf/Noncopyable.h>
#include <wtf/unicode/Unicode.h>

namespace WKAL {

class SimpleFontData;

class FontData : public WKALBase, Noncopyable {
public:
    /**
     * FontData constructor
     * @code
     * FontData fd = new FontData();
     * @endcode
     */
    FontData();

    /**
     *  ~FontData destuctor
     * @code
     * delete fontData;
     * @endcode
     */
    virtual ~FontData();

    /**
     * fontData for a character
     * @param[in] : character
     * @param[out] : font data
     * @code
     * SimpleFontData *sfd = fd->fontDataForCharacter(c);
     * @endcode
     */
    virtual const SimpleFontData* fontDataForCharacter(UChar32) const = 0;

    /**
     * test if font data contains Characters
     * @param[in] : characters
     * @param[in] : length
     * @param[out] : true or false
     * @code
     * bool c = fd->containsCharacters(c, 12);
     * @endcode
     */
    virtual bool containsCharacters(const UChar*, int length) const = 0;

    /**
     * test if it's a custom font
     * @param[out] : true or false
     * @code
     * bool cf = fd->isCustomFont();
     * @endcode
     */
    virtual bool isCustomFont() const = 0;

    /**
     * test if it's loading
     * @param[out] : true or false
     * @code
     * bool il = fd->isLoading();
     * @endcode
     */
    virtual bool isLoading() const = 0;

    /**
     * test if it's segmented
     * @param[out] : true or false
     * @code
     * bool s = fd->isSegmented();
     * @endcode
     */
    virtual bool isSegmented() const = 0;

    /**
     * set max glyphPageTree level
     * @param[in] : level
     * @code
     * fd->setMaxGlyphPageTreeLevel(3);
     * @endcode
     */
    void setMaxGlyphPageTreeLevel(unsigned level) const ;
    /**
     * get max glyphPageTree level
     * @param[out] : level
     * @code
     * unsigned level = fd->maxGlyphPageTreeLevel();
     * @endcode
     */
    unsigned maxGlyphPageTreeLevel() const ;

private:
    mutable unsigned m_maxGlyphPageTreeLevel;
};

} // namespace WKAL

#endif // FontData_h




