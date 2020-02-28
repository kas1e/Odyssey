#ifndef CredentialTest_h_CPPUNIT
#define CredentialTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCCredential.h"
class CredentialTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( CredentialTestTest );
//register each method:
    CPPUNIT_TEST(Credential);
    CPPUNIT_TEST(Credential_args);
    
    CPPUNIT_TEST(user);
    CPPUNIT_TEST(password);
    CPPUNIT_TEST(hasPassword);
    CPPUNIT_TEST(persistence);
    
    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);


    CPPUNIT_TEST_SUITE_END();
public:
    void Credential() CPPU_NOT_IMPLEMENTED
    void Credential_args() CPPU_NOT_IMPLEMENTED
    
    void user() CPPU_NOT_IMPLEMENTED
    void password() CPPU_NOT_IMPLEMENTED
    void hasPassword() CPPU_NOT_IMPLEMENTED
    void persistence() CPPU_NOT_IMPLEMENTED
    
    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED

    
};
#endif

