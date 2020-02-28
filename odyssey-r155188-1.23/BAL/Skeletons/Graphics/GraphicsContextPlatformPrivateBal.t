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

#ifndef GraphicsContextPlatformPrivateBal_H
#define GraphicsContextPlatformPrivateBal_H
/**
 *  @file  GraphicsContextPlatformPrivateBal.t
 *  GraphicsContextPlatformPrivateCairo description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:07 $
 */
#include "BALBase.h"


#include "GraphicsContext.h"


#include <math.h>
#include <stdio.h>
#include <wtf/MathExtras.h>


namespace WKAL {

class GraphicsContextPlatformPrivate : public WKALBase {
public:
    /**
     * GraphicsContextPlatformPrivate default constructor
     * @code
     * GraphicsContextPlatformPrivate *gcpp = new GraphicsContextPlatformPrivate();
     * @endcode
     */
    GraphicsContextPlatformPrivate();

    /**
     * GraphicsContextPlatformPrivate destructor
     * @code
     * delete gcpp;
     * @endcode
     */
    ~GraphicsContextPlatformPrivate();

    // On everything else, we do nothing.
    /**
     * save 
     * @code
     * gcpp->save();
     * @endcode
     */
    void save() ;

    /**
     * restore
     * @code
     * gcpp->restore();
     * @endcode
     */
    void restore() ;

    /**
     * clip
     * @param[in] : rect
     * @code
     * gcpp->clip(r);
     * @endcode
     */
    void clip(const FloatRect&) ;

    /**
     * clip
     * @param[in] : path
     * @code
     * gcpp->clip(p);
     * @endcode
     */
    void clip(const Path&) ;

    /**
     * scale
     * @param[in] : scale value
     * @code
     * gcpp->scale(s);
     * @endcode
     */
    void scale(const FloatSize&) ;

    /**
     * rotate
     * @param[in] : angle
     * @code
     * gcpp->rotate(a);
     * @endcode
     */
    void rotate(float) ;

    /**
     * translate 
     * @param[in] : x value
     * @param[in] : y value
     * @code
     * gcpp->translate(x, y);
     * @endcode
     */
    void translate(float, float) ;

    /**
     * concatCTM 
     * @param[in] : affine transform
     * @code
     * gcpp->concatCTM(a);
     * @endcode
     */
    void concatCTM(const AffineTransform&) ;

    /**
     * beginTransparencyLayer
     * @code
     * gcpp->beginTransparencyLayer();
     * @endcode
     */
    void beginTransparencyLayer() ;

    /**
     * endTransparencyLayer
     * @code
     * gcpp->endTransparencyLayer();
     * @endcode
     */
    void endTransparencyLayer() ;

    cairo_t* cr;
    Vector<float> layers;

    BalEventExpose* expose;
};

} // namespace WKAL





