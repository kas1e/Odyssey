#ifndef ResourceRequestBaseTest_h_CPPUNIT
#define ResourceRequestBaseTest_h_CPPUNIT

#include "config.h"
#include <cppunit/extensions/HelperMacros.h>
#include "BCResourceRequestBase.h"
class ResourceRequestBaseTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ResourceRequestBaseTestTest );
//register each method:
    CPPUNIT_TEST(isNull);
    CPPUNIT_TEST(isEmpty);

    CPPUNIT_TEST(url);
    CPPUNIT_TEST(setURL);

    CPPUNIT_TEST(cachePolicy);
    CPPUNIT_TEST(setCachePolicy);
        
    CPPUNIT_TEST(timeoutInterval);
    CPPUNIT_TEST(setTimeoutInterval);
        
    CPPUNIT_TEST(mainDocumentURL);
    CPPUNIT_TEST(setMainDocumentURL);
        
    CPPUNIT_TEST(httpMethod);
    CPPUNIT_TEST(setHTTPMethod);
        
    CPPUNIT_TEST(httpHeaderFields);
    CPPUNIT_TEST(httpHeaderField);
    CPPUNIT_TEST(setHTTPHeaderField);
    CPPUNIT_TEST(addHTTPHeaderField);
    CPPUNIT_TEST(addHTTPHeaderFields);
        
    CPPUNIT_TEST(httpContentType);
    CPPUNIT_TEST(setHTTPContentType);
        
    CPPUNIT_TEST(httpReferrer);
    CPPUNIT_TEST(setHTTPReferrer);
    CPPUNIT_TEST(clearHTTPReferrer);
        
    CPPUNIT_TEST(httpUserAgent);
    CPPUNIT_TEST(setHTTPUserAgent);

    CPPUNIT_TEST(httpAccept);
    CPPUNIT_TEST(setHTTPAccept);

    CPPUNIT_TEST(httpBody);
    CPPUNIT_TEST(setHTTPBody);
        
    CPPUNIT_TEST(allowHTTPCookies);
    CPPUNIT_TEST(setAllowHTTPCookies);

    CPPUNIT_TEST(isConditional);
        
    CPPUNIT_TEST(equalIgnoringHeaderFields);

    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);


    CPPUNIT_TEST_SUITE_END();


    public:
    void isNull() CPPU_NOT_IMPLEMENTED
    void isEmpty() CPPU_NOT_IMPLEMENTED

    void url() CPPU_NOT_IMPLEMENTED
    void setURL() CPPU_NOT_IMPLEMENTED

    void cachePolicy() CPPU_NOT_IMPLEMENTED
    void setCachePolicy() CPPU_NOT_IMPLEMENTED
        
    void timeoutInterval() CPPU_NOT_IMPLEMENTED
    void setTimeoutInterval() CPPU_NOT_IMPLEMENTED
        
    void mainDocumentURL() CPPU_NOT_IMPLEMENTED
    void setMainDocumentURL() CPPU_NOT_IMPLEMENTED
        
    void httpMethod() CPPU_NOT_IMPLEMENTED
    void setHTTPMethod() CPPU_NOT_IMPLEMENTED
        
    void httpHeaderFields() CPPU_NOT_IMPLEMENTED
    void httpHeaderField() CPPU_NOT_IMPLEMENTED
    void setHTTPHeaderField() CPPU_NOT_IMPLEMENTED
    void addHTTPHeaderField() CPPU_NOT_IMPLEMENTED
    void addHTTPHeaderFields() CPPU_NOT_IMPLEMENTED
        
    void httpContentType() CPPU_NOT_IMPLEMENTED
    void setHTTPContentType() CPPU_NOT_IMPLEMENTED
        
    void httpReferrer() CPPU_NOT_IMPLEMENTED
    void setHTTPReferrer() CPPU_NOT_IMPLEMENTED
    void clearHTTPReferrer() CPPU_NOT_IMPLEMENTED
        
    void httpUserAgent() CPPU_NOT_IMPLEMENTED
    void setHTTPUserAgent() CPPU_NOT_IMPLEMENTED

    void httpAccept() CPPU_NOT_IMPLEMENTED
    void setHTTPAccept() CPPU_NOT_IMPLEMENTED

    void httpBody() CPPU_NOT_IMPLEMENTED
    void setHTTPBody() CPPU_NOT_IMPLEMENTED
        
    void allowHTTPCookies() CPPU_NOT_IMPLEMENTED
    void setAllowHTTPCookies() CPPU_NOT_IMPLEMENTED

    void isConditional() CPPU_NOT_IMPLEMENTED
        
    void equalIgnoringHeaderFields() CPPU_NOT_IMPLEMENTED

    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED


};

#endif // ResourceRequestBase_h

