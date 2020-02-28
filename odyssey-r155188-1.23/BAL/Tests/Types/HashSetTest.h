#ifndef HashSetTest_h_CPPUNIT
#define HashSetTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCHashSet.h"
class HashSetTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( HashSetTestTest );
//register each method:

    CPPUNIT_TEST(deleteAllValues);


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

    CPPUNIT_TEST(find2);
    CPPUNIT_TEST(const_find2);
    CPPUNIT_TEST(contains2);

    CPPUNIT_TEST(add);

    CPPUNIT_TEST(pair_add);

    CPPUNIT_TEST(remove);
    CPPUNIT_TEST(remove2);
    CPPUNIT_TEST(clear);


    CPPUNIT_TEST_SUITE_END();



    public:

    void deleteAllValues() CPPU_NOT_IMPLEMENTED


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

    void find2() CPPU_NOT_IMPLEMENTED
    void const_find2() CPPU_NOT_IMPLEMENTED
    void contains2() CPPU_NOT_IMPLEMENTED

    void add() CPPU_NOT_IMPLEMENTED

    void pair_add() CPPU_NOT_IMPLEMENTED

    void remove() CPPU_NOT_IMPLEMENTED
    void remove2() CPPU_NOT_IMPLEMENTED
    void clear() CPPU_NOT_IMPLEMENTED

    };
class HashSetFuncTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( HashSetFuncTest );
    CPPUNIT_TEST(extract);
    CPPUNIT_TEST(hash);
    CPPUNIT_TEST(equal);
    CPPUNIT_TEST(translate);

    CPPUNIT_TEST(deleteAllValues_HashTableType);

    CPPUNIT_TEST(deleteAllValues_const_HashSet);
    CPPUNIT_TEST(copyToVector);

            CPPUNIT_TEST_SUITE_END();
    public:
    void extract() CPPU_NOT_IMPLEMENTED
    void hash() CPPU_NOT_IMPLEMENTED
    void equal() CPPU_NOT_IMPLEMENTED
    void translate() CPPU_NOT_IMPLEMENTED

    void deleteAllValues_HashTableType() CPPU_NOT_IMPLEMENTED

    void deleteAllValues_const_HashSet() CPPU_NOT_IMPLEMENTED
    void copyToVector() CPPU_NOT_IMPLEMENTED
};

#endif /* WTF_HashSet_h */

