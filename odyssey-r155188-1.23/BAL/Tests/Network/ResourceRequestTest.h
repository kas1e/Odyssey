#ifndef ResourceRequestTest_h_CPPUNIT
#define ResourceRequestTest_h_CPPUNIT

#include "config.h"
#include <cppunit/extensions/HelperMacros.h>
#include "BCResourceRequest.h"
class ResourceRequestTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ResourceRequestTestTest );
//register each method:
    CPPUNIT_TEST(ResourceRequest_String);
    CPPUNIT_TEST(ResourceRequest_KURL);
    CPPUNIT_TEST(ResourceRequest_KURL_Str);
    CPPUNIT_TEST(ResourceRequest);

    CPPUNIT_TEST_SUITE_END();

    public:
    void ResourceRequest_String() CPPU_NOT_IMPLEMENTED
    void ResourceRequest_KURL() CPPU_NOT_IMPLEMENTED
    void ResourceRequest_KURL_Str() CPPU_NOT_IMPLEMENTED
    void ResourceRequest() CPPU_NOT_IMPLEMENTED

    };

#endif // ResourceRequest_h

