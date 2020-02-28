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
#ifndef SVGFEComposite_h
#define SVGFEComposite_h
/**
 *  @file  FEComposite.t
 *  FEComposite description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:06 $
 */
#include "BALBase.h"

#if ENABLE(SVG) && ENABLE(SVG_FILTERS)
#include "FilterEffect.h"
#include "PlatformString.h"

namespace WKAL {

    enum CompositeOperationType {
        FECOMPOSITE_OPERATOR_UNKNOWN    = 0, 
        FECOMPOSITE_OPERATOR_OVER       = 1,
        FECOMPOSITE_OPERATOR_IN         = 2,
        FECOMPOSITE_OPERATOR_OUT        = 3,
        FECOMPOSITE_OPERATOR_ATOP       = 4,
        FECOMPOSITE_OPERATOR_XOR        = 5,
        FECOMPOSITE_OPERATOR_ARITHMETIC = 6
    };

    class FEComposite : public WKALBase, public FilterEffect {
    public:
    /**
     * create FEComposite
     * @param[in] : filter effect
     * @param[in] : filter effect
     * @param[in] : composite operation type
     * @param[in] : k1 value
     * @param[in] : k2 value
     * @param[in] : k3 value
     * @param[in] : k4 value
     * @param[out] : FEComposite
     */
        static PassRefPtr<FEComposite> create(FilterEffect*, FilterEffect*, const CompositeOperationType&,
                const float&, const float&, const float&, const float&);

    /**
     * get operation type
     * @param[out] : CompositeOperationType
     */
        CompositeOperationType operation() const;

    /**
     * set operation type
     * @param[in] : CompositeOperationType
     */
        void setOperation(CompositeOperationType);

    /**
     * get k1 value
     * @param[out] : k1
     */
        float k1() const;

    /**
     * set k1 value
     * @param[in] : k1
     */
        void setK1(float);

    /**
     * get k2 value
     * @param[out] : k2 value
     */
        float k2() const;

    /**
     * set k2 value
     * @param[in] : k2 value
     */
        void setK2(float);

    /**
     * get k3 value
     * @param[out] : k3 value
     */
        float k3() const;

    /**
     * set k3 value
     * @param[in] : k3 value
     */
        void setK3(float);

    /**
     * get k4 value
     * @param[out] : k4 value
     */
        float k4() const;

    /**
     * set k4 value
     * @param[in] : k4 value
     */
        void setK4(float);
        
    /**
     * apply effet
     */
        virtual void apply();

    /**
     * dump
     */
        virtual void dump();

    private:
    /**
     * FEComposite constructor
     */
        FEComposite(FilterEffect*, FilterEffect*, const CompositeOperationType&,
                const float&, const float&, const float&, const float&);

        RefPtr<FilterEffect> m_in;
        RefPtr<FilterEffect> m_in2;
        CompositeOperationType m_type;
        float m_k1;
        float m_k2;
        float m_k3;
        float m_k4;
    };

} // namespace WKAL

#endif // ENABLE(SVG) && ENABLE(SVG_FILTERS)

#endif // SVGFEComposite_h




