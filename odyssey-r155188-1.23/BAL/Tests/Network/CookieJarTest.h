#ifndef CookieJarTest_h_CPPUNIT
#define CookieJarTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "Platform.h"
#include "BCCookieJar.h"
class CookieJarTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( CookieJarTestTest );
//register each method:
    CPPUNIT_TEST(cookies);
    CPPUNIT_TEST(setCookies);
    CPPUNIT_TEST(cookiesEnabled);

    CPPUNIT_TEST_SUITE_END();

    public:
    void cookies() CPPU_NOT_IMPLEMENTED
    void setCookies() CPPU_NOT_IMPLEMENTED
    void cookiesEnabled() CPPU_NOT_IMPLEMENTED
};

#endif

