#ifndef TextCodecTest_h_CPPUNIT
#define TextCodecTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCTextCodec.h"
class TextCodecTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( TextCodecTestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);
    CPPUNIT_TEST(decode);
    CPPUNIT_TEST(decode2);
    CPPUNIT_TEST(encode);
    CPPUNIT_TEST(getUnencodableReplacement);

    CPPUNIT_TEST_SUITE_END();

//    class TextCodec : Noncopyable {
    public:
    void constructors() CPPU_NOT_IMPLEMENTED
    void destructors() CPPU_NOT_IMPLEMENTED
    void decode() CPPU_NOT_IMPLEMENTED
    void decode2() CPPU_NOT_IMPLEMENTED
    void encode() CPPU_NOT_IMPLEMENTED
    void getUnencodableReplacement() CPPU_NOT_IMPLEMENTED


};

#endif // TextCodec_h

