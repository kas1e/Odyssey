#ifndef ICOImageDecoderTest_h_CPPUNIT
#define ICOImageDecoderTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCICOImageDecoder.h"
class ICOImageDecoderTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ICOImageDecoderTestTest );
//register each method:
    CPPUNIT_TEST(isSizeAvailable);
    CPPUNIT_TEST(frameBufferAtIndex);

    CPPUNIT_TEST_SUITE_END();

    void isSizeAvailable() CPPU_NOT_IMPLEMENTED
    void frameBufferAtIndex() CPPU_NOT_IMPLEMENTED

};

#endif

