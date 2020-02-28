#ifndef ImageTest_h_CPPUNIT
#define ImageTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCImage.h"
class ImageTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ImageTestTest );
//register each method:
    CPPUNIT_TEST(Image);
    CPPUNIT_TEST(destruct_Image);
    
    CPPUNIT_TEST(loadPlatformResource);
    CPPUNIT_TEST(supportsType);

    CPPUNIT_TEST(isBitmapImage);
    
    CPPUNIT_TEST(isNull);

    CPPUNIT_TEST(setContainerSize);
    CPPUNIT_TEST(usesContainerSize);
    CPPUNIT_TEST(hasRelativeWidth);
    CPPUNIT_TEST(hasRelativeHeight);

    CPPUNIT_TEST(size);
    CPPUNIT_TEST(rect);
    CPPUNIT_TEST(width);
    CPPUNIT_TEST(height);

    CPPUNIT_TEST(setData);
    CPPUNIT_TEST(dataChanged);
    
    CPPUNIT_TEST(destroyDecodedData);
    CPPUNIT_TEST(decodedSize);

    CPPUNIT_TEST(data);

    CPPUNIT_TEST(stopAnimation);
    CPPUNIT_TEST(resetAnimation);
    
    CPPUNIT_TEST(imageObserver);

    CPPUNIT_TEST(nativeImageForCurrentFrame);
 
    CPPUNIT_TEST_SUITE_END();

public:
    void Image() CPPU_NOT_IMPLEMENTED
    void destruct_Image() CPPU_NOT_IMPLEMENTED
    
    void loadPlatformResource() CPPU_NOT_IMPLEMENTED
    void supportsType() CPPU_NOT_IMPLEMENTED

    void isBitmapImage() CPPU_NOT_IMPLEMENTED
    
    void isNull() CPPU_NOT_IMPLEMENTED

    void setContainerSize() CPPU_NOT_IMPLEMENTED
    void usesContainerSize() CPPU_NOT_IMPLEMENTED
    void hasRelativeWidth() CPPU_NOT_IMPLEMENTED
    void hasRelativeHeight() CPPU_NOT_IMPLEMENTED

    void size() CPPU_NOT_IMPLEMENTED
    void rect() CPPU_NOT_IMPLEMENTED
    void width() CPPU_NOT_IMPLEMENTED
    void height() CPPU_NOT_IMPLEMENTED

    void setData() CPPU_NOT_IMPLEMENTED
    void dataChanged() CPPU_NOT_IMPLEMENTED
    
    void destroyDecodedData() CPPU_NOT_IMPLEMENTED
    void decodedSize() CPPU_NOT_IMPLEMENTED

    void data() CPPU_NOT_IMPLEMENTED

    void stopAnimation() CPPU_NOT_IMPLEMENTED
    void resetAnimation() CPPU_NOT_IMPLEMENTED
    
    void imageObserver() CPPU_NOT_IMPLEMENTED

    void nativeImageForCurrentFrame() CPPU_NOT_IMPLEMENTED
    
};


#endif

