#ifndef IntSizeTest_h_CPPUNIT
#define IntSizeTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCIntSize.h"
class IntSizeTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( IntSizeTestTest );
//register each method:
    CPPUNIT_TEST(IntSize);
    CPPUNIT_TEST(IntSize_args);
    
    CPPUNIT_TEST(width);
    CPPUNIT_TEST(height);

    CPPUNIT_TEST(setWidth);
    CPPUNIT_TEST(setHeight);

    CPPUNIT_TEST(isEmpty);

    CPPUNIT_TEST(expandedTo);
    CPPUNIT_TEST(shrunkTo);
    CPPUNIT_TEST(clampNegativeToZero);

    CPPUNIT_TEST(operator_addeq);
    CPPUNIT_TEST(operator_subeq);
    CPPUNIT_TEST(operator_add);
    CPPUNIT_TEST(operator_sub);
    CPPUNIT_TEST(operator_sub_sz);
    CPPUNIT_TEST(operator_eq);
    CPPUNIT_TEST(operator_diff);


    CPPUNIT_TEST_SUITE_END();

public:
    void IntSize() CPPU_NOT_IMPLEMENTED
    void IntSize_args() CPPU_NOT_IMPLEMENTED
    
    void width() CPPU_NOT_IMPLEMENTED
    void height() CPPU_NOT_IMPLEMENTED

    void setWidth() CPPU_NOT_IMPLEMENTED
    void setHeight() CPPU_NOT_IMPLEMENTED

    void isEmpty() CPPU_NOT_IMPLEMENTED

    void expandedTo() CPPU_NOT_IMPLEMENTED
    void shrunkTo() CPPU_NOT_IMPLEMENTED
    void clampNegativeToZero() CPPU_NOT_IMPLEMENTED

    void operator_addeq() CPPU_NOT_IMPLEMENTED
    void operator_subeq() CPPU_NOT_IMPLEMENTED
    void operator_add() CPPU_NOT_IMPLEMENTED
    void operator_sub() CPPU_NOT_IMPLEMENTED
    void operator_sub_sz() CPPU_NOT_IMPLEMENTED
    void operator_eq() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED




};

#endif // IntSize_h

