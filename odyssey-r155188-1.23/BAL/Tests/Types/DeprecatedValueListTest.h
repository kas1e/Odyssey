#ifndef DeprecatedValueListTest_h_CPPUNIT
#define DeprecatedValueListTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCDeprecatedValueList.h"
class DeprecatedValueListIteratorTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( DeprecatedValueListIteratorTest );
//register each method:
    CPPUNIT_TEST(DeprecatedValueListIterator);

    CPPUNIT_TEST(operator_star);

    CPPUNIT_TEST(operator_preInc);
    CPPUNIT_TEST(operator_dec);
    CPPUNIT_TEST(operator_postInc);

    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);

    CPPUNIT_TEST_SUITE_END();

public:

    void DeprecatedValueListIterator() CPPU_NOT_IMPLEMENTED

    void operator_star() CPPU_NOT_IMPLEMENTED

    void operator_preInc() CPPU_NOT_IMPLEMENTED
    void operator_dec() CPPU_NOT_IMPLEMENTED
    void operator_postInc() CPPU_NOT_IMPLEMENTED

    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED
};

class DeprecatedValueListConstIteratorTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE(DeprecatedValueListConstIteratorTest);
    CPPUNIT_TEST(DeprecatedValueListConstIterator);

    CPPUNIT_TEST(operator_star);
    
    CPPUNIT_TEST(operator_preInc);
    CPPUNIT_TEST(operator_dec);
    CPPUNIT_TEST(operator_postInc);

    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);

    CPPUNIT_TEST(operator_equal2);
    CPPUNIT_TEST_SUITE_END();
    public:
    void DeprecatedValueListConstIterator() CPPU_NOT_IMPLEMENTED

    void operator_star() CPPU_NOT_IMPLEMENTED
    
    void operator_preInc() CPPU_NOT_IMPLEMENTED
    void operator_dec() CPPU_NOT_IMPLEMENTED
    void operator_postInc() CPPU_NOT_IMPLEMENTED

    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED

    void operator_equal2() CPPU_NOT_IMPLEMENTED
        //(const DeprecatedValueList<T> &a, const DeprecatedValueList<T> &b);
};


class DeprecatedValueListTest : public CppUnit::TestFixture
{ 
    CPPUNIT_TEST_SUITE(DeprecatedValueListTest);
    CPPUNIT_TEST(DeprecatedValueList);
        
    CPPUNIT_TEST(clear);
    CPPUNIT_TEST(count);
    CPPUNIT_TEST(isEmpty);

    CPPUNIT_TEST(append);
    CPPUNIT_TEST(prepend);
    CPPUNIT_TEST(remove);
    CPPUNIT_TEST(contains);
    CPPUNIT_TEST(find);

    CPPUNIT_TEST(insert);
    CPPUNIT_TEST(remove);
    CPPUNIT_TEST(fromLast);

    CPPUNIT_TEST(first);
    CPPUNIT_TEST(first2);
    CPPUNIT_TEST(last);
    CPPUNIT_TEST(last2);
    CPPUNIT_TEST(begin);
    CPPUNIT_TEST(end);

    CPPUNIT_TEST(beginC);
    CPPUNIT_TEST(endC);
    CPPUNIT_TEST(constBegin);
    CPPUNIT_TEST(constEnd);
    CPPUNIT_TEST(fromLast2);

    CPPUNIT_TEST(operator__ );
    CPPUNIT_TEST(operator__C );
    CPPUNIT_TEST(operator_add);
    CPPUNIT_TEST(operator_left);
        
    CPPUNIT_TEST(operator_equal);

    CPPUNIT_TEST_SUITE_END();
public:
    void DeprecatedValueList() CPPU_NOT_IMPLEMENTED
        
    void clear() CPPU_NOT_IMPLEMENTED
    void count() CPPU_NOT_IMPLEMENTED
    void isEmpty() CPPU_NOT_IMPLEMENTED

    void append() CPPU_NOT_IMPLEMENTED
    void prepend() CPPU_NOT_IMPLEMENTED
    void remove() CPPU_NOT_IMPLEMENTED
    void contains() CPPU_NOT_IMPLEMENTED
    void find() CPPU_NOT_IMPLEMENTED

    void insert() CPPU_NOT_IMPLEMENTED
    void remove2() CPPU_NOT_IMPLEMENTED
    void fromLast() CPPU_NOT_IMPLEMENTED

    void first() CPPU_NOT_IMPLEMENTED
    void first2() CPPU_NOT_IMPLEMENTED
    void last() CPPU_NOT_IMPLEMENTED
    void last2() CPPU_NOT_IMPLEMENTED
    void begin() CPPU_NOT_IMPLEMENTED
    void end() CPPU_NOT_IMPLEMENTED

    void beginC() CPPU_NOT_IMPLEMENTED
    void endC() CPPU_NOT_IMPLEMENTED
    void constBegin() CPPU_NOT_IMPLEMENTED
    void constEnd() CPPU_NOT_IMPLEMENTED
    void fromLast2() CPPU_NOT_IMPLEMENTED

    void operator__ () CPPU_NOT_IMPLEMENTED
    void operator__C () CPPU_NOT_IMPLEMENTED
    void operator_add() CPPU_NOT_IMPLEMENTED
    void operator_left() CPPU_NOT_IMPLEMENTED
        
    void operator_equal() CPPU_NOT_IMPLEMENTED

};



#endif

