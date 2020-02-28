#ifndef ThreadingTest_h_CPPUNIT
#define ThreadingTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCThreading.h"
class ThreadingTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ThreadingTestTest );
//register each method:

    CPPUNIT_TEST(createThread);
    CPPUNIT_TEST(currentThread);
    CPPUNIT_TEST(isMainThread);
    CPPUNIT_TEST(waitForThreadCompletion);
    CPPUNIT_TEST(detachThread);

    CPPUNIT_TEST(Mutex);
    CPPUNIT_TEST(destruct_Mutex);

    CPPUNIT_TEST(lock);
    CPPUNIT_TEST(tryLock);
    CPPUNIT_TEST(unlock);

    CPPUNIT_TEST(impl);

    CPPUNIT_TEST(ThreadCondition);
    CPPUNIT_TEST(destruct_ThreadCondition);
    CPPUNIT_TEST(wait);
    CPPUNIT_TEST(timedWait);
    CPPUNIT_TEST(signal);
    CPPUNIT_TEST(broadcast);
    CPPUNIT_TEST(atomicIncrement);
    CPPUNIT_TEST(atomicDecrement);



    CPPUNIT_TEST(ThreadSafeShared);
    CPPUNIT_TEST(ref);
    CPPUNIT_TEST(deref);
    CPPUNIT_TEST(hasOneRef);
    CPPUNIT_TEST(refCount);
    CPPUNIT_TEST_SUITE_END();
public:

    void createThread() CPPU_NOT_IMPLEMENTED
    void currentThread() CPPU_NOT_IMPLEMENTED
    void isMainThread() CPPU_NOT_IMPLEMENTED
    void waitForThreadCompletion() CPPU_NOT_IMPLEMENTED
    void detachThread() CPPU_NOT_IMPLEMENTED

    void Mutex() CPPU_NOT_IMPLEMENTED
    void destruct_Mutex() CPPU_NOT_IMPLEMENTED

    void lock() CPPU_NOT_IMPLEMENTED
    void tryLock() CPPU_NOT_IMPLEMENTED
    void unlock() CPPU_NOT_IMPLEMENTED

    void impl() CPPU_NOT_IMPLEMENTED

    void ThreadCondition() CPPU_NOT_IMPLEMENTED
    void destruct_ThreadCondition() CPPU_NOT_IMPLEMENTED
    void wait() CPPU_NOT_IMPLEMENTED
    void timedWait() CPPU_NOT_IMPLEMENTED
    void signal() CPPU_NOT_IMPLEMENTED
    void broadcast() CPPU_NOT_IMPLEMENTED
    void atomicIncrement() CPPU_NOT_IMPLEMENTED
    void atomicDecrement() CPPU_NOT_IMPLEMENTED



    void ThreadSafeShared() CPPU_NOT_IMPLEMENTED
    void ref() CPPU_NOT_IMPLEMENTED
    void deref() CPPU_NOT_IMPLEMENTED
    void hasOneRef() CPPU_NOT_IMPLEMENTED
    void refCount() CPPU_NOT_IMPLEMENTED
};


#endif // Threading_h

