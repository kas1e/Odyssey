#ifndef TextCodecUTF16Test_h_CPPUNIT
#define TextCodecUTF16Test_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCTextCodecUTF16.h"
class TextCodecUTF16TestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( TextCodecUTF16TestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);
    CPPUNIT_TEST(registerEncodingNames);
    CPPUNIT_TEST(registerCodecs);
    CPPUNIT_TEST(decode);
    CPPUNIT_TEST(encode);

    CPPUNIT_TEST_SUITE_END();



//    class TextCodecUTF16 : public TextCodec {
    public:
        void constructors() CPPU_NOT_IMPLEMENTED
        void destructors() CPPU_NOT_IMPLEMENTED
    void registerEncodingNames() CPPU_NOT_IMPLEMENTED
    void registerCodecs() CPPU_NOT_IMPLEMENTED
    void decode() CPPU_NOT_IMPLEMENTED
    void encode() CPPU_NOT_IMPLEMENTED

};

#endif // TextCodecUTF16_h

