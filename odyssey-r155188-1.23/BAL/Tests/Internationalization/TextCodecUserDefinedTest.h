#ifndef TextCodecUserDefinedTest_h_CPPUNIT
#define TextCodecUserDefinedTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCTextCodecUserDefined.h"
class TextCodecUserDefinedTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( TextCodecUserDefinedTestTest );
//register each method:
    CPPUNIT_TEST(registerEncodingNames);
    CPPUNIT_TEST(registerCodecs);
    CPPUNIT_TEST(decode);
    CPPUNIT_TEST(encode);

    CPPUNIT_TEST_SUITE_END();




    //class TextCodecUserDefined : public TextCodec {
    public:
    void registerEncodingNames() CPPU_NOT_IMPLEMENTED
    void registerCodecs() CPPU_NOT_IMPLEMENTED
    void decode() CPPU_NOT_IMPLEMENTED
    void encode() CPPU_NOT_IMPLEMENTED
    };


#endif // TextCodecUserDefined_h

