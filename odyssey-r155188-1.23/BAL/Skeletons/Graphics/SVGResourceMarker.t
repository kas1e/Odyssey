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
#ifndef SVGResourceMarker_h
#define SVGResourceMarker_h
/**
 *  @file  SVGResourceMarker.t
 *  SVGResourceMarker description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:08 $
 */
#include "BALBase.h"

#if ENABLE(SVG)

#include "FloatRect.h"
#include "SVGResource.h"

namespace WKAL {

    class GraphicsContext;
    class RenderSVGViewportContainer;

    class SVGResourceMarker : public WKALBase, public SVGResource {
    public:
    /**
     * create
     * @param[out] : SVGResourceMarker
     * @code
     * RefPtr<SVGResourceMarker> r = SVGResourceMarker::create();
     * @endcode
     */
        static PassRefPtr<SVGResourceMarker> create() ;

    /**
     * SVGResourceMarker destructor
     * @code
     * delete r;
     * @endcode
     */
        virtual ~SVGResourceMarker();

    /**
     * set marker
     * @param[in] : render SVG viewport container
     * @code
     * r->setMarker(v);
     * @endcode
     */
        void setMarker(RenderSVGViewportContainer*);

    /**
     * set ref 
     * @param[in] : ref x
     * @param[in] : ref y
     * @code
     * r->setRef(x, y);
     * @endcode
     */
        void setRef(double refX, double refY);

    /**
     * get ref x 
     * @param[out] : ref x
     * @code
     * double x = r->refX();
     * @endcode
     */
        double refX() const ;

    /**
     * get ref y 
     * @param[out] : ref y
     * @code
     * double y = r->refY();
     * @endcode
     */
        double refY() const ;

    /**
     * set angle
     * @param[in] : angle
     * @code
     * r->setAngle(a);
     * @endcode
     */
        void setAngle(float angle) ;

    /**
     * set auto angle
     * @param[in] : auto angle
     * @code
     * r->setAutoAngle();
     * @endcode
     */
        void setAutoAngle() ;

    /**
     * get angle
     * @param[out] : angle
     * @code
     * float a = r->angle();
     * @endcode
     */
        float angle() const ;

    /**
     * set use stroke width
     * @param[in] : status
     * @code
     * r->setUseStrokeWidth(false);
     * @endcode
     */
        void setUseStrokeWidth(bool useStrokeWidth = true) ;

    /**
     * get use stroke width
     * @param[out] : status
     * @code
     * bool u = r->useStrokeWidth();
     * @endcode
     */
        bool useStrokeWidth() const ;

    /**
     * get cached bounds
     * @param[out] : bounding rect
     * @code
     * FloatRect fr = r->cachedBounds();
     * @endcode
     */
        FloatRect cachedBounds() const;

    /**
     * draw
     * @param[in] : graphics context
     * @param[in] : rect
     * @param[in] : x position
     * @param[in] : y position
     * @param[in] : stroke width
     * @param[in] : angle
     * @code
     * r->draw(gc, r, x, y, sw, a);
     * @endcode
     */
        void draw(GraphicsContext*, const FloatRect&, double x, double y, double strokeWidth = 1, double angle = 0);
        
    /**
     * @see SVGResource
     */
        virtual SVGResourceType resourceType() const ;
    /**
     * @see SVGResource
     */
        virtual TextStream& externalRepresentation(TextStream&) const;

    private:
    /**
     *  SVGResourceMarker constructor
     */
        SVGResourceMarker();
        double m_refX, m_refY;
        FloatRect m_cachedBounds;
        float m_angle;
        RenderSVGViewportContainer* m_marker;
        bool m_useStrokeWidth;
    };

    /**
     *  getMarkerById
     */
    SVGResourceMarker* getMarkerById(Document*, const AtomicString&);

} // namespace WKAL

#endif

#endif // SVGResourceMarker_h




