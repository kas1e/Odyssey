#ifndef FontFallbackListTest_h_CPPUNIT
#define FontFallbackListTest_h_CPPUNIT

#include "config.h"
#include <cppunit/extensions/HelperMacros.h>
#include "BCFontFallbackList.h"
class FontFallbackListTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( FontFallbackListTestTest );
//register each method:
    CPPUNIT_TEST(create);

    CPPUNIT_TEST(destruct_FontFallbackList);
    CPPUNIT_TEST(invalidate);
    
    CPPUNIT_TEST(isFixedPitch);
    CPPUNIT_TEST(determinePitch);
    CPPUNIT_TEST(loadingCustomFonts);
    CPPUNIT_TEST(fontSelector);


    CPPUNIT_TEST_SUITE_END();

public:
    void create() CPPU_NOT_IMPLEMENTED

    void destruct_FontFallbackList() CPPU_NOT_IMPLEMENTED
    void invalidate() CPPU_NOT_IMPLEMENTED
    
    void isFixedPitch() CPPU_NOT_IMPLEMENTED
    void determinePitch() CPPU_NOT_IMPLEMENTED
    void loadingCustomFonts() CPPU_NOT_IMPLEMENTED
    void fontSelector() CPPU_NOT_IMPLEMENTED

};

#endif
