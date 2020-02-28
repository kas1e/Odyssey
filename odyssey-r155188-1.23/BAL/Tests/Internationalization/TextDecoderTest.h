#ifndef TextDecoderTest_h_CPPUNIT
#define TextDecoderTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCTextDecoder.h"
class TextDecoderTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( TextDecoderTestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);
    CPPUNIT_TEST(reset);
    CPPUNIT_TEST(encoding);
    CPPUNIT_TEST(decode);

    CPPUNIT_TEST_SUITE_END();


//    class TextDecoder {
    public:
        void constructors() CPPU_NOT_IMPLEMENTED
        void destructors() CPPU_NOT_IMPLEMENTED
    void reset() CPPU_NOT_IMPLEMENTED
    void encoding() CPPU_NOT_IMPLEMENTED
    void decode() CPPU_NOT_IMPLEMENTED
};


#endif // TextDecoder_h

