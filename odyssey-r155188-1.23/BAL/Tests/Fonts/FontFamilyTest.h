#ifndef FontFamilyTest_h_CPPUNIT
#define FontFamilyTest_h_CPPUNIT

#include "config.h"
#include <cppunit/extensions/HelperMacros.h>
#include "BCFontFamily.h"
class FontFamilyTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( FontFamilyTestTest );
//register each method:
    CPPUNIT_TEST(FontFamily);
    CPPUNIT_TEST(FontFamily_copy);
    CPPUNIT_TEST(operator_copy);
    CPPUNIT_TEST(setFamily);
    CPPUNIT_TEST(family);
    CPPUNIT_TEST(familyIsEmpty);

    CPPUNIT_TEST(next);
    CPPUNIT_TEST(next_const);

    CPPUNIT_TEST(appendFamily);

    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);
 
    CPPUNIT_TEST_SUITE_END();

public:
    void FontFamily() CPPU_NOT_IMPLEMENTED
    void FontFamily_copy() CPPU_NOT_IMPLEMENTED
    void operator_copy() CPPU_NOT_IMPLEMENTED
    void setFamily() CPPU_NOT_IMPLEMENTED
    void family() CPPU_NOT_IMPLEMENTED
    void familyIsEmpty() CPPU_NOT_IMPLEMENTED

    void next() CPPU_NOT_IMPLEMENTED
    void next_const() CPPU_NOT_IMPLEMENTED

    void appendFamily() CPPU_NOT_IMPLEMENTED

    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED
    
};


#endif

