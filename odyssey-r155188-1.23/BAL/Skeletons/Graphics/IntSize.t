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
#ifndef IntSize_h
#define IntSize_h
/**
 *  @file  IntSize.t
 *  IntSize description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:07 $
 */
#include "BALBase.h"

#include <wtf/Platform.h>




namespace WKAL {

class IntSize : public WKALBase {
public:
    /**
     * IntSize default constructor
     * @code
     * IntSize s;
     * @endcode
     */
    IntSize();

    /**
     * IntSize constructor
     * @param[in] : width
     * @param[in] : height
     * @code
     * IntSize s(3, 5);
     * @endcode
     */
    IntSize(int width, int height);
    
    /**
     * get width value
     * @param[out] : width value
     * @code
     * int w = s.width();
     * @endcode
     */
    int width() const ;

    /**
     * get height value
     * @param[out] : height value
     * @code
     * int h = s.height();
     * @endcode
     */
    int height() const ;

    /**
     * set width value
     * @param[in] : width value
     * @code
     * s.setWidth(3);
     * @endcode
     */
    void setWidth(int width) ;

    /**
     * set height value
     * @param[in] : height value
     * @code
     * s.setHeight(3);
     * @endcode
     */
    void setHeight(int height) ;

    /**
     * test if the IntSize is empty
     * @param[out] : true if the IntSize is empty
     * @code
     * bool e = s.isEmpty();
     * @endcode
     */
    bool isEmpty() const ;

    /**
     * expanded to the new size
     * @param[in] : size
     * @param[out] : size expanded
     * @code
     * IntSize s = s.expandedTo(s1);
     * @endcode
     */
    IntSize expandedTo(const IntSize& other) const;

    /**
     * shrunk to size
     * @param[in] : size
     * @param[out] : size shrunked
     * @code
     * IntSize s = s.shrunkTo(s1);
     * @endcode
     */
    IntSize shrunkTo(const IntSize& other) const;

    /**
     * clamp negative value to zero
     * @code
     * s.clampNegativeToZero();
     * @endcode
     */
    void clampNegativeToZero();


private:
    int m_width, m_height;
};

    /**
     *  operator+= 
     */
inline IntSize& operator+=(IntSize& a, const IntSize& b);

    /**
     *  operator-= 
     */
inline IntSize& operator-=(IntSize& a, const IntSize& b);

    /**
     *  operator+
     */
inline IntSize operator+(const IntSize& a, const IntSize& b);

    /**
     *  operator- 
     */
inline IntSize operator-(const IntSize& a, const IntSize& b);

    /**
     *  operator- 
     */
inline IntSize operator-(const IntSize& size);

    /**
     *  operator== 
     */
inline bool operator==(const IntSize& a, const IntSize& b);

    /**
     *  operator!= 
     */
inline bool operator!=(const IntSize& a, const IntSize& b);

} // namespace WKAL

#endif // IntSize_h




