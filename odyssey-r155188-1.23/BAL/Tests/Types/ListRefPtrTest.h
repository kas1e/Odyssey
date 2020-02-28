#ifndef ListRefPtrTest_h_CPPUNIT
#define ListRefPtrTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCListRefPtr.h"
class ListRefPtrTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ListRefPtrTestTest );
//register each method:
    CPPUNIT_TEST(ListRefPtr);
    CPPUNIT_TEST(ListRefPtr_ptr);
    CPPUNIT_TEST(ListRefPtr_RefPtr);
    CPPUNIT_TEST(ListRefPtr_PassRefPtr);
    CPPUNIT_TEST(destruct_ListRefPtr);
    CPPUNIT_TEST(operator_copy_T);
    CPPUNIT_TEST(operator_copy_RefPtr);
    CPPUNIT_TEST(operator_copy_PassRefPtr);
    CPPUNIT_TEST(operator_copy_RefPtr_U);
    CPPUNIT_TEST(operator_copy_PassRefPtr_U);
    CPPUNIT_TEST(getPtr);
 
    CPPUNIT_TEST_SUITE_END();

    public:
    void ListRefPtr() CPPU_NOT_IMPLEMENTED
    void ListRefPtr_ptr() CPPU_NOT_IMPLEMENTED
    void ListRefPtr_RefPtr() CPPU_NOT_IMPLEMENTED
    void ListRefPtr_PassRefPtr() CPPU_NOT_IMPLEMENTED
    void destruct_ListRefPtr() CPPU_NOT_IMPLEMENTED
    void operator_copy_T() CPPU_NOT_IMPLEMENTED
    void operator_copy_RefPtr() CPPU_NOT_IMPLEMENTED
    void operator_copy_PassRefPtr() CPPU_NOT_IMPLEMENTED
    void operator_copy_RefPtr_U() CPPU_NOT_IMPLEMENTED
    void operator_copy_PassRefPtr_U() CPPU_NOT_IMPLEMENTED
    void getPtr() CPPU_NOT_IMPLEMENTED
    };



#endif // WTF_ListRefPtr_h

