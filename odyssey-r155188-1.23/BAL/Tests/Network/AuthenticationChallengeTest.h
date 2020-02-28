#ifndef AuthenticationChallengeTest_h_CPPUNIT
#define AuthenticationChallengeTest_h_CPPUNIT

#include "config.h"
#include <cppunit/extensions/HelperMacros.h>
#include "BCAuthenticationChallenge.h"
class AuthenticationChallengeTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( AuthenticationChallengeTestTest );
//register each method:

    CPPUNIT_TEST(AuthenticationChallenge);
    CPPUNIT_TEST(AuthenticationChallenge_args);
    CPPUNIT_TEST(sourceHandle);
    CPPUNIT_TEST_SUITE_END();

public:
    void AuthenticationChallenge() CPPU_NOT_IMPLEMENTED
    void AuthenticationChallenge_args() CPPU_NOT_IMPLEMENTED
    void sourceHandle() CPPU_NOT_IMPLEMENTED

};


#endif

