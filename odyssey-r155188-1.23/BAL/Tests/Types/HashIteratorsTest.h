#ifndef HashIteratorsTest_h_CPPUNIT
#define HashIteratorsTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCHashTable.h"
#include "BCHashIterators.h"
class HashTableConstIteratorAdapterTest: public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( HashTableConstIteratorAdapterTest );
//register each method:
    CPPUNIT_TEST(hashTableConstIteratorAdapter);

    CPPUNIT_TEST(get);
    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator_ptr);

    CPPUNIT_TEST(operator_inc);

    CPPUNIT_TEST(keys);
    CPPUNIT_TEST(values);

    CPPUNIT_TEST_SUITE_END();
    public:
    void hashTableConstIteratorAdapter() CPPU_NOT_IMPLEMENTED

    void get() CPPU_NOT_IMPLEMENTED
    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator_ptr() CPPU_NOT_IMPLEMENTED

    void operator_inc() CPPU_NOT_IMPLEMENTED

    void keys() CPPU_NOT_IMPLEMENTED
    void values() CPPU_NOT_IMPLEMENTED
    };


class HashTableIteratorAdapterTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( HashTableIteratorAdapterTest );
    CPPUNIT_TEST(hashTableIteratorAdapter);

    CPPUNIT_TEST(get);
    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator_ptr);

    CPPUNIT_TEST(operator_inc);

    CPPUNIT_TEST(operator_HashTableConstIteratorAdapter);
    CPPUNIT_TEST(keys);
    CPPUNIT_TEST(values);
            CPPUNIT_TEST_SUITE_END();
    public:
    void hashTableIteratorAdapter() CPPU_NOT_IMPLEMENTED

    void get() CPPU_NOT_IMPLEMENTED
    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator_ptr() CPPU_NOT_IMPLEMENTED

    void operator_inc() CPPU_NOT_IMPLEMENTED

    void operator_HashTableConstIteratorAdapter() CPPU_NOT_IMPLEMENTED
    void keys() CPPU_NOT_IMPLEMENTED
    void values() CPPU_NOT_IMPLEMENTED
    };


class HashTableConstKeysIteratorTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( HashTableConstKeysIteratorTest);
    CPPUNIT_TEST(hashTableConstKeysIterator);
    CPPUNIT_TEST(get);
    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator_ptr);
    CPPUNIT_TEST(operator_inc);
            CPPUNIT_TEST_SUITE_END();
    public:
    void hashTableConstKeysIterator() CPPU_NOT_IMPLEMENTED
    void get() CPPU_NOT_IMPLEMENTED
    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator_ptr() CPPU_NOT_IMPLEMENTED
    void operator_inc() CPPU_NOT_IMPLEMENTED
    };

class HashTableConstValuesIteratorTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( HashTableConstValuesIteratorTest);
    CPPUNIT_TEST(hashTableConstValuesIterator);
    CPPUNIT_TEST(get);
    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator_ptr);
    CPPUNIT_TEST(operator_inc);
            CPPUNIT_TEST_SUITE_END();
    public:
    void hashTableConstValuesIterator() CPPU_NOT_IMPLEMENTED
    void get() CPPU_NOT_IMPLEMENTED
    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator_ptr() CPPU_NOT_IMPLEMENTED
    void operator_inc() CPPU_NOT_IMPLEMENTED
         
    };

class HashTableKeysIteratorTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( HashTableKeysIteratorTest);
    CPPUNIT_TEST(hashTableKeysIterator);
    CPPUNIT_TEST(get);
    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator_ptr);
    CPPUNIT_TEST(operator_inc);
            CPPUNIT_TEST_SUITE_END();
    public:
    void hashTableKeysIterator() CPPU_NOT_IMPLEMENTED
    void get() CPPU_NOT_IMPLEMENTED
    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator_ptr() CPPU_NOT_IMPLEMENTED
    void operator_inc() CPPU_NOT_IMPLEMENTED
    };

class HashTableValuesIteratorTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( HashTableValuesIteratorTest);
    CPPUNIT_TEST(hashTableValuesIterator);
    CPPUNIT_TEST(get);
    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator_ptr);
    CPPUNIT_TEST(operator_inc);
            CPPUNIT_TEST_SUITE_END();
    public:
    void hashTableValuesIterator() CPPU_NOT_IMPLEMENTED
    void get() CPPU_NOT_IMPLEMENTED
    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator_ptr() CPPU_NOT_IMPLEMENTED
    void operator_inc() CPPU_NOT_IMPLEMENTED
         
    };

class HashTableOperatorsTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( HashTableOperatorsTest );
    CPPUNIT_TEST(operator_equalConstKeysItr);
    CPPUNIT_TEST(operator_diffConstKeysItr);
    CPPUNIT_TEST(operator_equalConstValuesItr);
    CPPUNIT_TEST(operator_diffConstValuesItr);
    CPPUNIT_TEST(operator_equalKeysItr);
    CPPUNIT_TEST(operator_diffKeysItr);
    CPPUNIT_TEST(operator_equalValuesItr);
    CPPUNIT_TEST(operator_diffValuesItr);
            CPPUNIT_TEST_SUITE_END();
    public:
    void operator_equalConstKeysItr() CPPU_NOT_IMPLEMENTED
    void operator_diffConstKeysItr() CPPU_NOT_IMPLEMENTED
    void operator_equalConstValuesItr() CPPU_NOT_IMPLEMENTED
    void operator_diffConstValuesItr() CPPU_NOT_IMPLEMENTED
    void operator_equalKeysItr() CPPU_NOT_IMPLEMENTED
    void operator_diffKeysItr() CPPU_NOT_IMPLEMENTED
    void operator_equalValuesItr() CPPU_NOT_IMPLEMENTED
    void operator_diffValuesItr() CPPU_NOT_IMPLEMENTED

};



#endif // WTF_HashIterators_h

