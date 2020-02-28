#ifndef FormDataStreamCurlTest_h_CPPUNIT
#define FormDataStreamCurlTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCFormDataStream.h"
class FormDataStreamCurlTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( FormDataStreamCurlTestTest );
//register each method:
    CPPUNIT_TEST(FormDataStream);
    CPPUNIT_TEST(destruct_FormDataStream);
    CPPUNIT_TEST(read);

    CPPUNIT_TEST_SUITE_END();

public:
    void FormDataStream() CPPU_NOT_IMPLEMENTED
    void destruct_FormDataStream() CPPU_NOT_IMPLEMENTED
    void read() CPPU_NOT_IMPLEMENTED
};


#endif // FormDataStreamCurl_h

