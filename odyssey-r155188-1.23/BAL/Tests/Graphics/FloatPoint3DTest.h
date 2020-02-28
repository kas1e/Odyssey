#include "Platform.h"
#if ENABLE(SVG)

#ifndef FloatPoint3DTest_h_CPPUNIT
#define FloatPoint3DTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCFloatPoint3D.h"
class FloatPoint3DTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( FloatPoint3DTestTest );
//register each method:
    CPPUNIT_TEST(FloatPoint3D);
    CPPUNIT_TEST(FloatPoint3D_xyz);

    CPPUNIT_TEST(x);
    CPPUNIT_TEST(setX);
    CPPUNIT_TEST(y);
    CPPUNIT_TEST(setY);
    CPPUNIT_TEST(z);
    CPPUNIT_TEST(setZ);
    CPPUNIT_TEST(normalize);
    CPPUNIT_TEST_SUITE_END();
    public:

    void FloatPoint3D() CPPU_NOT_IMPLEMENTED
    void FloatPoint3D_xyz() CPPU_NOT_IMPLEMENTED

    void x() CPPU_NOT_IMPLEMENTED
    void setX() CPPU_NOT_IMPLEMENTED
    void y() CPPU_NOT_IMPLEMENTED
    void setY() CPPU_NOT_IMPLEMENTED
    void z() CPPU_NOT_IMPLEMENTED
    void setZ() CPPU_NOT_IMPLEMENTED
    void normalize() CPPU_NOT_IMPLEMENTED
};


#endif // FloatPoint3D_h

#endif // ENABLE(SVG)

