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
#ifndef GeneratedImage_h
#define GeneratedImage_h
/**
 *  @file  GeneratedImage.t
 *  GeneratedImage description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:07 $
 */
#include "BALBase.h"

#include "Image.h"

#include "Generator.h"
#include "IntSize.h"
#include <wtf/OwnPtr.h>

namespace WKAL {

class GeneratedImage : public WKALBase, public Image {
public:

    /**
     *  create 
     */
    static PassRefPtr<GeneratedImage> create(PassRefPtr<Generator> generator, const IntSize& size);

    /**
     * GeneratedImage destructor
     * @code
     * delete gi;
     * @endcode
     */
    virtual ~GeneratedImage() ;


    /**
     * has SingleSecurityOrigin
     */
    virtual bool hasSingleSecurityOrigin() const ;

    /**
     * set the container size, these are only used for SVGGeneratedImage right now
     * @param[in] : size
     * @code
     * gi->setContainerSize(s);
     * @endcode
     */
    virtual void setContainerSize(const IntSize& size) ;

    /**
     * test if the GeneratedImage uses ContainerSize
     * @param[out] : true if the GeneratedImage uses ContainerSize
     * @code
     * bool u = gi->usesContainerSize();
     * @endcode
     */
    virtual bool usesContainerSize() const ;

    /**
     * test if the GeneratedImage has relative width
     * @param[out] : true if the GeneratedImage has relative width
     * @code
     * bool rw = gi->hasRelativeWidth();
     * @endcode
     */
    virtual bool hasRelativeWidth() const ;

    /**
     * test if the GeneratedImage has relative height
     * @param[out] : true if the GeneratedImage has relative height
     * @code
     * bool rh = gi->hasRelativeHeight();
     * @endcode
     */
    virtual bool hasRelativeHeight() const ;

    /**
     * get GeneratedImage size
     * @param[out] : size
     * @code
     * IntSize s = gi->size();
     * @endcode
     */
    virtual IntSize size() const ;

    /**
     *  destroyDecodedData
     */
    virtual void destroyDecodedData(bool incremental = false) ;


    /**
     * get decodedSize 
     */
    virtual unsigned decodedSize() const ;

protected:
    /**
     * draw 
     * @param[in] : graphics context
     * @param[in] : destination rect
     * @param[in] : source rect
     * @param[in] : composite operator
     * @code
     * draw(gc, dest, src, op); 
     * @endcode
     */
    virtual void draw(GraphicsContext*, const FloatRect& dstRect, const FloatRect& srcRect, CompositeOperator);

    /**
     * drawPattern
     * @param[in] : graphics context
     * @param[in] : source rect
     * @param[in] : matrix transformation
     * @param[in] : phase
     * @param[in] : composite operator
     * @param[in] : destination rect
     * @code
     * drawPattern(gc, src, af, ph, op, dest);
     * @endcode
     */
    virtual void drawPattern(GraphicsContext*, const FloatRect& srcRect, const AffineTransform& patternTransform,
                             const FloatPoint& phase, CompositeOperator, const FloatRect& destRect);

protected:
    /**
     *  GeneratedImage constructor
     */
    GeneratedImage(PassRefPtr<Generator> generator, const IntSize& size);
    
    
    OwnPtr<Generator> m_generator;
    IntSize m_size;
};

}

#endi
