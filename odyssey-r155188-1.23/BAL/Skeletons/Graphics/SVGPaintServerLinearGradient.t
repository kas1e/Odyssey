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
#ifndef SVGPaintServerLinearGradient_h
#define SVGPaintServerLinearGradient_h
/**
 *  @file  SVGPaintServerLinearGradient.t
 *  SVGPaintServerLinearGradient description
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

    class SVGPaintServerLinearGradient : public WKALBase, public SVGPaintServerGradient {
    public:
    /**
     * create
     * @param[in] : svg gradient element
     * @param[out] : SVGPaintServerLinearGradient
     * @code
     * RefPtr<SVGPaintServerLinearGradient> p = SVGPaintServerLinearGradient::create(owner);
     * @endcode
     */
        static PassRefPtr<SVGPaintServerLinearGradient> create(const SVGGradientElement* owner) ;

    /**
     * SVGPaintServerLinearGradient destructor
     * @code
     * delete p;
     * @endcode
     */
        virtual ~SVGPaintServerLinearGradient();

    /**
     * get type
     * @param[out] : svg paint server type
     * @code
     * SVGPaintServerType t = p->type();
     * @endcode
     */
        virtual SVGPaintServerType type() const ;

    /**
     * get gradient start
     * @param[out] : start point
     * @code
     * FloatPoint po = p->gradientStart();
     * @endcode
     */
        FloatPoint gradientStart() const;

    /**
     * set gradient start 
     * @param[in] : start point
     * @code
     * p->setGradientStart(po);
     * @endcode
     */
        void setGradientStart(const FloatPoint&);

    /**
     * get gradient end
     * @param[out] : end point
     * @code
     * FloatPoint po = p->gradientEnd();
     * @endcode
     */
        FloatPoint gradientEnd() const;

    /**
     * set gradient end 
     * @param[in] : end point
     * @code
     * p->setGradientEnd(po);
     * @endcode
     */
        void setGradientEnd(const FloatPoint&);

    /**
     * get external representation
     * @param[in] : text stream
     * @param[out] : text stream
     * @code
     * TextStream ts = p->externalRepresentation(ts1);
     * @endcode
     */
        virtual TextStream& externalRepresentation(TextStream&) const;


    private:
    /**
     * SVGPaintServerLinearGradient private constructor
     * @param[in] : svg gradient element
     */
        SVGPaintServerLinearGradient(const SVGGradientElement* owner);

        FloatPoint m_start;
        FloatPoint m_end;
    };

} // namespace WKAL

#endif

#endif // SVGPaintServerLinearGradient_h




