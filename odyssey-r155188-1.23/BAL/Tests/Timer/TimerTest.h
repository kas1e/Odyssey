#ifndef TimerTest_h_CPPUNIT
#define TimerTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCTimer.h"
class TimerTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( TimerTestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);

    CPPUNIT_TEST(start);

    CPPUNIT_TEST(startRepeating);
    CPPUNIT_TEST(startOneShot);

    CPPUNIT_TEST(stop);
    CPPUNIT_TEST(isActive);

    CPPUNIT_TEST(nextFireInterval);
    CPPUNIT_TEST(repeatInterval);

    CPPUNIT_TEST(augmentRepeatInterval);

    CPPUNIT_TEST(fireTimersInNestedEventLoop);

    CPPUNIT_TEST(Timer);

    CPPUNIT_TEST(isDeferringTimers);

    CPPUNIT_TEST_SUITE_END();

//class TimerBase : Noncopyable {
public:
	void constructors() CPPU_NOT_IMPLEMENTED
	void destructors() CPPU_NOT_IMPLEMENTED

    void start() CPPU_NOT_IMPLEMENTED

    void startRepeating() CPPU_NOT_IMPLEMENTED
    void startOneShot() CPPU_NOT_IMPLEMENTED

    void stop() CPPU_NOT_IMPLEMENTED
    void isActive() CPPU_NOT_IMPLEMENTED

    void nextFireInterval() CPPU_NOT_IMPLEMENTED
    void repeatInterval() CPPU_NOT_IMPLEMENTED

    void augmentRepeatInterval() CPPU_NOT_IMPLEMENTED

    void fireTimersInNestedEventLoop() CPPU_NOT_IMPLEMENTED

//template <typename TimerFiredClass> class Timer : public TimerBase {
    void Timer() CPPU_NOT_IMPLEMENTED

	void isDeferringTimers() CPPU_NOT_IMPLEMENTED
};



#endif

