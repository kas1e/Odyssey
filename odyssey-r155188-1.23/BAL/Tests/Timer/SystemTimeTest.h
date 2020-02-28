#ifndef SystemTimeTest_h_CPPUNIT
#define SystemTimeTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSystemTime.h"
class SystemTimeTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SystemTimeTestTest );
//register each method:
    CPPUNIT_TEST(currentTime);
    CPPUNIT_TEST(userIdleTime);

    CPPUNIT_TEST_SUITE_END();

    void currentTime() CPPU_NOT_IMPLEMENTED
    void userIdleTime() CPPU_NOT_IMPLEMENTED
    
};

#endif

