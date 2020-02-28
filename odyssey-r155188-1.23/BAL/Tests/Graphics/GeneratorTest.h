#ifndef GeneratorTest_h_CPPUNIT
#define GeneratorTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCGenerator.h"
class GeneratorTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( GeneratorTestTest );
//register each method:
    CPPUNIT_TEST(destruct_Generator);
    CPPUNIT_TEST(fill);

    CPPUNIT_TEST_SUITE_END();


public:
    void destruct_Generator() CPPU_NOT_IMPLEMENTED
    void fill() CPPU_NOT_IMPLEMENTED
};


#endif

