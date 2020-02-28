#ifndef SimpleFontDataTest_h_CPPUNIT
#define SimpleFontDataTest_h_CPPUNIT

#include "config.h"
#include <cppunit/extensions/HelperMacros.h>
#include "BCSimpleFontData.h"
class SimpleFontDataTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SimpleFontDataTestTest );
//register each method:
    CPPUNIT_TEST(SimpleFontData);
    CPPUNIT_TEST(destruct_SimpleFontData);

    CPPUNIT_TEST(platformData);
    CPPUNIT_TEST(smallCapsFontData);

    CPPUNIT_TEST(ascent);
    CPPUNIT_TEST(descent);
    CPPUNIT_TEST(lineSpacing);
    CPPUNIT_TEST(lineGap);
    CPPUNIT_TEST(xHeight);
    CPPUNIT_TEST(unitsPerEm);

    CPPUNIT_TEST(widthForGlyph);
    CPPUNIT_TEST(platformWidthForGlyph);

    CPPUNIT_TEST(fontDataForCharacter);
    CPPUNIT_TEST(containsCharacters);

    CPPUNIT_TEST(determinePitch);
    CPPUNIT_TEST(pitch);

    CPPUNIT_TEST(svgFontData);
    CPPUNIT_TEST(isSVGFont);


    CPPUNIT_TEST(isCustomFont);
    CPPUNIT_TEST(isLoading);
    CPPUNIT_TEST(isSegmented);

    CPPUNIT_TEST(missingGlyphData);


    CPPUNIT_TEST_SUITE_END();

public:
    void SimpleFontData() CPPU_NOT_IMPLEMENTED
    void destruct_SimpleFontData() CPPU_NOT_IMPLEMENTED

    void platformData() CPPU_NOT_IMPLEMENTED
    void smallCapsFontData() CPPU_NOT_IMPLEMENTED

    void ascent() CPPU_NOT_IMPLEMENTED
    void descent() CPPU_NOT_IMPLEMENTED
    void lineSpacing() CPPU_NOT_IMPLEMENTED
    void lineGap() CPPU_NOT_IMPLEMENTED
    void xHeight() CPPU_NOT_IMPLEMENTED
    void unitsPerEm() CPPU_NOT_IMPLEMENTED

    void widthForGlyph() CPPU_NOT_IMPLEMENTED
    void platformWidthForGlyph() CPPU_NOT_IMPLEMENTED

    void fontDataForCharacter() CPPU_NOT_IMPLEMENTED
    void containsCharacters() CPPU_NOT_IMPLEMENTED

    void determinePitch() CPPU_NOT_IMPLEMENTED
    void pitch() CPPU_NOT_IMPLEMENTED

    void svgFontData() CPPU_NOT_IMPLEMENTED
    void isSVGFont() CPPU_NOT_IMPLEMENTED


    void isCustomFont() CPPU_NOT_IMPLEMENTED
    void isLoading() CPPU_NOT_IMPLEMENTED
    void isSegmented() CPPU_NOT_IMPLEMENTED

    void missingGlyphData() CPPU_NOT_IMPLEMENTED

};


#endif // SimpleFontData_h

