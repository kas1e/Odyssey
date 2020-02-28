#ifndef SecurityOriginHashTest_h_CPPUNIT
#define SecurityOriginHashTest_h_CPPUNIT

#include "config.h"
#include <cppunit/extensions/HelperMacros.h>
#include "BCSecurityOriginHash.h"
class SecurityOriginHashTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SecurityOriginHashTestTest );
//register each method:
	CPPUNIT_TEST( hash );
	CPPUNIT_TEST( equal );
    CPPUNIT_TEST_SUITE_END();


//struct SecurityOriginHash {
    void hash() CPPU_NOT_IMPLEMENTED
    void equal() CPPU_NOT_IMPLEMENTED
};

#endif

