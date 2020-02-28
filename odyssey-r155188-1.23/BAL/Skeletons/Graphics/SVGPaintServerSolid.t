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
#ifndef SVGPaintServerSolid_h
#define SVGPaintServerSolid_h
/**
 *  @file  SVGPaintServerSolid.t
 *  SVGPaintServerSolid description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:08 $
 */
#include "BALBase.h"

#if ENABLE(SVG)

#include "Color.h"
#include "SVGPaintServer.h"

namespace WKAL {

    class SVGPaintServerSolid : public WKALBase, public SVGPaintServer {
    public:
    /**
     * create 
     * @param[out] : SVGPaintServerSolid
     * @code
     * RefPtr<SVGPaintServerSolid> p = SVGPaintServerSolid::create();
     * @endcode
     */
        static PassRefPtr<SVGPaintServerSolid> create() ;

    /**
     * SVGPaintServerSolid destructor
     * @code
     * delete p
     * @endcode
     */
        virtual ~SVGPaintServerSolid();

    /**
     * get type 
     * @see SVGPaintServer
     */
        virtual SVGPaintServerType type() const ;

    /**
     * get color
     * @param[out] : color
     * @code
     * Color c = p->color();
     * @endcode
     */
        Color color() const;
    /**
     * set color
     * @param[out] : color
     * @code
     * p->setColor(c);
     * @endcode
     */
        void setColor(const Color&);

    /**
     * external representation
     * @see SVGPaintServer
     */
        virtual TextStream& externalRepresentation(TextStream&) const;

    /**
     * setup 
     * @see SVGPaintServer
     */
        virtual bool setup(GraphicsContext*&, const RenderObject*, SVGPaintTargetType, bool isPaintingText) const;

    private:
    /**
     * SVGPaintServerSolid private constructor
     */
        SVGPaintServerSolid();

        Color m_color;
    };

} // namespace WKAL

#endif

#endif // SVGPaintServerSolid_h




