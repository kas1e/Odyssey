#ifndef SSLKeyGeneratorTest_h_CPPUNIT
#define SSLKeyGeneratorTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSSLKeyGenerator.h"
class SSLKeyGeneratorTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SSLKeyGeneratorTestTest );
//register each method:
    CPPUNIT_TEST(supportedKeySizes);
    CPPUNIT_TEST(signedPublicKeyAndChallengeString);

    CPPUNIT_TEST_SUITE_END();

    void supportedKeySizes() CPPU_NOT_IMPLEMENTED
    void signedPublicKeyAndChallengeString()CPPU_NOT_IMPLEMENTED

};

#endif

