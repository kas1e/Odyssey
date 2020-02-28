#ifndef StringTruncatorTest_h_CPPUNIT
#define StringTruncatorTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCStringTruncator.h"
class StringTruncatorTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( StringTruncatorTestTest );
//register each method:
    CPPUNIT_TEST(centerTruncate);
    CPPUNIT_TEST(rightTruncate);
    CPPUNIT_TEST(width);

    CPPUNIT_TEST_SUITE_END();
    public:
    void centerTruncate() CPPU_NOT_IMPLEMENTED
    void rightTruncate() CPPU_NOT_IMPLEMENTED
    void width() CPPU_NOT_IMPLEMENTED
    };
    

#endif // !defined(StringTruncator_h)

