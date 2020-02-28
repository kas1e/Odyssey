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
#ifndef TextCodec_h
#define TextCodec_h
/**
 *  @file  TextCodec.t
 *  TextCodec description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:09 $
 */
#include "BALBase.h"

#include <memory>
#include <wtf/Noncopyable.h>
#include <wtf/Vector.h>
#include <wtf/unicode/Unicode.h>

#include "PlatformString.h"

namespace WebCore {
    class TextEncoding;

    // Specifies what will happen when a character is encountered that is
    // not encodable in the character set.
    enum UnencodableHandling {
        // Substitutes the replacement character "?".
        QuestionMarksForUnencodables,

        // Encodes the character as an XML entity. For example, U+06DE
        // would be "&#1758;" (0x6DE = 1758 in octal).
        EntitiesForUnencodables,

        // Encodes the character as en entity as above, but escaped
        // non-alphanumeric characters. This is used in URLs.
        // For example, U+6DE would be "%26%231758%3B".
        URLEncodedEntitiesForUnencodables,
    };

    typedef char UnencodableReplacementArray[32];

    class TextCodec : public WebCoreBase, Noncopyable {
    public:
    /**
     * TextCodec destructor
     */
        virtual ~TextCodec();

    /**
     * decode 
     * @param[in] : string
     * @param[in] : size
     * @param[in] : flush status
     * @param[out] : string
     * @code
     * String s = t->decode(s, l);
     * @endcode
     */
        String decode(const char* str, size_t length, bool flush = false);
        
    /**
     * decode
     * @param[in] : string
     * @param[in] : size
     * @param[in] : flush status
     * @param[in] : stop on error status
     * @param[out] : error
     * @param[out] : string
     * @code
     * String s = t->decode(s, l, true, true, &error);
     * @endcode
     */
        virtual String decode(const char*, size_t length, bool flush, bool stopOnError, bool& sawError) = 0;

    /**
     * encode
     * @param[in] : unicode character
     * @param[in] : size
     * @param[in] : unencodable handling
     * @param[out] : CString
     * @code
     * CString c = t->encode(u, l, uh);
     * @endcode
     */
        virtual CString encode(const UChar*, size_t length, UnencodableHandling) = 0;

    /**
     * Fills a null-terminated string representation of the given
     * unencodable character into the given replacement buffer. 
     * The length of the string (not including the null) will be returned.
     * @param[in] : code point
     * @param[in] : unencodable handling
     * @param[in] : unencodable replacement array
     * @param[out] : length
     * @code
     * int l = t->getUnencodableReplacement(c, uh, ur);
     * @endcode
     */
        static int getUnencodableReplacement(unsigned codePoint, UnencodableHandling, UnencodableReplacementArray);
    };

    /**
     * function template
     */
    typedef void (*EncodingNameRegistrar)(const char* alias, const char* name);

    /**
     * function template
     */
    typedef std::auto_ptr<TextCodec> (*NewTextCodecFunction)(const TextEncoding&, const void* additionalData);

    /**
     * function template
     */
    typedef void (*TextCodecRegistrar)(const char* name, NewTextCodecFunction, const void* additionalData);

} // namespace WebCore

#endif // TextCodec_h




