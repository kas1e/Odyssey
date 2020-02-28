#ifndef RegularExpressionTest_h_CPPUNIT
#define RegularExpressionTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCRegularExpression.h"
class RegularExpressionTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( RegularExpressionTestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);

    CPPUNIT_TEST(pattern);
    CPPUNIT_TEST(match);

    CPPUNIT_TEST(search);
    CPPUNIT_TEST(searchRev);

    CPPUNIT_TEST(pos);
    CPPUNIT_TEST(matchedLength);

    CPPUNIT_TEST(replace);


    CPPUNIT_TEST_SUITE_END();


//class RegularExpression {
public:

    void constructors() CPPU_NOT_IMPLEMENTED
    void destructors() CPPU_NOT_IMPLEMENTED

    void pattern() CPPU_NOT_IMPLEMENTED
    void match() CPPU_NOT_IMPLEMENTED

    void search() CPPU_NOT_IMPLEMENTED
    void searchRev() CPPU_NOT_IMPLEMENTED

    void pos() CPPU_NOT_IMPLEMENTED
    void matchedLength() CPPU_NOT_IMPLEMENTED

    void replace() CPPU_NOT_IMPLEMENTED

};
#endif // RegularExpression_h

