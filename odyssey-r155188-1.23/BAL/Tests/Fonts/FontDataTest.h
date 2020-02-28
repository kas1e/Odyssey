#ifndef FontDataTest_h_CPPUNIT
#define FontDataTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCFontData.h"
class FontDataTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( FontDataTestTest );
//register each method:
    CPPUNIT_TEST(FontData);
    CPPUNIT_TEST(destruct_FontData);

    CPPUNIT_TEST(fontDataForCharacter);
    CPPUNIT_TEST(containsCharacters);
    CPPUNIT_TEST(isCustomFont);
    CPPUNIT_TEST(isLoading);
    CPPUNIT_TEST(isSegmented);

    CPPUNIT_TEST(setMaxGlyphPageTreeLevel);
    CPPUNIT_TEST(maxGlyphPageTreeLevel);


    CPPUNIT_TEST_SUITE_END();


public:
    void FontData() CPPU_NOT_IMPLEMENTED
    void destruct_FontData() CPPU_NOT_IMPLEMENTED

    void fontDataForCharacter() CPPU_NOT_IMPLEMENTED
    void containsCharacters() CPPU_NOT_IMPLEMENTED
    void isCustomFont() CPPU_NOT_IMPLEMENTED
    void isLoading() CPPU_NOT_IMPLEMENTED
    void isSegmented() CPPU_NOT_IMPLEMENTED

    void setMaxGlyphPageTreeLevel() CPPU_NOT_IMPLEMENTED
    void maxGlyphPageTreeLevel() CPPU_NOT_IMPLEMENTED

};


#endif // FontData_h

