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
#ifndef PNG_DECODER_H_
#define PNG_DECODER_H_
/**
 *  @file  PNGImageDecoder.t
 *  PNGImageDecoder description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:08 $
 */
#include "BALBase.h"

#include "ImageDecoder.h"

namespace WebCore {

class PNGImageReader;

// This class decodes the PNG image format.
class PNGImageDecoder : public ImageDecoder
{
public:
    /**
     * PNGImageDecoder constructor
     */
    PNGImageDecoder();

    /**
     * PNGImageDecoder destructor
     */
    ~PNGImageDecoder();

    // Take the data and store it.
    /**
     * @see ImageDecoder
     */
    virtual void setData(SharedBuffer* data, bool allDataReceived);

    // Whether or not the size information has been decoded yet.
    /**
     * @see ImageDecoder
     */
    virtual bool isSizeAvailable() const;

    /**
     * @see ImageDecoder
     */
    virtual RGBA32Buffer* frameBufferAtIndex(size_t index);

    /**
     * decode
     * @param[in] : size only status
     * @code
     * i->decode(s);
     * @endcode
     */
    void decode(bool sizeOnly = false) const;

    /**
     * get reader
     * @param[out] : png image reader
     * @code
     * PNGImageReader p = i->reader();
     * @endcode
     */
    PNGImageReader* reader() ;

    // Callbacks from libpng
    /**
     * decoding failed
     */
    void decodingFailed() ;

    /**
     * header available
     */
    void headerAvailable();

    /**
     * row available
     */
    void rowAvailable(unsigned char* rowBuffer, unsigned rowIndex, int interlacePass);

    /**
     * pngComplete
     */
    void pngComplete();

private:
    mutable PNGImageReader* m_reader;
};

}

#endif




