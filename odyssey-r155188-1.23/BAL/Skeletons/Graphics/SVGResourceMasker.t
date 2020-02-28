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
#ifndef SVGResourceMasker_h
#define SVGResourceMasker_h
/**
 *  @file  SVGResourceMasker.t
 *  SVGResourceMasker description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:08 $
 */
#include "BALBase.h"

#if ENABLE(SVG)

#include "GraphicsContext.h"
#include "SVGResource.h"

#include <memory>

#include <wtf/OwnPtr.h>
#include <wtf/PassRefPtr.h>

namespace WKAL {

    class FloatRect;
    class ImageBuffer;
    class SVGMaskElement;

    class SVGResourceMasker : public WKALBase, public SVGResource {
    public:
    /**
     * create
     * @param[in] : svg mask element
     * @param[out] : SVGResourceMasker
     * @code
     * RefPtr<SVGResourceMasker> r = SVGResourceMasker::create(e);
     * @endcode
     */
        static PassRefPtr<SVGResourceMasker> create(const SVGMaskElement* ownerElement) ;

    /**
     * SVGResourceMasker destructor
     * @code
     * delete r;
     * @endcode
     */
        virtual ~SVGResourceMasker();
        
    /**
     * @see SVGResource
     */
        virtual void invalidate();
        
    /**
     * @see SVGResource
     */
        virtual SVGResourceType resourceType() const ;
    /**
     * @see SVGResource
     */
        virtual TextStream& externalRepresentation(TextStream&) const;

        // To be implemented by the specific rendering devices
    /**
     * apply mask
     * @param[in] : graphics context
     * @param[in] : bounding box
     * @code
     * r->applyMask(gc, bb);
     * @endcode
     */
        void applyMask(GraphicsContext*, const FloatRect& boundingBox);

    private:
    /**
     * SVGResourceMasker constructor
     */
        SVGResourceMasker(const SVGMaskElement*);

        const SVGMaskElement* m_ownerElement;
        
        OwnPtr<ImageBuffer> m_mask;
        FloatRect m_maskRect;
    };

    /**
     * getMaskerById
     */
    SVGResourceMasker* getMaskerById(Document*, const AtomicString&);

} // namespace WKAL

#endif

#endif // SVGResourceMasker_h




