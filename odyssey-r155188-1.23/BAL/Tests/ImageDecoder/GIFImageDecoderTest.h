#ifndef GIFImageDecoderTest_h_CPPUNIT
#define GIFImageDecoderTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCGIFImageDecoder.h"
class GIFImageDecoderTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( GIFImageDecoderTestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);

    CPPUNIT_TEST(setData);

    CPPUNIT_TEST(isSizeAvailable);

    CPPUNIT_TEST(frameCount);

    CPPUNIT_TEST(repetitionCount);

    CPPUNIT_TEST(frameBufferAtIndex);

    CPPUNIT_TEST(frameDurationAtIndex);


    CPPUNIT_TEST(decode);

    CPPUNIT_TEST(sizeNowAvailable);
    CPPUNIT_TEST(decodingHalted);
    CPPUNIT_TEST(haveDecodedRow);
    CPPUNIT_TEST(frameComplete);
    CPPUNIT_TEST(gifComplete);

    CPPUNIT_TEST_SUITE_END();



public:
	void constructors() CPPU_NOT_IMPLEMENTED
	void destructors() CPPU_NOT_IMPLEMENTED

    void setData() CPPU_NOT_IMPLEMENTED

    void isSizeAvailable() CPPU_NOT_IMPLEMENTED

    void frameCount() CPPU_NOT_IMPLEMENTED

    void repetitionCount() CPPU_NOT_IMPLEMENTED

    void frameBufferAtIndex() CPPU_NOT_IMPLEMENTED

    void frameDurationAtIndex() CPPU_NOT_IMPLEMENTED


	void decode() CPPU_NOT_IMPLEMENTED

    void sizeNowAvailable() CPPU_NOT_IMPLEMENTED
    void decodingHalted() CPPU_NOT_IMPLEMENTED
    void haveDecodedRow() CPPU_NOT_IMPLEMENTED
    void frameComplete() CPPU_NOT_IMPLEMENTED
    void gifComplete() CPPU_NOT_IMPLEMENTED

};

#endif

