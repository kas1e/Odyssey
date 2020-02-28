#ifndef PlatformScrollBarTest_h_CPPUNIT
#define PlatformScrollBarTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCPlatformScrollBar.h"
class PlatformScrollBarTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( PlatformScrollBarTestTest );
//register each method:
    CPPUNIT_TEST(create);
    CPPUNIT_TEST(destruct_PlatformScrollbar);

    CPPUNIT_TEST(isWidget);

    CPPUNIT_TEST(width);
    CPPUNIT_TEST(height);
    CPPUNIT_TEST(setRect);
    CPPUNIT_TEST(setEnabled);
    CPPUNIT_TEST(paint);

    CPPUNIT_TEST(horizontalScrollbarHeight);
    CPPUNIT_TEST(verticalScrollbarWidth);


    CPPUNIT_TEST_SUITE_END();

public:
    void create() CPPU_NOT_IMPLEMENTED
    void destruct_PlatformScrollbar() CPPU_NOT_IMPLEMENTED

    void isWidget() CPPU_NOT_IMPLEMENTED

    void width() CPPU_NOT_IMPLEMENTED
    void height() CPPU_NOT_IMPLEMENTED
    void setRect() CPPU_NOT_IMPLEMENTED
    void setEnabled() CPPU_NOT_IMPLEMENTED
    void paint() CPPU_NOT_IMPLEMENTED

    void horizontalScrollbarHeight() CPPU_NOT_IMPLEMENTED
    void verticalScrollbarWidth() CPPU_NOT_IMPLEMENTED

};


#endif // PlatformScrollBar_h

