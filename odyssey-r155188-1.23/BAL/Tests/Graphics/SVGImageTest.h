#include "Platform.h"
#if ENABLE(SVG)
#ifndef SVGImageTest_h_CPPUNIT
#define SVGImageTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSVGImage.h"
class SVGImageTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SVGImageTestTest );
//register each method:
    CPPUNIT_TEST(SVGImage);
    CPPUNIT_TEST(destruct_SVGImage);

    CPPUNIT_TEST(setContainerSize);
    CPPUNIT_TEST(usesContainerSize);
    CPPUNIT_TEST(hasRelativeWidth);
    CPPUNIT_TEST(hasRelativeHeight);

    CPPUNIT_TEST(size);
        
    CPPUNIT_TEST(dataChanged);

    CPPUNIT_TEST(frameAtIndex);
 
    CPPUNIT_TEST_SUITE_END();


    public:
    void SVGImage() CPPU_NOT_IMPLEMENTED
    void destruct_SVGImage() CPPU_NOT_IMPLEMENTED

    void setContainerSize() CPPU_NOT_IMPLEMENTED
    void usesContainerSize() CPPU_NOT_IMPLEMENTED
    void hasRelativeWidth() CPPU_NOT_IMPLEMENTED
    void hasRelativeHeight() CPPU_NOT_IMPLEMENTED

    void size() CPPU_NOT_IMPLEMENTED
        
    void dataChanged() CPPU_NOT_IMPLEMENTED

    void frameAtIndex() CPPU_NOT_IMPLEMENTED
        
};

#endif

#endif // ENABLE(SVG)

