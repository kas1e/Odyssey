#ifndef Base64Test_h_CPPUNIT
#define Base64Test_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCBase64.h"
class Base64TestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( Base64TestTest );
//register each method:
    CPPUNIT_TEST(base64Encode);

    CPPUNIT_TEST_SUITE_END();



    void base64Encode() CPPU_NOT_IMPLEMENTED


};

#endif // Base64_h

