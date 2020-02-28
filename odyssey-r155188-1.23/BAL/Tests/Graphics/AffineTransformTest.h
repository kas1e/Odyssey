#ifndef AffineTransformTest_h_CPPUNIT
#define AffineTransformTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "Platform.h"
#include "BCAffineTransform.h"
class AffineTransformTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( AffineTransformTestTest );
//register each method:
    CPPUNIT_TEST(AffineTransform);
    CPPUNIT_TEST(AffineTransform_abcdef);

    CPPUNIT_TEST(setMatrix);
    CPPUNIT_TEST(map);
    CPPUNIT_TEST(mapPoint);
    CPPUNIT_TEST(mapPoint2);
    CPPUNIT_TEST(mapRect);
    CPPUNIT_TEST(mapRect2);
    
    CPPUNIT_TEST(isIdentity);
    
    CPPUNIT_TEST(a);
    CPPUNIT_TEST(setA);

    CPPUNIT_TEST(b);
    CPPUNIT_TEST(setB);

    CPPUNIT_TEST(c);
    CPPUNIT_TEST(setC);

    CPPUNIT_TEST(d);
    CPPUNIT_TEST(setD);

    CPPUNIT_TEST(e);
    CPPUNIT_TEST(setE);

    CPPUNIT_TEST(f);
    CPPUNIT_TEST(setF);

    CPPUNIT_TEST(reset);

    CPPUNIT_TEST(multiply);
    CPPUNIT_TEST(scale);
    CPPUNIT_TEST(scale2);
    CPPUNIT_TEST(scaleNonUniform);
    CPPUNIT_TEST(rotate);
    CPPUNIT_TEST(rotateFromVector);
    CPPUNIT_TEST(translate);
    CPPUNIT_TEST(shear);
    CPPUNIT_TEST(flipX);
    CPPUNIT_TEST(flipY);
    CPPUNIT_TEST(skew);
    CPPUNIT_TEST(skewX);
    CPPUNIT_TEST(skewY);
 
    CPPUNIT_TEST(det);
    CPPUNIT_TEST(isInvertible);
    CPPUNIT_TEST(inverse);

    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);
    CPPUNIT_TEST(operator_premult);
    CPPUNIT_TEST(operator_mult);
 
    CPPUNIT_TEST_SUITE_END();

public:
    void AffineTransform() CPPU_NOT_IMPLEMENTED
    void AffineTransform_abcdef() CPPU_NOT_IMPLEMENTED

    void setMatrix() CPPU_NOT_IMPLEMENTED
    void map() CPPU_NOT_IMPLEMENTED
    void mapPoint() CPPU_NOT_IMPLEMENTED
    void mapPoint2() CPPU_NOT_IMPLEMENTED
    void mapRect() CPPU_NOT_IMPLEMENTED
    void mapRect2() CPPU_NOT_IMPLEMENTED
    
    void isIdentity() CPPU_NOT_IMPLEMENTED
    
    void a() CPPU_NOT_IMPLEMENTED
    void setA() CPPU_NOT_IMPLEMENTED

    void b() CPPU_NOT_IMPLEMENTED
    void setB() CPPU_NOT_IMPLEMENTED

    void c() CPPU_NOT_IMPLEMENTED
    void setC() CPPU_NOT_IMPLEMENTED

    void d() CPPU_NOT_IMPLEMENTED
    void setD() CPPU_NOT_IMPLEMENTED

    void e() CPPU_NOT_IMPLEMENTED
    void setE() CPPU_NOT_IMPLEMENTED

    void f() CPPU_NOT_IMPLEMENTED
    void setF() CPPU_NOT_IMPLEMENTED

    void reset() CPPU_NOT_IMPLEMENTED

    void multiply() CPPU_NOT_IMPLEMENTED
    void scale() CPPU_NOT_IMPLEMENTED
    void scale2() CPPU_NOT_IMPLEMENTED
    void scaleNonUniform() CPPU_NOT_IMPLEMENTED
    void rotate() CPPU_NOT_IMPLEMENTED
    void rotateFromVector() CPPU_NOT_IMPLEMENTED
    void translate() CPPU_NOT_IMPLEMENTED
    void shear() CPPU_NOT_IMPLEMENTED
    void flipX() CPPU_NOT_IMPLEMENTED
    void flipY() CPPU_NOT_IMPLEMENTED
    void skew() CPPU_NOT_IMPLEMENTED
    void skewX() CPPU_NOT_IMPLEMENTED
    void skewY() CPPU_NOT_IMPLEMENTED
 
    void det() CPPU_NOT_IMPLEMENTED
    void isInvertible() CPPU_NOT_IMPLEMENTED
    void inverse() CPPU_NOT_IMPLEMENTED

    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED
    void operator_premult() CPPU_NOT_IMPLEMENTED
    void operator_mult() CPPU_NOT_IMPLEMENTED
    
};


#endif // AffineTransform_h

