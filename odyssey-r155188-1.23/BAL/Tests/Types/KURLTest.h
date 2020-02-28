#ifndef KURLTest_h_CPPUNIT
#define KURLTest_h_CPPUNIT

#include "config.h"
#include <cppunit/extensions/HelperMacros.h>
#include "BCKURL.h"
class KURLTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( KURLTestTest );
//register each method:
    CPPUNIT_TEST(KURL);
    CPPUNIT_TEST(KURL_char);
    CPPUNIT_TEST(KURL_String);
    CPPUNIT_TEST(KURL_relative);
    CPPUNIT_TEST(KURL_TextEncoding);
    CPPUNIT_TEST(isNull);
    CPPUNIT_TEST(isEmpty);
    CPPUNIT_TEST(isValid);
    CPPUNIT_TEST(hasPath);
    CPPUNIT_TEST(string);
    CPPUNIT_TEST(protocol);
    CPPUNIT_TEST(host);
    CPPUNIT_TEST(port);
    CPPUNIT_TEST(user);
    CPPUNIT_TEST(pass);
    CPPUNIT_TEST(path);
    CPPUNIT_TEST(lastPathComponent);
    CPPUNIT_TEST(query);
    CPPUNIT_TEST(ref);
    CPPUNIT_TEST(hasRef);
    CPPUNIT_TEST(prettyURL);
    CPPUNIT_TEST(fileSystemPath);
    CPPUNIT_TEST(protocolIs);
    CPPUNIT_TEST(isLocalFile);
    CPPUNIT_TEST(setProtocol);
    CPPUNIT_TEST(setHost);
    CPPUNIT_TEST(setPort);
    CPPUNIT_TEST(setHostAndPort);
    CPPUNIT_TEST(setUser);
    CPPUNIT_TEST(setPass);
    CPPUNIT_TEST(setPath);
    CPPUNIT_TEST(setQuery);
    CPPUNIT_TEST(setRef);
    CPPUNIT_TEST(operator_const_String);
    CPPUNIT_TEST(operator_KJS__UString);
    CPPUNIT_TEST(hostStart);
    CPPUNIT_TEST(hostEnd);
    CPPUNIT_TEST(pathStart);
    CPPUNIT_TEST(pathEnd);
    CPPUNIT_TEST(pathAfterLastSlash);


    CPPUNIT_TEST(operator_equal_KURL_KURL);
    CPPUNIT_TEST(operator_equal_KURL_String);
    CPPUNIT_TEST(operator_equal_String_KURL);
    CPPUNIT_TEST(operator_diff_KURL_KURL);
    CPPUNIT_TEST(operator_diff_KURL_String);
    CPPUNIT_TEST(operator_diff_String_KURL);

    CPPUNIT_TEST(equalIgnoringRef);
    CPPUNIT_TEST(protocolHostAndPortAreEqual);
    
    CPPUNIT_TEST(blankURL);

    CPPUNIT_TEST(decodeURLEscapeSequences);
    CPPUNIT_TEST(decodeURLEscapeSequences_TextEncoding);

    CPPUNIT_TEST(encodeWithURLEscapeSequences);

    CPPUNIT_TEST_SUITE_END();

public:
    void KURL() CPPU_NOT_IMPLEMENTED
    void KURL_char() CPPU_NOT_IMPLEMENTED
    void KURL_String() CPPU_NOT_IMPLEMENTED
    void KURL_relative() CPPU_NOT_IMPLEMENTED
    void KURL_TextEncoding() CPPU_NOT_IMPLEMENTED
    void isNull() CPPU_NOT_IMPLEMENTED
    void isEmpty() CPPU_NOT_IMPLEMENTED
    void isValid() CPPU_NOT_IMPLEMENTED
    void hasPath() CPPU_NOT_IMPLEMENTED
    void string() CPPU_NOT_IMPLEMENTED
    void protocol() CPPU_NOT_IMPLEMENTED
    void host() CPPU_NOT_IMPLEMENTED
    void port() CPPU_NOT_IMPLEMENTED
    void user() CPPU_NOT_IMPLEMENTED
    void pass() CPPU_NOT_IMPLEMENTED
    void path() CPPU_NOT_IMPLEMENTED
    void lastPathComponent() CPPU_NOT_IMPLEMENTED
    void query() CPPU_NOT_IMPLEMENTED
    void ref() CPPU_NOT_IMPLEMENTED
    void hasRef() CPPU_NOT_IMPLEMENTED
    void prettyURL() CPPU_NOT_IMPLEMENTED
    void fileSystemPath() CPPU_NOT_IMPLEMENTED
    void protocolIs() CPPU_NOT_IMPLEMENTED
    void isLocalFile() CPPU_NOT_IMPLEMENTED
    void setProtocol() CPPU_NOT_IMPLEMENTED
    void setHost() CPPU_NOT_IMPLEMENTED
    void setPort() CPPU_NOT_IMPLEMENTED
    void setHostAndPort() CPPU_NOT_IMPLEMENTED
    void setUser() CPPU_NOT_IMPLEMENTED
    void setPass() CPPU_NOT_IMPLEMENTED
    void setPath() CPPU_NOT_IMPLEMENTED
    void setQuery() CPPU_NOT_IMPLEMENTED
    void setRef() CPPU_NOT_IMPLEMENTED
    void operator_const_String() CPPU_NOT_IMPLEMENTED
    void operator_KJS__UString() CPPU_NOT_IMPLEMENTED
    void hostStart() CPPU_NOT_IMPLEMENTED
    void hostEnd() CPPU_NOT_IMPLEMENTED
    void pathStart() CPPU_NOT_IMPLEMENTED
    void pathEnd() CPPU_NOT_IMPLEMENTED
    void pathAfterLastSlash() CPPU_NOT_IMPLEMENTED


    void operator_equal_KURL_KURL() CPPU_NOT_IMPLEMENTED
    void operator_equal_KURL_String() CPPU_NOT_IMPLEMENTED
    void operator_equal_String_KURL() CPPU_NOT_IMPLEMENTED
    void operator_diff_KURL_KURL() CPPU_NOT_IMPLEMENTED
    void operator_diff_KURL_String() CPPU_NOT_IMPLEMENTED
    void operator_diff_String_KURL() CPPU_NOT_IMPLEMENTED

    void equalIgnoringRef() CPPU_NOT_IMPLEMENTED
    void protocolHostAndPortAreEqual() CPPU_NOT_IMPLEMENTED
    
    void blankURL() CPPU_NOT_IMPLEMENTED

    void decodeURLEscapeSequences() CPPU_NOT_IMPLEMENTED
    void decodeURLEscapeSequences_TextEncoding() CPPU_NOT_IMPLEMENTED

    void encodeWithURLEscapeSequences() CPPU_NOT_IMPLEMENTED

};

#endif // KURL_h

