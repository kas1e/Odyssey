#ifndef TCPackedCacheTest_h_CPPUNIT
#define TCPackedCacheTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "Platform.h"
#include "Assertions.h"

#include "BCTCPackedCache.h"
class TCPackedCacheTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( TCPackedCacheTestTest );
//register each method:
    CPPUNIT_TEST(PackedCache);
    CPPUNIT_TEST(Put);
    CPPUNIT_TEST(Has);
    CPPUNIT_TEST(GetOrDefault);
    CPPUNIT_TEST(Clear);
    CPPUNIT_TEST_SUITE_END();

 public:
    void PackedCache() CPPU_NOT_IMPLEMENTED
    void Put() CPPU_NOT_IMPLEMENTED
    void Has() CPPU_NOT_IMPLEMENTED
    void GetOrDefault() CPPU_NOT_IMPLEMENTED
    void Clear() CPPU_NOT_IMPLEMENTED
};

#endif  // TCMALLOC_PACKED_CACHE_INL_H__

