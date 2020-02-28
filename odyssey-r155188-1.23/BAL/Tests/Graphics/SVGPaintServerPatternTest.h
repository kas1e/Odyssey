#include "Platform.h"
#if ENABLE(SVG)
#ifndef SVGPaintServerPatternTest_h_CPPUNIT
#define SVGPaintServerPatternTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSVGPaintServerPattern.h"
class SVGPaintServerPatternTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SVGPaintServerPatternTestTest );
//register each method:
    CPPUNIT_TEST(create);

    CPPUNIT_TEST(destruct_SVGPaintServerPattern);

    CPPUNIT_TEST(type);

    CPPUNIT_TEST(setPatternBoundaries);
    CPPUNIT_TEST(patternBoundaries);

    CPPUNIT_TEST(tile);
    CPPUNIT_TEST(setTile);

    CPPUNIT_TEST(patternTransform);
    CPPUNIT_TEST(setPatternTransform);

    CPPUNIT_TEST(externalRepresentation);


    CPPUNIT_TEST_SUITE_END();

    public:
    void create() CPPU_NOT_IMPLEMENTED

    void destruct_SVGPaintServerPattern() CPPU_NOT_IMPLEMENTED

    void type() CPPU_NOT_IMPLEMENTED

    void setPatternBoundaries() CPPU_NOT_IMPLEMENTED
    void patternBoundaries() CPPU_NOT_IMPLEMENTED

    void tile() CPPU_NOT_IMPLEMENTED
    void setTile() CPPU_NOT_IMPLEMENTED

    void patternTransform() CPPU_NOT_IMPLEMENTED
    void setPatternTransform() CPPU_NOT_IMPLEMENTED

    void externalRepresentation() CPPU_NOT_IMPLEMENTED

    };



#endif // SVGPaintServerPattern_h

#endif

