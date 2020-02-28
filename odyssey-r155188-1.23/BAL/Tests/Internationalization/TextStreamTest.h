#ifndef TextStreamTest_h_CPPUNIT
#define TextStreamTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCTextStream.h"
class TextStreamTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( TextStreamTestTest );
//register each method:
    CPPUNIT_TEST(operator_leftInt);
    CPPUNIT_TEST(operator_leftUnsigned);
    CPPUNIT_TEST(operator_leftLong);
    CPPUNIT_TEST(operator_leftULong);
    CPPUNIT_TEST(operator_leftFloat);
    CPPUNIT_TEST(operator_leftDouble);
    CPPUNIT_TEST(operator_leftCharStar);
    CPPUNIT_TEST(operator_leftStringRef);

    CPPUNIT_TEST(release);


    CPPUNIT_TEST_SUITE_END();



//class TextStream {
public:
    void operator_leftInt() CPPU_NOT_IMPLEMENTED
    void operator_leftUnsigned() CPPU_NOT_IMPLEMENTED
    void operator_leftLong() CPPU_NOT_IMPLEMENTED
    void operator_leftULong() CPPU_NOT_IMPLEMENTED
    void operator_leftFloat() CPPU_NOT_IMPLEMENTED
    void operator_leftDouble() CPPU_NOT_IMPLEMENTED
    void operator_leftCharStar() CPPU_NOT_IMPLEMENTED
    void operator_leftStringRef() CPPU_NOT_IMPLEMENTED

    void release() CPPU_NOT_IMPLEMENTED

};

#endif

