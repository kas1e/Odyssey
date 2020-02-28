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
#ifndef SVGResource_h
#define SVGResource_h
/**
 *  @file  SVGResource.t
 *  SVGResource description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:08 $
 */
#include "BALBase.h"

#if ENABLE(SVG)
#include "PlatformString.h"
#include "StringHash.h"

#include <wtf/HashMap.h>
#include <wtf/HashSet.h>
#include <wtf/RefCounted.h>

namespace WKAL {

    class AtomicString; 
    class Document;
    class SVGStyledElement;
    class TextStream;

    enum SVGResourceType {
        // Painting mode
        ClipperResourceType = 0,
        MarkerResourceType,
        ImageResourceType,
        FilterResourceType,
        MaskerResourceType,
        PaintServerResourceType,
        
        // For resource tracking we need to know how many types of resource there are
        _ResourceTypeCount
    };

    // The SVGResource file represent various graphics resources:
    // - Filter resource
    // - Clipper resource
    // - Masker resource
    // - Marker resource
    // - Pattern resource
    // - Linear/Radial gradient resource
    //
    // SVG creates/uses these resources.

    class SVGResource : public WKALBase, public RefCounted<SVGResource> {
    public:
    /**
     * SVGResource destructor
     * @code
     * delete r;
     * @endcode
     */
        virtual ~SVGResource();
      
    /**
     * invalidate resource
     * @code
     * r->invalidate();
     * @endcode
     */
        virtual void invalidate();

    /**
     * add client
     * @param[in] : svg styled element
     * @code
     * r->addClient(elem);
     * @endcode
     */
        void addClient(SVGStyledElement*);

    /**
     * get resource type
     * @param[out] : svg resource type
     * @code
     * SVGResourceType t = r->resourceType();
     * @endcode
     */
        virtual SVGResourceType resourceType() const = 0;
        
    /**
     * test if the SVGResource is a paint server
     * @param[out] : true if the SVGResource is a paint server
     * @code
     * bool i = r->isPaintServer();
     * @endcode
     */
        bool isPaintServer() const ;

    /**
     * test if the SVGResource is a filter
     * @param[out] : true if the SVGResource is a filter
     * @code
     * bool i = r->isFilter();
     * @endcode
     */
        bool isFilter() const ;

    /**
     * test if the SVGResource is a clipper
     * @param[out] : true if the SVGResource is a clipper
     * @code
     * bool i = r->isClipper();
     * @endcode
     */
        bool isClipper() const ;

    /**
     * test if the SVGResource is a marker
     * @param[out] : true if the SVGResource is a marker
     * @code
     * bool i = r->isMarker();
     * @endcode
     */
        bool isMarker() const ;
    /**
     * test if the SVGResource is a masker
     * @param[out] : true if the SVGResource is a marker
     * @code
     * bool i = r->isMasker();
     * @endcode
     */
        bool isMasker() const ;

    /**
     * get external rRepresentation
     * @param[in] : TextStream
     * @param[out] : TextStream
     * @code
     * TextStream t = r->externalRepresentation(te);
     * @endcode
     */
        virtual TextStream& externalRepresentation(TextStream&) const;

    /**
     * invalidate clients
     * @param[in] : svg styled element
     * @code
     * r->invalidateClients(e);
     * @endcode
     */
        static void invalidateClients(HashSet<SVGStyledElement*>);

    /**
     * remove client
     * @param[in] : svg styled element
     * @code
     * r->removeClient(e);
     * @endcode
     */
        static void removeClient(SVGStyledElement*);

    protected:
    /**
     * SVGResource constructor
     * @code
     * SVGResource *s = new SVGResource();
     * @endcode
     */
        SVGResource();

    private:
        HashSet<SVGStyledElement*> m_clients;
    };

    /**
     * get resource by id 
     * @param[in] : Document
     * @param[in] : id
     * @param[out] : resource
     * @code
     * SVGResource *r = getResourceById(d, id);
     * @endcode
     */
    SVGResource* getResourceById(Document*, const AtomicString&);
    
    /**
     * operator<<
     */
    TextStream& operator<<(TextStream&, const SVGResource&);

} // namespace WKAL

#endif
#endif // SVGResource_h




