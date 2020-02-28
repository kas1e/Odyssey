#ifndef ResourceHandleTest_h_CPPUNIT
#define ResourceHandleTest_h_CPPUNIT

#include "config.h"
#include <cppunit/extensions/HelperMacros.h>
#include "BCResourceHandle.h"
class ResourceHandleTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ResourceHandleTestTest );
//register each method:
    CPPUNIT_TEST(create);

    CPPUNIT_TEST(loadResourceSynchronously);
    CPPUNIT_TEST(willLoadFromCache);
    
    CPPUNIT_TEST(destruct_ResourceHandle);

    CPPUNIT_TEST(didReceiveAuthenticationChallenge);
    CPPUNIT_TEST(receivedCredential);
    CPPUNIT_TEST(receivedRequestToContinueWithoutCredential);
    CPPUNIT_TEST(receivedCancellation);

    CPPUNIT_TEST(setHostAllowsAnyHTTPSCertificate);
    CPPUNIT_TEST(setClientCertificate);

    CPPUNIT_TEST(bufferedData);
    CPPUNIT_TEST(supportsBufferedData);

    CPPUNIT_TEST(getInternal);

    CPPUNIT_TEST(loadsBlocked);
    
    CPPUNIT_TEST(clearAuthentication);
    CPPUNIT_TEST(cancel);

    CPPUNIT_TEST(client);
    CPPUNIT_TEST(setClient);

    CPPUNIT_TEST(setDefersLoading);
      
    CPPUNIT_TEST(request);

    CPPUNIT_TEST(fireFailure);

    CPPUNIT_TEST(scheduleFailure);

    CPPUNIT_TEST(start);


    CPPUNIT_TEST_SUITE_END();


public:
    void create() CPPU_NOT_IMPLEMENTED

    void loadResourceSynchronously() CPPU_NOT_IMPLEMENTED
    void willLoadFromCache() CPPU_NOT_IMPLEMENTED
    
    void destruct_ResourceHandle() CPPU_NOT_IMPLEMENTED

    void didReceiveAuthenticationChallenge() CPPU_NOT_IMPLEMENTED
    void receivedCredential() CPPU_NOT_IMPLEMENTED
    void receivedRequestToContinueWithoutCredential() CPPU_NOT_IMPLEMENTED
    void receivedCancellation() CPPU_NOT_IMPLEMENTED

    void setHostAllowsAnyHTTPSCertificate() CPPU_NOT_IMPLEMENTED
    void setClientCertificate() CPPU_NOT_IMPLEMENTED

    void bufferedData() CPPU_NOT_IMPLEMENTED
    void supportsBufferedData() CPPU_NOT_IMPLEMENTED

    void getInternal() CPPU_NOT_IMPLEMENTED

    void loadsBlocked() CPPU_NOT_IMPLEMENTED
    
    void clearAuthentication() CPPU_NOT_IMPLEMENTED
    void cancel() CPPU_NOT_IMPLEMENTED

    void client() CPPU_NOT_IMPLEMENTED
    void setClient() CPPU_NOT_IMPLEMENTED

    void setDefersLoading() CPPU_NOT_IMPLEMENTED
      
    void request() CPPU_NOT_IMPLEMENTED

    void fireFailure() CPPU_NOT_IMPLEMENTED

    void scheduleFailure() CPPU_NOT_IMPLEMENTED

    void start() CPPU_NOT_IMPLEMENTED

};

#endif // ResourceHandle_h

