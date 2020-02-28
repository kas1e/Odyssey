#ifndef BitmapImageTest_h_CPPUNIT
#define BitmapImageTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "Platform.h"
#include "BCBitmapImage.h"
class BitmapImageTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( BitmapImageTestTest );
//register each method:

    CPPUNIT_TEST(FrameData);
    CPPUNIT_TEST(destruct_FrameData);
    CPPUNIT_TEST(FrameData_clear);
    CPPUNIT_TEST(BitmapImage);
    CPPUNIT_TEST(destruct_BitmapImage);
    
    CPPUNIT_TEST(isBitmapImage);
    
    CPPUNIT_TEST(size);

    CPPUNIT_TEST(dataChanged);

    CPPUNIT_TEST(stopAnimation);
    CPPUNIT_TEST(resetAnimation);
    
    CPPUNIT_TEST(decodedSize);

    CPPUNIT_TEST(nativeImageForCurrentFrame);


    CPPUNIT_TEST_SUITE_END();
public:

    void FrameData() CPPU_NOT_IMPLEMENTED
    void destruct_FrameData() CPPU_NOT_IMPLEMENTED
    void FrameData_clear() CPPU_NOT_IMPLEMENTED
    void BitmapImage() CPPU_NOT_IMPLEMENTED
    void destruct_BitmapImage() CPPU_NOT_IMPLEMENTED
    
    void isBitmapImage() CPPU_NOT_IMPLEMENTED
    
    void size() CPPU_NOT_IMPLEMENTED

    void dataChanged() CPPU_NOT_IMPLEMENTED

    void stopAnimation() CPPU_NOT_IMPLEMENTED
    void resetAnimation() CPPU_NOT_IMPLEMENTED
    
    void decodedSize() CPPU_NOT_IMPLEMENTED

    void nativeImageForCurrentFrame() CPPU_NOT_IMPLEMENTED

};

#endif

