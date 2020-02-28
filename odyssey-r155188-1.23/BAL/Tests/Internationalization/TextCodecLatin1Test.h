#ifndef TextCodecLatin1Test_h_CPPUNIT
#define TextCodecLatin1Test_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCTextCodecLatin1.h"
class TextCodecLatin1TestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( TextCodecLatin1TestTest );
//register each method:
    CPPUNIT_TEST(registerEncodingNames);
    CPPUNIT_TEST(registerCodecs);

    CPPUNIT_TEST(decode);
    CPPUNIT_TEST(encode);

    CPPUNIT_TEST_SUITE_END();


//    class TextCodecLatin1 : public TextCodec {
    public:
    void registerEncodingNames() CPPU_NOT_IMPLEMENTED
    void registerCodecs() CPPU_NOT_IMPLEMENTED

    void decode() CPPU_NOT_IMPLEMENTED
    void encode() CPPU_NOT_IMPLEMENTED
};


#endif // TextCodecLatin1_h

