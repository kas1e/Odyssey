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
#ifndef FloatPoint3D_h
#define FloatPoint3D_h
/**
 *  @file  FloatPoint3D.t
 *  FloatPoint3D description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:07 $
 */
#include "BALBase.h"

#if ENABLE(SVG)

namespace WKAL {

class FloatPoint3D : public WKALBase {
public:
    /**
     * FloatPoint3D default constructor
     * @code
     * FloatPoint3D p;
     * @endcode
     */
    FloatPoint3D();

    /**
     * FloatPoint3D constructor
     * @param[in] : x value
     * @param[in] : y value
     * @param[in] : z value
     * @code
     * FloatPoint3D p(0, 0, 0);
     * @endcode
     */
    FloatPoint3D(float x, float y, float z);

    /**
     * get x value
     * @param[out] : x value
     * @code
     * float x = p.x();
     * @endcode
     */
    float x() const;

    /**
     * set x value
     * @param[in] : x value
     * @code
     * p.setX(0);
     * @endcode
     */
    void setX(float x);

    /**
     * get y value
     * @param[out] : y value
     * @code
     * float y = p.y();
     * @endcode
     */
    float y() const;

    /**
     * set y value
     * @param[in] : y value
     * @code
     * p.setY(0);
     * @endcode
     */
    void setY(float y);

    /**
     * get z value
     * @param[out] : z value
     * @code
     * float z = p.z();
     * @endcode
     */
    float z() const;

    /**
     * set z value
     * @param[in] : z value
     * @code
     * p.setZ(0);
     * @endcode
     */
    void setZ(float z);

    /**
     * normalize
     * @code
     * p.normalize();
     * @endcode
     */
    void normalize();

private:
    float m_x;
    float m_y;
    float m_z;
};

} // namespace WKAL

#endif // ENABLE(SVG)

#endif // FloatPoint3D_h




