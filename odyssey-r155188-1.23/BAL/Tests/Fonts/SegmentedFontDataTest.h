#ifndef SegmentedFontDataTest_h_CPPUNIT
#define SegmentedFontDataTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSegmentedFontData.h"
class SegmentedFontDataTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SegmentedFontDataTestTest );
//register each method:
    CPPUNIT_TEST(FontDataRange);
    CPPUNIT_TEST(FontDataRange_from);
    CPPUNIT_TEST(FontDataRange_to);
    CPPUNIT_TEST(FontDataRange_fontData);

    CPPUNIT_TEST(destruct_SegmentedFontData);

    CPPUNIT_TEST(fontDataForCharacter);
    CPPUNIT_TEST(containsCharacters);

    CPPUNIT_TEST(isCustomFont);
    CPPUNIT_TEST(isLoading);
    CPPUNIT_TEST(isSegmented);

    CPPUNIT_TEST(appendRange);
    CPPUNIT_TEST(numRanges);
    CPPUNIT_TEST(rangeAt);


    CPPUNIT_TEST_SUITE_END();



    void FontDataRange() CPPU_NOT_IMPLEMENTED
    void FontDataRange_from() CPPU_NOT_IMPLEMENTED
    void FontDataRange_to() CPPU_NOT_IMPLEMENTED
    void FontDataRange_fontData() CPPU_NOT_IMPLEMENTED

    void destruct_SegmentedFontData() CPPU_NOT_IMPLEMENTED

    void fontDataForCharacter() CPPU_NOT_IMPLEMENTED
    void containsCharacters() CPPU_NOT_IMPLEMENTED

    void isCustomFont() CPPU_NOT_IMPLEMENTED
    void isLoading() CPPU_NOT_IMPLEMENTED
    void isSegmented() CPPU_NOT_IMPLEMENTED

    void appendRange() CPPU_NOT_IMPLEMENTED
    void numRanges() CPPU_NOT_IMPLEMENTED
    void rangeAt() CPPU_NOT_IMPLEMENTED

};


#endif // SegmentedFontData_h

