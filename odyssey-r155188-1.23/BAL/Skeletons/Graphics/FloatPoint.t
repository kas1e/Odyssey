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
#ifndef FloatPoint_h
#define FloatPoint_h
/**
 *  @file  FloatPoint.t
 *  FloatPoint description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:07 $
 */
#include "BALBase.h"

#include "FloatSize.h"
#include <wtf/Platform.h>





namespace WKAL {

class AffineTransform;
class IntPoint;

class FloatPoint : public WKALBase {
public:
    /**
     * FloatPoint default constructor
     * @code
     * FloatPoint *fp = new FloatPoint();
     * @endcode
     */
    FloatPoint();

    /**
     * FloatPoint constructor
     * @param[in] : x value
     * @param[in] : y value
     * @code
     * FloatPoint *fp = new FloatPoint(0, 0);
     * @endcode
     */
    FloatPoint(float x, float y);

    /**
     * FloatPoint constructor
     * @param[in] : IntPoint
     * @code
     * FloatPoint *fp = new FloatPoint(IntPoint(0,0));
     * @endcode
     */
    FloatPoint(const IntPoint&);

    /**
     * narrow precision 
     * @param[in] : x value
     * @param[in] : y value
     * @param[out] : float point
     * @code
     * FloatPoint p = FloatPoint::narrowPrecision(0, 0);
     * @endcode
     */
    static FloatPoint narrowPrecision(double x, double y);

    /**
     * get x value
     * @param[out] : x value
     * @code
     * float x = fp->x();
     * @endcode
     */
    float x() const ;

    /**
     * get y value
     * @param[out] : y value
     * @code
     * float y = fp->y();
     * @endcode
     */
    float y() const ;

    /**
     * set x value
     * @param[in] : x value
     * @code
     * fp->setX(0);
     * @endcode
     */
    void setX(float x) ;

    /**
     * set y value
     * @param[in] : y value
     * @code
     * fp->setY(0);
     * @endcode
     */
    void setY(float y) ;

    /**
     * move 
     * @param[in] : x value
     * @param[in] : y value
     * @code
     * fp->move(0, 0);
     * @endcode
     */
    void move(float dx, float dy) ;

    /**
     * apply matrix transformation on float point
     * @param[in] : affine transform
     * @param[out] : float point
     * @code
     * FloatPoint p = fp->matrixTransform(a);
     * @endcode
     */
    FloatPoint matrixTransform(const AffineTransform&) const;

private:
    float m_x, m_y;
};


    /**
     *  operator+= 
     */
inline FloatPoint& operator+=(FloatPoint& a, const FloatSize& b);

    /**
     *  operator-=
     */
inline FloatPoint& operator-=(FloatPoint& a, const FloatSize& b);

    /**
     *  operator+
     */
inline FloatPoint operator+(const FloatPoint& a, const FloatSize& b);

    /**
     *  operator-
     */
inline FloatSize operator-(const FloatPoint& a, const FloatPoint& b);

    /**
     *  operator-
     */
inline FloatPoint operator-(const FloatPoint& a, const FloatSize& b);

    /**
     *  operator== 
     */
inline bool operator==(const FloatPoint& a, const FloatPoint& b);

    /**
     *  operator!= 
     */
inline bool operator!=(const FloatPoint& a, const FloatPoint& b);

}

#endif




