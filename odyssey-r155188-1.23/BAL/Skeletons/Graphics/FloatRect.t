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
#ifndef FloatRect_h
#define FloatRect_h
/**
 *  @file  FloatRect.t
 *  FloatRect description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:07 $
 */
#include "BALBase.h"

#include "FloatPoint.h"





namespace WKAL {

class IntRect;

class FloatRect : public WKALBase {
public:
    /**
     * FloatRect default constructor
     * @code
     * FloatRect r;
     * @endcode
     */
    FloatRect() ;

    /**
     * FloatRect constructor
     * @param[in] : position
     * @param[in] : size
     * @code
     * FloatRect r(l,s);
     * @endcode
     */
    FloatRect(const FloatPoint& location, const FloatSize& size);

    /**
     * FloatRect constructor
     * @param[in] : IntRect
     * @code
     * FloatRect(IntRect(0,0));
     * @endcode
     */
    FloatRect(const IntRect&);

    /**
     * narrow precision
     * @param[in] : x value 
     * @param[in] : y value
     * @param[in] : width value
     * @param[in] : height value
     * @param[out] : float rect
     * @code
     * FloatRect r = FloatRect::narrowPrecision(0, 0, 10.1, 10.3);
     * @endcode
     */
    static FloatRect narrowPrecision(double x, double y, double width, double height);

    /**
     * get float rect position
     * @param[out] : position
     * @code
     * FloatPoint p = r.location();
     * @endcode
     */
    FloatPoint location() const ;

    /**
     * get float rect size
     * @param[out] : size
     * @code
     * FloatSize s = r.size();
     * @endcode
     */
    FloatSize size() const ;

    /**
     * set position
     * @param[in] : position
     * @code
     * r.setLocation(p);
     * @endcode
     */
    void setLocation(const FloatPoint& location) ;

    /**
     * set size
     * @param[in] : size
     * @code
     * r.setSize(s);
     * @endcode
     */
    void setSize(const FloatSize& size) ;

    /**
     * get x value
     * @param[out] : x value
     * @code
     * float x = r.x();
     * @endcode
     */
    float x() const ;

    /**
     * get y value
     * @param[out] : y value
     * @code
     * float y = r.y();
     * @endcode
     */
    float y() const ;

    /**
     * get width value
     * @param[out] : width value
     * @code
     * float w = r.width();
     * @endcode
     */
    float width() const ;

    /**
     * get height value
     * @param[out] : height value
     * @code
     * float h = r.height();
     * @endcode
     */
    float height() const ;

    /**
     * set x value
     * @param[in] : x value
     * @code
     * r.setX(0.1);
     * @endcode
     */
    void setX(float x) ;

    /**
     * set y value
     * @param[in] : y value
     * @code
     * r.setY(1.3);
     * @endcode
     */
    void setY(float y) ;

    /**
     * set width value
     * @param[in] : width value
     * @code
     * r.setWidth(4.6);
     * @endcode
     */
    void setWidth(float width) ;

    /**
     * set height value
     * @param[in] : height value
     * @code
     * r.setHeight(5.3);
     * @endcode
     */
    void setHeight(float height) ;

    /**
     * test if the FloatRect is empty
     * @param[out] : true if the FloatRect is empty
     * @code
     * bool emp = r.isEmpty();
     * @endcode
     */
    bool isEmpty() const ;

    /**
     * get right position
     * @param[out] : right position
     * @code
     * float ri = r.right();
     * @endcode
     */
    float right() const ;

    /**
     * get bottom position
     * @param[out] : bottom position
     * @code
     * float b = r.bottom();
     * @endcode
     */
    float bottom() const ;

    /**
     * move float rect position
     * @param[in] : size delta
     * @code
     * r.move(d);
     * @endcode
     */
    void move(const FloatSize& delta) ;
    /**
     * move float rect position
     * @param[in] : x delta value
     * @param[in] : y delta value
     * @code
     * r.move(4.3, 5.2);
     * @endcode
     */
    void move(float dx, float dy) ;

    /**
     * intersects with the float rect given
     * @param[in] : float rect
     * @param[out] : true if the intersects is possible.
     * @code
     * bool o = r.intersects(f);
     * @endcode
     */
    bool intersects(const FloatRect&) const;

    /**
     * test if float rect contains the float rect given
     * @param[in] : float rect
     * @param[out] : true if float rect contains the float rect given
     * @code
     * bool c = r.contains(f);
     * @endcode
     */
    bool contains(const FloatRect&) const;

    /**
     * intersect with the float rect given
     * @param[in] : float rect
     * @code
     * r.intersects(f);
     * @endcode
     */
    void intersect(const FloatRect&);

    /**
     * it's a union with the float rect given
     * @param[in] : float rect
     * @code
     * r.unite(f);
     * @endcode
     */
    void unite(const FloatRect&);

    // Note, this doesn't match what IntRect::contains(IntPoint&) does; the int version
    // is really checking for containment of 1x1 rect, but that doesn't make sense with floats.
    /**
     * test if the point is contains in float rect
     * @param[in] : point
     * @param[out] : true if the point is contains in float rect
     * @code
     * bool c = r.contains(p);
     * @endcode
     */
    bool contains(const FloatPoint& point) const ;

    /**
     * inflate x 
     * @param[in] : delta x value
     * @code
     * r.inflateX(3.2);
     * @endcode
     */
    void inflateX(float dx) ;

    /**
     * inflate y 
     * @param[in] : delta y value
     * @code
     * r.inflateY(4.2);
     * @endcode
     */
    void inflateY(float dy) ;

    /**
     * inflate 
     * @param[in] : delta value
     * @code
     * r.inflate(3.0);
     * @endcode
     */
    void inflate(float d) ;

    /**
     * scale
     * @param[in] : scale value
     * @code
     * r.scale(3.4);
     * @endcode
     */
    void scale(float s);


private:
    FloatPoint m_location;
    FloatSize m_size;
};

    /**
     *  intersection
     */
inline FloatRect intersection(const FloatRect& a, const FloatRect& b);

    /**
     *  unionRect
     */
inline FloatRect unionRect(const FloatRect& a, const FloatRect& b);

    /**
     *  operator==
     */
inline bool operator==(const FloatRect& a, const FloatRect& b);

    /**
     *  operator!=
     */
inline bool operator!=(const FloatRect& a, const FloatRect& b);

    /**
     *  enclosingIntRect
     */
IntRect enclosingIntRect(const FloatRect&);

}

#endif




