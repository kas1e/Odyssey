#ifndef RenderThemeBalTest_h_CPPUNIT
#define RenderThemeBalTest_h_CPPUNIT

#include "config.h"
#include <cppunit/extensions/HelperMacros.h>
#include "Platform.h"
#include "BCRenderTheme.h"
class RenderThemeBalTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( RenderThemeBalTestTest );
//register each method:
    CPPUNIT_TEST(RenderThemeBal);

    CPPUNIT_TEST(supportsHover);
    CPPUNIT_TEST(supportsFocusRing);
    CPPUNIT_TEST(controlSupportsTints);
    CPPUNIT_TEST(supportsControlTints);
    CPPUNIT_TEST(baselinePosition);
    CPPUNIT_TEST(platformActiveSelectionBackgroundColor);
    CPPUNIT_TEST(platformInactiveSelectionBackgroundColor);
    CPPUNIT_TEST(platformActiveSelectionForegroundColor);
    CPPUNIT_TEST(platformInactiveSelectionForegroundColor);
    CPPUNIT_TEST(activeListBoxSelectionBackgroundColor);
    CPPUNIT_TEST(activeListBoxSelectionForegroundColor);
    CPPUNIT_TEST(inactiveListBoxSelectionBackgroundColor);
    CPPUNIT_TEST(inactiveListBoxSelectionForegroundColor);
    CPPUNIT_TEST(caretBlinkFrequency);
    CPPUNIT_TEST(systemFont);


    CPPUNIT_TEST_SUITE_END();

public:
    void RenderThemeBal() CPPU_NOT_IMPLEMENTED

    void supportsHover() CPPU_NOT_IMPLEMENTED
    void supportsFocusRing() CPPU_NOT_IMPLEMENTED
    void controlSupportsTints() CPPU_NOT_IMPLEMENTED
    void supportsControlTints() CPPU_NOT_IMPLEMENTED
    void baselinePosition() CPPU_NOT_IMPLEMENTED
    void platformActiveSelectionBackgroundColor() CPPU_NOT_IMPLEMENTED
    void platformInactiveSelectionBackgroundColor() CPPU_NOT_IMPLEMENTED
    void platformActiveSelectionForegroundColor() CPPU_NOT_IMPLEMENTED
    void platformInactiveSelectionForegroundColor() CPPU_NOT_IMPLEMENTED
    void activeListBoxSelectionBackgroundColor() CPPU_NOT_IMPLEMENTED
    void activeListBoxSelectionForegroundColor() CPPU_NOT_IMPLEMENTED
    void inactiveListBoxSelectionBackgroundColor() CPPU_NOT_IMPLEMENTED
    void inactiveListBoxSelectionForegroundColor() CPPU_NOT_IMPLEMENTED
    void caretBlinkFrequency() CPPU_NOT_IMPLEMENTED
    void systemFont() CPPU_NOT_IMPLEMENTED

};


#endif

