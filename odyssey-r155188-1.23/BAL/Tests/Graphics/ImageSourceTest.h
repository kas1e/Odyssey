#ifndef ImageSourceTest_h_CPPUNIT
#define ImageSourceTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCImageSource.h"
class ImageSourceTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ImageSourceTestTest );
//register each method:
    CPPUNIT_TEST(ImageSource);
    CPPUNIT_TEST(destruct_ImageSource);

    CPPUNIT_TEST(clear);

    CPPUNIT_TEST(initialized);
    
    CPPUNIT_TEST(setData);

    CPPUNIT_TEST(isSizeAvailable);
    CPPUNIT_TEST(size);
    
    CPPUNIT_TEST(repetitionCount);
    
    CPPUNIT_TEST(frameCount);
    
    CPPUNIT_TEST(createFrameAtIndex);
    
    CPPUNIT_TEST(frameDurationAtIndex);
    CPPUNIT_TEST(frameHasAlphaAtIndex);
    CPPUNIT_TEST(frameIsCompleteAtIndex);


    CPPUNIT_TEST_SUITE_END();




public:
    void ImageSource() CPPU_NOT_IMPLEMENTED
    void destruct_ImageSource() CPPU_NOT_IMPLEMENTED

    void clear() CPPU_NOT_IMPLEMENTED

    void initialized() CPPU_NOT_IMPLEMENTED
    
    void setData() CPPU_NOT_IMPLEMENTED

    void isSizeAvailable() CPPU_NOT_IMPLEMENTED
    void size() CPPU_NOT_IMPLEMENTED
    
    void repetitionCount() CPPU_NOT_IMPLEMENTED
    
    void frameCount() CPPU_NOT_IMPLEMENTED
    
    void createFrameAtIndex() CPPU_NOT_IMPLEMENTED
    
    void frameDurationAtIndex() CPPU_NOT_IMPLEMENTED
    void frameHasAlphaAtIndex() CPPU_NOT_IMPLEMENTED
    void frameIsCompleteAtIndex() CPPU_NOT_IMPLEMENTED

};


#endif

