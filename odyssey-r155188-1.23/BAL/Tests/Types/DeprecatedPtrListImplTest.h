#ifndef DeprecatedPtrListImplTest_h_CPPUNIT
#define DeprecatedPtrListImplTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCDeprecatedPtrListImpl.h"
class DeprecatedPtrListImplTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( DeprecatedPtrListImplTestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);
     
    CPPUNIT_TEST(isEmpty);
    CPPUNIT_TEST(count);
    CPPUNIT_TEST(clear);

    CPPUNIT_TEST(at);

    CPPUNIT_TEST(insert);
    CPPUNIT_TEST(remove);
    CPPUNIT_TEST(remove2);
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

    CPPUNIT_TEST(assign);

//class DeprecatedPtrListImplIterator {
    CPPUNIT_TEST(constructors2);
    CPPUNIT_TEST(destructors2);
    CPPUNIT_TEST(countItr);
    CPPUNIT_TEST(toFirst);
    CPPUNIT_TEST(toLast);
    CPPUNIT_TEST(currentItr);

    CPPUNIT_TEST(operatorLessLess);
    CPPUNIT_TEST(operatorPlusPlus);


    CPPUNIT_TEST_SUITE_END();




//class DeprecatedPtrListImpl
public:
    void constructors() CPPU_NOT_IMPLEMENTED
    void destructors() CPPU_NOT_IMPLEMENTED 
     
    void isEmpty() CPPU_NOT_IMPLEMENTED
    void count() CPPU_NOT_IMPLEMENTED
    void clear() CPPU_NOT_IMPLEMENTED

    void at() CPPU_NOT_IMPLEMENTED

    void insert() CPPU_NOT_IMPLEMENTED
    void remove() CPPU_NOT_IMPLEMENTED
    void remove2() CPPU_NOT_IMPLEMENTED
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

    void assign() CPPU_NOT_IMPLEMENTED

//class DeprecatedPtrListImplIterator {
    void constructors2() CPPU_NOT_IMPLEMENTED
    void destructors2() CPPU_NOT_IMPLEMENTED
    void countItr() CPPU_NOT_IMPLEMENTED
    void toFirst() CPPU_NOT_IMPLEMENTED
    void toLast() CPPU_NOT_IMPLEMENTED
    void currentItr() CPPU_NOT_IMPLEMENTED

    void operatorLessLess() CPPU_NOT_IMPLEMENTED
    void operatorPlusPlus() CPPU_NOT_IMPLEMENTED

};
#endif

