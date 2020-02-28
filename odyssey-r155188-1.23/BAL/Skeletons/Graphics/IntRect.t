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
#ifndef IntRect_h
#define IntRect_h
/**
 *  @file  IntRect.t
 *  IntRect description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:07 $
 */
#include "BALBase.h"

#include "IntPoint.h"
#include <wtf/Platform.h>





namespace WKAL {

class FloatRect;

class IntRect : public WKALBase {
public:
    /**
     * IntRect default constructor
     * @code
     * IntRect r;
     * @endcode
     */
    IntRect() ;

    /**
     * IntRect constructor
     * @param[in] : position
     * @param[in] : size
     * @code
     * IntRect r(l, s);
     * @endcode
     */
    IntRect(const IntPoint& location, const IntSize& size);

    /**
     * IntRect constructor
     * @param[in] : float rect
     * @code
     * IntRect r(fr);
     * @endcode
     */
    explicit IntRect(const FloatRect& rect); // don't do this implicitly since it's lossy
        
    /**
     * get IntRect position
     * @param[out] : position
     * @code
     * IntPoint p = r.location();
     * @endcode
     */
    IntPoint location() const ;

    /**
     * get size
     * @param[out] : size
     * @code
     * IntSize s = r.size();
     * @endcode
     */
    IntSize size() const ;

    /**
     * set position 
     * @param[in] : position
     * @code
     * r.location(p);
     * @endcode
     */
    void setLocation(const IntPoint& location) ;

    /**
     * set size
     * @param[in] : size
     * @code
     * r.setSize(s);
     * @endcode
     */
    void setSize(const IntSize& size) ;

    /**
     * get x value
     * @param[out] : x value
     * @code
     * int x = r.x();
     * @endcode
     */
    int x() const ;

    /**
     * get y value
     * @param[out] : y value
     * @code
     * int y = r.y();
     * @endcode
     */
    int y() const ;

    /**
     * get width value
     * @param[out] : width value
     * @code
     * int w = r.width();
     * @endcode
     */
    int width() const ;

    /**
     * get height value
     * @param[out] : height value
     * @code
     * int h = r.height();
     * @endcode
     */
    int height() const ;

    /**
     * set x value
     * @param[in] : x value
     * @code
     * r.setX(4);
     * @endcode
     */
    void setX(int x) ;

    /**
     * set y value
     * @param[in] : y value
     * @code
     * r.setY(3);
     * @endcode
     */
    void setY(int y) ;

    /**
     * set width value
     * @param[in] : width value
     * @code
     * r.setWidth(30);
     * @endcode
     */
    void setWidth(int width) ;

    /**
     * set height value
     * @param[in] : height value
     * @code
     * r.setHeight(3);
     * @endcode
     */
    void setHeight(int height) ;


    /**
     * get top left position
     * Be careful with these functions.  The point is considered to be to the right and below.  These are not substitutes for right() and bottom().
     * @param[out] : top left position
     * @code
     * IntPoint p = r.topLeft();
     * @endcode
     */
    IntPoint topLeft() const ;

    /**
     * get top right position
     * Be careful with these functions.  The point is considered to be to the right and below.  These are not substitutes for right() and bottom().
     * @param[out] : top right position
     * @code
     * IntPoint p = r.topRight();
     * @endcode
     */
    IntPoint topRight() const ;

    /**
     * get bottom left position
     * Be careful with these functions.  The point is considered to be to the right and below.  These are not substitutes for right() and bottom().
     * @param[out] : bottom left position
     * @code
     * IntPoint p = r.bottomLeft();
     * @endcode
     */
    IntPoint bottomLeft() const ;

    /**
     * bottom right position
     * Be careful with these functions.  The point is considered to be to the right and below.  These are not substitutes for right() and bottom().
     * @param[out] : bottom right position
     * @code
     * IntPoint p = r.bottomRight();
     * @endcode
     */
    IntPoint bottomRight() const ;

    /**
     * test if the rect is empty
     * @param[out] : true if the rect is empty
     * @code
     * bool i = r.isEmpty();
     * @endcode
     */
    bool isEmpty() const ;

    /**
     * get right value
     * @param[out] : right value
     * @code
     * int ri = r.right();
     * @endcode
     */
    int right() const ;

    /**
     * get bottom value
     * @param[out] : bottom value
     * @code
     * int b = r.bottom();
     * @endcode
     */
    int bottom() const ;

    /**
     * move
     * @param[in] : delta
     * @code
     * r.move(s);
     * @endcode
     */
    void move(const IntSize& s) ;

    /**
     * move
     * @param[in] : delta x
     * @param[in] : delta y
     * @code
     * r.move(4, 3);
     * @endcode
     */
    void move(int dx, int dy) ;

    /**
     * intersects
     * @param[in] : rect
     * @param[out] : true if the intersection is available
     * @code
     * bool i = r.intersects(r1);
     * @endcode
     */
    bool intersects(const IntRect&) const;

    /**
     * test if rect contains the other rect
     * @param[in] : other rect
     * @param[out] : true if rect contains the other rect
     * @code
     * bool c = r.contains(r1);
     * @endcode
     */
    bool contains(const IntRect&) const;

    /**
     * This checks to see if the rect contains x,y in the traditional sense.
     * Equivalent to checking if the rect contains a 1x1 rect below and to the right of (px,py).
     * @param[in] : point
     * @param[out] : true if rect containt this point
     * @code
     * bool c = r.contains(p);
     * @endcode
     */
    bool contains(const IntPoint& point) const ;

    /**
     * intersect
     * @param[in] : rect
     * @code
     * r.intersect(r1);
     * @endcode
     */
    void intersect(const IntRect&);

    /**
     * union of rect and other rect
     * @param[in] : rect
     * @code
     * r.unite(r1);
     * @endcode
     */
    void unite(const IntRect&);

    /**
     * inflate x value
     * @param[in] : delta x value
     * @code
     * r.inflateX(2);
     * @endcode
     */
    void inflateX(int dx);

    /**
     * inflate y value
     * @param[in] : delta y value
     * @code
     * r.inflateY(3);
     * @endcode
     */
    void inflateY(int dy);

    /**
     * inflate
     * @param[in] : delata value
     * @code
     * r.inflate(3);
     * @endcode
     */
    void inflate(int d) ;

    /**
     * scale
     * @param[in] : scale value
     * @code
     * r.scale(s);
     * @endcode
     */
    void scale(float s);


    /**
     * IntRect constructor
     * @param[in] : platform rectangle
     * @code
     * IntRect r(balRect);
     * @endcode
     */
    IntRect(const BalRectangle&);

    /**
     * BalRectangle operator
     * @param[out] : BalRectangle
     */
    operator BalRectangle() const;



private:
    IntPoint m_location;
    IntSize m_size;
};

    /**
     *  intersection
     */
inline IntRect intersection(const IntRect& a, const IntRect& b);

    /**
     *  unionRect
     */
inline IntRect unionRect(const IntRect& a, const IntRect& b);

    /**
     *  operator==
     */
inline bool operator==(const IntRect& a, const IntRect& b);

    /**
     *  operator!=
     */
inline bool operator!=(const IntRect& a, const IntRect& b);



} // namespace WKAL

#endif // IntRect_h




