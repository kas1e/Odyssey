#ifndef GlyphWidthMapTest_h_CPPUNIT
#define GlyphWidthMapTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCGlyphWidthMap.h"
class GlyphWidthMapTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( GlyphWidthMapTestTest );
//register each method:
    CPPUNIT_TEST(GlyphWidthMap);
    CPPUNIT_TEST(destruct_GlyphWidthMap);

    CPPUNIT_TEST(widthForGlyph);
    CPPUNIT_TEST(setWidthForGlyph);

    CPPUNIT_TEST_SUITE_END();


public:
    void GlyphWidthMap() CPPU_NOT_IMPLEMENTED
    void destruct_GlyphWidthMap() CPPU_NOT_IMPLEMENTED

    void widthForGlyph() CPPU_NOT_IMPLEMENTED
    void setWidthForGlyph() CPPU_NOT_IMPLEMENTED

};

#endif

