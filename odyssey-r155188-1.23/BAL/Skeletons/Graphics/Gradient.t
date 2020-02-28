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
#ifndef Gradient_h
#define Gradient_h
/**
 *  @file  Gradient.t
 *  Gradient description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:07 $
 */
#include "BALBase.h"

#include "Generator.h"

#include "FloatPoint.h"
#include "NotImplemented.h"
#include <wtf/Vector.h>


namespace WKAL {

    class Color;
    class String;

    class Gradient : public WKALBase, public Generator {
    public:

    /**
     *  create
     */
        static PassRefPtr<Gradient> create(const FloatPoint& p0, const FloatPoint& p1);


    /**
     *  create
     */
        static PassRefPtr<Gradient> create(const FloatPoint& p0, float r0, const FloatPoint& p1, float r1);

     /**
      * desctructor
      */
        virtual ~Gradient();

    /**
     * addColorStop
     * @param[in] : stop value
     * @param[in] : color name
     * @code
     * g->addColorStop(f, s);
     * @endcode
     */
        void addColorStop(float, const String&);

    /**
     * addColorStop
     * @param[in] : stop value
     * @param[in] : color
     * @code
     * g->addColorStop(f, c);
     * @endcode
     */
        void addColorStop(float, const Color&);

    /**
     * get color 
     * @param[in] : stop value
     * @param[in] : red value
     * @param[in] : green value
     * @param[in] : blue value
     * @param[in] : alpha value
     * @code
     * g->getColor(v, r, g, b, a);
     * @endcode
     */
        void getColor(float value, float* r, float* g, float* b, float* a) const;

    /**
     * get platform gradient
     * @param[out] : platform gradient
     * @code
     * PlatformGradient pg = g->platformGradient();
     * @endcode
     */
        PlatformGradient platformGradient();

        struct ColorStop {
            float stop;
            float red;
            float green;
            float blue;
            float alpha;
            
    /**
     * ColorStop default constructor
     * @code
     * ColorStop cs;
     * @endcode
     */
            ColorStop();

    /**
     *  ColorStop constructor
     * @param[in] : stop value
     * @param[in] : red value
     * @param[in] : green value
     * @param[in] : blue value
     * @param[in] : alpha value
     * @code
     * ColorStop(s, r, g, b, a);
     * @endcode
     */
            ColorStop(float s, float r, float g, float b, float a);
        };

    /**
     * set stops sorted
     * @param[in] : value
     * @code
     * g->setStopSorted(s);
     * @endcode
     */
        void setStopsSorted(bool s) ;

    /**
     * fill
     * @param[in] : graphics context
     * @param[in] : fill rect
     * @code
     * g->fill(gc, r);
     * @endcode
     */
        virtual void fill(GraphicsContext*, const FloatRect&);


    private:
    /**
     * gradient constructor
     */
       Gradient(const FloatPoint& p0, const FloatPoint& p1);
    /**
     * Gradient constructor
     * @param[in] : float point
     * @ddparam[in] : 
     * @param[in] : float point
     * @param[in] : 
     * @code
     * Gradient *g = new Gradient(p0, r0, p1, r1);
     * @endcode
     */
        Gradient(const FloatPoint& p0, float r0, const FloatPoint& p1, float r1);

    /**
     * platformInit
     */
        void platformInit() ;

    /**
     * platform destroy
     * @code
     * platformDestroy();
     * @endcode
     */
        void platformDestroy();

    /**
     * findStop
     */
        int findStop(float value) const;

        bool m_radial;
        FloatPoint m_p0, m_p1;
        float m_r0, m_r1;
        mutable Vector<ColorStop> m_stops;
        mutable bool m_stopsSorted;
        mutable int m_lastStop;

        PlatformGradient m_gradient;
    };
} //namespace

#endif
