#ifndef ResourceResponseTest_h_CPPUNIT
#define ResourceResponseTest_h_CPPUNIT

#include "config.h"
#include <cppunit/extensions/HelperMacros.h>
#include "BCResourceResponse.h"
class ResourceResponseTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ResourceResponseTestTest );
//register each method:
    CPPUNIT_TEST(ResourceResponse);
    CPPUNIT_TEST(ResourceResponse_args);
    CPPUNIT_TEST(setResponseFired);
    CPPUNIT_TEST(responseFired);

    CPPUNIT_TEST_SUITE_END();

public:
    void ResourceResponse() CPPU_NOT_IMPLEMENTED
    void ResourceResponse_args() CPPU_NOT_IMPLEMENTED
    void setResponseFired() CPPU_NOT_IMPLEMENTED
    void responseFired() CPPU_NOT_IMPLEMENTED

};


#endif // ResourceResponse_h

