#ifndef SQLValue_h_CPPUNIT
#define SQLValue_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSQLValue.h"
class SQLValueTest: public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SQLValueTest );
//register each method:
    CPPUNIT_TEST(type);
    CPPUNIT_TEST(string);
    CPPUNIT_TEST(number);
    CPPUNIT_TEST_SUITE_END();



    public:
        void type() CPPU_NOT_IMPLEMENTED
        void string() CPPU_NOT_IMPLEMENTED
        void number() CPPU_NOT_IMPLEMENTED

};

#endif
