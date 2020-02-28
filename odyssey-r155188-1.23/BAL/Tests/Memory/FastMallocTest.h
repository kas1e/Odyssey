#ifndef FastMallocTest_h_CPPUNIT
#define FastMallocTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCFastMalloc.h"
class FastMallocTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( FastMallocTestTest );
//register each method:
    CPPUNIT_TEST(fastMalloc);
    CPPUNIT_TEST(fastZeroedMalloc);
    CPPUNIT_TEST(fastCalloc);
    CPPUNIT_TEST(fastFree);
    CPPUNIT_TEST(fastRealloc);

#ifndef NDEBUG    
    CPPUNIT_TEST(fastMallocForbid);
    CPPUNIT_TEST(fastMallocAllow);
#endif
    CPPUNIT_TEST_SUITE_END();




    void fastMalloc() CPPU_NOT_IMPLEMENTED
    void fastZeroedMalloc() CPPU_NOT_IMPLEMENTED
    void fastCalloc() CPPU_NOT_IMPLEMENTED
    void fastFree() CPPU_NOT_IMPLEMENTED
    void fastRealloc() CPPU_NOT_IMPLEMENTED

#ifndef NDEBUG    
    void fastMallocForbid() CPPU_NOT_IMPLEMENTED
    void fastMallocAllow() CPPU_NOT_IMPLEMENTED
#endif

};

#endif /* WTF_FastMalloc_h */

