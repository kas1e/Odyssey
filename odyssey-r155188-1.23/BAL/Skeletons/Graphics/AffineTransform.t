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
#ifndef AffineTransform_h
#define AffineTransform_h
/**
 *  @file  AffineTransform.t
 *  AffineTransform description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:06 $
 */
#include "BALBase.h"


namespace WKAL {

class IntPoint;
class IntRect;
class FloatPoint;
class FloatRect;

class AffineTransform : public WKALBase {
public:
    /**
     * AffineTransform default contructor
     * @code
     * AffineTransform *a = new AffineTransform();
     * @endcode
     */
    AffineTransform();

    /**
     * AffineTransform constructor
     * @param[in] : a value
     * @param[in] : b value
     * @param[in] : c value
     * @param[in] : d value
     * @param[in] : dx value
     * @param[in] : dy value
     * @code
     * AffineTransform *a = new AffineTransform(0, 1, 0, 1, 0, 0);
     * @endcode
     */
    AffineTransform(double a, double b, double c, double d, double e, double f);

    /**
     * AffineTransform constructor
     * @param[in] : platform matrix
     * @code
     * AffineTransform *a = new AffineTransform(balMatrix);
     * @endcode
     */
    AffineTransform(const PlatformAffineTransform&);

    /**
     * set Matrix 
     * @param[in] : a value
     * @param[in] : b value
     * @param[in] : c value
     * @param[in] : d value
     * @param[in] : dx value
     * @param[in] : dy value
     * @code
     * a->setMatrix(0, 1, 0, 1, 0, 0);
     * @endcode
     */
    void setMatrix(double a, double b, double c, double d, double e, double f);

    /**
     * Maps the given coordinates x and y into the coordinate system defined by this matrix. The resulting values are put in x2 and y2, respectively.
     * @param[in] : x value
     * @param[in] : y value
     * @param[out] : x value
     * @param[out] : y value
     * @code
     * a->map(x1, y1, &x2, &y2);
     * @endcode
     */
    void map(double x, double y, double *x2, double *y2) const;

    /**
     * Maps the given coordinates x and y into the coordinate system defined by this matrix.
     * @param[in] : point
     * @param[out] : point
     * @code
     * IntPoint p = a->mapPoint(p1);
     * @endcode
     */
    IntPoint mapPoint(const IntPoint&) const;

    /**
     * Maps the given coordinates x and y into the coordinate system defined by this matrix.
     * @param[in] : point
     * @param[out] : point
     * @code
     * FloatPoint p = a->mapPoint(p1);
     * @endcode
     */
    FloatPoint mapPoint(const FloatPoint&) const;

    /**
     * Maps the given rect into the coordinate system defined by this matrix.
     * @param[in] : rectangle
     * @param[out] : rectangle
     * @code
     * IntRect r = a->mapRect(r1);
     * @endcode
     */
    IntRect mapRect(const IntRect&) const;

    /**
     * Maps the given rect into the coordinate system defined by this matrix.
     * @param[in] : rectangle
     * @param[out] : rectangle
     * @code
     * FloatRect r = a->mapRect(r1);
     * @endcode
     */
    FloatRect mapRect(const FloatRect&) const;
    
    /**
     * test if the matrix is the identity matrix
     * @param[out] : true if the matrix is the identity matrix
     * @code
     * bool id = a->isIdentity();
     * @endcode
     */
    bool isIdentity() const;
    
    /**
     * get a value
     * @param[out] : a value
     * @code
     * double a = af->a();
     * @endcode
     */
    double a() const;

   /**
     * set a value
     * @param[in] : a value
     * @code
     * af->setA(3.3);
     * @endcode
     */
    void setA(double a);

    /**
     * get b value
     * @param[out] : b value
     * @code
     * double b = af->b();
     * @endcode
     */
    double b() const;

    /**
     * set b value
     * @param[in] : b value
     * @code
     * af->setB(3.3);
     * @endcode
     */
     void setB(double b);

    /**
     * get c value
     * @param[out] : c value
     * @code
     * double c = af->c();
     * @endcode
     */
    double c() const;

   /**
     * set c value
     * @param[in] : c value
     * @code
     * af->setC(3.3);
     * @endcode
     */
    void setC(double c);

    /**
     * get d value
     * @param[out] : d value
     * @code
     * double d = af->d();
     * @endcode
     */
    double d() const;

   /**
     * set d value
     * @param[in] : d value
     * @code
     * af->setD(3.3);
     * @endcode
     */
    void setD(double d);

    /**
     * get e value
     * @param[out] : e value
     * @code
     * double e = af->e();
     * @endcode
     */
    double e() const;

   /**
     * set e value
     * @param[in] : e value
     * @code
     * af->setE(3.3);
     * @endcode
     */
    void setE(double e);

    /**
     * get f value
     * @param[out] : f value
     * @code
     * double f = af->f();
     * @endcode
     */
    double f() const;

   /**
     * set f value
     * @param[in] : f value
     * @code
     * af->setF(3.3);
     * @endcode

     */
    void setF(double f);

    /**
     * reset matrix
     * @code
     * af->reset();
     * @endcode
     */
    void reset();

    /**
     * multiply matrix
     * @param[in] : affineTransform
     * @param[out] : affineTransform
     * @code
     * af = af->multiply(af1);
     * @endcode
     */
    AffineTransform& multiply(const AffineTransform&);

    /**
     * scale
     * @param[in] : scale value
     * @param[out] : affineTransform
     * @code
     * af = af->scale(3.0);
     * @endcode
     */
    AffineTransform& scale(double); 

    /**
     * scale 
     * @param[in] : scale x value
     * @param[in] : scale y value
     * @param[out] : affineTransform
     * @code
     * af = af->scale(3.0, 1.0);
     * @endcode
     */
    AffineTransform& scale(double sx, double sy); 

    /**
     * scale non uniform
     * @param[in] : scale x value
     * @param[in] : scale y value
     * @param[out] : affineTransform
     * @code
     * af = af->scaleNonUniform(3.0, 1.0);
     * @endcode
     */
    AffineTransform& scaleNonUniform(double sx, double sy);

    /**
     * rotate
     * @param[in] : rotate value in radian
     * @param[out] : affineTransform
     * @code
     * af = af->rotate(2.0);
     * @endcode
     */
    AffineTransform& rotate(double d);

    /**
     * rotate from vector
     * @param[in] : rotate x value 
     * @param[in] : rotate y value 
     * @param[out] : affineTransform
     * @code
     * af = af->rotateFromVector(1.0, 2.0);
     * @endcode
     */
    AffineTransform& rotateFromVector(double x, double y);

    /**
     * translate
     * @param[in] : translate x value
     * @param[in] : translate y value
     * @param[out] : affineTransform
     * @code
     * af = af->translate(1.0, 2.0);
     * @endcode
     */
    AffineTransform& translate(double tx, double ty);

    /**
     * shear
     * @param[in] : shear x value
     * @param[in] : shear y value
     * @param[out] : affineTransform
     * @code
     * af = af->shear(1.0, 2.0);
     * @endcode
     */
    AffineTransform& shear(double sx, double sy);

    /**
     * flip on X axis
     * @param[out] : affineTransform
     * @code
     * af = af->flipX();
     * @endcode
     */
    AffineTransform& flipX();

    /**
     * flip on Y axis
     * @param[out] : affineTransform
     * @code 
     * af = af->flipY();
     * @endcode
     */
    AffineTransform& flipY();

    /**
     * skew
     * @param[in] : angle x
     * @param[in] : angle y
     * @param[out] : affineTransform
     * @code
     * af = af->skew(2.0, 3.0)
     * @endcode
     */
    AffineTransform& skew(double angleX, double angleY);

    /**
     * skew on x axis
     * @param[in] : angle value
     * @param[out] : affineTransform
     * @code
     * af = af->skewX(2.0);
     * @endcode
     */
    AffineTransform& skewX(double angle);

    /**
     * skew on y axis
     * @param[in] : angle value
     * @param[out] : affineTransform
     * @code
     * af = af->skewY(2.0);
     * @endcode
     */
    AffineTransform& skewY(double angle);
 
    /**
     * get the matrix's determinant
     * @param[out] : det value
     * @code
     * double det = af->det();
     * @endcode
     */
    double det() const;

    /**
     * test if the matrix is invertible
     * @param[out] : true if the matrix is invertible
     * @code
     * bool rev = af->isInvertible();
     * @endcode
     */
    bool isInvertible() const;

    /**
     * inverse the matrix
     * @param[out] : affineTransform
     * @code
     * af = af->inverse();
     * @endcode
     */
    AffineTransform inverse() const;



    /**
     * blend 
     * @param[in] : affineTransform
     * @param[in] : a double
     * @code
     * @endcode
     */
    void blend(const AffineTransform& from, double progress);

    /**
     * PlatformAffineTransform operator
     */
    operator PlatformAffineTransform() const;

    /**
     *  operator== 
     * @param[in] : affineTransform
     * @param[out] : true if the two affineTransform are equal
     * @code
     * bool e = af == af2;
     * @endcode
     */
    bool operator==(const AffineTransform&) const;

    /**
     *  operator!=
     * @param[in] : affineTransform
     * @param[out] : true if the two affineTransform are different
     * @code
     * bool d = af != af2;
     * @endcode
     */
    bool operator!=(const AffineTransform& other) const ;

    /**
     * operator*= 
     * @param[in] : affineTransform
     * @param[out] : affineTransform
     * @code
     * af *= af2;
     * @endcode
     */
    AffineTransform& operator*=(const AffineTransform&);

    /**
     *  operator* 
     * @param[in] : affineTransform
     * @param[out] : affineTransform
     * @code
     * af = af * af2;
     * @endcode
     */
    AffineTransform operator*(const AffineTransform&);
    
private:
    BalMatrix m_transform;
};

} // namespace WKAL

#endif // AffineTransform_h

