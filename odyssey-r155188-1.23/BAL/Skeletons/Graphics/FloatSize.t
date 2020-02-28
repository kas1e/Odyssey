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
#ifndef FloatSize_h
#define FloatSize_h
/**
 *  @file  FloatSize.t
 *  FloatSize description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:07 $
 */
#include "BALBase.h"

#include <wtf/Platform.h>



namespace WKAL {

class IntSize;

class FloatSize : public WKALBase {
public:
    /**
     * FloatSize default constructor
     * @code
     * FloatSize s;
     * @endcode
     */
    FloatSize();

    /**
     * FloatSize constructor
     * @param[in] : width value
     * @param[in] : height value
     * @code
     * FloatSize s(3.2, 5.4);
     * @endcode
     */
    FloatSize(float width, float height);

    /**
     * FloatSize constructor
     * @param[in] : IntSize
     * @code
     * FloatSize(IntSize(3, 5);
     * @endcode
     */
    FloatSize(const IntSize&);

    /**
     * narrow precision
     * @param[in] : width value
     * @param[in] : height value
     * @param[out] : float size
     * @code
     * FloatSize s = FloatSize::narrowPrecision(4.3, 5.2);
     * @endcode
     */
    static FloatSize narrowPrecision(double width, double height);

    /**
     * get width value
     * @param[out] : width value
     * @code
     * float w = s.width();
     * @endcode
     */
    float width() const ;

    /**
     * get height value
     * @param[out] : height value
     * @code
     * float h = s.height();
     * @endcode
     */
    float height() const ;

    /**
     * set width
     * @param[in] : width value
     * @code
     * s.setWidth(4.3);
     * @endcode
     */
    void setWidth(float width) ;

    /**
     * set height
     * @param[in] : height value
     * @code
     * s.setHeight(4.3);
     * @endcode
     */
    void setHeight(float height) ;

    /**
     * test if the float size is empty
     * @param[out] : true if the float size is empty
     * @code
     * bool emp = s.isEmpty();
     * @endcode
     */
    bool isEmpty() const ;

    /**
     * expanded to the other float size
     * @param[in] : other float size
     * @param[out] : expand result
     * @code
     * FloatSize s = s.expandedTo(f);
     * @endcode
     */
    FloatSize expandedTo(const FloatSize& other) const;



private:
    float m_width, m_height;
};

    /**
     *  operator+= 
     */
inline FloatSize& operator+=(FloatSize& a, const FloatSize& b);

    /**
     *  operator-= 
     */
inline FloatSize& operator-=(FloatSize& a, const FloatSize& b);

    /**
     *  operator+
     */
inline FloatSize operator+(const FloatSize& a, const FloatSize& b);

    /**
     *  operator- 
     */
inline FloatSize operator-(const FloatSize& a, const FloatSize& b);

    /**
     *  operator-
     */
inline FloatSize operator-(const FloatSize& size);

    /**
     *  operator== 
     */
inline bool operator==(const FloatSize& a, const FloatSize& b);

    /**
     *  operator!= 
     */
inline bool operator!=(const FloatSize& a, const FloatSize& b);

} // namespace WKAL

#endif // FloatSize_h




