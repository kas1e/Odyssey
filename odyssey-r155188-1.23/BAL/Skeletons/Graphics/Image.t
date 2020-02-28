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
#ifndef Image_h
#define Image_h
/**
 *  @file  Image.t
 *  Image description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:07 $
 */
#include "BALBase.h"

#include "Color.h"
#include "GraphicsTypes.h"
#include "ImageSource.h"
#include <wtf/RefPtr.h>
#include <wtf/PassRefPtr.h>
#include "SharedBuffer.h"





namespace WKAL {

class AffineTransform;
class FloatPoint;
class FloatRect;
class FloatSize;
class GraphicsContext;
class IntRect;
class IntSize;
class SharedBuffer;
class String;

// This class gets notified when an image creates or destroys decoded frames and when it advances animation frames.
class ImageObserver;

class Image : public WKALBase, Noncopyable {
    friend class GeneratedImage;
    friend class GraphicsContext;
publi

    /**
     * Image destructor
     * @code
     * delete i;
     * @endcode
     */
    virtual ~Image();
    

    /**
     * create an image
     * @param[in] : imageObserver
     * @param[out] : image
     */
    static PassRefPtr<Image> create(ImageObserver* = 0);

    /**
     * load platform resource 
     * @param[in] : name
     * @param[out] : image
     * @code
     * Image *i = Image::loadPlatformResource(n);
     * @endcode
     */
    static PassRefPtr<Image> loadPlatformResource(const char* name);

    /**
     * supports type
     * @param[in] : type
     * @param[out] : true if type is supported
     * @code
     * bool s = Image::supportsType(s);
     * @endcode
     */
    static bool supportsType(const String&); 

    /**
     * test if the image is a bitmap image
     * @param[out] : true if the image is a bitmap image
     * @code
     * bool b = i->isBitmapImage();
     * @endcode
     */
    virtual bool isBitmapImage() const ;
    


    /**
     * has SingleSecurityOrigin
     */
    virtual bool hasSingleSecurityOrigin() const ;

    /**
     * get a nullImage
     * @param[out] : null image
     */
    static Image* nullImage();

    /**
     * test if the image is null
     * @param[out] : true if the image is null
     * @code
     * bool n = i->isNull();
     * @endcode
     */
    bool isNull() const;

    // These are only used for SVGImage right now
    /**
     * set container size
     * @param[in] : size
     * @code
     * i->setContainerSize(s);
     * @endcode
     */
    virtual void setContainerSize(const IntSize&) ;

    /**
     * test if image uses ContainerSize
     * @param[out] : true if image uses ContainerSize
     * @code
     * bool b = i->usesContainerSize();
     * @endcode
     */
    virtual bool usesContainerSize() const ;

    /**
     * test if image has relative width
     * @param[out] : true if image has relative width
     * @code
     * bool r = i->hasRelativeWidth();
     * @endcode
     */
    virtual bool hasRelativeWidth() const ;

    /**
     * test if image has relative height 
     * @param[out] : true if image has relative height
     * @code
     * bool h = i->hasRelativeHeight();
     * @endcode
     */
    virtual bool hasRelativeHeight() const ;

    /**
     * get image size
     * @param[out] : size
     * @code
     * IntSize s = i->size();
     * @endcode
     */
    virtual IntSize size() const = 0;

    /**
     * get rect
     * @param[out] : rect
     * @code
     * IntRect r = i->rect();
     * @endcode
     */
    IntRect rect() const;

    /**
     * get width
     * @param[out] : width value
     * @code
     * int w = i->width();
     * @endcode
     */
    int width() const;

    /**
     * get height
     * @param[out] : height value
     * @code
     * int w = i->height();
     * @endcode
     */
    int height() const;

    /**
     * set data
     * @param[in] : data
     * @param[in] : true if all data is received
     * @param[out] : true if image is available
     * @code
     * bool a = i->setData(d, true);
     * @endcode
     */
    bool setData(PassRefPtr<SharedBuffer> data, bool allDataReceived);

    /**
     * data changed
     * @param[in] : true if all data is received
     * @param[out] : true if image is available
     * @code
     * bool d = i->dataChanged(true);
     * @endcode
     */
    virtual bool dataChanged(bool allDataReceived) ;
    
    // FIXME: PDF/SVG will be underreporting decoded sizes and will be unable to prune because these functions are not
    // implemented yet for those image types.
    /**
     * destroy decoded data
     * @param[in] : incremental
     * @code
     * i->destroyDecodedData();
     * @endcode
     */
    virtual void destroyDecodedData(bool incremental = false) = 0;

    /**
     * get decoded size
     * @param[out] : size
     * @code
     * unsigned s = i->decodedSize();
     * @endcode
     */
    virtual unsigned decodedSize() const = 0;

    /**
     * get data
     * @param[out] : data
     * @code
     * SharedBuffer *d = i->data();
     * @endcode
     */
    SharedBuffer* data() ;

    // It may look unusual that there is no start animation call as public API.  This is because
    // we start and stop animating lazily.  Animation begins whenever someone draws the image.  It will
    // automatically pause once all observers no longer want to render the image anywhere.
    /**
     * stop animation
     * @code
     * i->stopAnimation();
     * @endcode
     */
    virtual void stopAnimation() ;

    /**
     * reset animation
     * @code
     * i->resetAnimation();
     * @endcode
     */
    virtual void resetAnimation() ;
    
    // Typically the CachedImage that owns us.
    /**
     * get imageObserver
     * @param[out] : imageObserver
     * @code
     * ImageObserver *io = i->imageObserver();
     * @endcode
     */
    ImageObserver* imageObserver() const ;

    enum TileRule { StretchTile, RoundTile, RepeatTile };

    /**
     * get native image for current frame
     * @param[out] : native image
     * @code
     * NativeImagePtr ni = i->nativeImageForCurrentFrame();
     * @endcode
     */
    virtual NativeImagePtr nativeImageForCurrentFrame() ;
    
protected:
    /**
     * image constructor
     **/
    Image(ImageObserver* = 0);
 
    /**
     * fillWithSolidColor
     **/
    static void fillWithSolidColor(GraphicsContext* ctxt, const FloatRect& dstRect, const Color& color, CompositeOperator op);

    /**
     * draw
     */
    virtual void draw(GraphicsContext*, const FloatRect& dstRect, const FloatRect& srcRect, CompositeOperator) = 0;
    /**
     *  drawTiled
     */
    void drawTiled(GraphicsContext*, const FloatRect& dstRect, const FloatPoint& srcPoint, const FloatSize& tileSize, CompositeOperator);

    /**
     *  drawTiled
     */
    void drawTiled(GraphicsContext*, const FloatRect& dstRect, const FloatRect& srcRect, TileRule hRule, TileRule vRule, CompositeOperator);

    // Supporting tiled drawing
    /**
     * mayFillWithSolidColor
     */
    virtual bool mayFillWithSolidColor() const ;

    /**
     *  solidColor 
     */
    virtual Color solidColor() const ;

    /**
     * startAnimation
     */
    virtual void startAnimation() ;
    
    /**
     *  drawPattern
     */
    virtual void drawPattern(GraphicsContext*, const FloatRect& srcRect, const AffineTransform& patternTransform,
                             const FloatPoint& phase, CompositeOperator, const FloatRect& destRect);
    
protected:
    RefPtr<SharedBuffer> m_data; // The encoded raw data for the image. 
    ImageObserver* m_imageObserver;
};

}
