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
#ifndef SVGFEColorMatrix_h
#define SVGFEColorMatrix_h
/**
 *  @file  FEColorMatrix.t
 *  FEColorMatrix description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:06 $
 */
#include "BALBase.h"

#if ENABLE(SVG) && ENABLE(SVG_FILTERS)
#include "FilterEffect.h"
#include <wtf/Vector.h>

namespace WKAL {

    enum ColorMatrixType {
        FECOLORMATRIX_TYPE_UNKNOWN          = 0,
        FECOLORMATRIX_TYPE_MATRIX           = 1,
        FECOLORMATRIX_TYPE_SATURATE         = 2,
        FECOLORMATRIX_TYPE_HUEROTATE        = 3,
        FECOLORMATRIX_TYPE_LUMINANCETOALPHA = 4
    };

    class FEColorMatrix : public WKALBase, public FilterEffect {
    public:
    /**
     * create FEColorMatrix
     * @param[in] : filter effect
     * @param[in] : color matrix type
     * @param[in] : values
     * @param[out] : FEColorMatrix
     */
        static PassRefPtr<FEColorMatrix> create(FilterEffect*, ColorMatrixType, const Vector<float>&);

    /**
     * get color matrix type 
     * @param[out] : ColorMatrixType
     */
        ColorMatrixType type() const;

    /**
     * set color matrix type
     * @param[in] : ColorMatrixType
     */
        void setType(ColorMatrixType);

    /**
     * get values
     * @param[out] : values
     */
        const Vector<float>& values() const;

    /**
     * set values 
     * @param[in] : values
     */
        void setValues(const Vector<float>&);
        
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
     * FEColorMatrix constructor
     */
        FEColorMatrix(FilterEffect*, ColorMatrixType, const Vector<float>&);

        RefPtr<FilterEffect> m_in;
        ColorMatrixType m_type;
        Vector<float> m_values;
    };

} // namespace WKAL

#endif // ENABLE(SVG) && ENABLE(SVG_FILTERS)

#endif // SVGFEColorMatrix_h




