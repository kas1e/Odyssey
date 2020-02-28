#ifndef StringBuilderTest_h_CPPUNIT
#define StringBuilderTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCStringBuilder.h"
class StringBuilderTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( StringBuilderTestTest );
//register each method:
    CPPUNIT_TEST(StringBuilder);

    CPPUNIT_TEST(setNonNull);

    CPPUNIT_TEST(append_String);
    CPPUNIT_TEST(append_UChar);
    CPPUNIT_TEST(append_char);

    CPPUNIT_TEST(toString);


    CPPUNIT_TEST_SUITE_END();


    public:
    void StringBuilder() CPPU_NOT_IMPLEMENTED

    void setNonNull() CPPU_NOT_IMPLEMENTED

    void append_String() CPPU_NOT_IMPLEMENTED
    void append_UChar() CPPU_NOT_IMPLEMENTED
    void append_char() CPPU_NOT_IMPLEMENTED

    void toString() CPPU_NOT_IMPLEMENTED

    };


#endif

