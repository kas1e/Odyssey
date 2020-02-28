#ifndef ProtectionSpaceTest_h_CPPUNIT
#define ProtectionSpaceTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCProtectionSpace.h"
class ProtectionSpaceTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ProtectionSpaceTestTest );
//register each method:
    CPPUNIT_TEST(ProtectionSpace);
    CPPUNIT_TEST(ProtectionSpace_args);
    
    CPPUNIT_TEST(host);
    CPPUNIT_TEST(port);
    CPPUNIT_TEST(serverType);
    CPPUNIT_TEST(isProxy);
    CPPUNIT_TEST(realm);
    CPPUNIT_TEST(authenticationScheme);
    
    CPPUNIT_TEST(receivesCredentialSecurely);
    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);


    CPPUNIT_TEST_SUITE_END();

public:
    void ProtectionSpace() CPPU_NOT_IMPLEMENTED
    void ProtectionSpace_args() CPPU_NOT_IMPLEMENTED
    
    void host() CPPU_NOT_IMPLEMENTED
    void port() CPPU_NOT_IMPLEMENTED
    void serverType() CPPU_NOT_IMPLEMENTED
    void isProxy() CPPU_NOT_IMPLEMENTED
    void realm() CPPU_NOT_IMPLEMENTED
    void authenticationScheme() CPPU_NOT_IMPLEMENTED
    
    void receivesCredentialSecurely() CPPU_NOT_IMPLEMENTED
    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED

};

#endif

