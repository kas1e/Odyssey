#ifndef ImageBufferTest_h_CPPUNIT
#define ImageBufferTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCImageBuffer.h"
class ImageBufferTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ImageBufferTestTest );
//register each method:
    CPPUNIT_TEST(create);
    CPPUNIT_TEST(destruct_ImageBuffer);

    CPPUNIT_TEST(size);
    CPPUNIT_TEST(context);

    CPPUNIT_TEST(image);
    CPPUNIT_TEST(clearImage);

    CPPUNIT_TEST(getImageData);
    CPPUNIT_TEST(putImageData);

    CPPUNIT_TEST(toDataURL);


    CPPUNIT_TEST_SUITE_END();

    public:
    void create() CPPU_NOT_IMPLEMENTED
    void destruct_ImageBuffer() CPPU_NOT_IMPLEMENTED

    void size() CPPU_NOT_IMPLEMENTED
    void context() CPPU_NOT_IMPLEMENTED

    void image() CPPU_NOT_IMPLEMENTED
    void clearImage() CPPU_NOT_IMPLEMENTED

    void getImageData() CPPU_NOT_IMPLEMENTED
    void putImageData() CPPU_NOT_IMPLEMENTED

    void toDataURL() CPPU_NOT_IMPLEMENTED

};


#endif // ImageBuffer_h

