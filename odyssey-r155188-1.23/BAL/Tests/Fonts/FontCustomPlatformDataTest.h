#ifndef FontCustomPlatformDataTest_h_CPPUNIT
#define FontCustomPlatformDataTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCFontCustomPlatformData.h"
class FontCustomPlatformDataTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( FontCustomPlatformDataTestTest );
//register each method:
    CPPUNIT_TEST(FontCustomPlatformData);
    CPPUNIT_TEST(destruct_FontCustomPlatformData);
    CPPUNIT_TEST(fontPlatformData);
    CPPUNIT_TEST(createFontCustomPlatformData);

    CPPUNIT_TEST_SUITE_END();

    void FontCustomPlatformData() CPPU_NOT_IMPLEMENTED
    void destruct_FontCustomPlatformData() CPPU_NOT_IMPLEMENTED
    void fontPlatformData() CPPU_NOT_IMPLEMENTED
    void createFontCustomPlatformData() CPPU_NOT_IMPLEMENTED
};



#endif

