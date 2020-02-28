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
#ifndef SVGPaintServer_h
#define SVGPaintServer_h
/**
 *  @file  SVGPaintServer.t
 *  SVGPaintServer description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:08 $
 */
#include "BALBase.h"

#if ENABLE(SVG)

#include "SVGResource.h"




namespace WKAL {

    enum SVGPaintServerType {
        // Painting mode
        SolidPaintServer = 0,
        PatternPaintServer = 1,
        LinearGradientPaintServer = 2,
        RadialGradientPaintServer = 3
    };

    enum SVGPaintTargetType {
        // Target mode
        ApplyToFillTargetType = 1,
        ApplyToStrokeTargetType = 2
    };

    class GraphicsContext;
    class RenderObject;
    class RenderStyle;
    class SVGPaintServerSolid;

    class SVGPaintServer : public WKALBase, public SVGResource {
    public:
    /**
     *  SVGPaintServer destructor
     * @code
     * delete ps;
     * @endcode
     */
        virtual ~SVGPaintServer();

    /**
     * get resource type 
     * @param[out] : resource type
     * @code
     * SVGResourceType t = ps->resourceType();
     * @endcode
     */
        virtual SVGResourceType resourceType() const ;

    /**
     * get type 
     * @param[out] : type
     * @code
     * SVGPaintServerType t = ps->type();
     * @endcode
     */
        virtual SVGPaintServerType type() const = 0;

    /**
     * get external representation
     * @param[in] : text stream
     * @param[out] : text strema
     * @code
     * TextStream t = ps->externalRepresentation(ts);
     * @endcode
     */
        virtual TextStream& externalRepresentation(TextStream&) const = 0;

        // To be implemented in platform specific code.
    /**
     * draw 
     * @param[in] : graphics context
     * @param[in] : render object
     * @param[in] : target type
     * @code
     * ps->draw(gc, ro, sptt);
     * @endcode
     */
        virtual void draw(GraphicsContext*&, const RenderObject*, SVGPaintTargetType) const;

    /**
     * teardown
     * @param[in] : graphics context
     * @param[in] : render object
     * @param[in] : target type
     * @param[in] : is paiting text
     * @code
     * ps->teardown(gc, ro, sptt, true);
     * @endcode
     */
        virtual void teardown(GraphicsContext*&, const RenderObject*, SVGPaintTargetType, bool isPaintingText = false) const;

    /**
     * render path 
     * @param[in] : graphics context
     * @param[in] : render object
     * @param[in] : target type 
     * @code
     * ps->renderPath(gc, ro, sptt);
     * @endcode
     */
        virtual void renderPath(GraphicsContext*&, const RenderObject*, SVGPaintTargetType) const;

    /**
     * setup
     * @param[in] : graphics context
     * @param[in] : render object
     * @param[in] : target type
     * @param[in] : is paiting text
     * @code
     * ps->setup(gc, ro, sptt, true);
     * @endcode
     */
        virtual bool setup(GraphicsContext*&, const RenderObject*, SVGPaintTargetType, bool isPaintingText = false) const = 0;

    /**
     * get strokePaintServer 
     * @param[in] : render style
     * @param[in] : render object
     * @param[out] : svg paint server
     * @code
     * SVGPaintServer *ps = SVGPaintServer::strokePaintServer(rs, ro);
     * @endcode
     */
        static SVGPaintServer* strokePaintServer(const RenderStyle*, const RenderObject*);

    /**
     * get fill paint server
     * @param[in] : render style
     * @param[in] : render object
     * @param[out] : svg paint server
     * @code
     * SVGPaintServer *ps = SVGPaintServer::fillPaintServer(rs, ro);
     * @endcode
     */
        static SVGPaintServer* fillPaintServer(const RenderStyle*, const RenderObject*);

    /**
     * get shared solid paint server
     * @param[out] : svg paint server solid
     * @code
     * SVGPaintServerSolid *ps = SVGPaintServer::sharedSolidPaintServer();
     * @endcode
     */
        static SVGPaintServerSolid* sharedSolidPaintServer();

    protected:

    protected:
    /**
     *  SVGPaintServer constructor
     */
        SVGPaintServer();        
    };

    /**
     *  operator<< 
     */
    TextStream& operator<<(TextStream&, const SVGPaintServer&);

    /**
     * get paint server by id
     */
    SVGPaintServer* getPaintServerById(Document*, const AtomicString&);

    /**
     * get dashArray from rendering style
     */
    DashArray dashArrayFromRenderingStyle(const RenderStyle* style);
} // namespace WKAL

#endif

#endif // SVGPaintServer_h




