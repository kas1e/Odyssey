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
#ifndef SVGImage_h
#define SVGImage_h
/**
 *  @file  SVGImage.t
 *  SVGImage description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:08 $
 */
#include "BALBase.h"

#if ENABLE(SVG)

#include "Image.h"
#include "ImageBuffer.h"
#include "IntSize.h"
#include <wtf/OwnPtr.h>

namespace WKAL {
    
    class SVGDocument;
    class Frame;
    class FrameView;
    class Page;
    
    class SVGImage : public WKALBase, public Image {
    public:

    /**
     *  create SVG Image
     */
        static PassRefPtr<SVGImage> create(ImageObserver* observer);

    /**
     * SVGImage destructor
     * @code
     * delete i;
     * @endcode
     */
        ~SVGImage();

    /**
     * set container size
     * @param[in] : size
     * @code
     * i->setContainerSize(s);
     * @endcode
     */
        virtual void setContainerSize(const IntSize&);

    /**
     * test if the SVGImage uses container size
     * @param[out] : true if the SVGImage uses container size
     * @code
     * bool u = i->usesContainerSize();
     * @endcode
     */
        virtual bool usesContainerSize() const;

    /**
     * test if the SVGImage has relative width
     * @param[out] : true if the SVGImage has relative width
     * @code
     * bool h = i->hasRelativeWidth();
     * @endcode
     */
        virtual bool hasRelativeWidth() const;

    /**
     * test if SVGImage has relative height
     * @param[out] : true if SVGImage has relative height
     * @code
     * bool h = i->hasRelativeHeight();
     * @endcode
     */
        virtual bool hasRelativeHeight() const;

    /**
     * get SVGImage size
     * @param[out] : size
     * @code
     * IntSize s = i->size();
     * @endcode
     */
        virtual IntSize size() const;
        
    /**
     * test if the SVGImage data changed
     * @param[in] : true if all data is received
     * @param[out] : true if the SVGImage data changed
     * @code
     * bool d = i->dataChanged(true);
     * @endcode
     */
        virtual bool dataChanged(bool allDataReceived);


    /**
     *  destroyDecodedData
     */
        virtual void destroyDecodedData(bool incremental = false) ;


    /**
     * get decodedSize
     */
        virtual unsigned decodedSize() const ;

    /**
     * get frame at index 
     * @param[in] : index
     * @param[out] : native image
     * @code
     * NativeImagePtr im = i->frameAtIndex(1);
     * @endcode
     */
        virtual NativeImagePtr frameAtIndex(size_t) ;

private :

    /**
     * SVGImage constructor 
     */
        SVGImage(ImageObserver*);

    /**
     *  draw 
     */
        virtual void draw(GraphicsContext*, const FloatRect& fromRect, const FloatRect& toRect, CompositeOperator);

    /**
     * get nativeImageForCurrentFrame
     */
        virtual NativeImagePtr nativeImageForCurrentFrame();
        
        SVGDocument* m_document;
        OwnPtr<Page> m_page;
        RefPtr<Frame> m_frame;
        RefPtr<FrameView> m_frameView;
        IntSize m_minSize;
        OwnPtr<ImageBuffer> m_frameCache;
    };
}

#endif // ENABLE(SVG)

#end
