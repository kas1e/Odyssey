#ifndef IntSizeHashTest_h_CPPUNIT
#define IntSizeHashTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCIntSizeHash.h"
class IntSizeHashTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( IntSizeHashTestTest );
//register each method:
    CPPUNIT_TEST(hash);
    CPPUNIT_TEST(equal);
    CPPUNIT_TEST(constructDeletedValue);
    CPPUNIT_TEST(isDeletedValue);

    CPPUNIT_TEST_SUITE_END();


    void hash() CPPU_NOT_IMPLEMENTED
    void equal() CPPU_NOT_IMPLEMENTED
    void constructDeletedValue() CPPU_NOT_IMPLEMENTED
    void isDeletedValue() CPPU_NOT_IMPLEMENTED
    };

#endif

