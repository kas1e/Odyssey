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
#ifndef PathTraversalState_h
#define PathTraversalState_h
/**
 *  @file  PathTraversalState.t
 *  PathTraversalState description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:07 $
 */
#include "BALBase.h"

#include "FloatPoint.h"
#include <wtf/Vector.h>

namespace WKAL {
    
    class Path;
    
    class PathTraversalState : public WKALBase {
    public:
        enum PathTraversalAction {
            TraversalTotalLength,
            TraversalPointAtLength,
            TraversalSegmentAtLength,
            TraversalNormalAngleAtLength
        };
        
    /**
     * PathTraversalState constructor
     * @param[in] : PathTraversalAction
     * @code
     * PathTraversalState *pt = new PathTraversalState(TraversalTotalLength);
     * @endcode
     */
        PathTraversalState(PathTraversalAction);
        
    /**
     * close sub path
     * @param[out] : distance
     * @code
     * float d = pt->closeSubpath();
     * @endcode
     */
        float closeSubpath();

    /**
     * move to point
     * @param[in] : point
     * @param[out] : distance
     * @code
     * float d = pt->moveTo(p);
     * @endcode
     */
        float moveTo(const FloatPoint&);

    /**
     * line to point
     * @param[in] : point
     * @param[out] : distance
     * @code
     * float d = pt->lineTo(fp);
     * @endcode
     */
        float lineTo(const FloatPoint&);

    /**
     * quadratic bezier to point
     * @param[in] : control point
     * @param[in] : end point
     * @param[out] : distance
     * @code
     * float d = pt->quadraticBezierTo(nc, ne);
     * @endcode
     */
        float quadraticBezierTo(const FloatPoint& newControl, const FloatPoint& newEnd);

    /**
     * cubic bezier to point
     * @param[in] : control point
     * @param[in] : control point
     * @param[in] : end point
     * @param[out] : distance
     * @code
     * float d = pt->cubicBezierTo(nc, nc2, ne);
     * @endcode
     */
        float cubicBezierTo(const FloatPoint& newControl1, const FloatPoint& newControl2, const FloatPoint& newEnd);
        
    public:
        PathTraversalAction m_action;
        bool m_success;
        
        FloatPoint m_current;
        FloatPoint m_start;
        FloatPoint m_control1;
        FloatPoint m_control2;
        
        float m_totalLength;
        unsigned m_segmentIndex;
        float m_desiredLength;
        
        // For normal calculations
        FloatPoint m_previous;
        float m_normalAngle; // degrees
    };    
}

#endif




