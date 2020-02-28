#include "Platform.h"
#if ENABLE(SVG)
#ifndef SVGPaintServerGradientTest_h_CPPUNIT
#define SVGPaintServerGradientTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSVGPaintServerGradient.h"
class SVGPaintServerGradientTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SVGPaintServerGradientTestTest );
//register each method:
    CPPUNIT_TEST(destruct_SVGPaintServerGradient);

    CPPUNIT_TEST(gradientStops);
    CPPUNIT_TEST(setGradientStops);

    CPPUNIT_TEST(spreadMethod);
    CPPUNIT_TEST(setGradientSpreadMethod);

    CPPUNIT_TEST(boundingBoxMode);
    CPPUNIT_TEST(setBoundingBoxMode);

    CPPUNIT_TEST(gradientTransform);
    CPPUNIT_TEST(setGradientTransform);

    CPPUNIT_TEST(externalRepresentation);

    CPPUNIT_TEST(setup);
    CPPUNIT_TEST(makeGradientStop);


    CPPUNIT_TEST_SUITE_END();


    public:
    void destruct_SVGPaintServerGradient() CPPU_NOT_IMPLEMENTED

    void gradientStops() CPPU_NOT_IMPLEMENTED
    void setGradientStops() CPPU_NOT_IMPLEMENTED

    void spreadMethod() CPPU_NOT_IMPLEMENTED
    void setGradientSpreadMethod() CPPU_NOT_IMPLEMENTED

    void boundingBoxMode() CPPU_NOT_IMPLEMENTED
    void setBoundingBoxMode() CPPU_NOT_IMPLEMENTED

    void gradientTransform() CPPU_NOT_IMPLEMENTED
    void setGradientTransform() CPPU_NOT_IMPLEMENTED

    void externalRepresentation() CPPU_NOT_IMPLEMENTED

    void setup() CPPU_NOT_IMPLEMENTED
    void makeGradientStop() CPPU_NOT_IMPLEMENTED


    };




#endif // SVGPaintServerGradient_h

#endif

