#ifndef FloatPointTest_h_CPPUNIT
#define FloatPointTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCFloatPoint.h"
class FloatPointTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( FloatPointTestTest );
//register each method:
    CPPUNIT_TEST(FloatPoint);
    CPPUNIT_TEST(FloatPoint_xy);
    CPPUNIT_TEST(FloatPoint_intPoint);

    CPPUNIT_TEST(narrowPrecision);

    CPPUNIT_TEST(x);
    CPPUNIT_TEST(y);

    CPPUNIT_TEST(setX);
    CPPUNIT_TEST(setY);
    CPPUNIT_TEST(move);

    CPPUNIT_TEST(matrixTransform);
    CPPUNIT_TEST(operator_pluseq);
    CPPUNIT_TEST(operator_subeq);
    CPPUNIT_TEST(operator_plus);
    CPPUNIT_TEST(operator_sub);
    CPPUNIT_TEST(operator_sub_size);
    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);


    CPPUNIT_TEST_SUITE_END();

public:
    void FloatPoint() CPPU_NOT_IMPLEMENTED
    void FloatPoint_xy() CPPU_NOT_IMPLEMENTED
    void FloatPoint_intPoint() CPPU_NOT_IMPLEMENTED

    void narrowPrecision() CPPU_NOT_IMPLEMENTED

    void x() CPPU_NOT_IMPLEMENTED
    void y() CPPU_NOT_IMPLEMENTED

    void setX() CPPU_NOT_IMPLEMENTED
    void setY() CPPU_NOT_IMPLEMENTED
    void move() CPPU_NOT_IMPLEMENTED

    void matrixTransform() CPPU_NOT_IMPLEMENTED
    void operator_pluseq() CPPU_NOT_IMPLEMENTED
    void operator_subeq() CPPU_NOT_IMPLEMENTED
    void operator_plus() CPPU_NOT_IMPLEMENTED
    void operator_sub() CPPU_NOT_IMPLEMENTED
    void operator_sub_size() CPPU_NOT_IMPLEMENTED
    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED

};




#endif

