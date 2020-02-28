#ifndef LockerTest_h_CPPUNIT
#define LockerTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCLocker.h"
class LockerTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( LockerTestTest );
//register each method:
    CPPUNIT_TEST(Locker);
    CPPUNIT_TEST(destruct_Locker);

    CPPUNIT_TEST_SUITE_END();

public:
    void Locker() CPPU_NOT_IMPLEMENTED
    void destruct_Locker() CPPU_NOT_IMPLEMENTED
};


#endif

