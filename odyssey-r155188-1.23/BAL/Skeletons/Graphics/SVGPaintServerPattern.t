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
#ifndef SVGPaintServerPattern_h
#define SVGPaintServerPattern_h
/**
 *  @file  SVGPaintServerPattern.t
 *  SVGPaintServerPattern description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:08 $
 */
#include "BALBase.h"

#if ENABLE(SVG)

#include "AffineTransform.h"
#include "FloatRect.h"
#include "SVGPaintServer.h"

#include <memory>

#include <wtf/OwnPtr.h>

namespace WKAL {

    class GraphicsContext;
    class ImageBuffer;
    class SVGPatternElement;

    class SVGPaintServerPattern : public WKALBase, public SVGPaintServer {
    public:
    /**
     * create SVGPaintServerPattern
     * @param[in] : svg Pattern element
     * @param[out] : SVGPaintServerPattern
     * @code
     * RefPtr<SVGPaintServerPattern> p = SVGPaintServerPattern::create(elem);
     * @endcode
     */
        static PassRefPtr<SVGPaintServerPattern> create(const SVGPatternElement* owner) ;

    /**
     *  SVGPaintServerPattern destructor
     * @code
     * delete p;
     * @endcode
     */
        virtual ~SVGPaintServerPattern();

    /**
     * get type
     * @param[out] : svg paint server type
     * @code
     * SVGPaintServerType s = p->type();
     * @endcode
     */
        virtual SVGPaintServerType type() const ;

        // Pattern boundaries
    /**
     * set pattern boundaries
     * @param[in] : rect
     * @code
     * p->setPatternBoundaries(r);
     * @endcode
     */
        void setPatternBoundaries(const FloatRect&);

    /**
     * get pattern boundaries
     * @param[out] : rect
     * @code
     * FloatRect r = p->patternBoundaries();
     * @endcode
     */
        FloatRect patternBoundaries() const;

    /**
     * get tile 
     * @param[out] : image buffer
     * @code
     * ImageBuffer *im = p->tile();
     * @endcode
     */
        ImageBuffer* tile() const;

    /**
     * set tile 
     * @param[in] : image buffer
     * @code
     * p->setTile(im);
     * @endcode
     */
        void setTile(std::auto_ptr<ImageBuffer>);

    /**
     * get pattern transform
     * @param[out] : affine transform
     * @code
     * AffineTransform a = p->patternTransform();
     * @endcode
     */
        AffineTransform patternTransform() const;

    /**
     * set pattern transform
     * @param[in] : affine transform
     * @code
     * p->setPatternTransform(a);
     * @endcode
     */
        void setPatternTransform(const AffineTransform&);

    /**
     * get external representation
     * @param[in] : text stream
     * @param[out] : text stream
     * @code
     * TextStream ts = p->externalRepresentation(ts1);
     * @endcode
     */
        virtual TextStream& externalRepresentation(TextStream&) const;


    /**
     * setup
     * @param[in] : graphics context
     * @param[in] : render object
     * @param[in] : svg paint target type
     * @param[in] : is painting text
     * @param[out] : status
     * @code
     * bool s = p->setup(gc, ro, t, true);
     * @endcode
     */
        virtual bool setup(GraphicsContext*&, const RenderObject*, SVGPaintTargetType, bool isPaintingText) const;

    private:
    /**
     * SVGPaintServerPattern constructor
     * @param[in] : svg pattern element
     */
        SVGPaintServerPattern(const SVGPatternElement*);
        
        OwnPtr<ImageBuffer> m_tile;
        const SVGPatternElement* m_ownerElement;
        AffineTransform m_patternTransform;
        FloatRect m_patternBoundaries;

    };

} // namespace WKAL

#endif

#endif // SVGPaintServerPattern_h




