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
#ifndef Pen_h
#define Pen_h
/**
 *  @file  Pen.t
 *  Pen description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:08 $
 */
#include "BALBase.h"

#include "Color.h"


namespace WKAL {

class Pen : public WKALBase {
public:
    enum PenStyle {
        NoPen,
        SolidLine,
        DotLine,
        DashLine
    };

    /**
     * Pen constructor
     * @param[in] : color
     * @param[in] : width
     * @param[in] : pen style
     * @code
     * Pen *p = new Pen();
     * @endcode
     */
    Pen(const Color &c = Color::black, unsigned w = 0, PenStyle ps = SolidLine);

    /**
     * get reference on pen color
     * @param[out] : color
     * @code
     * Color c = p->color();
     * @endcode
     */
    const Color &color() const;

    /**
     * get width value
     * @param[out] : width value
     * @code
     * unsigned w = p->width();
     * @endcode
     */
    unsigned width() const;

    /**
     * get style value
     * @param[out] : pen style
     * @code
     * PenStyle s = p->style();
     * @endcode
     */
    PenStyle style() const;

    /**
     * set pen color
     * @param[in] : color
     * @code
     * p->setColor(c);
     * @endcode
     */
    void setColor(const Color &);

    /**
     * set width 
     * @param[in] : width
     * @code
     * p->setWidth(w)
     * @endcode
     */
    void setWidth(unsigned);

    /**
     * set style
     * @param[in] : style
     * @code
     * p->setStyle(s);
     * @endcode
     */
    void setStyle(PenStyle);

    /**
     * operator==
     * @param[in] : pen
     * @param[out] : true if the two pen are equal
     * @code
     * bool e = p == p1;
     * @endcode
     */
    bool operator==(const Pen &) const;

    /**
     * operator!= 
     * @param[in] : pen
     * @param[out] : true if the two pen are different
     * @code
     * bool d = p != p1;
     * @endcode
     */
    bool operator!=(const Pen &) const;
    

private:
    PenStyle  m_style;
    unsigned  m_width;
    Color     m_color;
};

}

#endif




