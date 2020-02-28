#ifndef HTTPParsersTest_h_CPPUNIT
#define HTTPParsersTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCHTTPParsers.h"
class HTTPParsersTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( HTTPParsersTestTest );
//register each method:
    CPPUNIT_TEST(parseHTTPRefresh);
    CPPUNIT_TEST(filenameFromHTTPContentDisposition);
    CPPUNIT_TEST(extractMIMETypeFromMediaType);
    CPPUNIT_TEST(extractCharsetFromMediaType);

    CPPUNIT_TEST_SUITE_END();


    void parseHTTPRefresh() CPPU_NOT_IMPLEMENTED
    void filenameFromHTTPContentDisposition() CPPU_NOT_IMPLEMENTED
    void extractMIMETypeFromMediaType() CPPU_NOT_IMPLEMENTED
    void extractCharsetFromMediaType() CPPU_NOT_IMPLEMENTED
};

#endif

