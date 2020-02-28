#ifndef FontDescriptionTest_h_CPPUNIT
#define FontDescriptionTest_h_CPPUNIT

#include "config.h"
#include <cppunit/extensions/HelperMacros.h>
#include "BCFontDescription.h"
class FontDescriptionTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( FontDescriptionTestTest );
//register each method:
    CPPUNIT_TEST(FontDescription);
    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);
    
    CPPUNIT_TEST(family);
    CPPUNIT_TEST(firstFamily);
    CPPUNIT_TEST(specifiedSize);
    CPPUNIT_TEST(computedSize);
    CPPUNIT_TEST(italic);
    CPPUNIT_TEST(computedPixelSize);
    CPPUNIT_TEST(smallCaps);
    CPPUNIT_TEST(isAbsoluteSize);
    CPPUNIT_TEST(weight);
    CPPUNIT_TEST(lighterWeight);
    CPPUNIT_TEST(bolderWeight);
    CPPUNIT_TEST(genericFamily);
    CPPUNIT_TEST(usePrinterFont);
    CPPUNIT_TEST(renderingMode);
    CPPUNIT_TEST(keywordSize);

    CPPUNIT_TEST(setFamily);
    CPPUNIT_TEST(setComputedSize);
    CPPUNIT_TEST(setSpecifiedSize);
    CPPUNIT_TEST(setItalic);
    CPPUNIT_TEST(setSmallCaps);
    CPPUNIT_TEST(setIsAbsoluteSize);
    CPPUNIT_TEST(setWeight);
    CPPUNIT_TEST(setGenericFamily);
    CPPUNIT_TEST(setUsePrinterFont);
    CPPUNIT_TEST(setRenderingMode);
    CPPUNIT_TEST(setKeywordSize);
    CPPUNIT_TEST_SUITE_END();



public:
    void FontDescription() CPPU_NOT_IMPLEMENTED
    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED
    
    void family() CPPU_NOT_IMPLEMENTED
    void firstFamily() CPPU_NOT_IMPLEMENTED
    void specifiedSize() CPPU_NOT_IMPLEMENTED
    void computedSize() CPPU_NOT_IMPLEMENTED
    void italic() CPPU_NOT_IMPLEMENTED
    void computedPixelSize() CPPU_NOT_IMPLEMENTED
    void smallCaps() CPPU_NOT_IMPLEMENTED
    void isAbsoluteSize() CPPU_NOT_IMPLEMENTED
    void weight() CPPU_NOT_IMPLEMENTED
    void lighterWeight() CPPU_NOT_IMPLEMENTED
    void bolderWeight() CPPU_NOT_IMPLEMENTED
    void genericFamily() CPPU_NOT_IMPLEMENTED
    void usePrinterFont() CPPU_NOT_IMPLEMENTED
    void renderingMode() CPPU_NOT_IMPLEMENTED
    void keywordSize() CPPU_NOT_IMPLEMENTED

    void setFamily() CPPU_NOT_IMPLEMENTED
    void setComputedSize() CPPU_NOT_IMPLEMENTED
    void setSpecifiedSize() CPPU_NOT_IMPLEMENTED
    void setItalic() CPPU_NOT_IMPLEMENTED
    void setSmallCaps() CPPU_NOT_IMPLEMENTED
    void setIsAbsoluteSize() CPPU_NOT_IMPLEMENTED
    void setWeight() CPPU_NOT_IMPLEMENTED
    void setGenericFamily() CPPU_NOT_IMPLEMENTED
    void setUsePrinterFont() CPPU_NOT_IMPLEMENTED
    void setRenderingMode() CPPU_NOT_IMPLEMENTED
    void setKeywordSize() CPPU_NOT_IMPLEMENTED
};


#endif

