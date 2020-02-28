#ifndef OwnPtrTest_h_CPPUNIT
#define OwnPtrTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCOwnPtr.h"
class OwnPtrTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( OwnPtrTestTest );
//register each method:
    CPPUNIT_TEST(deleteOwnedPtr);
    CPPUNIT_TEST(OwnPtr);
    CPPUNIT_TEST(destruct_OwnPtr);
    CPPUNIT_TEST(get);
    CPPUNIT_TEST(release);
    CPPUNIT_TEST(set);
    CPPUNIT_TEST(clear);
    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator_ptr);
    CPPUNIT_TEST(operator_not);
    CPPUNIT_TEST(operator_UnspecifiedBoolType);
    CPPUNIT_TEST(swap);
    CPPUNIT_TEST(swap_2args);
    CPPUNIT_TEST(operator_equal1);
    CPPUNIT_TEST(operator_equal2);
    CPPUNIT_TEST(operator_diff1);
    CPPUNIT_TEST(operator_diff2);
    CPPUNIT_TEST(getPtr);
 
    CPPUNIT_TEST_SUITE_END();


    public:
    void deleteOwnedPtr() CPPU_NOT_IMPLEMENTED
    void OwnPtr() CPPU_NOT_IMPLEMENTED
    void destruct_OwnPtr() CPPU_NOT_IMPLEMENTED
    void get() CPPU_NOT_IMPLEMENTED
    void release() CPPU_NOT_IMPLEMENTED
    void set() CPPU_NOT_IMPLEMENTED
    void clear() CPPU_NOT_IMPLEMENTED
    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator_ptr() CPPU_NOT_IMPLEMENTED
    void operator_not() CPPU_NOT_IMPLEMENTED
    void operator_UnspecifiedBoolType() CPPU_NOT_IMPLEMENTED
    void swap() CPPU_NOT_IMPLEMENTED
    void swap_2args() CPPU_NOT_IMPLEMENTED
    void operator_equal1() CPPU_NOT_IMPLEMENTED
    void operator_equal2() CPPU_NOT_IMPLEMENTED
    void operator_diff1() CPPU_NOT_IMPLEMENTED
    void operator_diff2() CPPU_NOT_IMPLEMENTED
    void getPtr() CPPU_NOT_IMPLEMENTED
 
    

   };

#endif // WTF_OwnPtr_h

