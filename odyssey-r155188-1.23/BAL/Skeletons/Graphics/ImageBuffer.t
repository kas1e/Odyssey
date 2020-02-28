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
#ifndef ImageBuffer_h
#define ImageBuffer_h
/**
 *  @file  ImageBuffer.t
 *  ImageBuffer description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:07 $
 */
#include "BALBase.h"

#include "Image.h"
#include "IntSize.h"
#include <wtf/OwnPtr.h>
#include <wtf/PassRefPtr.h>
#include <memory>

#include "NotImplemented.h"




namespace WKAL {

    class GraphicsContext;
    class ImageData;
    class IntPoint;
    class IntRect;
    class RenderObject;
    class String;

    class ImageBuffer : public WKALBase, Noncopyable {
    public:
    /**
     * create image buffer
     * @param[in] : size
     * @param[in] : gray scale
     * @param[out] : Image buffer
     * @code
     * RefPtr<ImageBuffer> im = ImageBuffer::create(s, true);
     * @endcode
     */
        static std::auto_ptr<ImageBuffer> create(const IntSize&, bool grayScale);

    /**
     * ImageBuffer destructor
     * @code
     * delete im;
     * @endcode
     */
        ~ImageBuffer();

    /**
     * get image buffer size
     * @param[out] : size
     * @code
     * IntSize s = im->size();
     * @endcode
     */
        IntSize size() const ;

    /**
     * get graphics context
     * @param[out] : graphics context
     * @code
     * GraphicsContext *gc = im->context();
     * @endcode
     */
        GraphicsContext* context() const;

    /**
     * get image
     * @param[out] : im->image();
     * @code
     * Image i = im->image();
     * @endcode
     */
        Image* image() const;

    /**
     * clear image 
     * @code
     * im->clearImage();
     * @endcode
     */
        void clearImage() ;

    /**
     * get image data 
     * @param[in] : rect
     * @param[out] : image data
     * @code
     * RefPtr<ImageData> id = im->getImageData(r);
     * @endcode
     */
        PassRefPtr<ImageData> getImageData(const IntRect& rect) const;

    /**
     * put image data
     * @param[in] : image data
     * @param[in] : source rect
     * @param[in] : destination point
     * @code
     * im->putImageData(id, src, dest);
     * @endcode
     */
        void putImageData(ImageData* source, const IntRect& sourceRect, const IntPoint& destPoint);

    /**
     * to data URL
     * @param[in] : mime type
     * @param[out] : url
     * @code
     * String u = im->toDataURL(m);
     * @endcode
     */
        String toDataURL(const String& mimeType) const;

        

    private:
        void* m_data;
        IntSize m_size;

        OwnPtr<GraphicsContext> m_context;
        mutable OwnPtr<Image> m_image;
    
    /**
     * ImageBuffer private constructor
     * @param[in] : surface
     */
        ImageBuffer(BalSurface*);
        mutable BalSurface* m_surface;
    };

} // namespace WKAL

#endif // ImageBuffer_h



