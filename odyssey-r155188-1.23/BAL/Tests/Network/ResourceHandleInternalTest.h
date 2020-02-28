#ifndef ResourceHandleInternalTest_h_CPPUNIT
#define ResourceHandleInternalTest_h_CPPUNIT

#include "config.h"
#include <cppunit/extensions/HelperMacros.h>
#include "BCResourceHandleInternal.h"
class ResourceHandleInternalTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ResourceHandleInternalTestTest );
//register each method:
    CPPUNIT_TEST(ResourceHandleInternal);
    CPPUNIT_TEST(destruct_ResourceHandleInternal);

    CPPUNIT_TEST(client);

    CPPUNIT_TEST_SUITE_END();

    public:
    void ResourceHandleInternal() CPPU_NOT_IMPLEMENTED
    void destruct_ResourceHandleInternal() CPPU_NOT_IMPLEMENTED

    void client() CPPU_NOT_IMPLEMENTED
        
    };


#endif // ResourceHandleInternal_h

