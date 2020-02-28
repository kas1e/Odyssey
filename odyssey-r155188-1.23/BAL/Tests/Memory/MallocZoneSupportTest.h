#if 0 //Not used, as it is specific for DARWIN platform
#ifndef MallocZoneSupportTest_h_CPPUNIT
#define MallocZoneSupportTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "Platform.h"
#include "BCMallocZoneSupport.h"
class MallocZoneSupportTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( MallocZoneSupportTestTest );
//register each method:
    CPPUNIT_TEST(operator_parenthesis);
    CPPUNIT_TEST_SUITE_END();

public:

    void operator_parenthesis() CPPU_NOT_IMPLEMENTED
};


#endif // MallocZoneSupport_h
#endif

