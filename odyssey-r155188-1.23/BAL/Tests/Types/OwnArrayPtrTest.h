#ifndef OwnArrayPtrTest_h_CPPUNIT
#define OwnArrayPtrTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCOwnArrayPtr.h"
class OwnArrayPtrTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( OwnArrayPtrTestTest );
//register each method:
    CPPUNIT_TEST(OwnArrayPtr);
    CPPUNIT_TEST(destruct_OwnArrayPtr);
    CPPUNIT_TEST(get);
    CPPUNIT_TEST(release);
    CPPUNIT_TEST(set);
    CPPUNIT_TEST(clear);
    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator_ptr);
    CPPUNIT_TEST(operator__);
    CPPUNIT_TEST(operator_not);
    CPPUNIT_TEST(operator_UnspecifiedBoolType);
    CPPUNIT_TEST(swap);
    CPPUNIT_TEST(swap_2args);
    CPPUNIT_TEST(getPtr);
 
    CPPUNIT_TEST_SUITE_END();


    public:
    void OwnArrayPtr() CPPU_NOT_IMPLEMENTED
    void destruct_OwnArrayPtr() CPPU_NOT_IMPLEMENTED
    void get() CPPU_NOT_IMPLEMENTED
    void release() CPPU_NOT_IMPLEMENTED
    void set() CPPU_NOT_IMPLEMENTED
    void clear() CPPU_NOT_IMPLEMENTED
    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator_ptr() CPPU_NOT_IMPLEMENTED
    void operator__() CPPU_NOT_IMPLEMENTED
    void operator_not() CPPU_NOT_IMPLEMENTED
    void operator_UnspecifiedBoolType() CPPU_NOT_IMPLEMENTED
    void swap() CPPU_NOT_IMPLEMENTED
    void swap_2args() CPPU_NOT_IMPLEMENTED
    void getPtr() CPPU_NOT_IMPLEMENTED
    };
    

#endif // WTF_OwnArrayPtr_h

