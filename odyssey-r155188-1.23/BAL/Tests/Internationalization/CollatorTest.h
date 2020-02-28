#ifndef CollatorTest_h_CPPUNIT
#define CollatorTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include <Platform.h>
#include "BCCollator.h"
class CollatorTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( CollatorTestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);

    CPPUNIT_TEST(setOrderLowerFirst);
    CPPUNIT_TEST(userDefault);
    CPPUNIT_TEST(collate);


    CPPUNIT_TEST_SUITE_END();


public:

    void constructors() CPPU_NOT_IMPLEMENTED
    void destructors() CPPU_NOT_IMPLEMENTED

    void setOrderLowerFirst() CPPU_NOT_IMPLEMENTED
    void userDefault() CPPU_NOT_IMPLEMENTED
    void collate() CPPU_NOT_IMPLEMENTED

    };


#endif

