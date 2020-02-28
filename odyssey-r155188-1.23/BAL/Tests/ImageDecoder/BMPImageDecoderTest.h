#ifndef BMPImageDecoderTest_h_CPPUNIT
#define BMPImageDecoderTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCBMPImageDecoder.h"
class BMPImageDecoderTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( BMPImageDecoderTestTest );
//register each method:
    CPPUNIT_TEST(isSizeAvailable);
    CPPUNIT_TEST(frameBufferAtIndex);

    CPPUNIT_TEST_SUITE_END();

    void isSizeAvailable() CPPU_NOT_IMPLEMENTED
    void frameBufferAtIndex() CPPU_NOT_IMPLEMENTED
};


#endif

