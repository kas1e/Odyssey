#ifndef TCPageMapTest_h_CPPUNIT
#define TCPageMapTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include <Platform.h>
#include "BCTCPageMap.h"
class TCPageMapTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( TCPageMapTestTest );
//register each method:
    CPPUNIT_TEST(map1_init);
    CPPUNIT_TEST(map1_Ensure);
    CPPUNIT_TEST(map1_PreallocateMoreMemory);
    CPPUNIT_TEST(map1_get);
    CPPUNIT_TEST(map1_set);
    CPPUNIT_TEST(map2_init);
    CPPUNIT_TEST(map2_Ensure);
    CPPUNIT_TEST(map2_PreallocateMoreMemory);
    CPPUNIT_TEST(map2_get);
    CPPUNIT_TEST(map2_set);
    CPPUNIT_TEST(map3_init);
    CPPUNIT_TEST(map3_Ensure);
    CPPUNIT_TEST(map3_PreallocateMoreMemory);
    CPPUNIT_TEST(map3_get);
    CPPUNIT_TEST(map3_set);
    CPPUNIT_TEST_SUITE_END();

 public:
    void map1_init() CPPU_NOT_IMPLEMENTED
    void map1_Ensure() CPPU_NOT_IMPLEMENTED
    void map1_PreallocateMoreMemory() CPPU_NOT_IMPLEMENTED
    void map1_get() CPPU_NOT_IMPLEMENTED
    void map1_set() CPPU_NOT_IMPLEMENTED
    void map2_init() CPPU_NOT_IMPLEMENTED
    void map2_Ensure() CPPU_NOT_IMPLEMENTED
    void map2_PreallocateMoreMemory() CPPU_NOT_IMPLEMENTED
    void map2_get() CPPU_NOT_IMPLEMENTED
    void map2_set() CPPU_NOT_IMPLEMENTED
    void map3_init() CPPU_NOT_IMPLEMENTED
    void map3_Ensure() CPPU_NOT_IMPLEMENTED
    void map3_PreallocateMoreMemory() CPPU_NOT_IMPLEMENTED
    void map3_get() CPPU_NOT_IMPLEMENTED
    void map3_set() CPPU_NOT_IMPLEMENTED
};

#endif  // TCMALLOC_PAGEMAP_H__

