#include <Platform.h>
#if PLATFORM(MAC)

#ifndef RetainPtrTest_h_CPPUNIT
#define RetainPtrTest_h_CPPUNIT
#include <cppunit/extensions/HelperMacros.h>
#include "BCRetainPtr.h"
class RetainPtrTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( RetainPtrTestTest );
//register each method:

    CPPUNIT_TEST(RetainPtr);
    CPPUNIT_TEST(RetainPtr_PtrType);

    CPPUNIT_TEST(RetainPtr_AdoptCFTag);
    CPPUNIT_TEST(RetainPtr_AdoptNSTag);
        
    CPPUNIT_TEST(RetainPtr_RetainPtr);
    CPPUNIT_TEST(RetainPtr_RetainPtr_U);

    CPPUNIT_TEST(dsstruct_RetainPtr);
        
        
    CPPUNIT_TEST(get);
        
    CPPUNIT_TEST(releaseRef);
        
    CPPUNIT_TEST(operator_ptr);
        
    CPPUNIT_TEST(operator_not);
    
    CPPUNIT_TEST(operator_UnspecifiedBoolType);
        
    CPPUNIT_TEST(operator_copy_RetainPtr);
    CPPUNIT_TEST(operator_copy_RetainPtr_U);
    CPPUNIT_TEST(operator_copy_PtrType);
    CPPUNIT_TEST(operator_copy_U);

    CPPUNIT_TEST(adoptCF);
    CPPUNIT_TEST(adoptNS);
        
    CPPUNIT_TEST(swap);
    CPPUNIT_TEST(swap_2args);

    CPPUNIT_TEST(operator_equal_RetainPtr_RetainPtr);
    CPPUNIT_TEST(operator_equal_RetainPtr_U);
    CPPUNIT_TEST(operator_equal_T_RetainPtr);
    CPPUNIT_TEST(operator_diff_RetainPtr_RetainPtr);
    CPPUNIT_TEST(operator_diff_RetainPtr_U);
    CPPUNIT_TEST(operator_diff_T_RetainPtr);
 
    CPPUNIT_TEST_SUITE_END();

    public:

    void RetainPtr() CPPU_NOT_IMPLEMENTED
    void RetainPtr_PtrType() CPPU_NOT_IMPLEMENTED

    void RetainPtr_AdoptCFTag() CPPU_NOT_IMPLEMENTED
    void RetainPtr_AdoptNSTag() CPPU_NOT_IMPLEMENTED
        
    void RetainPtr_RetainPtr() CPPU_NOT_IMPLEMENTED
    void RetainPtr_RetainPtr_U() CPPU_NOT_IMPLEMENTED

    void dsstruct_RetainPtr() CPPU_NOT_IMPLEMENTED
        
        
    void get() CPPU_NOT_IMPLEMENTED
        
    void releaseRef() CPPU_NOT_IMPLEMENTED
        
    void operator_ptr() CPPU_NOT_IMPLEMENTED
        
    void operator_not() CPPU_NOT_IMPLEMENTED
    
    void operator_UnspecifiedBoolType() CPPU_NOT_IMPLEMENTED
        
    void operator_copy_RetainPtr() CPPU_NOT_IMPLEMENTED
    void operator_copy_RetainPtr_U() CPPU_NOT_IMPLEMENTED
    void operator_copy_PtrType() CPPU_NOT_IMPLEMENTED
    void operator_copy_U() CPPU_NOT_IMPLEMENTED

    void adoptCF() CPPU_NOT_IMPLEMENTED
    void adoptNS() CPPU_NOT_IMPLEMENTED
        
    void swap() CPPU_NOT_IMPLEMENTED
    void swap_2args() CPPU_NOT_IMPLEMENTED

    void operator_equal_RetainPtr_RetainPtr() CPPU_NOT_IMPLEMENTED
    void operator_equal_RetainPtr_U() CPPU_NOT_IMPLEMENTED
    void operator_equal_T_RetainPtr() CPPU_NOT_IMPLEMENTED
    void operator_diff_RetainPtr_RetainPtr() CPPU_NOT_IMPLEMENTED
    void operator_diff_RetainPtr_U() CPPU_NOT_IMPLEMENTED
    void operator_diff_T_RetainPtr() CPPU_NOT_IMPLEMENTED
    };
#endif // WTF_RetainPtr_h

#endif    
