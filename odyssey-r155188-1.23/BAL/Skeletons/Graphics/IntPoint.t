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
#ifndef IntPoint_h
#define IntPoint_h
/**
 *  @file  IntPoint.t
 *  IntPoint description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:07 $
 */
#include "BALBase.h"

#include "IntSize.h"
#include <wtf/Platform.h>





namespace WKAL {

class IntPoint : public WKALBase {
public:
    /**
     * IntPoint default constructor
     * @code
     * IntPoint p;
     * @endcode
     */
    IntPoint();

    /**
     * IntPoint constructor
     * @param[in] : x value
     * @param[in] : y value
     * @code
     * IntPoint p(0, 0);
     * @endcode
     */
    IntPoint(int x, int y);

    /**
     * get x value
     * @param[out] : x value
     * @code
     * int x = p.x();
     * @endcode
     */
    int x() const ;

    /**
     * get y value
     * @param[out] : y value
     * @code
     * int y = p.y();
     * @endcode
     */
    int y() const ;

    /**
     * set x value
     * @param[in] : x value
     * @code
     * p.setX(0);
     * @endcode
     */
    void setX(int x) ;

    /**
     * set y value
     * @param[in] : y value
     * @code
     * p.setY(0);
     * @endcode
     */
    void setY(int y) ;

    /**
     * move
     * @param[in] : delta x value
     * @param[in] : delta y value
     * @code
     * p.move(3, 4);
     * @endcode
     */
    void move(int dx, int dy) ;

    /**
     * IntPoint constructor
     * @param[in] : platform point
     * @code
     * IntPoint p(bp);
     * @endcode
     */
    IntPoint(const BalPoint&);

    /**
     * BalPoint operator
     * @param[out] : platform point
     */
    operator BalPoint() const;


private:
    int m_x, m_y;
};

    /**
     *  operator+= 
     */
inline IntPoint& operator+=(IntPoint& a, const IntSize& b);

    /**
     *  operator-=
     */
inline IntPoint& operator-=(IntPoint& a, const IntSize& b);

    /**
     *  operator+ 
     */
inline IntPoint operator+(const IntPoint& a, const IntSize& b);

    /**
     *  operator- 
     */
inline IntSize operator-(const IntPoint& a, const IntPoint& b);

    /**
     *  operator- 
     */
inline IntPoint operator-(const IntPoint& a, const IntSize& b);

    /**
     *  operator== 
     */
inline bool operator==(const IntPoint& a, const IntPoint& b);

    /**
     *  operator!= 
     */
inline bool operator!=(const IntPoint& a, const IntPoint& b);

} // namespace WKAL

#endif // IntPoint_h




