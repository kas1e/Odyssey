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
#ifndef SegmentedFontData_h
#define SegmentedFontData_h
/**
 *  @file  SegmentedFontData.t
 *  SegmentedFontData description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:06 $
 */
#include "BALBase.h"

#include "FontData.h"
#include <wtf/Vector.h>

namespace WKAL {

class SimpleFontData;

struct FontDataRange {
    /**
     * FontDataRange constructor
     * @param[in] : start range
     * @param[in] : end range
     * @param[in] : font data
     * @code
     * FontDataRange *fdr = new FontDataRange(0, 12, fd);
     * @endcode
     */
    FontDataRange(UChar32 from, UChar32 to, const SimpleFontData* fontData);

    /**
     * get start range
     * @param[out] : start range
     * @code
     * UChar32 c = fdr->from();
     * @endcode
     */
    UChar32 from() const ;

    /**
     * get end range
     * @param[out] : end range
     * @code
     * UChar32 c = fdr->to();
     * @endcode
     */
    UChar32 to() const ;

    /**
     * get font data 
     * @param[out] : font data
     * @code
     * SimpleFontData *fd = fdr->fontData();
     * @endcode
     */
    const SimpleFontData* fontData() const ;

private:
    UChar32 m_from;
    UChar32 m_to;
    const SimpleFontData* m_fontData;
};

class SegmentedFontData : public WKALBase, public FontData {
public:
    /**
     * ~SegmentedFontData destructor
     * @code
     * delete segfd;
     * @endcode
     */
    virtual ~SegmentedFontData();

    /**
     * fontData for a character 
     * @param[in] : character
     * @param[out] : font data
     * @code
     * SimpleFontData *sfd = segfd->fontDataForCharacter(c);
     * @endcode
     */
    virtual const SimpleFontData* fontDataForCharacter(UChar32) const;

    /**
     * get if the SegmentedFontData contains characters
     * @param[in] : characters
     * @param[in] : characters length
     * @param[out] : true or false
     * @code
     * bool c = segfd->containsCharacters(chars, 12);
     * @endcode
     */
    virtual bool containsCharacters(const UChar*, int length) const;

    /**
     * get if it's a custom font
     * @param[out] : true or false
     * @code
     * bool c = segfd->isCustomFont();
     * @endcode
     */
    virtual bool isCustomFont() const;

    /**
     * get if the SegmentedFontData is loading
     * @param[out] : true or false
     * @code
     * bool c = segfd->isLoading();
     * @endcode
     */
    virtual bool isLoading() const;

    /**
     * get if the SegmentedFontData is segmented
     * @param[out] : true or false
     * @code
     * bool c = segfd->isSegmented();
     * @endcode
     */
    virtual bool isSegmented() const;

    /**
     * append range
     * @param[in] : font data range
     * @code
     * segfd->appendRange(fdr);
     * @endcode
     */
    void appendRange(const FontDataRange& range) ;

    /**
     * get number of ranges
     * @param[out] : number of ranges
     * @code
     * unsigned n = segfd->numRanges();
     * @endcode
     */
    unsigned numRanges() const ;

    /**
     * range at index
     * @param[in] : index
     * @param[out] : FontDataRange
     * @code
     * FontDataRange fdr = segfd->rangeAt(3);
     * @endcode
     */
    const FontDataRange& rangeAt(unsigned i) const ;

private:
    Vector<FontDataRange, 1> m_ranges;
};

} // namespace WKAL

#endif // SegmentedFontData_h




