#ifndef FontCacheTest_h_CPPUNIT
#define FontCacheTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "Platform.h"
#include "BCFontCache.h"
class FontCacheTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( FontCacheTestTest );
//register each method:
    CPPUNIT_TEST(getFontData);
    CPPUNIT_TEST(releaseFontData);
    
    CPPUNIT_TEST(getFontDataForCharacters);
    
    CPPUNIT_TEST(platformInit);

    CPPUNIT_TEST(fontExists);

    CPPUNIT_TEST(getCachedFontPlatformData);
    CPPUNIT_TEST(getCachedFontData);
    CPPUNIT_TEST(getLastResortFallbackFont);

    CPPUNIT_TEST(fontDataCount);
    CPPUNIT_TEST(inactiveFontDataCount);
    CPPUNIT_TEST(purgeInactiveFontData);


    CPPUNIT_TEST_SUITE_END();

public:
    void getFontData() CPPU_NOT_IMPLEMENTED
    void releaseFontData() CPPU_NOT_IMPLEMENTED
    
    void getFontDataForCharacters() CPPU_NOT_IMPLEMENTED
    
    void platformInit() CPPU_NOT_IMPLEMENTED

    void fontExists() CPPU_NOT_IMPLEMENTED

    void getCachedFontPlatformData() CPPU_NOT_IMPLEMENTED
    void getCachedFontData() CPPU_NOT_IMPLEMENTED
    void getLastResortFallbackFont() CPPU_NOT_IMPLEMENTED

    void fontDataCount() CPPU_NOT_IMPLEMENTED
    void inactiveFontDataCount() CPPU_NOT_IMPLEMENTED
    void purgeInactiveFontData() CPPU_NOT_IMPLEMENTED

};


#endif

