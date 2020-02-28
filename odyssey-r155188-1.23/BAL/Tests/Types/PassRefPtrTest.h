#ifndef PassRefPtrTest_h_CPPUNIT
#define PassRefPtrTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCPassRefPtr.h"
class PassRefPtrTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( PassRefPtrTestTest );
//register each method:
    CPPUNIT_TEST(PassRefPtr);
    CPPUNIT_TEST(PassRefPtr_ptr);
    CPPUNIT_TEST(PassRefPtr_copy);
    CPPUNIT_TEST(PassRefPtr_copy2);
    CPPUNIT_TEST(destruct_PassRefPtr);
    CPPUNIT_TEST(get);
    CPPUNIT_TEST(clear);
    CPPUNIT_TEST(releaseRef);
    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator_ptr);
    CPPUNIT_TEST(operator_not);
    CPPUNIT_TEST(operator_UnspecifiedBoolType);
        
    CPPUNIT_TEST(operator_copy);
    CPPUNIT_TEST(operator_copy_PassRefPtr);
    CPPUNIT_TEST(operator_copy_PassRefPtr_U);
    CPPUNIT_TEST(operator_copy_RefPtr);

    CPPUNIT_TEST(operator_equal_PassRefPtr_PassRefPtr);
    CPPUNIT_TEST(operator_equal_PassRefPtr_RefPtr);
    CPPUNIT_TEST(operator_equal_RefPtr_PassRefPtr);
    CPPUNIT_TEST(operator_equal_PassRefPtr_U);
    CPPUNIT_TEST(operator_equal_T_PassRefPtr);
    CPPUNIT_TEST(operator_diff_PassRefPtr_PassRefPtr);
    CPPUNIT_TEST(operator_diff_PassRefPtr_RefPtr);
    CPPUNIT_TEST(operator_diff_RefPtr_PassRefPtr);
    CPPUNIT_TEST(operator_diff_PassRefPtr_U);
    CPPUNIT_TEST(operator_diff_T_PassRefPtr);
    CPPUNIT_TEST(adoptRef);
    CPPUNIT_TEST(static_pointer_cast);
    CPPUNIT_TEST(const_pointer_cast);
    CPPUNIT_TEST(getPtr);


    CPPUNIT_TEST_SUITE_END();

    public:
    void PassRefPtr() CPPU_NOT_IMPLEMENTED
    void PassRefPtr_ptr() CPPU_NOT_IMPLEMENTED
    void PassRefPtr_copy() CPPU_NOT_IMPLEMENTED
    void PassRefPtr_copy2() CPPU_NOT_IMPLEMENTED
    void destruct_PassRefPtr() CPPU_NOT_IMPLEMENTED
    void get() CPPU_NOT_IMPLEMENTED
    void clear() CPPU_NOT_IMPLEMENTED
    void releaseRef() CPPU_NOT_IMPLEMENTED
    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator_ptr() CPPU_NOT_IMPLEMENTED
    void operator_not() CPPU_NOT_IMPLEMENTED
    void operator_UnspecifiedBoolType() CPPU_NOT_IMPLEMENTED
        
    void operator_copy() CPPU_NOT_IMPLEMENTED
    void operator_copy_PassRefPtr() CPPU_NOT_IMPLEMENTED
    void operator_copy_PassRefPtr_U() CPPU_NOT_IMPLEMENTED
    void operator_copy_RefPtr() CPPU_NOT_IMPLEMENTED

    void operator_equal_PassRefPtr_PassRefPtr() CPPU_NOT_IMPLEMENTED
    void operator_equal_PassRefPtr_RefPtr() CPPU_NOT_IMPLEMENTED
    void operator_equal_RefPtr_PassRefPtr() CPPU_NOT_IMPLEMENTED
    void operator_equal_PassRefPtr_U() CPPU_NOT_IMPLEMENTED
    void operator_equal_T_PassRefPtr() CPPU_NOT_IMPLEMENTED
    void operator_diff_PassRefPtr_PassRefPtr() CPPU_NOT_IMPLEMENTED
    void operator_diff_PassRefPtr_RefPtr() CPPU_NOT_IMPLEMENTED
    void operator_diff_RefPtr_PassRefPtr() CPPU_NOT_IMPLEMENTED
    void operator_diff_PassRefPtr_U() CPPU_NOT_IMPLEMENTED
    void operator_diff_T_PassRefPtr() CPPU_NOT_IMPLEMENTED
    void adoptRef() CPPU_NOT_IMPLEMENTED
    void static_pointer_cast() CPPU_NOT_IMPLEMENTED
    void const_pointer_cast() CPPU_NOT_IMPLEMENTED
    void getPtr() CPPU_NOT_IMPLEMENTED

    };
    

#endif // WTF_PassRefPtr_h

