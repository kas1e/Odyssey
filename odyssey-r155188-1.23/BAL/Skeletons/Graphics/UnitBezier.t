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
#ifndef UnitBezier_h
#define UnitBezier_h
/**
 *  @file  UnitBezier.t
 *  UnitBezier description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:08 $
 */
#include "BALBase.h"

#include <math.h>

namespace WKAL {

    struct UnitBezier {
    /**
     *  UnitBezier construtor
     * @param[in] : x1 point
     * @param[in] : y1 point
     * @param[in] : x2 point
     * @param[in] : y2 point
     * @code
     * UnitBezier *u = new UnitBezier(x1, y1, x2, y2);
     * @endcode
     */
        UnitBezier(double p1x, double p1y, double p2x, double p2y);
        
    /**
     * sample curve x
     * @param[in] : x value
     * @param[out] : x value
     * @code
     * double x = u->sampleCurveX(t);
     * @endcode
     */
        double sampleCurveX(double t);
        
    /**
     * sample curve y 
     * @param[in] : y value
     * @param[out] : y value
     * @code
     * double y = u->sampleCurveY(t);
     * @endcode
     */
        double sampleCurveY(double t);
        
    /**
     * sample curve derivative x
     * @param[in] : x value
     * @param[out] : x value
     * @code
     * double x = u->sampleCurveDerivativeX(t);
     * @endcode
     */
        double sampleCurveDerivativeX(double t);
        
        // Given an x value, find a parametric value it came from.
    /**
     * Given an x value, find a parametric value it came from. 
     * @param[in] : x value
     * @param[in] : epsilon value
     * @param[out] : parametric value
     * @code
     * double p = u->solveCurveX(x, e);
     * @endcode
     */
        double solveCurveX(double x, double epsilon);

    /**
     * Given an x value, find a parametric value it came from.
     * @param[in] : x value
     * @param[in] : epsilon value
     * @param[out] : parametric value
     * @code
     * double p = u->solveCurveX(x, e);
     * @endcode
     */
        double solve(double x, double epsilon);
        
    private:
        double ax;
        double bx;
        double cx;
        
        double ay;
        double by;
        double cy;
    };
}
#endif




