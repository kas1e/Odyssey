#ifndef ResourceErrorTest_h_CPPUNIT
#define ResourceErrorTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCResourceError.h"
class ResourceErrorTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ResourceErrorTestTest );
//register each method:
    CPPUNIT_TEST(ResourceError);
    CPPUNIT_TEST(ResourceError_args);

    CPPUNIT_TEST_SUITE_END();


public:
    void ResourceError() CPPU_NOT_IMPLEMENTED
    void ResourceError_args() CPPU_NOT_IMPLEMENTED
};


#endif // ResourceError_h_

