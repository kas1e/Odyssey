#include "Platform.h"
#if ENABLE(SVG)
#ifndef SVGResourceMarkerTest_h_CPPUNIT
#define SVGResourceMarkerTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSVGResourceMarker.h"
class SVGResourceMarkerTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SVGResourceMarkerTestTest );
//register each method:
    CPPUNIT_TEST(create);
    CPPUNIT_TEST(destruct_SVGResourceMarker);

    CPPUNIT_TEST(setMarker);

    CPPUNIT_TEST(setRef);
    CPPUNIT_TEST(refX);
    CPPUNIT_TEST(refY);

    CPPUNIT_TEST(setAngle);
    CPPUNIT_TEST(setAutoAngle);
    CPPUNIT_TEST(angle);

    CPPUNIT_TEST(setUseStrokeWidth);
    CPPUNIT_TEST(useStrokeWidth);

    CPPUNIT_TEST(cachedBounds);
    CPPUNIT_TEST(draw);
        
    CPPUNIT_TEST(resourceType);
    CPPUNIT_TEST(externalRepresentation);

    CPPUNIT_TEST(getMarkerById);


    CPPUNIT_TEST_SUITE_END();

    public:
    void create() CPPU_NOT_IMPLEMENTED
    void destruct_SVGResourceMarker() CPPU_NOT_IMPLEMENTED

    void setMarker() CPPU_NOT_IMPLEMENTED

    void setRef() CPPU_NOT_IMPLEMENTED
    void refX() CPPU_NOT_IMPLEMENTED
    void refY() CPPU_NOT_IMPLEMENTED

    void setAngle() CPPU_NOT_IMPLEMENTED
    void setAutoAngle() CPPU_NOT_IMPLEMENTED
    void angle() CPPU_NOT_IMPLEMENTED

    void setUseStrokeWidth() CPPU_NOT_IMPLEMENTED
    void useStrokeWidth() CPPU_NOT_IMPLEMENTED

    void cachedBounds() CPPU_NOT_IMPLEMENTED
    void draw() CPPU_NOT_IMPLEMENTED
        
    void resourceType() CPPU_NOT_IMPLEMENTED
    void externalRepresentation() CPPU_NOT_IMPLEMENTED

    void getMarkerById() CPPU_NOT_IMPLEMENTED

    };




#endif // SVGResourceMarker_h
#endif

