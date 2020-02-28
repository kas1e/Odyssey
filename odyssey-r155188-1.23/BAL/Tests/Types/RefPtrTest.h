#ifndef RefPtrTest_h_CPPUNIT
#define RefPtrTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCRefPtr.h"
class RefPtrTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( RefPtrTestTest );
//register each method:
    CPPUNIT_TEST(RefPtr);
    CPPUNIT_TEST(RefPtr_T);
    CPPUNIT_TEST(RefPtr_RefPtr);
    CPPUNIT_TEST(RefPtr_PassRefPtr);
    CPPUNIT_TEST(RefPtr_PlacementNewAdoptType);

    CPPUNIT_TEST(RefPtr_HashTableDeletedValueType);
    CPPUNIT_TEST(RefPtr_RefPtr_U);
    CPPUNIT_TEST(isHashTableDeletedValue);

    CPPUNIT_TEST(destruct_RefPtr);
        
        
    CPPUNIT_TEST(get);
        
    CPPUNIT_TEST(clear);
    CPPUNIT_TEST(release);

    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator_ptr);
        
    CPPUNIT_TEST(operator_not);
    
    CPPUNIT_TEST(operator_UnspecifiedBoolType);
        
    CPPUNIT_TEST(operator_copy);
    CPPUNIT_TEST(operator_copy_T);
    CPPUNIT_TEST(operator_copy_PassRefPtr_T);
    CPPUNIT_TEST(operator_copy_RefPtr_U);
    CPPUNIT_TEST(operator_copy_PassRefPtr_U);

    CPPUNIT_TEST(swap);
    CPPUNIT_TEST(swap_2args);
    CPPUNIT_TEST(operator_equal_RefPtr_RefPtr);
    CPPUNIT_TEST(operator_equal_RefPtr_U);
    CPPUNIT_TEST(operator_equal_T_RefPtr);
    CPPUNIT_TEST(operator_diff_RefPtr_RefPtr);
    CPPUNIT_TEST(operator_diff_RefPtr_U);
    CPPUNIT_TEST(operator_diff_T_RefPtr);
    CPPUNIT_TEST(static_pointer_cast);
    CPPUNIT_TEST(const_pointer_cast);
    CPPUNIT_TEST(getPtr);
 
    CPPUNIT_TEST_SUITE_END();

    public:
    void RefPtr() CPPU_NOT_IMPLEMENTED
    void RefPtr_T() CPPU_NOT_IMPLEMENTED
    void RefPtr_RefPtr() CPPU_NOT_IMPLEMENTED
    void RefPtr_PassRefPtr() CPPU_NOT_IMPLEMENTED
    void RefPtr_PlacementNewAdoptType() CPPU_NOT_IMPLEMENTED

    void RefPtr_HashTableDeletedValueType() CPPU_NOT_IMPLEMENTED
    void RefPtr_RefPtr_U() CPPU_NOT_IMPLEMENTED
    void isHashTableDeletedValue() CPPU_NOT_IMPLEMENTED

    void destruct_RefPtr() CPPU_NOT_IMPLEMENTED
        
        
    void get() CPPU_NOT_IMPLEMENTED
        
    void clear() CPPU_NOT_IMPLEMENTED
    void release() CPPU_NOT_IMPLEMENTED

    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator_ptr() CPPU_NOT_IMPLEMENTED
        
    void operator_not() CPPU_NOT_IMPLEMENTED
    
    void operator_UnspecifiedBoolType() CPPU_NOT_IMPLEMENTED
        
    void operator_copy() CPPU_NOT_IMPLEMENTED
    void operator_copy_T() CPPU_NOT_IMPLEMENTED
    void operator_copy_PassRefPtr_T() CPPU_NOT_IMPLEMENTED
    void operator_copy_RefPtr_U() CPPU_NOT_IMPLEMENTED
    void operator_copy_PassRefPtr_U() CPPU_NOT_IMPLEMENTED

    void swap() CPPU_NOT_IMPLEMENTED
    void swap_2args() CPPU_NOT_IMPLEMENTED
    void operator_equal_RefPtr_RefPtr() CPPU_NOT_IMPLEMENTED
    void operator_equal_RefPtr_U() CPPU_NOT_IMPLEMENTED
    void operator_equal_T_RefPtr() CPPU_NOT_IMPLEMENTED
    void operator_diff_RefPtr_RefPtr() CPPU_NOT_IMPLEMENTED
    void operator_diff_RefPtr_U() CPPU_NOT_IMPLEMENTED
    void operator_diff_T_RefPtr() CPPU_NOT_IMPLEMENTED
    void static_pointer_cast() CPPU_NOT_IMPLEMENTED
    void const_pointer_cast() CPPU_NOT_IMPLEMENTED
    void getPtr() CPPU_NOT_IMPLEMENTED
    };
    

#endif // WTF_RefPtr_h

