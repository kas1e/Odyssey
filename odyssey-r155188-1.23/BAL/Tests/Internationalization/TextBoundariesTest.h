#ifndef TextBoundariesTest_h_CPPUNIT
#define TextBoundariesTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCTextBoundaries.h"
class TextBoundariesTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( TextBoundariesTestTest );
//register each method:

    CPPUNIT_TEST(findWordBoundary);
    CPPUNIT_TEST(findNextWordFromIndex);
    CPPUNIT_TEST_SUITE_END();




    void findWordBoundary() CPPU_NOT_IMPLEMENTED
    void findNextWordFromIndex() CPPU_NOT_IMPLEMENTED

};

#endif

