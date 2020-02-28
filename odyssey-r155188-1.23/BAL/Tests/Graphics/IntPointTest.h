#ifndef IntPointTest_h_CPPUNIT
#define IntPointTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCIntPoint.h"
class IntPointTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( IntPointTestTest );
//register each method:
    CPPUNIT_TEST(IntPoint);
    CPPUNIT_TEST(IntPoint_params);

    CPPUNIT_TEST(x);
    CPPUNIT_TEST(y);

    CPPUNIT_TEST(setX);
    CPPUNIT_TEST(setY);

    CPPUNIT_TEST(move);
    
    CPPUNIT_TEST(IntPoint_point);
    CPPUNIT_TEST(operator_BalPoint);
    CPPUNIT_TEST(operator_addeq);
    CPPUNIT_TEST(operator_subeq);
    CPPUNIT_TEST(operator_add);
    CPPUNIT_TEST(operator_sub);
    CPPUNIT_TEST(operator_subSz);
    CPPUNIT_TEST(operator_eq);
    CPPUNIT_TEST(operator_diff);


    CPPUNIT_TEST_SUITE_END();


public:
    void IntPoint() CPPU_NOT_IMPLEMENTED
    void IntPoint_params() CPPU_NOT_IMPLEMENTED

    void x() CPPU_NOT_IMPLEMENTED
    void y() CPPU_NOT_IMPLEMENTED

    void setX() CPPU_NOT_IMPLEMENTED
    void setY() CPPU_NOT_IMPLEMENTED

    void move() CPPU_NOT_IMPLEMENTED
    
    void IntPoint_point() CPPU_NOT_IMPLEMENTED
    void operator_BalPoint() CPPU_NOT_IMPLEMENTED
    void operator_addeq() CPPU_NOT_IMPLEMENTED
    void operator_subeq() CPPU_NOT_IMPLEMENTED
    void operator_add() CPPU_NOT_IMPLEMENTED
    void operator_sub() CPPU_NOT_IMPLEMENTED
    void operator_subSz() CPPU_NOT_IMPLEMENTED
    void operator_eq() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED

};

#endif // IntPoint_h

