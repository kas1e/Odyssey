#ifndef DeprecatedPtrListTest_h_CPPUNIT
#define DeprecatedPtrListTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCDeprecatedPtrList.h"
class DeprecatedPtrListTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( DeprecatedPtrListTestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);

    CPPUNIT_TEST(operator_copy);

    CPPUNIT_TEST(isEmpty);
    CPPUNIT_TEST(count);
    CPPUNIT_TEST(clear);

    CPPUNIT_TEST(at);

    CPPUNIT_TEST(insert);
    CPPUNIT_TEST(remove);
    CPPUNIT_TEST(remove2);
    CPPUNIT_TEST(remove3);
    CPPUNIT_TEST(removeFirst);
    CPPUNIT_TEST(removeLast);
    CPPUNIT_TEST(removeRef);

    CPPUNIT_TEST(getFirst);
    CPPUNIT_TEST(getLast);
    CPPUNIT_TEST(getNext);
    CPPUNIT_TEST(getPrev);
    CPPUNIT_TEST(current);
    CPPUNIT_TEST(first);
    CPPUNIT_TEST(last);
    CPPUNIT_TEST(next);
    CPPUNIT_TEST(prev);
    CPPUNIT_TEST(take);
    CPPUNIT_TEST(take2);

    CPPUNIT_TEST(append);
    CPPUNIT_TEST(prepend);

    CPPUNIT_TEST(containsRef);
    CPPUNIT_TEST(findRef);

    CPPUNIT_TEST(begin);
    CPPUNIT_TEST(end);

    CPPUNIT_TEST(autoDelete);
    CPPUNIT_TEST(setAutoDelete);

//template <class T> class DeprecatedPtrListIterator {
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);
    CPPUNIT_TEST(countItr);
    CPPUNIT_TEST(toFirst);
    CPPUNIT_TEST(toLast);
    CPPUNIT_TEST(currentItr);

    CPPUNIT_TEST(operator1);
    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator__lessLess);
    CPPUNIT_TEST(operator__plusPlus);


    CPPUNIT_TEST_SUITE_END();

//template <class T> class DeprecatedPtrList {
public:
    void constructors() CPPU_NOT_IMPLEMENTED
    void destructors() CPPU_NOT_IMPLEMENTED 

    void operator_copy() CPPU_NOT_IMPLEMENTED

    void isEmpty() CPPU_NOT_IMPLEMENTED
    void count() CPPU_NOT_IMPLEMENTED
    void clear() CPPU_NOT_IMPLEMENTED

    void at() CPPU_NOT_IMPLEMENTED

    void insert() CPPU_NOT_IMPLEMENTED
    void remove() CPPU_NOT_IMPLEMENTED
    void remove2() CPPU_NOT_IMPLEMENTED
    void remove3() CPPU_NOT_IMPLEMENTED
    void removeFirst() CPPU_NOT_IMPLEMENTED
    void removeLast() CPPU_NOT_IMPLEMENTED
    void removeRef() CPPU_NOT_IMPLEMENTED

    void getFirst() CPPU_NOT_IMPLEMENTED
    void getLast() CPPU_NOT_IMPLEMENTED
    void getNext() CPPU_NOT_IMPLEMENTED
    void getPrev() CPPU_NOT_IMPLEMENTED
    void current() CPPU_NOT_IMPLEMENTED
    void first() CPPU_NOT_IMPLEMENTED
    void last() CPPU_NOT_IMPLEMENTED
    void next() CPPU_NOT_IMPLEMENTED
    void prev() CPPU_NOT_IMPLEMENTED
    void take() CPPU_NOT_IMPLEMENTED
    void take2() CPPU_NOT_IMPLEMENTED

    void append() CPPU_NOT_IMPLEMENTED
    void prepend() CPPU_NOT_IMPLEMENTED

    void containsRef() CPPU_NOT_IMPLEMENTED
    void findRef() CPPU_NOT_IMPLEMENTED

    void begin() CPPU_NOT_IMPLEMENTED
    void end() CPPU_NOT_IMPLEMENTED

    void autoDelete() CPPU_NOT_IMPLEMENTED
    void setAutoDelete() CPPU_NOT_IMPLEMENTED

//template <class T> class DeprecatedPtrListIterator {
    void constructorsItr() CPPU_NOT_IMPLEMENTED
    void destructorsItr() CPPU_NOT_IMPLEMENTED
    void countItr() CPPU_NOT_IMPLEMENTED
    void toFirst() CPPU_NOT_IMPLEMENTED
    void toLast() CPPU_NOT_IMPLEMENTED
    void currentItr() CPPU_NOT_IMPLEMENTED

    void operator1() CPPU_NOT_IMPLEMENTED
    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator__lessLess() CPPU_NOT_IMPLEMENTED
    void operator__plusPlus() CPPU_NOT_IMPLEMENTED

};


#endif

