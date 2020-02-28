
#include "Platform.h"
#if ENABLE(SVG)

#ifndef SVGPaintServerRadialGradientTest_h_CPPUNIT
#define SVGPaintServerRadialGradientTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSVGPaintServerRadialGradient.h"
class SVGPaintServerRadialGradientTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SVGPaintServerRadialGradientTestTest );
//register each method:
    CPPUNIT_TEST(create);
    CPPUNIT_TEST(destruct_SVGPaintServerRadialGradient);

    CPPUNIT_TEST(type);

    CPPUNIT_TEST(gradientCenter);
    CPPUNIT_TEST(setGradientCenter);

    CPPUNIT_TEST(gradientFocal);
    CPPUNIT_TEST(setGradientFocal);

    CPPUNIT_TEST(gradientRadius);
    CPPUNIT_TEST(setGradientRadius);

    CPPUNIT_TEST(externalRepresentation);


    CPPUNIT_TEST_SUITE_END();

    public:
    void create() CPPU_NOT_IMPLEMENTED
    void destruct_SVGPaintServerRadialGradient() CPPU_NOT_IMPLEMENTED

    void type() CPPU_NOT_IMPLEMENTED

    void gradientCenter() CPPU_NOT_IMPLEMENTED
    void setGradientCenter() CPPU_NOT_IMPLEMENTED

    void gradientFocal() CPPU_NOT_IMPLEMENTED
    void setGradientFocal() CPPU_NOT_IMPLEMENTED

    void gradientRadius() CPPU_NOT_IMPLEMENTED
    void setGradientRadius() CPPU_NOT_IMPLEMENTED

    void externalRepresentation() CPPU_NOT_IMPLEMENTED

    };



#endif // SVGPaintServerRadialGradient_h

#endif

