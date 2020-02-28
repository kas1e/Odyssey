#ifndef UTF8Test_h_CPPUNIT
#define UTF8Test_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCUTF8.h"
class UTF8TestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( UTF8TestTest );
//register each method:
    CPPUNIT_TEST(UTF8SequenceLength);
    CPPUNIT_TEST(decodeUTF8Sequence);
    CPPUNIT_TEST(convertUTF8ToUTF16);
    CPPUNIT_TEST(convertUTF16ToUTF8);

    CPPUNIT_TEST_SUITE_END();

    void UTF8SequenceLength() CPPU_NOT_IMPLEMENTED
    void decodeUTF8Sequence() CPPU_NOT_IMPLEMENTED
    void convertUTF8ToUTF16() CPPU_NOT_IMPLEMENTED
    void convertUTF16ToUTF8() CPPU_NOT_IMPLEMENTED
};

#endif // WTF_UTF8_h

