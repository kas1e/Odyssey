#ifndef UnicodeRangeTest_h_CPPUNIT
#define UnicodeRangeTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCUnicodeRange.h"
class UnicodeRangeTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( UnicodeRangeTestTest );
//register each method:
    CPPUNIT_TEST(findCharUnicodeRange);
    CPPUNIT_TEST(langGroupFromUnicodeRange);

    CPPUNIT_TEST_SUITE_END();


    void findCharUnicodeRange() CPPU_NOT_IMPLEMENTED
    void langGroupFromUnicodeRange() CPPU_NOT_IMPLEMENTED

};

#endif // UnicodeRange_H

