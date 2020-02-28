#ifndef MainThreadTest_h_CPPUNIT
#define MainThreadTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include <Platform.h>
#include "BCMainThread.h"
class MainThreadTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( MainThreadTestTest );
//register each method:

    CPPUNIT_TEST(callOnMainThread);
    CPPUNIT_TEST(setMainThreadCallbacksPaused);

    CPPUNIT_TEST(dispatchFunctionsFromMainThread);
    CPPUNIT_TEST(scheduleDispatchFunctionsOnMainThread);
    CPPUNIT_TEST_SUITE_END();




    void callOnMainThread() CPPU_NOT_IMPLEMENTED
    void setMainThreadCallbacksPaused() CPPU_NOT_IMPLEMENTED

    void dispatchFunctionsFromMainThread() CPPU_NOT_IMPLEMENTED
    void scheduleDispatchFunctionsOnMainThread() CPPU_NOT_IMPLEMENTED
};

#endif // MainThread_h

