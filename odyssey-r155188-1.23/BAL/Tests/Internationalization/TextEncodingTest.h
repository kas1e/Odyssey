#ifndef TextEncodingTest_h_CPPUNIT
#define TextEncodingTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCTextEncoding.h"
class TextEncodingTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( TextEncodingTestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);
    CPPUNIT_TEST(isValid);
    CPPUNIT_TEST(name);
    CPPUNIT_TEST(usesVisualOrdering);
    CPPUNIT_TEST(isJapanese);
    CPPUNIT_TEST(backslashAsCurrencySymbol);
    CPPUNIT_TEST(closest8BitEquivalent);

    CPPUNIT_TEST(decode);
    CPPUNIT_TEST(decode2);
    CPPUNIT_TEST(encode);

    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);

    CPPUNIT_TEST(ASCIIEncoding);
    CPPUNIT_TEST(Latin1Encoding);
    CPPUNIT_TEST(UTF16BigEndianEncoding);
    CPPUNIT_TEST(UTF16LittleEndianEncoding);
    CPPUNIT_TEST(UTF32BigEndianEncoding);
    CPPUNIT_TEST(UTF32LittleEndianEncoding);
    CPPUNIT_TEST(UTF8Encoding);
    CPPUNIT_TEST(WindowsLatin1Encoding);


    CPPUNIT_TEST_SUITE_END();



//    class TextEncoding {
    public:
    void constructors() CPPU_NOT_IMPLEMENTED
    void destructors() CPPU_NOT_IMPLEMENTED
    void isValid() CPPU_NOT_IMPLEMENTED
    void name() CPPU_NOT_IMPLEMENTED
    void usesVisualOrdering() CPPU_NOT_IMPLEMENTED
    void isJapanese() CPPU_NOT_IMPLEMENTED
    void backslashAsCurrencySymbol() CPPU_NOT_IMPLEMENTED
    void closest8BitEquivalent() CPPU_NOT_IMPLEMENTED

    void decode() CPPU_NOT_IMPLEMENTED
    void decode2() CPPU_NOT_IMPLEMENTED
    void encode() CPPU_NOT_IMPLEMENTED

    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED

    void ASCIIEncoding() CPPU_NOT_IMPLEMENTED
    void Latin1Encoding() CPPU_NOT_IMPLEMENTED
    void UTF16BigEndianEncoding() CPPU_NOT_IMPLEMENTED
    void UTF16LittleEndianEncoding() CPPU_NOT_IMPLEMENTED
    void UTF32BigEndianEncoding() CPPU_NOT_IMPLEMENTED
    void UTF32LittleEndianEncoding() CPPU_NOT_IMPLEMENTED
    void UTF8Encoding() CPPU_NOT_IMPLEMENTED
    void WindowsLatin1Encoding() CPPU_NOT_IMPLEMENTED
};

#endif // TextEncoding_h

