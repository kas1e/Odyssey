#ifndef RefPtrHashMapTest_h_CPPUNIT
#define RefPtrHashMapTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCHashMap.h"
//#include "BCRefPtrHashMap.h"
class RefPtrHashMapTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( RefPtrHashMapTestTest );
//register each method:
    CPPUNIT_TEST(hash);
    CPPUNIT_TEST(equal);
    CPPUNIT_TEST(translate);

    CPPUNIT_TEST(swap);

    CPPUNIT_TEST(size);
    CPPUNIT_TEST(capacity);
    CPPUNIT_TEST(isEmpty);

    CPPUNIT_TEST(begin);
    CPPUNIT_TEST(end);
    CPPUNIT_TEST(const_begin);
    CPPUNIT_TEST(const_end);

    CPPUNIT_TEST(find);
    CPPUNIT_TEST(find_RawKeyType);
    CPPUNIT_TEST(const_find);
    CPPUNIT_TEST(const_find_RawKeyType);
    CPPUNIT_TEST(contains);
    CPPUNIT_TEST(contains_RawKeyType);
    CPPUNIT_TEST(get);
    CPPUNIT_TEST(get_RawKeyType);
    CPPUNIT_TEST(inlineGet);

    CPPUNIT_TEST(set);
    CPPUNIT_TEST(set_RawKeyType);

    CPPUNIT_TEST(add);
    CPPUNIT_TEST(add_RawKeyType);

    CPPUNIT_TEST(remove);
    CPPUNIT_TEST(remove_RawKeyType);
    CPPUNIT_TEST(remove_itr);
    CPPUNIT_TEST(clear);

    CPPUNIT_TEST(take);
    CPPUNIT_TEST(take_RawKeyType);

 
    CPPUNIT_TEST_SUITE_END();


    public:
    void hash() CPPU_NOT_IMPLEMENTED
    void equal() CPPU_NOT_IMPLEMENTED
    void translate() CPPU_NOT_IMPLEMENTED

    void swap() CPPU_NOT_IMPLEMENTED

    void size() CPPU_NOT_IMPLEMENTED
    void capacity() CPPU_NOT_IMPLEMENTED
    void isEmpty() CPPU_NOT_IMPLEMENTED

    void begin() CPPU_NOT_IMPLEMENTED
    void end() CPPU_NOT_IMPLEMENTED
    void const_begin() CPPU_NOT_IMPLEMENTED
    void const_end() CPPU_NOT_IMPLEMENTED

    void find() CPPU_NOT_IMPLEMENTED
    void find_RawKeyType() CPPU_NOT_IMPLEMENTED
    void const_find() CPPU_NOT_IMPLEMENTED
    void const_find_RawKeyType() CPPU_NOT_IMPLEMENTED
    void contains() CPPU_NOT_IMPLEMENTED
    void contains_RawKeyType() CPPU_NOT_IMPLEMENTED
    void get() CPPU_NOT_IMPLEMENTED
    void get_RawKeyType() CPPU_NOT_IMPLEMENTED
    void inlineGet() CPPU_NOT_IMPLEMENTED

    void set() CPPU_NOT_IMPLEMENTED
    void set_RawKeyType() CPPU_NOT_IMPLEMENTED

    void add() CPPU_NOT_IMPLEMENTED
    void add_RawKeyType() CPPU_NOT_IMPLEMENTED

    void remove() CPPU_NOT_IMPLEMENTED
    void remove_RawKeyType() CPPU_NOT_IMPLEMENTED
    void remove_itr() CPPU_NOT_IMPLEMENTED
    void clear() CPPU_NOT_IMPLEMENTED

    void take() CPPU_NOT_IMPLEMENTED
    void take_RawKeyType() CPPU_NOT_IMPLEMENTED

    };
    
#endif 

