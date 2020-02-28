#ifndef XBMImageDecoderTest_h_CPPUNIT
#define XBMImageDecoderTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCXBMImageDecoder.h"
class XBMImageDecoderTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( XBMImageDecoderTestTest );
//register each method:
    CPPUNIT_TEST(isSizeAvailable);
    CPPUNIT_TEST(frameBufferAtIndex);

    CPPUNIT_TEST_SUITE_END();




//class XBMImageDecoder : public ImageDecoder

public:
    void isSizeAvailable() CPPU_NOT_IMPLEMENTED
    void frameBufferAtIndex() CPPU_NOT_IMPLEMENTED
};



#endif

