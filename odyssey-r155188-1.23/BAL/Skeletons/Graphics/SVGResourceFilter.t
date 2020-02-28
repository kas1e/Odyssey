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
#ifndef SVGResourceFilter_h
#define SVGResourceFilter_h
/**
 *  @file  SVGResourceFilter.t
 *  SVGResourceFilter description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:08 $
 */
#include "BALBase.h"

#if ENABLE(SVG) && ENABLE(SVG_FILTERS)
#include "SVGResource.h"
#include "SVGFilterEffect.h"

#include "FloatRect.h"

#include <wtf/OwnPtr.h>

namespace WKAL {

class GraphicsContext;
class SVGFilterEffect;
    
class SVGResourceFilterPlatformData : public WKALBase {
public:
    /**
     * SVGResourceFilterPlatformData destructor
     * @code
     * delete r;
     * @endcode
     */
    virtual ~SVGResourceFilterPlatformData() ;
};

class SVGResourceFilter : public WKALBase, public SVGResource {
public:
    /**
     * SVGResourceFilter default constructor
     * @code
     * SVGResourceFilter *r = new SVGResourceFilter();
     * @endcode
     */
    SVGResourceFilter();
    
    /**
     * see @SVGResource
     */
    virtual SVGResourceType resourceType() const ;

    /**
     * get filter bounding box mode
     * @param[out] : status
     * @code
     * bool s = r->filterBoundingBoxMode();
     * @endcode
     */
    bool filterBoundingBoxMode() const ;

    /**
     * set filter bounding box mode
     * @param[in] : status
     * @code
     * r->setFilterBoundingBoxMode(s);
     * @endcode
     */
    void setFilterBoundingBoxMode(bool bboxMode) ;

    /**
     * get effect bounding box mode description
     * @param[out] : status
     * @code
     * bool s = r->effectBoundingBoxMode();
     * @endcode
     */
    bool effectBoundingBoxMode() const ;

    /**
     * set effect bounding box mode
     * @param[in] : status
     * @code
     * r->setEffectBoundingBoxMode(s);
     * @endcode
     */
    void setEffectBoundingBoxMode(bool bboxMode) ;

    /**
     * get x bounding box mode
     * @param[out] : status
     * @code
     * bool s = r->xBoundingBoxMode();
     * @endcode
     */
    bool xBoundingBoxMode() const ;

    /**
     * set x bounding box mode
     * @param[in] : status
     * @code
     * r->setXBoundingBoxMode(s);
     * @endcode
     */
    void setXBoundingBoxMode(bool bboxMode) ;

    /**
     * y bounding box mode
     * @param[out] : status
     * @code
     * bool s = r->yBoundingBoxMode();
     * @endcode
     */
    bool yBoundingBoxMode() const ;

    /**
     * set y bounding box mode
     * @param[in] : status
     * @code
     * r->setYBoundingBoxMode(s);
     * @endcode
     */
    void setYBoundingBoxMode(bool bboxMode) ;

    /**
     * get filter rect
     * @param[out] : rect
     * @code
     * FloatRect fr = r->filterRect();
     * @endcode
     */
    FloatRect filterRect() const ;

    /**
     * set filter rect
     * @param[in] : rect
     * @code
     * r->setFilterRect(fr);
     * @endcode
     */
    void setFilterRect(const FloatRect& rect) ;

    /**
     * filter bounding box for an item bounding box
     * @param[in] : item bounding box
     * @param[out] : rect
     * @code
     * FloatRect fr = r->filterBBoxForItemBBox(i);
     * @endcode
     */
    FloatRect filterBBoxForItemBBox(const FloatRect& itemBBox) const;

    /**
     * clear effects
     * @code
     * r->clearEffects();
     * @endcode
     */
    void clearEffects();

    /**
     * add filter effect
     * @param[in] : filter effect
     * @code
     * r->addFilterEffect(f);
     * @endcode
     */
    void addFilterEffect(SVGFilterEffect*);

    /**
     * see @SVGResource
     */
    virtual TextStream& externalRepresentation(TextStream&) const;

    // To be implemented in platform specific code.
    /**
     * prepare filter 
     * @param[in] : graphics context
     * @param[in] : bounding box 
     * @code
     * r->prepareFilter(gc, bb);
     * @endcode
     */
    void prepareFilter(GraphicsContext*&, const FloatRect& bbox);

    /**
     * apply filter
     * @param[in] : graphics context
     * @param[in] : bounding box
     * @code
     * r->applyFilter(gc, bb);
     * @endcode
     */
    void applyFilter(GraphicsContext*&, const FloatRect& bbox);
    
    /**
     * get platform data
     * @param[out] : SVG resource filter platform data
     * @code
     * SVGResourceFilterPlatformData *p = r->platformData();
     * @endcode
     */
    SVGResourceFilterPlatformData* platformData() ;

    /**
     * get effects 
     * @param[out] : effects
     * @code
     * Vector<SVGFilterEffect*> e = r->effects();
     * @endcode
     */
    const Vector<SVGFilterEffect*>& effects() ;
    
private:
    /**
     * create platformData 
     */
    SVGResourceFilterPlatformData* createPlatformData();
    
    OwnPtr<SVGResourceFilterPlatformData> m_platformData;

    bool m_filterBBoxMode : 1;
    bool m_effectBBoxMode : 1;

    bool m_xBBoxMode : 1;
    bool m_yBBoxMode : 1;

    FloatRect m_filterRect;
    Vector<SVGFilterEffect*> m_effects;
};

    /**
     *  getFilterById
     */
SVGResourceFilter* getFilterById(Document*, const AtomicString&);

} // namespace WKAL

#endif // ENABLE(SVG)

#endif // SVGResourceFilter_h




