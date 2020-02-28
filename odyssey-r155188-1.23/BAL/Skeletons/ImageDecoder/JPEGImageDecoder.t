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
#ifndef JPEG_DECODER_H_
#define JPEG_DECODER_H_
/**
 *  @file  JPEGImageDecoder.t
 *  JPEGImageDecoder description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:08 $
 */
#include "BALBase.h"

#include "ImageDecoder.h"

namespace WebCore {

class JPEGImageReader;

// This class decodes the JPEG image format.
class JPEGImageDecoder : public ImageDecoder
{
public:
    /**
     * JPEGImageDecoder default constructor
     */
    JPEGImageDecoder();

    /**
     * JPEGImageDecoder destructor
     */
    ~JPEGImageDecoder();

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
     * @see ImageDecoder
     */
    virtual bool supportsAlpha() const ;

    /**
     * decode
     * @param[in] : size only status
     * @code
     * i->decode(true);
     * @endcode
     */
    void decode(bool sizeOnly = false) const;

    /**
     * get reader 
     * @param[out] : jpeg image reader
     * @code
     * JPEGImageReader *j = i->reader();
     * @endcode
     */
    JPEGImageReader* reader() ;

    /**
     * set size
     * @param[in] : width
     * @param[in] : height
     * @code
     * i->setSize(w, h);
     * @endcode
     */
    void setSize(int width, int height) ;

    /**
     * output scanlines
     * @param[out] : status
     * @code
     * bool s = i->outputScanlines();
     * @endcode
     */
    bool outputScanlines();

    /**
     * jpeg complete
     * @code
     * i->jpegComplete();
     * @endcode
     */
    void jpegComplete();

private:
    mutable JPEGImageReader* m_reader;
};

}

#endif




