#ifndef GradientTest_h_CPPUNIT
#define GradientTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCGradient.h"
class GradientTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( GradientTestTest );
//register each method:
    CPPUNIT_TEST(Gradient);
    CPPUNIT_TEST(Gradient_r0_r1);
    CPPUNIT_TEST(destruct_Gradient);

    CPPUNIT_TEST(addColorStop);
    CPPUNIT_TEST(addColorStop2);

    CPPUNIT_TEST(getColor);

    CPPUNIT_TEST(platformGradient);

    CPPUNIT_TEST(ColorStop);
    CPPUNIT_TEST(ColorStop_values);

    CPPUNIT_TEST(setStopsSorted);

    CPPUNIT_TEST(fill);

    CPPUNIT_TEST_SUITE_END();

    public:
    void Gradient() CPPU_NOT_IMPLEMENTED
    void Gradient_r0_r1() CPPU_NOT_IMPLEMENTED
    void destruct_Gradient() CPPU_NOT_IMPLEMENTED

    void addColorStop() CPPU_NOT_IMPLEMENTED
    void addColorStop2() CPPU_NOT_IMPLEMENTED

    void getColor() CPPU_NOT_IMPLEMENTED

    void platformGradient() CPPU_NOT_IMPLEMENTED

    void ColorStop() CPPU_NOT_IMPLEMENTED
    void ColorStop_values() CPPU_NOT_IMPLEMENTED

    void setStopsSorted() CPPU_NOT_IMPLEMENTED

    void fill() CPPU_NOT_IMPLEMENTED
    };


#endif

