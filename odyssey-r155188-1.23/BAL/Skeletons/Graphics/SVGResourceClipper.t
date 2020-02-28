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
#ifndef SVGResourceClipper_h
#define SVGResourceClipper_h
/**
 *  @file  SVGResourceClipper.t
 *  SVGResourceClipper description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:08 $
 */
#include "BALBase.h"

#if ENABLE(SVG)

#include "SVGResource.h"
#include "Path.h"

namespace WKAL {

    struct ClipData {
        Path path;
        WindRule windRule;
        bool bboxUnits : 1;
    };

    class ClipDataList : public WKALBase { 
    public:
    /**
     * add path
     * @param[in] : path
     * @param[in] : rule
     * @param[in] : bbox units
     * @code
     * c->addPath(p, r, b);
     * @endcode
     */
        void addPath(const Path& pathData, WindRule windRule, bool bboxUnits);
        
    /**
     * clear
     * @code
     * c->clear();
     * @endcode
     */
        void clear() ;

    /**
     * get clip data
     * @param[out] : clip data
     * @code
     * Vector<ClipData> cd = c->clipData()
     * @endcode
     */
        const Vector<ClipData>& clipData() const ;
 
    /**
     * test if the ClipDataList is empty
     * @code
     * bool e = c->isEmpty();
     * @endcode
     */
        bool isEmpty() const ;
    private:
        Vector<ClipData> m_clipData;
    };  

    class GraphicsContext;

    class SVGResourceClipper : public WKALBase, public SVGResource {
    public:
    /**
     * create
     * @param[out] : SVGResourceClipper
     * @code
     * RefPtr<SVGResourceClipper> r = SVGResourceClipper::create();
     * @endcode
     */
        static PassRefPtr<SVGResourceClipper> create() ;

    /**
     * SVGResourceClipper destructor
     * @code
     * delete r;
     * @endcode
     */
        virtual ~SVGResourceClipper();
      
    /**
     * reset clip data 
     * @code
     * r->resetClipData();
     * @endcode
     */
        void resetClipData();

    /**
     * add clip data 
     * @param[in] : path
     * @param[in] : rule
     * @param[in] : bbox units
     * @code
     * r->addClipData(p, r, bb);
     * @endcode
     */
        void addClipData(const Path&, WindRule, bool bboxUnits);

    /**
     * get clip data list
     * @param[out] : clip data list
     * @code
     * ClipDataList c = r->clipData();
     * @endcode
     */
        const ClipDataList& clipData() const;
        
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
     * apply clip 
     * @param[in] : graphics context
     * @param[in] : bounding box
     * @code
     * r->applyClip(gc, bb);
     * @endcode
     */
        void applyClip(GraphicsContext*, const FloatRect& boundingBox) const;
    private:
    /**
     * SVGResourceClipper constructor
     */
        SVGResourceClipper();
        ClipDataList m_clipData;
    };

    /**
     *  operator<< 
     */
    TextStream& operator<<(TextStream&, WindRule);
    /**
     *  operator<< 
     */
    TextStream& operator<<(TextStream&, const ClipData&);

    /**
     *  getClipperById 
     */
    SVGResourceClipper* getClipperById(Document*, const AtomicString&);

} // namespace WKAL

#endif

#endif // SVGResourceClipper_h




