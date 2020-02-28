#ifndef NoncopyableTest_h_CPPUNIT
#define NoncopyableTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCNoncopyable.h"
class NoncopyableTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( NoncopyableTestTest );
//register each method:
    CPPUNIT_TEST(Noncopyable);
    CPPUNIT_TEST(operator_copy);

    CPPUNIT_TEST_SUITE_END();

    void Noncopyable() CPPU_NOT_IMPLEMENTED
    void operator_copy() CPPU_NOT_IMPLEMENTED
    };



#endif // WTF_Noncopyable_h

