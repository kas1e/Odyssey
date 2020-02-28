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

#ifndef FontFallbackList_H
#define FontFallbackList_H
/**
 *  @file  FontFallbackList.t
 *  FontFallbackList description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:06 $
 */
#include "BALBase.h"


// This file has no guards on purpose in order to detect redundant includes. This is a private header
// and so this may catch someone trying to include this file in public cpp files.

#include "FontSelector.h"
#include "SimpleFontData.h"
#include <wtf/Forward.h>

namespace WKAL {

class Font;
class GraphicsContext;
class IntRect;
class FontDescription;
class FontPlatformData;
class FontSelector;

const int cAllFamiliesScanned = -1;

class FontFallbackList : public WKALBase, public RefCounted<FontFallbackList> {
public:
    /**
     * create a font fallback list
     * @param[out] : FontFallbackList
     * @code
     * RefPtr<FontFallbackList> ffl = FontFallbackList::create();
     * @endcode
     */
    static PassRefPtr<FontFallbackList> create() ;

    /**
     *  ~FontFallbackList destructor
     * @code
     * delete fontFallbackList;
     * @endcode
     */
    ~FontFallbackList() ;

    /**
     * invalidate FontFallbackList
     * @param[in] : FontSelector
     * @code
     * ffl->invalidate(fontSelector);
     * @endcode
     */
    void invalidate(PassRefPtr<FontSelector>);
    
    /**
     * get fixed pitch status
     * @param[in] : font
     * @param[out] : status
     * @code
     * bool fix = ffl->isFixedPitch(f);
     * @endcode
     */
    bool isFixedPitch(const Font* f) const ;

    /**
     * determine pitch
     * @param[in] : font
     * @code
     * ffl->determinePitch(f);
     * @endcode
     */
    void determinePitch(const Font*) const;

    /**
     * loading custom fonts
     * @param[out] : status
     * @code
     * bool load = ffl->loadingCustomFonts();
     * @endcode
     */
    bool loadingCustomFonts() const ;

    /**
     * get font selector
     * @param[out] : FontSelector
     * @code
     * FontSelector *fs = ffl->fontSelector();
     * @endcode
     */
    FontSelector* fontSelector() const ;
    /**
     * get generation
     * @param[out] : generation
     * @code
     * unsigned g = fs->generation();
     * @endcode
     */
    unsigned generation() const ;
    

private:
    /**
     *  FontFallbackList private constructor
     */
    FontFallbackList();

    /**
     * get primary font 
     * @param[in] : font
     * @param[out] : font data
     * @code
     * FontData *fd = ffl->primaryFont(f);
     * @endcode
     */
    const FontData* primaryFont(const Font* f) const ;

    /**
     * get font data at index
     * @param[in] : font
     * @param[in] : index
     * @param[out] : font data
     * @code
     * FontData *fd = ffl->fontDataAt(f, 12);
     * @endcode
     */
    const FontData* fontDataAt(const Font*, unsigned index) const;

    /**
     * get font data for characters
     * @param[in] : font
     * @param[in] : characters
     * @param[in] : length
     * @param[out] : font data
     * @code
     * FontData *fd = ffl->fontDataForCharacters(f, chars, 12);
     * @endcode
     */
    const FontData* fontDataForCharacters(const Font*, const UChar*, int length) const;
    
    /**
     * set platform font data
     * @param[in] : FontPlatformData
     * @code
     * ffl->setPlatformFont(fpd);
     * @endcode
     */
    void setPlatformFont(const FontPlatformData&);

    /**
     * release font data
     * @code
     * ffl->releaseFontData();
     * @endcode
     */
    void releaseFontData();

    mutable Vector<pair<const FontData*, bool>, 1> m_fontList;
    mutable int m_familyIndex;
    mutable Pitch m_pitch;
    mutable bool m_loadingCustomFonts;
    RefPtr<FontSelector> m_fontSelector;

    friend class Font;
};

}




