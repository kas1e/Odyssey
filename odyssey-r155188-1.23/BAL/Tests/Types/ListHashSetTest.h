#ifndef ListHashSetTest_h_CPPUNIT
#define ListHashSetTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCListHashSet.h"
class ListHashSetTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ListHashSetTestTest );
//register each method:
    CPPUNIT_TEST(deleteAllValues);

    CPPUNIT_TEST(ListHashSet);
    CPPUNIT_TEST(ListHashSetCopy);
    CPPUNIT_TEST(operatorCopy);
    CPPUNIT_TEST(destructListHashSet);

    CPPUNIT_TEST(swap);

    CPPUNIT_TEST(size);
    CPPUNIT_TEST(capacity);
    CPPUNIT_TEST(isEmpty);

    CPPUNIT_TEST(begin);
    CPPUNIT_TEST(end);
    CPPUNIT_TEST(const_begin);
    CPPUNIT_TEST(const_end);

    CPPUNIT_TEST(find);
    CPPUNIT_TEST(const_find);
    CPPUNIT_TEST(contains);

    CPPUNIT_TEST(add);

    CPPUNIT_TEST(remove);
    CPPUNIT_TEST(remove_itr);
    CPPUNIT_TEST(clear);


    CPPUNIT_TEST_SUITE_END();

    public:
    void deleteAllValues() CPPU_NOT_IMPLEMENTED

    void ListHashSet() CPPU_NOT_IMPLEMENTED
    void ListHashSetCopy() CPPU_NOT_IMPLEMENTED
    void operatorCopy() CPPU_NOT_IMPLEMENTED
    void destructListHashSet() CPPU_NOT_IMPLEMENTED

    void swap() CPPU_NOT_IMPLEMENTED

    void size() CPPU_NOT_IMPLEMENTED
    void capacity() CPPU_NOT_IMPLEMENTED
    void isEmpty() CPPU_NOT_IMPLEMENTED

    void begin() CPPU_NOT_IMPLEMENTED
    void end() CPPU_NOT_IMPLEMENTED
    void const_begin() CPPU_NOT_IMPLEMENTED
    void const_end() CPPU_NOT_IMPLEMENTED

    void find() CPPU_NOT_IMPLEMENTED
    void const_find() CPPU_NOT_IMPLEMENTED
    void contains() CPPU_NOT_IMPLEMENTED

    void add() CPPU_NOT_IMPLEMENTED

    void remove() CPPU_NOT_IMPLEMENTED
    void remove_itr() CPPU_NOT_IMPLEMENTED
    void clear() CPPU_NOT_IMPLEMENTED

    };

class ListHashSetFuncsTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( ListHashSetFuncsTest );
    CPPUNIT_TEST(ListHashSetNodeAllocator);
    CPPUNIT_TEST(allocate);
    CPPUNIT_TEST(deallocate);
    CPPUNIT_TEST(ListHashSetNode);
    CPPUNIT_TEST(operator_new);
    CPPUNIT_TEST(destroy);
    CPPUNIT_TEST(hash);
    CPPUNIT_TEST(equal);
        CPPUNIT_TEST_SUITE_END();
    public:
    void ListHashSetNodeAllocator() CPPU_NOT_IMPLEMENTED
    void allocate() CPPU_NOT_IMPLEMENTED
    void deallocate() CPPU_NOT_IMPLEMENTED
    void ListHashSetNode() CPPU_NOT_IMPLEMENTED
    void operator_new() CPPU_NOT_IMPLEMENTED
    void destroy() CPPU_NOT_IMPLEMENTED
    void hash() CPPU_NOT_IMPLEMENTED
    void equal() CPPU_NOT_IMPLEMENTED
    };

    
 class ListHashSetIteratorTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ListHashSetIteratorTest );
    CPPUNIT_TEST(ListHashSetIterator);
    CPPUNIT_TEST(get);
    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator_ptr);
    CPPUNIT_TEST(operator_inc);
    CPPUNIT_TEST(operator_dec);
    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);
    CPPUNIT_TEST(operator_const);
    CPPUNIT_TEST_SUITE_END();
    public:
    void ListHashSetIterator() CPPU_NOT_IMPLEMENTED
    void get() CPPU_NOT_IMPLEMENTED
    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator_ptr() CPPU_NOT_IMPLEMENTED
    void operator_inc() CPPU_NOT_IMPLEMENTED
    void operator_dec() CPPU_NOT_IMPLEMENTED
    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED
    void operator_const() CPPU_NOT_IMPLEMENTED
    };
 class ListHashSetConstIteratorTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ListHashSetConstIteratorTest );
    CPPUNIT_TEST(ListHashSetConstIterator);
    CPPUNIT_TEST(get);
    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator_ptr);
    CPPUNIT_TEST(operator_inc);
    CPPUNIT_TEST(operator_dec);
    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);
    CPPUNIT_TEST_SUITE_END();
    public:
    void ListHashSetConstIterator() CPPU_NOT_IMPLEMENTED
    void get() CPPU_NOT_IMPLEMENTED
    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator_ptr() CPPU_NOT_IMPLEMENTED
    void operator_inc() CPPU_NOT_IMPLEMENTED
    void operator_dec() CPPU_NOT_IMPLEMENTED
    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED
    };

class ListHashSetTranslatorTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( ListHashSetTranslatorTest );
    CPPUNIT_TEST(hash);
    CPPUNIT_TEST(equal);
    CPPUNIT_TEST(translate);
            CPPUNIT_TEST_SUITE_END();
    public:
    void hash() CPPU_NOT_IMPLEMENTED
    void equal() CPPU_NOT_IMPLEMENTED
    void translate() CPPU_NOT_IMPLEMENTED
    };



#endif /* WTF_ListHashSet_h */

