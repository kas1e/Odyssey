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
#ifndef SVGPaintServerRadialGradient_h
#define SVGPaintServerRadialGradient_h
/**
 *  @file  SVGPaintServerRadialGradient.t
 *  SVGPaintServerRadialGradient description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:08 $
 */
#include "BALBase.h"

#if ENABLE(SVG)

#include "FloatPoint.h"
#include "SVGPaintServerGradient.h"

namespace WKAL {

    class SVGPaintServerRadialGradient : public WKALBase, public SVGPaintServerGradient {
    public:
    /**
     * create
     * @param[in] : svg gradient element
     * @param[out] : SVGPaintServerRadialGradient
     * @code
     * RefPtr<SVGPaintServerRadialGradient> p = SVGPaintServerRadialGradient::create(elem);
     * @endcode
     */
        static PassRefPtr<SVGPaintServerRadialGradient> create(const SVGGradientElement* owner) ;

    /**
     * ~SVGPaintServerRadialGradient destructor
     * @code
     * delete p;
     * @endcode
     */
        virtual ~SVGPaintServerRadialGradient();

    /**
     * get type
     * @param[out] : svg paint server type
     * @code
     * @endcode
     */
        virtual SVGPaintServerType type() const ;

    /**
     * get gradient center
     * @param[out] : point
     * @code
     * FloatPoint fp = p->gradientCenter();
     * @endcode
     */
        FloatPoint gradientCenter() const;

    /**
     * set gradient center
     * @param[in] : point
     * @code
     * p->setGradientCenter(fp);
     * @endcode
     */
        void setGradientCenter(const FloatPoint&);

    /**
     * get gradient focal
     * @param[out] : point
     * @code
     * FloatPoint fp = p->gradientFocal();
     * @endcode
     */
        FloatPoint gradientFocal() const;

    /**
     * set gradient focal
     * @param[in] : point
     * @code
     * p->setGradientFocal(fp);
     * @endcode
     */
        void setGradientFocal(const FloatPoint&);

    /**
     * get gradient radius
     * @param[out] : radius
     * @code
     * float r = p->gradientRadius();
     * @endcode
     */
        float gradientRadius() const;

    /**
     * set gradient radius
     * @param[in] : radius
     * @code
     * p->setGradientRadius(r);
     * @endcode
     */
        void setGradientRadius(float);

    /**
     * external representation
     * @param[in] : text stream
     * @param[out] : text stream
     * @code
     * TextStream ts = p->externalRepresentation(ts1);
     * @endcode
     */
        virtual TextStream& externalRepresentation(TextStream&) const;


    private:
    /**
     * SVGPaintServerRadialGradient private constructor
     */
        SVGPaintServerRadialGradient(const SVGGradientElement* owner);

        float m_radius;
        FloatPoint m_center;
        FloatPoint m_focal;
    };

} // namespace WKAL

#endif

#endif // SVGPaintServerRadialGradient_h




