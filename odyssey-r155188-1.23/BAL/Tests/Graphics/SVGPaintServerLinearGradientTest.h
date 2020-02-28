#include "Platform.h"
#if ENABLE(SVG)
#ifndef SVGPaintServerLinearGradientTest_h_CPPUNIT
#define SVGPaintServerLinearGradientTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSVGPaintServerLinearGradient.h"
class SVGPaintServerLinearGradientTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SVGPaintServerLinearGradientTestTest );
//register each method:
    CPPUNIT_TEST(create);
    CPPUNIT_TEST(destruct_SVGPaintServerLinearGradient);

    CPPUNIT_TEST(type);

    CPPUNIT_TEST(gradientStart);
    CPPUNIT_TEST(setGradientStart);

    CPPUNIT_TEST(gradientEnd);
    CPPUNIT_TEST(setGradientEnd);

    CPPUNIT_TEST(externalRepresentation);


    CPPUNIT_TEST_SUITE_END();



    public:
    void create() CPPU_NOT_IMPLEMENTED
    void destruct_SVGPaintServerLinearGradient() CPPU_NOT_IMPLEMENTED

    void type() CPPU_NOT_IMPLEMENTED

    void gradientStart() CPPU_NOT_IMPLEMENTED
    void setGradientStart() CPPU_NOT_IMPLEMENTED

    void gradientEnd() CPPU_NOT_IMPLEMENTED
    void setGradientEnd() CPPU_NOT_IMPLEMENTED

    void externalRepresentation() CPPU_NOT_IMPLEMENTED

    };



#endif // SVGPaintServerLinearGradient_h

#endif

