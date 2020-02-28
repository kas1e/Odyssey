#ifndef PNGImageDecoderTest_h_CPPUNIT
#define PNGImageDecoderTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCPNGImageDecoder.h"
class PNGImageDecoderTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( PNGImageDecoderTestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);
    CPPUNIT_TEST(setData);

    CPPUNIT_TEST(isSizeAvailable);

    CPPUNIT_TEST(frameBufferAtIndex);

    CPPUNIT_TEST(decode);

    CPPUNIT_TEST(reader);

    CPPUNIT_TEST(decodingFailed);
    CPPUNIT_TEST(headerAvailable);
    CPPUNIT_TEST(rowAvailable);
    CPPUNIT_TEST(pngComplete);


    CPPUNIT_TEST_SUITE_END();

//class PNGImageDecoder : public ImageDecoder
public:
    void constructors() CPPU_NOT_IMPLEMENTED
    void destructors() CPPU_NOT_IMPLEMENTED
    void setData() CPPU_NOT_IMPLEMENTED

    void isSizeAvailable() CPPU_NOT_IMPLEMENTED

    void frameBufferAtIndex() CPPU_NOT_IMPLEMENTED

    void decode() CPPU_NOT_IMPLEMENTED

    void reader() CPPU_NOT_IMPLEMENTED

    void decodingFailed() CPPU_NOT_IMPLEMENTED
    void headerAvailable() CPPU_NOT_IMPLEMENTED
    void rowAvailable() CPPU_NOT_IMPLEMENTED
    void pngComplete() CPPU_NOT_IMPLEMENTED

};


#endif

