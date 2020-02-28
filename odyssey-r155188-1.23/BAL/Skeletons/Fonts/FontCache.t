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
#ifndef FontCache_h
#define FontCache_h
/**
 *  @file  FontCache.t
 *  FontCache description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:06 $
 */
#include "BALBase.h"

#include <limits.h>
#include <wtf/unicode/Unicode.h>


namespace WKAL
{

class AtomicString;
class Font;
class FontPlatformData;
class FontData;
class FontDescription;
class FontSelector;
class SimpleFontData;

class FontCache : public WKALBase {
public:
    /**
     * get font data 
     * @param[in] : Font
     * @param[in] : family index
     * @param[in] : font selector
     * @param[out] : font data
     * @code
     * FontData *fd = fc->getFontData(f, 0, fs);
     * @endcode
     */
    static const FontData* getFontData(const Font&, int& familyIndex, FontSelector*);

    /**
     * release font data
     * @param[in] : font data
     * @code
     * fc->releaseFontData();
     * @endcode
     */
    static void releaseFontData(const SimpleFontData*);
    
    /**
     * get font data for characters
     * @param[in] : font
     * @param[in] : characters
     * @param[in] : length
     * @param[out] : font data
     * @code
     * SimpleFontData *fd = fc->getFontDataForCharacters(f, chars, 13);
     * @endcode
     */
    static const SimpleFontData* getFontDataForCharacters(const Font&, const UChar* characters, int length);
    
    /**
     * init platform font
     * @code
     * fc->platformInit();
     * @endcode
     */
    static void platformInit();

    /**
     * get traits in family
     * @param[in] : family name
     * @param[in] : traits mask
     * @code
     * FontCache::getTraitsInFamily(f, m);
     * @endcode
     */
    static void getTraitsInFamily(const AtomicString&, Vector<unsigned>&);
    

    /**
     * get cached fontPlatformData
     * @param[in] : font description 
     * @param[in] : family
     * @param[in] : checking alternative Name
     * @param[out] : FontPlatformData
     * @code
     * FontPlatformData *fpd = fc->getCachedFontPlatformData(fd, fa);
     * @endcode
     */
    static FontPlatformData* getCachedFontPlatformData(const FontDescription&, const AtomicString& family, bool checkingAlternateName = false);

    /**
     * get cached FontData
     * @param[in] : FontPlatformData
     * @param[out] : FontData
     * @code
     * SimpleFontData *s = fc->getCachedFontData(fpd)
     * @endcode
     */
    static SimpleFontData* getCachedFontData(const FontPlatformData*);

    /**
     * get last resort fallback font description
     * @param[in] : font description
     * @param[out] : FontPlatformData
     * @code
     * FontPlatformData *fpd = fc->getLastResortFallbackFont(fd);
     * @endcode
     */
    static FontPlatformData* getLastResortFallbackFont(const FontDescription&);

    /**
     * add client
     * @param[in] : FontSelector
     * @code
     * FontCache::addClient(fs);
     * @endcode
     */
    static void addClient(FontSelector*);

    /**
     * remove client
     * @param[in] : FontSelector
     * @code
     * FontCache::removeClient(fs);
     * @endcode
     */
    static void removeClient(FontSelector*);

    /**
     * get generation
     * @param[out] : generation
     * @code
     * unsigned g = FontCache::generation();
     * @endcode
     */
    static unsigned generation();

    /**
     * invalidate
     * @code
     * FontCache::invalidate();
     * @endcode
     */
    static void invalidate();

    /**
     * get fontData count 
     * @param[out] : font data count
     * @code
     * size_t s = fc->fontDataCount();
     * @endcode
     */
    static size_t fontDataCount();

    /**
     * get inactive font data count
     * @param[out] : inactive font data count
     * @code
     * size_t s = fc->inactiveFontDataCount();
     * @endcode
     */
    static size_t inactiveFontDataCount();

    /**
     * purge inactive font data
     * @param[in] : count
     * @code
     * fc->purgeInactiveFontData();
     * @endcode
     */
    static void purgeInactiveFontData(int count = INT_MAX);

private:
    /**
     * get similar FontPlatformData
     * @param[in] : font
     * @param[out] : FontPlatformData
     * @code
     * FontPlatformData *fpd = fc->getSimilarFontPlatformData(f);
     * @endcode
     */
    static FontPlatformData* getSimilarFontPlatformData(const Font&);

    /**
     * create FontPlatformData
     * @param[in] : FontDescription
     * @param[in] : family
     * @param[out] : FontPlatformData
     * @code
     * FontPlatformData *fpd = fc->createFontPlatformData(fd, fa);
     * @endcode
     */
    static FontPlatformData* createFontPlatformData(const FontDescription&, const AtomicString& family);

    friend class SimpleFontData;
    friend class FontFallbackList;
};

}

#endif
