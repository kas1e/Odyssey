#ifndef FontPlatformDataTest_h_CPPUNIT
#define FontPlatformDataTest_h_CPPUNIT

#include "config.h"
#include <cppunit/extensions/HelperMacros.h>
#include "BCFontPlatformData.h"
class FontPlatformDataTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( FontPlatformDataTestTest );
//register each method:
    CPPUNIT_TEST(FontPlatformData_hashTable);
    CPPUNIT_TEST(FontPlatformData);
    CPPUNIT_TEST(FontPlatformData_desc_family);
    CPPUNIT_TEST(FontPlatformData_sz_bd_italic);
    CPPUNIT_TEST(FontPlatformData_fontFaice_sz_bd_italic);
    CPPUNIT_TEST(destruct_FontPlatformData);

    CPPUNIT_TEST(init);

    CPPUNIT_TEST(isFixedPitch);
    CPPUNIT_TEST(size);

    CPPUNIT_TEST(setFont);

    CPPUNIT_TEST(hash);
    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(isHashTableDeletedValue);


    CPPUNIT_TEST_SUITE_END();




public:
    void FontPlatformData_hashTable() CPPU_NOT_IMPLEMENTED
    void FontPlatformData() CPPU_NOT_IMPLEMENTED
    void FontPlatformData_desc_family() CPPU_NOT_IMPLEMENTED
    void FontPlatformData_sz_bd_italic() CPPU_NOT_IMPLEMENTED
    void FontPlatformData_fontFaice_sz_bd_italic() CPPU_NOT_IMPLEMENTED
    void destruct_FontPlatformData() CPPU_NOT_IMPLEMENTED

    void init() CPPU_NOT_IMPLEMENTED

    void isFixedPitch() CPPU_NOT_IMPLEMENTED
    void size() CPPU_NOT_IMPLEMENTED

    void setFont() CPPU_NOT_IMPLEMENTED

    void hash() CPPU_NOT_IMPLEMENTED
    void operator_equal() CPPU_NOT_IMPLEMENTED
    void isHashTableDeletedValue() CPPU_NOT_IMPLEMENTED

};


#endif

