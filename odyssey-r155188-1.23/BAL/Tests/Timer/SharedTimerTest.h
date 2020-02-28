#ifndef SharedTimerTest_h_CPPUNIT
#define SharedTimerTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSharedTimer.h"
class SharedTimerTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SharedTimerTestTest );
//register each method:
    CPPUNIT_TEST(setSharedTimerFiredFunction);
    CPPUNIT_TEST(setSharedTimerFireTime);
    CPPUNIT_TEST(stopSharedTimer);

    CPPUNIT_TEST_SUITE_END();


    void setSharedTimerFiredFunction()CPPU_NOT_IMPLEMENTED
    void setSharedTimerFireTime()CPPU_NOT_IMPLEMENTED
    void stopSharedTimer() CPPU_NOT_IMPLEMENTED

};

#endif

