#ifndef JPEGImageDecoderTest_h_CPPUNIT
#define JPEGImageDecoderTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCJPEGImageDecoder.h"
class JPEGImageDecoderTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( JPEGImageDecoderTestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);
    CPPUNIT_TEST(setData);

    CPPUNIT_TEST(isSizeAvailable);

    CPPUNIT_TEST(frameBufferAtIndex);
    
    CPPUNIT_TEST(supportsAlpha);

    CPPUNIT_TEST(decode);

    CPPUNIT_TEST(reader);

    CPPUNIT_TEST(setSize);
    CPPUNIT_TEST(outputScanlines);
    CPPUNIT_TEST(jpegComplete);

    CPPUNIT_TEST_SUITE_END();



//class JPEGImageDecoder : public ImageDecoder
public:
    void constructors() CPPU_NOT_IMPLEMENTED
    void destructors() CPPU_NOT_IMPLEMENTED
    void setData() CPPU_NOT_IMPLEMENTED

    void isSizeAvailable() CPPU_NOT_IMPLEMENTED

    void frameBufferAtIndex() CPPU_NOT_IMPLEMENTED
    
    void supportsAlpha() CPPU_NOT_IMPLEMENTED

    void decode() CPPU_NOT_IMPLEMENTED

    void reader() CPPU_NOT_IMPLEMENTED

    void setSize() CPPU_NOT_IMPLEMENTED
    void outputScanlines() CPPU_NOT_IMPLEMENTED
    void jpegComplete() CPPU_NOT_IMPLEMENTED

};


#endif

