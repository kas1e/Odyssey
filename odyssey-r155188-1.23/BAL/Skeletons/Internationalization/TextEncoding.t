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
#ifndef TextEncoding_h
#define TextEncoding_h
/**
 *  @file  TextEncoding.t
 *  TextEncoding description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:09 $
 */
#include "BALBase.h"

#include "TextCodec.h"
#include <wtf/unicode/Unicode.h>

namespace WebCore {

    class CString;
    class String;

    class TextEncoding : public WebCoreBase {
    public:
    /**
     * TextEncoding default constructor
     */
        TextEncoding();

    /**
     * TextEncoding constructor
     * @param[in] : string
     */
        TextEncoding(const char* name);

    /**
     * TextEncoding constructor
     * @param[in] : string
     */
        TextEncoding(const String& name);

    /**
     * test if the TextEncoding is valid
     * @param[out] : status
     */
        bool isValid() const ;

    /**
     * get name 
     * @param[out] : name
     */
        const char* name() const ;

    /**
     * test if TextEncoding uses visual ordering
     * @param[out] : status
     */
        bool usesVisualOrdering() const;

    /**
     * test if TextEncoding is japanese
     * @param[out] : status
     */
        bool isJapanese() const;

    /**
     * get back slash as currency symbol
     * @param[out] : unicode character
     */
        UChar backslashAsCurrencySymbol() const;

    /**
     * get closest 8 bit equivalent
     * @param[out] : TextEncoding
     */
        const TextEncoding& closest8BitEquivalent() const;

    /**
     * decode
     * @param[in] : string
     * @param[in] : length
     * @param[out] : string
     */
        String decode(const char* str, size_t length) const;

    /**
     * decode 
     * @param[in] : string
     * @param[in] : length
     * @param[in] : stop on error status
     * @param[in] : saw error status
     * @param[out] : string
     */
        String decode(const char*, size_t length, bool stopOnError, bool& sawError) const;

    /**
     * encode
     * @param[in] : unicode characters
     * @param[in] : length
     * @param[in] : unencodable handling
     * @param[out] : CString
     */
        CString encode(const UChar*, size_t length, UnencodableHandling) const;

    private:
        const char* m_name;
    };

    /**
     * operator== 
     */
    inline bool operator==(const TextEncoding& a, const TextEncoding& b) ;

    /**
     * operator!= 
     */
    inline bool operator!=(const TextEncoding& a, const TextEncoding& b) ;

    /**
     * ASCIIEncoding 
     */
    const TextEncoding& ASCIIEncoding();

    /**
     * Latin1Encoding
     */
    const TextEncoding& Latin1Encoding();

    /**
     * UTF16BigEndianEncoding 
     */
    const TextEncoding& UTF16BigEndianEncoding();

    /**
     * UTF16LittleEndianEncoding 
     */
    const TextEncoding& UTF16LittleEndianEncoding();

    /**
     * UTF32BigEndianEncoding 
     */
    const TextEncoding& UTF32BigEndianEncoding();

    /**
     * UTF32LittleEndianEncoding 
     */
    const TextEncoding& UTF32LittleEndianEncoding();

    /**
     * UTF8Encoding 
     */
    const TextEncoding& UTF8Encoding();

    /**
     * WindowsLatin1Encoding
     */
    const TextEncoding& WindowsLatin1Encoding();

} // namespace WebCore

#endif // TextEncoding_h




