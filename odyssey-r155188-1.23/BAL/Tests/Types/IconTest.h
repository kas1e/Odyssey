#ifndef IconTest_h_CPPUNIT
#define IconTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCIcon.h"
class IconTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( IconTestTest );
//register each method:
    CPPUNIT_TEST(Icon);
    CPPUNIT_TEST(destruct_Icon);
    CPPUNIT_TEST(newIconForFile);
    CPPUNIT_TEST(paint);

    CPPUNIT_TEST_SUITE_END();

public:
    void Icon() CPPU_NOT_IMPLEMENTED
    void destruct_Icon() CPPU_NOT_IMPLEMENTED
    void newIconForFile() CPPU_NOT_IMPLEMENTED
    void paint() CPPU_NOT_IMPLEMENTED

};

#endif

