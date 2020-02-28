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
#ifndef WTF_MathExtras_h
#define WTF_MathExtras_h
/**
 *  @file  MathExtras.t
 *  MathExtras description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#include <math.h>
#include <stdlib.h>
#include <time.h>


#if COMPILER(MSVC)

#include <xmath.h>
#include <limits>

#if HAVE(FLOAT_H)
#include <float.h>
#endif

#endif

#ifndef M_PI
const double piDouble = 3.14159265358979323846;
const float piFloat = 3.14159265358979323846f;
#else
const double piDouble = M_PI;
    /**
     *  static_cast<float> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
const float piFloat = static_cast<float>(M_PI);
#endif

#ifndef M_PI_4
const double piOverFourDouble = 0.785398163397448309616;
const float piOverFourFloat = 0.785398163397448309616f;
#else
const double piOverFourDouble = M_PI_4;
    /**
     *  static_cast<float> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
const float piOverFourFloat = static_cast<float>(M_PI_4);
#endif


#if COMPILER(MSVC)

    /**
     *  isinf description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline bool isinf(double num) ;
    /**
     *  isnan description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline bool isnan(double num) ;
    /**
     *  lround description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline long lround(double num) ;
    /**
     *  lroundf description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline long lroundf(float num) ;
    /**
     *  round description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline double round(double num) ;
    /**
     *  roundf description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline float roundf(float num) ;
    /**
     *  signbit description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline bool signbit(double num) ;
    /**
     *  trunc description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline double trunc(double num) ;

    /**
     *  nextafter description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline double nextafter(double x, double y) ;
    /**
     *  nextafterf description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline float nextafterf(float x, float y) ;

    /**
     *  copysign description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline double copysign(double x, double y) ;
    /**
     *  isfinite description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline int isfinite(double x) ;

// Work around a bug in Win, where atan2(+-infinity, +-infinity) yields NaN instead of specific values.
    /**
     *  wtf_atan2 description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline double wtf_atan2(double x, double y);

// Work around a bug in the Microsoft CRT, where fmod(x, +-infinity) yields NaN instead of x.
    /**
     *  wtf_fmod description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline double wtf_fmod(double x, double y) ;

// Work around a bug in the Microsoft CRT, where pow(NaN, 0) yields NaN instead of 1.
    /**
     *  wtf_pow description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline double wtf_pow(double x, double y) ;

#define atan2(x, y) wtf_atan2(x, y)
#define fmod(x, y) wtf_fmod(x, y)
#define pow(x, y) wtf_pow(x, y)

#if defined(_CRT_RAND_S)
// Initializes the random number generator.;
    /**
     *  wtf_random_init description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline void wtf_random_init();

// Returns a pseudo-random number in the range [0, 1).
    /**
     *  wtf_random description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline double wtf_random();
#endif // _CRT_RAND_S

#endif // COMPILER(MSVC)

#if !COMPILER(MSVC) || !defined(_CRT_RAND_S)

// Initializes the random number generator.
    /**
     *  wtf_random_init description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline void wtf_random_init();

// Returns a pseudo-random number in the range [0, 1).
    /**
     *  wtf_random description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline double wtf_random();

#endif // #if COMPILER(MSVC)

    /**
     *  deg2rad description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline double deg2rad(double d)  ;
    /**
     *  rad2deg description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline double rad2deg(double r)  ;
    /**
     *  deg2grad description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline double deg2grad(double d) ;
    /**
     *  grad2deg description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline double grad2deg(double g) ;
    /**
     *  rad2grad description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline double rad2grad(double r) ;
    /**
     *  grad2rad description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline double grad2rad(double g) ;

    /**
     *  deg2rad description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline float deg2rad(float d)  ;
    /**
     *  rad2deg description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline float rad2deg(float r)  ;
    /**
     *  deg2grad description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline float deg2grad(float d) ;
    /**
     *  grad2deg description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline float grad2deg(float g) ;
    /**
     *  rad2grad description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline float rad2grad(float r) ;
    /**
     *  grad2rad description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline float grad2rad(float g) ;

#endif // #ifndef WTF_MathExtras_h




