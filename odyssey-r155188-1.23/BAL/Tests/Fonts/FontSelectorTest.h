#ifndef FontSelectorTest_h_CPPUNIT
#define FontSelectorTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCFontSelector.h"
class FontSelectorTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( FontSelectorTestTest );
//register each method:
    CPPUNIT_TEST(FontSelector);
    CPPUNIT_TEST(destruct_FontSelector);
    CPPUNIT_TEST(getFontData);

    CPPUNIT_TEST_SUITE_END();



public:
    void FontSelector() CPPU_NOT_IMPLEMENTED
    void destruct_FontSelector() CPPU_NOT_IMPLEMENTED
    void getFontData() CPPU_NOT_IMPLEMENTED
};


#endif // FontSelector_h

