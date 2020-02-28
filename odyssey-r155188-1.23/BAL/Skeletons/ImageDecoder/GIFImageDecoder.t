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
#ifndef GIF_DECODER_H_
#define GIF_DECODER_H_
/**
 *  @file  GIFImageDecoder.t
 *  GIFImageDecoder description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:08 $
 */
#include "BALBase.h"

#include "ImageDecoder.h"

namespace WebCore {

class GIFImageDecoderPrivate;

// This class decodes the GIF image format.
class GIFImageDecoder : public ImageDecoder
{
public:
    /**
     * GIFImageDecoder default constructor
     */
    GIFImageDecoder();

    /**
     * GIFImageDecoder destructor
     */
    ~GIFImageDecoder();

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

    // The total number of frames for the image.  Will scan the image data for the answer
    // (without necessarily decoding all of the individual frames).
    /**
     * @see ImageDecoder
     */
    virtual int frameCount();

    // The number of repetitions to perform for an animation loop.
    /**
     * @see ImageDecoder
     */
    virtual int repetitionCount() const;

    /**
     * @see ImageDecoder
     */
    virtual RGBA32Buffer* frameBufferAtIndex(size_t index);

    /**
     * @see ImageDecoder
     */
    virtual unsigned frameDurationAtIndex(size_t index) ;

    enum GIFQuery { GIFFullQuery, GIFSizeQuery, GIFFrameCountQuery };

    /**
     * decode
     * @param[in] : query
     * @param[in] : halt at frame
     * @code
     * i->decode(q, h);
     * @endcode
     */
    void decode(GIFQuery query, unsigned haltAtFrame) const;

    // Callbacks from the GIF reader.
    /**
     * size now available
     * @param[in] : width
     * @param[in] : height
     * @code
     * i->sizeNowAvailable(w, h);
     * @endcode
     */
    void sizeNowAvailable(unsigned width, unsigned height);

    /**
     * decoding halted
     * @param[in] : bytes left
     * @code
     * i->decodingHalted(b);
     * @endcode
     */
    void decodingHalted(unsigned bytesLeft);

    /**
     * have decoded row 
     * @param[in] : frame index
     * @param[in] : row buffer
     * @param[in] : row end
     * @param[in] : row number
     * @param[in] : repeat count
     * @param[in] : write transparent pixel
     * @code
     * i->haveDecodedRow(f, b, e, n, r, w);
     * @endcode
     */
    void haveDecodedRow(unsigned frameIndex, unsigned char* rowBuffer, unsigned char* rowEnd, unsigned rowNumber, 
                        unsigned repeatCount, bool writeTransparentPixels);

    /**
     * frame complete
     * @param[in] : frame index
     * @param[in] : frame duration
     * @param[in] : disposal method
     * @code
     * i->frameComplete(fi, fd, dm);
     * @endcode
     */
    void frameComplete(unsigned frameIndex, unsigned frameDuration, RGBA32Buffer::FrameDisposalMethod disposalMethod);

    /**
     * gif complete
     * @code
     * i->gifComplete();
     * @endcode
     */
    void gifComplete();

private:
    // Called to initialize the frame buffer with the given index, based on the
    // previous frame's disposal method.
    /**
     *  initFrameBuffer 
     */
    void initFrameBuffer(unsigned frameIndex);

    // A helper for initFrameBuffer(), this sets the size of the buffer, and
    // fills it with transparent pixels.
    /**
     *  prepEmptyFrameBuffer
     */
    void prepEmptyFrameBuffer(RGBA32Buffer* buffer) const;

    bool m_frameCountValid;
    bool m_currentBufferSawAlpha;
    mutable int m_repetitionCount;
    mutable GIFImageDecoderPrivate* m_reader;
};

}

#endif




