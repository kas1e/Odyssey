#ifndef DeprecatedPtrQueueTest_h_CPPUNIT
#define DeprecatedPtrQueueTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCDeprecatedPtrQueue.h"
class DeprecatedPtrQueueTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( DeprecatedPtrQueueTestTest );
//register each method:
    CPPUNIT_TEST(isEmpty);
    CPPUNIT_TEST(dequeue);
    CPPUNIT_TEST(enqueue);
    CPPUNIT_TEST(count);
    CPPUNIT_TEST(head);
    CPPUNIT_TEST(operator_copy);


    CPPUNIT_TEST_SUITE_END();




public:
//template<class T> class DeprecatedPtrQueue
    void isEmpty() CPPU_NOT_IMPLEMENTED
    void dequeue() CPPU_NOT_IMPLEMENTED
    void enqueue() CPPU_NOT_IMPLEMENTED
    void count() CPPU_NOT_IMPLEMENTED
    void head() CPPU_NOT_IMPLEMENTED
    void operator_copy() CPPU_NOT_IMPLEMENTED

};


#endif /* DeprecatedPtrQueue_h */

