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
#ifndef FontPlatformData_h
#define FontPlatformData_h
/**
 *  @file  FontPlatformData.t
 *  FontPlatformData description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:06 $
 */
#include "BALBase.h"

#include "GlyphBuffer.h"
#include "FontDescription.h"




namespace WKAL {

class FontPlatformData : public WKALBase {
public:
    /**
     * FontPlatformData constructor
     * @param[in] : HashTableDeletedValueType
     * @code
     * FontPlatformData *fpd = new FontPlatformData(hashtable);
     * @endcode
     */
    FontPlatformData(WTF::HashTableDeletedValueType);

    /**
     * FontPlatformData default constructor
     * @code
     * FontPlatformData *fpd = new FontPlatformData();
     * @endcode
     */
    FontPlatformData();

    /**
     * FontPlatformData constructor
     * @param[in] : font description
     * @param[in] : family name
     * @code
     * FontPlatformData *fpd = new FontPlatformData(fd, family);
     * @endcode
     */
    FontPlatformData(const FontDescription&, const AtomicString& family);

    /**
     * FontPlatformData constructor
     * @param[in] : size
     * @param[in] : bold status
     * @param[in] : italic status
     * @code
     * FontPlatformData *fpd = new FontPlatformData(12, false, false);
     * @endcode
     */
    FontPlatformData(float size, bool bold, bool italic);

    /**
     * FontPlatformData constructor
     * @param[in] : platform font face
     * @param[in] : size
     * @param[in] : bold status
     * @param[in] : italic status
     * @code
     * FontPlatformData *fpd = new FontPlatformData(fontface, 12, false, false);
     * @endcode
     */
    FontPlatformData(BalFontFace* fontFace, int size, bool bold, bool italic);

    /**
     * ~FontPlatformData destructor
     * @code
     * delete fontPlatformData;
     * @endcode
     */
    ~FontPlatformData();

    /**
     * init platform data
     * @param[out] : true if platform data is correctly initialized
     * @code
     * bool init = fpd->init();
     * @endcode
     */
    static bool init();

    /**
     * get fixed pitch status
     * @param[out] : status
     * @code
     * bool fixed = fpd->isFixedPitch();
     * @endcode
     */
    bool isFixedPitch();

    /**
     * get size
     * @param[out] : size
     * @code
     * float s = fpd->size();
     * @endcode
     */
    float size() const ;

    /**
     * set platform font
     * @param[in] : platform font
     * @code
     * fpd->setFont(balFont);
     * @endcode
     */
    void setFont(BalFont*) const;

    /**
     * hash
     * @param[out] : hash result
     * @code
     * unsigned fpd->hash();
     * @endcode
     */
    unsigned hash() const;

    /**
     *  operator==
     * @param[in] : FontPlatformData
     * @param[out] : true if it's equal
     * @code
     * bool e = fpd == fdp2;
     * @endcode
     */
    bool operator==(const FontPlatformData&) const;

    /**
     * HashTableDeletedValue status
     * @param[out] : status
     * @code
     * bool s = fpd->isHashTableDeletedValue();
     * @endcode
     */
    bool isHashTableDeletedValue() const ;

    BalPattern* m_pattern;
    float m_size;
    bool m_syntheticBold;
    bool m_syntheticOblique;
    BalScaledFont* m_scaledFont;
private:
    /**
     * get platform pattern
     * @param[out] : platform pattern
     * @code
     * BalPattern *bp = hashTableDeletedFontValue();
     * @endcode
     */
    static BalPattern *hashTableDeletedFontValue() ;
};

}

#endif




