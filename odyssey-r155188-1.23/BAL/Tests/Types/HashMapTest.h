#ifndef HashMapTest_h_CPPUNIT
#define HashMapTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCHashMap.h"
class HashMapTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( HashMapTestTest );
//register each method:
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
    CPPUNIT_TEST(get);

    CPPUNIT_TEST(set);

    CPPUNIT_TEST(add);

    CPPUNIT_TEST(remove_const);
    CPPUNIT_TEST(remove);
    CPPUNIT_TEST(clear);

    CPPUNIT_TEST(take);
 
    CPPUNIT_TEST_SUITE_END();

    public:
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
    void get() CPPU_NOT_IMPLEMENTED

    void set() CPPU_NOT_IMPLEMENTED

    void add() CPPU_NOT_IMPLEMENTED

    void remove_const() CPPU_NOT_IMPLEMENTED
    void remove() CPPU_NOT_IMPLEMENTED
    void clear() CPPU_NOT_IMPLEMENTED

    void take() CPPU_NOT_IMPLEMENTED
    };


class HashMapFuncsTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( HashMapFuncsTest );
    CPPUNIT_TEST(extract);

    CPPUNIT_TEST(hash);
    CPPUNIT_TEST(equal);
    CPPUNIT_TEST(translate);

    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);

    CPPUNIT_TEST(deleteAllPairSeconds);
    CPPUNIT_TEST(deleteAllValues);

    CPPUNIT_TEST(deleteAllPairFirsts);

    CPPUNIT_TEST(deleteAllKeys);
    CPPUNIT_TEST(copyKeysToVector);
    CPPUNIT_TEST(copyValuesToVector);

        CPPUNIT_TEST_SUITE_END();
    public:
    void extract() CPPU_NOT_IMPLEMENTED

    void hash() CPPU_NOT_IMPLEMENTED
    void equal() CPPU_NOT_IMPLEMENTED
    void translate() CPPU_NOT_IMPLEMENTED

    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED

    void deleteAllPairSeconds() CPPU_NOT_IMPLEMENTED
    void deleteAllValues() CPPU_NOT_IMPLEMENTED

    void deleteAllPairFirsts() CPPU_NOT_IMPLEMENTED

    void deleteAllKeys() CPPU_NOT_IMPLEMENTED
    void copyKeysToVector() CPPU_NOT_IMPLEMENTED
    void copyValuesToVector() CPPU_NOT_IMPLEMENTED

};

#endif /* WTF_HashMap_h */

