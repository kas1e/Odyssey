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
#ifndef SVGFEComponentTransfer_h
#define SVGFEComponentTransfer_h
/**
 *  @file  FEComponentTransfer.t
 *  FEComponentTransfer description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:06 $
 */
#include "BALBase.h"

#if ENABLE(SVG) && ENABLE(SVG_FILTERS)
#include "FilterEffect.h"
#include "SVGFEDisplacementMap.h"

#include <wtf/Vector.h>

namespace WKAL {

    enum ComponentTransferType {
        FECOMPONENTTRANSFER_TYPE_UNKNOWN  = 0,
        FECOMPONENTTRANSFER_TYPE_IDENTITY = 1,
        FECOMPONENTTRANSFER_TYPE_TABLE    = 2,
        FECOMPONENTTRANSFER_TYPE_DISCRETE = 3,
        FECOMPONENTTRANSFER_TYPE_LINEAR   = 4,
        FECOMPONENTTRANSFER_TYPE_GAMMA    = 5
    };

    struct ComponentTransferFunction {
    /**
     * ComponentTransferFunction
     */
        ComponentTransferFunction();

        ComponentTransferType type;

        float slope;
        float intercept;
        float amplitude;
        float exponent;
        float offset;

        Vector<float> tableValues;
    };

    class FEComponentTransfer : public WKALBase, public FilterEffect {
    public:
    /**
     * create FEComponentTransfer
     * @param[in] : filter effect
     * @param[in] : Component transfer function
     * @param[in] : Component transfer function
     * @param[in] : Component transfer function
     * @param[in] : Component transfer function
     * @param[out] : FEComponentTransfer
     */
        static PassRefPtr<FEComponentTransfer> create(FilterEffect*, const ComponentTransferFunction&, 
                const ComponentTransferFunction&, const ComponentTransferFunction&, const ComponentTransferFunction&);

    /**
     * get component transfert red function 
     * @param[out] : ComponentTransferFunction
     */
        ComponentTransferFunction redFunction() const;

    /**
     * set component transfert red function 
     * @param[in] : ComponentTransferFunction
     */
        void setRedFunction(const ComponentTransferFunction&);

    /**
     * get component transfert green function 
     * @param[out] : ComponentTransferFunction
     */
        ComponentTransferFunction greenFunction() const;

    /**
     * set component transfert green function 
     * @param[in] : ComponentTransferFunction
     */
        void setGreenFunction(const ComponentTransferFunction&);

    /**
     * get component transfert blue function
     * @param[out] : ComponentTransferFunction
     */
        ComponentTransferFunction blueFunction() const;

    /**
     * set component transfert blue function
     * @param[in] : ComponentTransferFunction
     */
        void setBlueFunction(const ComponentTransferFunction&);

    /**
     * get component transfert alpha function
     * @param[out] : ComponentTransferFunction
     */
        ComponentTransferFunction alphaFunction() const;

    /**
     * set component transfert alpha function 
     * @param[in] : ComponentTransferFunction
     */
        void setAlphaFunction(const ComponentTransferFunction&);
        
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
     * FEComponentTransfer constructor
     */
        FEComponentTransfer(FilterEffect*,const ComponentTransferFunction&, const ComponentTransferFunction&,
                const ComponentTransferFunction&, const ComponentTransferFunction&);

        RefPtr<FilterEffect> m_in;
        ComponentTransferFunction m_redFunc;
        ComponentTransferFunction m_greenFunc;
        ComponentTransferFunction m_blueFunc;
        ComponentTransferFunction m_alphaFunc;
    };

} // namespace WKAL

#endif // ENABLE(SVG) && ENABLE(SVG_FILTERS)

#endif // SVGFEComponentTransfer_h




