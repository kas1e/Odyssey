#ifndef AuthenticationChallengeBaseTest_h_CPPUNIT
#define AuthenticationChallengeBaseTest_h_CPPUNIT

#include "config.h"
#include <cppunit/extensions/HelperMacros.h>
#include "BCAuthenticationChallengeBase.h"
class AuthenticationChallengeBaseTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( AuthenticationChallengeBaseTestTest );
//register each method:
    CPPUNIT_TEST(AuthenticationChallengeBase);
    CPPUNIT_TEST(AuthenticationChallengeBase_args);

    CPPUNIT_TEST(previousFailureCount);
    CPPUNIT_TEST(proposedCredential);
    CPPUNIT_TEST(protectionSpace);
    CPPUNIT_TEST(failureResponse);
    CPPUNIT_TEST(error);
    
    CPPUNIT_TEST(isNull);
    CPPUNIT_TEST(nullify);

    CPPUNIT_TEST(compare);

    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);
    CPPUNIT_TEST_SUITE_END();

public:
    void AuthenticationChallengeBase() CPPU_NOT_IMPLEMENTED
    void AuthenticationChallengeBase_args() CPPU_NOT_IMPLEMENTED

    void previousFailureCount() CPPU_NOT_IMPLEMENTED
    void proposedCredential() CPPU_NOT_IMPLEMENTED
    void protectionSpace() CPPU_NOT_IMPLEMENTED
    void failureResponse() CPPU_NOT_IMPLEMENTED
    void error() CPPU_NOT_IMPLEMENTED
    
    void isNull() CPPU_NOT_IMPLEMENTED
    void nullify() CPPU_NOT_IMPLEMENTED

    void compare() CPPU_NOT_IMPLEMENTED

    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED
};


#endif

