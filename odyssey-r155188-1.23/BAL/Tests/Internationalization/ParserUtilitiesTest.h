#ifndef ParserUtilitiesTest_h_CPPUNIT
#define ParserUtilitiesTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCParserUtilities.h"
class ParserUtilitiesTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ParserUtilitiesTestTest );
//register each method:

    CPPUNIT_TEST(skipString);
    CPPUNIT_TEST_SUITE_END();



    void skipString() CPPU_NOT_IMPLEMENTED
};

#endif // ParserUtilities_h

