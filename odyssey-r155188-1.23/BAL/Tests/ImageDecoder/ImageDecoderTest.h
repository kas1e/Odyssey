#ifndef ImageDecoderTest_h_CPPUNIT
#define ImageDecoderTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCImageDecoder.h"
class ImageDecoderTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ImageDecoderTestTest );
//register each method:
    CPPUNIT_TEST(bytes);
    CPPUNIT_TEST(rect);
    CPPUNIT_TEST(height);
    CPPUNIT_TEST(status);
    CPPUNIT_TEST(duration);
    CPPUNIT_TEST(disposalMethod);
    CPPUNIT_TEST(hasAlpha);

    CPPUNIT_TEST(setRect);
    CPPUNIT_TEST(ensureHeight);
    CPPUNIT_TEST(setStatus);
    CPPUNIT_TEST(setDuration);
    CPPUNIT_TEST(setDisposalMethod);
    CPPUNIT_TEST(setHasAlpha);

    CPPUNIT_TEST(setRGBA);

//class ImageDecoder
    CPPUNIT_TEST(setData);
    CPPUNIT_TEST(isSizeAvailable);
    CPPUNIT_TEST(size);

    CPPUNIT_TEST(frameCount);

    CPPUNIT_TEST(repetitionCount);

    CPPUNIT_TEST(frameBufferAtIndex);

    CPPUNIT_TEST(supportsAlpha);

    CPPUNIT_TEST(failed);
    CPPUNIT_TEST(setFailed);


    CPPUNIT_TEST_SUITE_END();


public:
    void bytes() CPPU_NOT_IMPLEMENTED
    void rect() CPPU_NOT_IMPLEMENTED
    void height() CPPU_NOT_IMPLEMENTED
    void status() CPPU_NOT_IMPLEMENTED
    void duration() CPPU_NOT_IMPLEMENTED
    void disposalMethod() CPPU_NOT_IMPLEMENTED
    void hasAlpha() CPPU_NOT_IMPLEMENTED

    void setRect() CPPU_NOT_IMPLEMENTED
    void ensureHeight() CPPU_NOT_IMPLEMENTED
    void setStatus() CPPU_NOT_IMPLEMENTED
    void setDuration() CPPU_NOT_IMPLEMENTED
    void setDisposalMethod() CPPU_NOT_IMPLEMENTED
    void setHasAlpha() CPPU_NOT_IMPLEMENTED

    void setRGBA() CPPU_NOT_IMPLEMENTED

//class ImageDecoder
    void setData() CPPU_NOT_IMPLEMENTED
    void isSizeAvailable() CPPU_NOT_IMPLEMENTED
    void size() CPPU_NOT_IMPLEMENTED

    void frameCount() CPPU_NOT_IMPLEMENTED

    void repetitionCount() CPPU_NOT_IMPLEMENTED

    void frameBufferAtIndex() CPPU_NOT_IMPLEMENTED

    void supportsAlpha() CPPU_NOT_IMPLEMENTED

    void failed() CPPU_NOT_IMPLEMENTED
    void setFailed() CPPU_NOT_IMPLEMENTED

};


#endif

