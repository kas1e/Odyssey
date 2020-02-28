#ifndef ResourceErrorBaseTest_h_CPPUNIT
#define ResourceErrorBaseTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCResourceErrorBase.h"
class ResourceErrorBaseTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ResourceErrorBaseTestTest );
//register each method:
    CPPUNIT_TEST(isNull);

    CPPUNIT_TEST(domain);
    CPPUNIT_TEST(errorCode);
    CPPUNIT_TEST(failingURL);
    CPPUNIT_TEST(localizedDescription);

    CPPUNIT_TEST(setIsCancellation);
    CPPUNIT_TEST(isCancellation);

    CPPUNIT_TEST(compare);

    CPPUNIT_TEST(operator_eq);
    CPPUNIT_TEST(operator_diff);
    CPPUNIT_TEST_SUITE_END();



public:
    void isNull() CPPU_NOT_IMPLEMENTED

    void domain() CPPU_NOT_IMPLEMENTED
    void errorCode() CPPU_NOT_IMPLEMENTED
    void failingURL() CPPU_NOT_IMPLEMENTED
    void localizedDescription() CPPU_NOT_IMPLEMENTED

    void setIsCancellation() CPPU_NOT_IMPLEMENTED
    void isCancellation() CPPU_NOT_IMPLEMENTED

    void compare() CPPU_NOT_IMPLEMENTED

    void operator_eq() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED
};



#endif // ResourceErrorBase_h_

