#ifndef TextCodecICUTest_h_CPPUNIT
#define TextCodecICUTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCTextCodec.h"
class TextCodecICUTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( TextCodecICUTestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);


    CPPUNIT_TEST(registerBaseEncodingNames);
    CPPUNIT_TEST(registerBaseCodecs);

    CPPUNIT_TEST(registerExtendedEncodingNames);
    CPPUNIT_TEST(registerExtendedCodecs);


    CPPUNIT_TEST(decode);
    CPPUNIT_TEST(encode2);


    CPPUNIT_TEST_SUITE_END();


    //class TextCodecICU : public TextCodec {
    public:
        void constructors() CPPU_NOT_IMPLEMENTED
        void destructors() CPPU_NOT_IMPLEMENTED


    void registerBaseEncodingNames() CPPU_NOT_IMPLEMENTED
    void registerBaseCodecs() CPPU_NOT_IMPLEMENTED

    void registerExtendedEncodingNames() CPPU_NOT_IMPLEMENTED
    void registerExtendedCodecs() CPPU_NOT_IMPLEMENTED


    void decode() CPPU_NOT_IMPLEMENTED
    void encode2() CPPU_NOT_IMPLEMENTED

};

#endif // TextCodecICU_h

