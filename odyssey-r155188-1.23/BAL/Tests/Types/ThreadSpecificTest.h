#ifndef ThreadSpecificTest_h_CPPUNIT
#define ThreadSpecificTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include <Platform.h>
#include "BCThreadSpecific.h"
class ThreadSpecificTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ThreadSpecificTestTest );
//register each method:
    CPPUNIT_TEST(ThreadSpecific);
    CPPUNIT_TEST(operator_ptr);
    CPPUNIT_TEST(operator_T);
    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(destruct_ThreadSpecific);


    CPPUNIT_TEST_SUITE_END();



public:
    void ThreadSpecific() CPPU_NOT_IMPLEMENTED
    void operator_ptr() CPPU_NOT_IMPLEMENTED
    void operator_T() CPPU_NOT_IMPLEMENTED
    void operator_star() CPPU_NOT_IMPLEMENTED
    void destruct_ThreadSpecific() CPPU_NOT_IMPLEMENTED

};


#endif

