#ifndef ColorTest_h_CPPUNIT
#define ColorTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCColor.h"
class ColorTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ColorTestTest );
//register each method:
    CPPUNIT_TEST(makeRGB_rgb);
    CPPUNIT_TEST(makeRGBA_rgba);
    CPPUNIT_TEST(makeRGBAFromHSLA);

    CPPUNIT_TEST(differenceSquared);

    CPPUNIT_TEST(Color);
    CPPUNIT_TEST(Color_RGBA);
    CPPUNIT_TEST(Color_rgb);
    CPPUNIT_TEST(Color_rgba);
    CPPUNIT_TEST(Color_String);
    CPPUNIT_TEST(Color_chars);
    
    CPPUNIT_TEST(name);
    CPPUNIT_TEST(setNamedColor);

    CPPUNIT_TEST(isValid);

    CPPUNIT_TEST(hasAlpha);

    CPPUNIT_TEST(red);
    CPPUNIT_TEST(green);
    CPPUNIT_TEST(blue);
    CPPUNIT_TEST(alpha);
    
    CPPUNIT_TEST(rgb);
    CPPUNIT_TEST(setRGB_rgb);
    CPPUNIT_TEST(setRGB);
    CPPUNIT_TEST(getRGBA_floats);
    CPPUNIT_TEST(getRGBA_doubles);

    CPPUNIT_TEST(light);
    CPPUNIT_TEST(dark);

    CPPUNIT_TEST(blend);
    CPPUNIT_TEST(blendWithWhite);

    CPPUNIT_TEST(parseHexColor);
    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);
    CPPUNIT_TEST(focusRingColor);
    CPPUNIT_TEST(setFocusRingColorChangeFunction);


    CPPUNIT_TEST_SUITE_END();

public:
    void makeRGB_rgb() CPPU_NOT_IMPLEMENTED
    void makeRGBA_rgba() CPPU_NOT_IMPLEMENTED
    void makeRGBAFromHSLA() CPPU_NOT_IMPLEMENTED

    void differenceSquared() CPPU_NOT_IMPLEMENTED

    void Color() CPPU_NOT_IMPLEMENTED
    void Color_RGBA() CPPU_NOT_IMPLEMENTED
    void Color_rgb() CPPU_NOT_IMPLEMENTED
    void Color_rgba() CPPU_NOT_IMPLEMENTED
    void Color_String() CPPU_NOT_IMPLEMENTED
    void Color_chars() CPPU_NOT_IMPLEMENTED
    
    void name() CPPU_NOT_IMPLEMENTED
    void setNamedColor() CPPU_NOT_IMPLEMENTED

    void isValid() CPPU_NOT_IMPLEMENTED

    void hasAlpha() CPPU_NOT_IMPLEMENTED

    void red() CPPU_NOT_IMPLEMENTED
    void green() CPPU_NOT_IMPLEMENTED
    void blue() CPPU_NOT_IMPLEMENTED
    void alpha() CPPU_NOT_IMPLEMENTED
    
    void rgb() CPPU_NOT_IMPLEMENTED
    void setRGB_rgb() CPPU_NOT_IMPLEMENTED
    void setRGB() CPPU_NOT_IMPLEMENTED
    void getRGBA_floats() CPPU_NOT_IMPLEMENTED
    void getRGBA_doubles() CPPU_NOT_IMPLEMENTED

    void light() CPPU_NOT_IMPLEMENTED
    void dark() CPPU_NOT_IMPLEMENTED

    void blend() CPPU_NOT_IMPLEMENTED
    void blendWithWhite() CPPU_NOT_IMPLEMENTED

    void parseHexColor() CPPU_NOT_IMPLEMENTED
    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED
    void focusRingColor() CPPU_NOT_IMPLEMENTED
    void setFocusRingColorChangeFunction() CPPU_NOT_IMPLEMENTED


};

#endif // Color_h

