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
#ifndef TextDecoder_h
#define TextDecoder_h
/**
 *  @file  TextDecoder.t
 *  TextDecoder description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:09 $
 */
#include "BALBase.h"

#include "PlatformString.h"
#include "TextCodec.h"
#include "TextEncoding.h"
#include <wtf/OwnPtr.h>

namespace WebCore {

    class TextCodec;

    class TextDecoder : public WebCoreBase {
    public:
    /**
     * TextDecoder constructor
     * @param[in] : TextEncoding
     */
        TextDecoder(const TextEncoding&);

    /**
     * reset
     * @param[in] : TextEncoding
     * @code
     * t->reset(te);
     * @endcode
     */
        void reset(const TextEncoding&);

    /**
     * encoding
     * @param[out] : text encoding
     * @code
     * TextEncoding te = t->encoding();
     * @endcode
     */
        const TextEncoding& encoding() const ;

    /**
     * decode
     * @param[in] : data
     * @param[in] : length
     * @param[in] : flush status
     * @param[in] : stop on error status
     * @param[out] : error
     * @param[out] : description
     * @code
     * t->decode(d, l, f, st, er);
     * @endcode
     */
        String decode(const char* data, size_t length, bool flush, bool stopOnError, bool& sawError);

    private:
    /**
     * checkForBOM 
     */
        String checkForBOM(const char*, size_t length, bool flush, bool stopOnError, bool& sawError);

        TextEncoding m_encoding;
        OwnPtr<TextCodec> m_codec;

        bool m_checkedForBOM;
        unsigned char m_numBufferedBytes;
        unsigned char m_bufferedBytes[3];
    };

} // namespace WebCore

#endif // TextDecoder_h




