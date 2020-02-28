#ifndef DequeTest_h_CPPUNIT
#define DequeTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCDeque.h"
class DequeTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( DequeTestTest );
//register each method:
    CPPUNIT_TEST(Deque);
    CPPUNIT_TEST(DequeC);
    CPPUNIT_TEST(operator_copy);
    CPPUNIT_TEST(destructorDeque);

    CPPUNIT_TEST(swap);

    CPPUNIT_TEST(size);
    CPPUNIT_TEST(isEmpty);

    CPPUNIT_TEST(begin);
    CPPUNIT_TEST(end);
    CPPUNIT_TEST(const_begin);
    CPPUNIT_TEST(const_end);
    CPPUNIT_TEST(rbegin);
    CPPUNIT_TEST(rend);
    CPPUNIT_TEST(const_rbegin);
    CPPUNIT_TEST(const_rend);

    CPPUNIT_TEST(first);
    CPPUNIT_TEST(const_first);

    CPPUNIT_TEST(append);
    CPPUNIT_TEST(prepend);
    CPPUNIT_TEST(removeFirst);

    CPPUNIT_TEST(clear);
    CPPUNIT_TEST(deleteAllValues);


    CPPUNIT_TEST_SUITE_END();
    void Deque() CPPU_NOT_IMPLEMENTED
    void DequeC() CPPU_NOT_IMPLEMENTED
    void operator_copy() CPPU_NOT_IMPLEMENTED
    void destructorDeque() CPPU_NOT_IMPLEMENTED

    void swap() CPPU_NOT_IMPLEMENTED

    void size() CPPU_NOT_IMPLEMENTED
    void isEmpty() CPPU_NOT_IMPLEMENTED

    void begin() CPPU_NOT_IMPLEMENTED
    void end() CPPU_NOT_IMPLEMENTED
    void const_begin() CPPU_NOT_IMPLEMENTED
    void const_end() CPPU_NOT_IMPLEMENTED
    void rbegin() CPPU_NOT_IMPLEMENTED
    void rend() CPPU_NOT_IMPLEMENTED
    void const_rbegin() CPPU_NOT_IMPLEMENTED
    void const_rend() CPPU_NOT_IMPLEMENTED

    void first() CPPU_NOT_IMPLEMENTED
    void const_first() CPPU_NOT_IMPLEMENTED

    void append() CPPU_NOT_IMPLEMENTED
    void prepend() CPPU_NOT_IMPLEMENTED
    void removeFirst() CPPU_NOT_IMPLEMENTED

    void clear() CPPU_NOT_IMPLEMENTED

    void deleteAllValues() CPPU_NOT_IMPLEMENTED
    };

class DequeIteratorBaseTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( DequeIteratorBaseTest );
    CPPUNIT_TEST(DequeIterator);

    CPPUNIT_TEST(DequeIterator2);
    CPPUNIT_TEST(operator_copy);

    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator_arrow);

    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);

    CPPUNIT_TEST(operator_preInc);
    CPPUNIT_TEST(operator_preDec);
    CPPUNIT_TEST_SUITE_END();
    public:

    void DequeIterator() CPPU_NOT_IMPLEMENTED

    void DequeIterator2() CPPU_NOT_IMPLEMENTED
    void operator_copy() CPPU_NOT_IMPLEMENTED

    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator_arrow() CPPU_NOT_IMPLEMENTED

    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED

    void operator_preInc() CPPU_NOT_IMPLEMENTED
        // postfix ++ intentionally omitted
    void operator_preDec() CPPU_NOT_IMPLEMENTED
        // postfix -- intentionally omitted
    };

class DequeConstIteratorTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( DequeConstIteratorTest );
    CPPUNIT_TEST(DequeConstIterator);
    CPPUNIT_TEST(DequeConstIterator2);
    CPPUNIT_TEST(DequeConstIterator3);
    CPPUNIT_TEST(operator_copy);
    CPPUNIT_TEST(operator_copy2);

    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator_arrow);

    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);

    CPPUNIT_TEST(operator_preInc);
    CPPUNIT_TEST(operator_preDec);
         CPPUNIT_TEST_SUITE_END();
    
    public:
    void DequeConstIterator() CPPU_NOT_IMPLEMENTED
    void DequeConstIterator2() CPPU_NOT_IMPLEMENTED
    void DequeConstIterator3() CPPU_NOT_IMPLEMENTED
    void operator_copy() CPPU_NOT_IMPLEMENTED
    void operator_copy2() CPPU_NOT_IMPLEMENTED

    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator_arrow() CPPU_NOT_IMPLEMENTED

    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED

    void operator_preInc() CPPU_NOT_IMPLEMENTED
    void operator_preDec() CPPU_NOT_IMPLEMENTED
    };

class DequeReverseIteratorTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( DequeReverseIteratorTest );
    CPPUNIT_TEST(DequeReverseIterator);
    CPPUNIT_TEST(DequeReverseIterator2);
    CPPUNIT_TEST(operator_copy);

    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator_arrow);

    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);

    CPPUNIT_TEST(operator_preInc);
    CPPUNIT_TEST(operator_preDec);
             CPPUNIT_TEST_SUITE_END();
    public:
    void DequeReverseIterator() CPPU_NOT_IMPLEMENTED
    void DequeReverseIterator2() CPPU_NOT_IMPLEMENTED
    void operator_copy() CPPU_NOT_IMPLEMENTED

    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator_arrow() CPPU_NOT_IMPLEMENTED

    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED

    void operator_preInc() CPPU_NOT_IMPLEMENTED
    void operator_preDec() CPPU_NOT_IMPLEMENTED
    };

class DequeConstReverseIteratorTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( DequeConstReverseIteratorTest );
    CPPUNIT_TEST(DequeConstReverseIterator);
    CPPUNIT_TEST(DequeConstReverseIterator2);
    CPPUNIT_TEST(DequeConstReverseIterator3);
    CPPUNIT_TEST(operator_copy);
    CPPUNIT_TEST(operator_copy2);

    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator_arrow);

    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);

    CPPUNIT_TEST(operator_preInc);
    CPPUNIT_TEST(operator__preDec);
             CPPUNIT_TEST_SUITE_END();
    public:
    void DequeConstReverseIterator() CPPU_NOT_IMPLEMENTED
    void DequeConstReverseIterator2() CPPU_NOT_IMPLEMENTED
    void DequeConstReverseIterator3() CPPU_NOT_IMPLEMENTED
    void operator_copy() CPPU_NOT_IMPLEMENTED
    void operator_copy2() CPPU_NOT_IMPLEMENTED

    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator_arrow() CPPU_NOT_IMPLEMENTED

    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED

    void operator_preInc() CPPU_NOT_IMPLEMENTED
    void operator__preDec() CPPU_NOT_IMPLEMENTED
    };



#endif // WTF_Deque_h

