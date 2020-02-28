#ifndef TCSpinLockTest_h_CPPUNIT
#define TCSpinLockTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include <Platform.h>
#include "BCTCSpinLock.h"
class TCSpinLockTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( TCSpinLockTestTest );
//register each method:
    CPPUNIT_TEST(TCMalloc_SlowLock);
    CPPUNIT_TEST(Lock);
    CPPUNIT_TEST(Unlock);
    CPPUNIT_TEST(IsHeld);
    CPPUNIT_TEST(Init);
    CPPUNIT_TEST(TCMalloc_SpinLockHolder);
    CPPUNIT_TEST(destruct_TCMalloc_SpinLockHolder);

    CPPUNIT_TEST_SUITE_END();

    void TCMalloc_SlowLock() CPPU_NOT_IMPLEMENTED
    void Lock() CPPU_NOT_IMPLEMENTED
    void Unlock() CPPU_NOT_IMPLEMENTED
    void IsHeld() CPPU_NOT_IMPLEMENTED
    void Init() CPPU_NOT_IMPLEMENTED
    void TCMalloc_SpinLockHolder() CPPU_NOT_IMPLEMENTED
    void destruct_TCMalloc_SpinLockHolder() CPPU_NOT_IMPLEMENTED
};


#endif  // TCMALLOC_INTERNAL_SPINLOCK_H__

