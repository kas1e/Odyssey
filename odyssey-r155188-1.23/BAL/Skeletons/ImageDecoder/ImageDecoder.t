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
#ifndef IMAGE_DECODER_H_
#define IMAGE_DECODER_H_
/**
 *  @file  ImageDecoder.t
 *  ImageDecoder description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:08 $
 */
#include "BALBase.h"

#include "IntRect.h"
#include "ImageSource.h"
#include "SharedBuffer.h"
#include <wtf/Vector.h>

namespace WebCore {

typedef Vector<unsigned> RGBA32Array;

// The RGBA32Buffer object represents the decoded image data in RGBA32 format.  This buffer is what all
// decoders write a single frame into.  Frames are then instantiated for drawing by being handed this buffer.
class RGBA32Buffer
{
public:
    enum FrameStatus { FrameEmpty, FramePartial, FrameComplete };
    enum FrameDisposalMethod {
        // If you change the numeric values of these, make sure you audit all
        // users, as some users may cast raw values to/from these constants.
        DisposeNotSpecified = 0,       // Leave frame in framebuffer
        DisposeKeep = 1,               // Leave frame in framebuffer
        DisposeOverwriteBgcolor = 2,   // Clear frame to transparent
        DisposeOverwritePrevious = 3,  // Clear frame to previous framebuffer contents
    };

    /**
     * RGBA32Buffer default constructor
     */
    RGBA32Buffer();

    /**
     * get bytes
     * @param[out] : rgba array
     * @code
     * RGBA32Array rgba = r.bytes();
     * @endcode
     */
    const RGBA32Array& bytes() const ;

    /**
     * get bytes 
     * @param[out] : rgba array
     * @code
     * RGBA32Array rgba = r.bytes();
     * @endcode
     */
    RGBA32Array& bytes() ;

    /**
     * get rect 
     * @param[out] : rect
     * @code
     * IntRect r = r.rect();
     * @endcode
     */
    const IntRect& rect() const ;

    /**
     * get height
     * @param[out] : height
     * @code
     * unsigned h = r.height();
     * @endcode
     */
    unsigned height() const ;

    /**
     * get frame status 
     * @param[out] : frame status
     * @code
     * FrameStatus fs = r.status();
     * @endcode
     */
    FrameStatus status() const ;

    /**
     * get duration
     * @param[out] : duration
     * @code
     * unsigned d = r.duration();
     * @endcode
     */
    unsigned duration() const ;

    /**
     * get frame disposal method
     * @param[out] : frame disposal method
     * @code
     * FrameDisposalMethod f = r.disposalMethod();
     * @endcode
     */
    FrameDisposalMethod disposalMethod() const ;

    /**
     * test if the buffer has alpha
     * @param[out] : status
     * @code
     * bool a = r.hasAlpha();
     * @endcode
     */
    bool hasAlpha() const ;

    /**
     * set rect 
     * @param[in] : rect
     * @code
     * r.setRect(re);
     * @endcode
     */
    void setRect(const IntRect& r) ;

    /**
     * ensure height
     * @param[in] : row index
     * @code
     * r.ensureHeight(i);
     * @endcode
     */
    void ensureHeight(unsigned rowIndex) ;

    /**
     * set status
     * @param[in] : frame status
     * @code
     * r.setStatus(s);
     * @endcode
     */
    void setStatus(FrameStatus s) ;

    /**
     * set duration
     * @param[in] : duration
     * @code
     * r.setDuration(d);
     * @endcode
     */
    void setDuration(unsigned duration) ;

    /**
     * set disposal method
     * @param[in] : disposal method
     * @code
     * r.setDisposalMethod(m);
     * @endcode
     */
    void setDisposalMethod(FrameDisposalMethod method) ;

    /**
     * set has alpha
     * @param[in] : alpha status
     * @code
     * r.setHasAlpha(true);
     * @endcode
     */
    void setHasAlpha(bool alpha) ;

    /**
     * set RGBA 
     * @param[in] : position
     * @param[in] : red value
     * @param[in] : green value
     * @param[in] : blue value
     * @param[in] : alpha value
     * @code
     * r.setRGBA(p, r, g, b, a);
     * @endcode
     */
    static void setRGBA(unsigned& pos, unsigned r, unsigned g, unsigned b, unsigned a);

private:
    RGBA32Array m_bytes;
    IntRect m_rect;    // The rect of the original specified frame within the overall buffer.
                       // This will always just be the entire buffer except for GIF frames
                       // whose original rect was smaller than the overall image size.
    unsigned m_height; // The height (the number of rows we've fully decoded).
    FrameStatus m_status; // Whether or not this frame is completely finished decoding.
    unsigned m_duration; // The animation delay.
    FrameDisposalMethod m_disposalMethod; // What to do with this frame's data when initializing the next frame.
    bool m_hasAlpha; // Whether or not any of the pixels in the buffer have transparency.
};

// The ImageDecoder class represents a base class for specific image format decoders
// (e.g., GIF, JPG, PNG, ICO) to derive from.  All decoders decode into RGBA32 format
// and the base class manages the RGBA32 frame cache.
class ImageDecoder
{
public:
    /**
     * ImageDecoder default constructor
     */
    ImageDecoder() :m_sizeAvailable(false), m_failed(false) ;

    /**
     * ImageDecoder destructor
     */
    virtual ~ImageDecoder() ;

    // All specific decoder plugins must do something with the data they are given.
    /**
     * set data 
     * @param[in] : data
     * @param[in] : all data received status
     * @code
     * i->setData(d, s);
     * @endcode
     */
    virtual void setData(SharedBuffer* data, bool allDataReceived) ;

    /**
     * Whether or not the size information has been decoded yet.
     * @param[out] : status
     * @code
     * i->isSizeAvailable();
     * @endcode
     */
    virtual bool isSizeAvailable() const = 0;

    /**
     * Requests the size.
     * @param[out] : size
     * @code
     * i->size();
     * @endcode
     */
    virtual IntSize size() const ;

    /**
     * The total number of frames for the image.  Classes that support multiple frames
     * will scan the image data for the answer if they need to (without necessarily
     * decoding all of the individual frames).
     * @param[out] : count
     * @code
     * int c = i->frameCount();
     * @endcode
     */
    virtual int frameCount() ;

    /**
     * The number of repetitions to perform for an animation loop.
     * @param[out] : number of repetitions
     * @code
     * int r = i->repetitionCount();
     * @endcode
     */
    virtual int repetitionCount() const ;

    /**
     * Called to obtain the RGBA32Buffer full of decoded data for rendering.  The
     * decoder plugin will decode as much of the frame as it can before handing
     * back the buffer.
     * @param[in] : index
     * @param[out] : rgba buffer
     * @code
     * RGBABuffer *r = i->frameBufferAtIndex(id);
     * @endcode
     */
    virtual RGBA32Buffer* frameBufferAtIndex(size_t index) = 0;

    /**
     * Whether or not the underlying image format even supports alpha transparency.
     * @param[out] : status
     * @code
     * bool a = i->supportsAlpha();
     * @endcode
     */
    virtual bool supportsAlpha() const ;

    /**
     * get failed status
     * @param[out] : status
     * @code
     * bool f = i->failed();
     * @endcode
     */
    bool failed() const ;

    /**
     * set failed
     * @code
     * i->setFailed();
     * @endcode
     */
    void setFailed() ;

protected:
    RefPtr<SharedBuffer> m_data; // The encoded data.
    Vector<RGBA32Buffer> m_frameBufferCache;
    bool m_sizeAvailable;
    mutable bool m_failed;
    IntSize m_size;
};

}

#endif




