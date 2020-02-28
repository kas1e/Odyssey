#ifndef LanguageTest_h_CPPUNIT
#define LanguageTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCLanguage.h"
class LanguageTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( LanguageTestTest );
//register each method:
	CPPUNIT_TEST(defaultLanguage);
    CPPUNIT_TEST_SUITE_END();

    void defaultLanguage() CPPU_NOT_IMPLEMENTED
};


#endif 

