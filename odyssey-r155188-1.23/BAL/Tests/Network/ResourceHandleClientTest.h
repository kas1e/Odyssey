#ifndef ResourceHandleClientTest_h_CPPUNIT
#define ResourceHandleClientTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCResourceHandleClient.h"
class ResourceHandleClientTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ResourceHandleClientTestTest );
//register each method:
    CPPUNIT_TEST(destruct_ResourceHandleClient);

    CPPUNIT_TEST(willSendRequest);

    CPPUNIT_TEST(didReceiveResponse);
    CPPUNIT_TEST(didReceiveData);
    CPPUNIT_TEST(didFinishLoading);
    CPPUNIT_TEST(didFail);
    CPPUNIT_TEST(wasBlocked);
    CPPUNIT_TEST(cannotShowURL);

    CPPUNIT_TEST(willCacheResponse);

    CPPUNIT_TEST(didReceiveAuthenticationChallenge);
    CPPUNIT_TEST(didCancelAuthenticationChallenge);
    CPPUNIT_TEST(receivedCredential);
    CPPUNIT_TEST(receivedRequestToContinueWithoutCredential);
    CPPUNIT_TEST(receivedCancellation);


    CPPUNIT_TEST_SUITE_END();


    public:
    void destruct_ResourceHandleClient() CPPU_NOT_IMPLEMENTED

    void willSendRequest() CPPU_NOT_IMPLEMENTED

    void didReceiveResponse() CPPU_NOT_IMPLEMENTED
    void didReceiveData() CPPU_NOT_IMPLEMENTED
    void didFinishLoading() CPPU_NOT_IMPLEMENTED
    void didFail() CPPU_NOT_IMPLEMENTED
    void wasBlocked() CPPU_NOT_IMPLEMENTED
    void cannotShowURL() CPPU_NOT_IMPLEMENTED

    void willCacheResponse() CPPU_NOT_IMPLEMENTED

    void didReceiveAuthenticationChallenge() CPPU_NOT_IMPLEMENTED
    void didCancelAuthenticationChallenge() CPPU_NOT_IMPLEMENTED
    void receivedCredential() CPPU_NOT_IMPLEMENTED
    void receivedRequestToContinueWithoutCredential() CPPU_NOT_IMPLEMENTED
    void receivedCancellation() CPPU_NOT_IMPLEMENTED

};

#endif

