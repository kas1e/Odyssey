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
#ifndef TextEncodingRegistry_h
#define TextEncodingRegistry_h
/**
 *  @file  TextEncodingRegistry.t
 *  TextEncodingRegistry description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:09 $
 */
#include "BALBase.h"

#include <memory>
#include <wtf/unicode/Unicode.h>

namespace WebCore {

    class TextCodec;
    class TextEncoding;

    // Only TextEncoding and TextDecoder should use this function directly.
    // - Use TextDecoder::decode to decode, since it handles BOMs.
    // - Use TextEncoding::decode to decode if you have all the data at once.
    //   It's implemented by calling TextDecoder::decode so works just as well.
    // - Use TextEncoding::encode to encode, since it takes care of normalization.
    /**
     * newTextCodec 
     * @param[in] : text encoding
     * @param[out] : TextCodec
     */
    std::auto_ptr<TextCodec> newTextCodec(const TextEncoding&);

    /**
     * get atomicCanonicalTextEncodingName
     * Only TextEncoding should use this function directly.
     * @param[in] : alias
     * @param[out] : encoding name
     */
    const char* atomicCanonicalTextEncodingName(const char* alias);

    /**
     * atomicCanonicalTextEncodingName 
     * @param[in] : alias characters
     * @param[in] : alias length
     * @param[out] : encoding name
     */
    const char* atomicCanonicalTextEncodingName(const UChar* aliasCharacters, size_t aliasLength);

    /**
     * noExtendedTextEncodingNameUsed 
     * Only TextEncoding should use this function directly.
     * @param[out] : status
     */
    bool noExtendedTextEncodingNameUsed();

}

#endif // TextEncodingRegistry_h




