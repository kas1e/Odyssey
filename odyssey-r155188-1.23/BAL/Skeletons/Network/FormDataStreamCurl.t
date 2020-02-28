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
#ifndef FormatDataStreamCurl_h
#define FormatDataStreamCurl_h
/**
 *  @file  FormDataStreamCurl.t
 *  FormDataStreamCurl description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:10 $
 */
#include "BALBase.h"

#include "config.h"

#include "FileSystem.h"
#include "ResourceHandle.h"
#include <stdio.h>

namespace WKAL {

class FormDataStream : public WKALBase {
public:
    /**
     * FormDataStream construtor
     * @param[in] : resource handle
     * @code
     * FormDataStream *f = new FormDataStream(h);
     * @endcode
     */
    FormDataStream(ResourceHandle* handle);

    /**
     * FormDataStream destructor
     * @code
     * delete f;
     * @endcode
     */
    ~FormDataStream();

    /**
     * read
     * @param[in] : data
     * @param[in] : block size
     * @param[in] : number of block
     * @param[out] : size read
     * @code
     * size_t r = f->read(p, b, n);
     * @endcode
     */
    size_t read(void* ptr, size_t blockSize, size_t numberOfBlocks);

private:
    // We can hold a weak reference to our ResourceHandle as it holds a strong reference
    // to us through its ResourceHandleInternal.
    ResourceHandle* m_resourceHandle;

    FILE* m_file;
    size_t m_formDataElementIndex;
    size_t m_formDataElementDataOffset;
};

} // namespace WKAL

#endif // FormDataStreamCurl_h




