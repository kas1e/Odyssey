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
#ifndef SVGFEBlend_h
#define SVGFEBlend_h
/**
 *  @file  FEBlend.t
 *  FEBlend description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:06 $
 */
#include "BALBase.h"

#if ENABLE(SVG) && ENABLE(SVG_FILTERS)
#include "FilterEffect.h"

namespace WKAL {

    enum BlendModeType {
        FEBLEND_MODE_UNKNOWN  = 0,
        FEBLEND_MODE_NORMAL   = 1,
        FEBLEND_MODE_MULTIPLY = 2,
        FEBLEND_MODE_SCREEN   = 3,
        FEBLEND_MODE_DARKEN   = 4,
        FEBLEND_MODE_LIGHTEN  = 5
    };

    class FEBlend : public WKALBase, public FilterEffect {
    public:
    /**
     * create FEBlend
     * @param[in] : filter effect
     * @param[in] : filter effect
     * @param[in] : blend mode type
     * @param[out] : FEBlend
     */
        static PassRefPtr<FEBlend> create(FilterEffect*, FilterEffect*, BlendModeType);
        
    /**
     * get filter effect in2 
     * @param[out] : filter effect
     */
        FilterEffect* in2() const;

    /**
     * set filter effect In2 
     * @param[in] : filter effect 
     */
        void setIn2(FilterEffect*);

    /**
     * get blend mode
     * @param[out] : blend mode
     */
        BlendModeType blendMode() const;

    /**
     * set blend mode
     * @param[in] : blend mode
     */
        void setBlendMode(BlendModeType);
        
    /**
     * apply 
     */
        virtual void apply();

    /**
     * dump 
     */
        virtual void dump();

    private:
    /**
     * FEBlend constructor
     */
        FEBlend(FilterEffect*, FilterEffect*, BlendModeType);

        RefPtr<FilterEffect> m_in;
        RefPtr<FilterEffect> m_in2;
        BlendModeType m_mode;
    };

} // namespace WKAL

#endif // ENABLE(SVG) && ENABLE(SVG_FILTERS)

#endif // SVGFEBlend_h




