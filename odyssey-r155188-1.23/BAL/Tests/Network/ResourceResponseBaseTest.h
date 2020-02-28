#ifndef ResourceResponseBaseTest_h_CPPUNIT
#define ResourceResponseBaseTest_h_CPPUNIT

#include "config.h"
#include <cppunit/extensions/HelperMacros.h>
#include "BCResourceResponseBase.h"
class ResourceResponseBaseTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ResourceResponseBaseTestTest );
//register each method:
    CPPUNIT_TEST(isNull);
    CPPUNIT_TEST(isHTTP);
    CPPUNIT_TEST(url);
    CPPUNIT_TEST(setUrl);

    CPPUNIT_TEST(mimeType);
    CPPUNIT_TEST(setMimeType);

    CPPUNIT_TEST(expectedContentLength);
    CPPUNIT_TEST(setExpectedContentLength);

    CPPUNIT_TEST(textEncodingName);
    CPPUNIT_TEST(setTextEncodingName);
    CPPUNIT_TEST(suggestedFilename);
    CPPUNIT_TEST(setSuggestedFilename);

    CPPUNIT_TEST(httpStatusCode);
    CPPUNIT_TEST(setHTTPStatusCode);
    
    CPPUNIT_TEST(httpStatusText);
    CPPUNIT_TEST(setHTTPStatusText);
    
    CPPUNIT_TEST(httpHeaderField);
    CPPUNIT_TEST(setHTTPHeaderField);
    CPPUNIT_TEST(httpHeaderFields);

    CPPUNIT_TEST(isMultipart);

    CPPUNIT_TEST(isAttachment);

    CPPUNIT_TEST(setExpirationDate);
    CPPUNIT_TEST(expirationDate);

    CPPUNIT_TEST(setLastModifiedDate);
    CPPUNIT_TEST(lastModifiedDate);

    CPPUNIT_TEST(compare);

    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);


    CPPUNIT_TEST_SUITE_END();


 public:
    void isNull() CPPU_NOT_IMPLEMENTED
    void isHTTP() CPPU_NOT_IMPLEMENTED
    void url() CPPU_NOT_IMPLEMENTED
    void setUrl() CPPU_NOT_IMPLEMENTED

    void mimeType() CPPU_NOT_IMPLEMENTED
    void setMimeType() CPPU_NOT_IMPLEMENTED

    void expectedContentLength() CPPU_NOT_IMPLEMENTED
    void setExpectedContentLength() CPPU_NOT_IMPLEMENTED

    void textEncodingName() CPPU_NOT_IMPLEMENTED
    void setTextEncodingName() CPPU_NOT_IMPLEMENTED
    void suggestedFilename() CPPU_NOT_IMPLEMENTED
    void setSuggestedFilename() CPPU_NOT_IMPLEMENTED

    void httpStatusCode() CPPU_NOT_IMPLEMENTED
    void setHTTPStatusCode() CPPU_NOT_IMPLEMENTED
    
    void httpStatusText() CPPU_NOT_IMPLEMENTED
    void setHTTPStatusText() CPPU_NOT_IMPLEMENTED
    
    void httpHeaderField() CPPU_NOT_IMPLEMENTED
    void setHTTPHeaderField() CPPU_NOT_IMPLEMENTED
    void httpHeaderFields() CPPU_NOT_IMPLEMENTED

    void isMultipart() CPPU_NOT_IMPLEMENTED

    void isAttachment() CPPU_NOT_IMPLEMENTED

    void setExpirationDate() CPPU_NOT_IMPLEMENTED
    void expirationDate() CPPU_NOT_IMPLEMENTED

    void setLastModifiedDate() CPPU_NOT_IMPLEMENTED
    void lastModifiedDate() CPPU_NOT_IMPLEMENTED

    void compare() CPPU_NOT_IMPLEMENTED

    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED


};


#endif // ResourceResponseBase_h

