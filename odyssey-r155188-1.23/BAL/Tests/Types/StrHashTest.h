#if 0
//removed because deprecated by r255
#ifndef StrHashTest_h_CPPUNIT
#define StrHashTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCStrHash.h"
class StrHashTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( StrHashTestTest );
//register each method:
    CPPUNIT_TEST(hash);
    CPPUNIT_TEST(equal);

    CPPUNIT_TEST_SUITE_END();

    void hash() CPPU_NOT_IMPLEMENTED
    void equal() CPPU_NOT_IMPLEMENTED
};
#endif // WTF_StrHash_h
#endif
