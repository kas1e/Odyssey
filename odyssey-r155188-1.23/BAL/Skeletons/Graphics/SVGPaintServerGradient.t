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
#ifndef SVGPaintServerGradient_h
#define SVGPaintServerGradient_h
/**
 *  @file  SVGPaintServerGradient.t
 *  SVGPaintServerGradient description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:08 $
 */
#include "BALBase.h"

#if ENABLE(SVG)

#include "AffineTransform.h"
#include "Color.h"
#include "SVGPaintServer.h"

#include <wtf/RefCounted.h>
#include <wtf/RefPtr.h>


namespace WKAL {

    class ImageBuffer;
    class SVGGradientElement;

    // FIXME: Remove the spread method enum in SVGGradientElement
    enum SVGGradientSpreadMethod {
        SPREADMETHOD_PAD = 1,
        SPREADMETHOD_REFLECT = 2,
        SPREADMETHOD_REPEAT = 3
    };



    class SVGPaintServerGradient : public WKALBase, public SVGPaintServer {
    public:
    /**
     * SVGPaintServerGradient destructor
     * @code
     * delete ssg;
     * @endcode
     */
        virtual ~SVGPaintServerGradient();

    /**
     * get gradient stops 
     * @param[out] : gradient stop
     * @code
     * Vector<SVGGradientStop> gs = ssg->gradientStops();
     * @endcode
     */
        const Vector<SVGGradientStop>& gradientStops() const;

    /**
     * set gradient stops
     * @param[in] : gradient stop
     * @code
     * ssg->setGradientStops(gs);
     * @endcode
     */
        void setGradientStops(const Vector<SVGGradientStop>&);

    /**
     * get gradient spread method
     * @param[out] : gradient spread method
     * @code
     * SVGGradientSpreadMethod s = ssg->spreadMethod();
     * @endcode
     */
        SVGGradientSpreadMethod spreadMethod() const;

    /**
     * set gradient spread method
     * @param[in] : gradient spread method
     * @code
     * ssg->setGradientSpreadMethod(s);
     * @endcode
     */
        void setGradientSpreadMethod(const SVGGradientSpreadMethod&);

        // Gradient start and end points are percentages when used in boundingBox mode.
        // For instance start point with value (0,0) is top-left and end point with
        // value (100, 100) is bottom-right. BoundingBox mode is enabled by default.
    /**
     * get bounding box mode
     * @param[out] : bounding box mode
     * @code
     * bool b = ssg->boundingBoxMode();
     * @endcode
     */
        bool boundingBoxMode() const;

    /**
     * set bounding box mode
     * @param[in] : mode
     * @code
     * ssg->setBoundingBoxMode(false);
     * @endcode
     */
        void setBoundingBoxMode(bool mode = true);

    /**
     * get gradient affine transform
     * @param[out] : affine transform
     * @code
     * AffineTransform a = ssg->gradientTransform();
     * @endcode
     */
        AffineTransform gradientTransform() const;

    /**
     * set gradient affine transform
     * @param[in] : affine transform
     * @code
     * ssg->setGradientTransform(a);
     * @endcode
     */
        void setGradientTransform(const AffineTransform&);

    /**
     * get external representation
     * @param[in] : text stream
     * @param[out] : text stream
     * @code
     * TextStream t = ssg->externalRepresentation(ts);
     * @endcode
     */
        virtual TextStream& externalRepresentation(TextStream&) const;

    /**
     * setup
     * @param[in] : graphics context
     * @param[in] : render object
     * @param[in] : paint target type
     * @param[in] : is painting text
     * @param[out] : setup status
     * @code
     * bool o = ssg->setup(gc, ro, sptt, true);
     * @endcode
     */
        virtual bool setup(GraphicsContext*&, const RenderObject*, SVGPaintTargetType, bool isPaintingText) const;


    protected:
    /**
     * SVGPaintServerGradient constructor
     * @param[in] : svg gradient element
     */
        SVGPaintServerGradient(const SVGGradientElement* owner);
        
    private:
        Vector<SVGGradientStop> m_stops;
        SVGGradientSpreadMethod m_spreadMethod;
        bool m_boundingBoxMode;
        AffineTransform m_gradientTransform;
        const SVGGradientElement* m_ownerElement;

    };

    /**
     *  makeGradientStop 
     */
    inline SVGGradientStop makeGradientStop(float offset, const Color& color);

} // namespace WKAL

#endif

#endif // SVGPaintServerGradient_h




