#ifndef HashTableTest_h_CPPUNIT
#define HashTableTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCHashTable.h"
class HashTableTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( HashTableTestTest );
//register each method:
    CPPUNIT_TEST(addIterator);
    CPPUNIT_TEST(removeIterator);

    CPPUNIT_TEST_SUITE_END();


    void addIterator() CPPU_NOT_IMPLEMENTED
    void removeIterator() CPPU_NOT_IMPLEMENTED
};



class HashTableConstIteratorTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( HashTableConstIteratorTest );
    CPPUNIT_TEST(HashTableConstIterator);
    CPPUNIT_TEST(get);
    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator_ptr);
    CPPUNIT_TEST(operator_inc);
    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);
        CPPUNIT_TEST_SUITE_END();
    public:
    void HashTableConstIterator() CPPU_NOT_IMPLEMENTED
    void get() CPPU_NOT_IMPLEMENTED
    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator_ptr() CPPU_NOT_IMPLEMENTED
    void operator_inc() CPPU_NOT_IMPLEMENTED
    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED
    };

class HashTableIteratorTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( HashTableIteratorTest );
    CPPUNIT_TEST(HashTableIterator);
    CPPUNIT_TEST(get);
    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator_ptr);
    CPPUNIT_TEST(operator_inc);
    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);
    CPPUNIT_TEST(operator_const);
        CPPUNIT_TEST_SUITE_END();
    public:
    void HashTableIterator() CPPU_NOT_IMPLEMENTED
    void get() CPPU_NOT_IMPLEMENTED
    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator_ptr() CPPU_NOT_IMPLEMENTED
    void operator_inc() CPPU_NOT_IMPLEMENTED
    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED
    void operator_const() CPPU_NOT_IMPLEMENTED
};
class IdentityHashTranslatorTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( IdentityHashTranslatorTest );
    CPPUNIT_TEST(hash);
    CPPUNIT_TEST(equal);
    CPPUNIT_TEST(translate);
            CPPUNIT_TEST_SUITE_END();
    public:
    void hash() CPPU_NOT_IMPLEMENTED
    void equal() CPPU_NOT_IMPLEMENTED
    void translate() CPPU_NOT_IMPLEMENTED
};


class HashTableTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( HashTableTest );
    CPPUNIT_TEST(HashTable);
    CPPUNIT_TEST(destruct_HashTable);
    CPPUNIT_TEST(HashTable_copy);
    CPPUNIT_TEST(swap);
    CPPUNIT_TEST(operator_copy);

    CPPUNIT_TEST(begin);
    CPPUNIT_TEST(end);
    CPPUNIT_TEST(const_begin);
    CPPUNIT_TEST(const_end);

    CPPUNIT_TEST(size);
    CPPUNIT_TEST(capacity);
    CPPUNIT_TEST(isEmpty);

    CPPUNIT_TEST(add);

    CPPUNIT_TEST(add_extra);
    CPPUNIT_TEST(addPassingHashCode);

    CPPUNIT_TEST(find);
    CPPUNIT_TEST(const_find);
    CPPUNIT_TEST(contains);

    CPPUNIT_TEST(find_T);
    CPPUNIT_TEST(const_find_T);
    CPPUNIT_TEST(contains_T);

    CPPUNIT_TEST(remove_KeyType);
    CPPUNIT_TEST(remove);
    CPPUNIT_TEST(removeWithoutEntryConsistencyCheck);
    CPPUNIT_TEST(clear);

    CPPUNIT_TEST(isEmptyBucket);
    CPPUNIT_TEST(isDeletedBucket);
    CPPUNIT_TEST(isEmptyOrDeletedBucket);

    CPPUNIT_TEST(lookup);
    CPPUNIT_TEST(lookup_T);

    CPPUNIT_TEST(checkTableConsistency);

            CPPUNIT_TEST_SUITE_END();
    public:
    void HashTable() CPPU_NOT_IMPLEMENTED
    void destruct_HashTable() CPPU_NOT_IMPLEMENTED
    void HashTable_copy() CPPU_NOT_IMPLEMENTED
    void swap() CPPU_NOT_IMPLEMENTED
    void operator_copy() CPPU_NOT_IMPLEMENTED

    void begin() CPPU_NOT_IMPLEMENTED
    void end() CPPU_NOT_IMPLEMENTED
    void const_begin() CPPU_NOT_IMPLEMENTED
    void const_end() CPPU_NOT_IMPLEMENTED

    void size() CPPU_NOT_IMPLEMENTED
    void capacity() CPPU_NOT_IMPLEMENTED
    void isEmpty() CPPU_NOT_IMPLEMENTED

    void add() CPPU_NOT_IMPLEMENTED

    void add_extra() CPPU_NOT_IMPLEMENTED
    void addPassingHashCode() CPPU_NOT_IMPLEMENTED

    void find() CPPU_NOT_IMPLEMENTED
    void const_find() CPPU_NOT_IMPLEMENTED
    void contains() CPPU_NOT_IMPLEMENTED

    void find_T() CPPU_NOT_IMPLEMENTED
    void const_find_T() CPPU_NOT_IMPLEMENTED
    void contains_T() CPPU_NOT_IMPLEMENTED

    void remove_KeyType() CPPU_NOT_IMPLEMENTED
    void remove() CPPU_NOT_IMPLEMENTED
    void removeWithoutEntryConsistencyCheck() CPPU_NOT_IMPLEMENTED
    void clear() CPPU_NOT_IMPLEMENTED

    void isEmptyBucket() CPPU_NOT_IMPLEMENTED
    void isDeletedBucket() CPPU_NOT_IMPLEMENTED
    void isEmptyOrDeletedBucket() CPPU_NOT_IMPLEMENTED

    void lookup() CPPU_NOT_IMPLEMENTED
    void lookup_T() CPPU_NOT_IMPLEMENTED

    void checkTableConsistency() CPPU_NOT_IMPLEMENTED

    };


class HashTableConstIteratorAdapterTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( HashTableConstIteratorAdapterTest );
    CPPUNIT_TEST(HashTableConstIteratorAdapter);
    CPPUNIT_TEST(get);
    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator_ptr);
    CPPUNIT_TEST(operator_inc);
            CPPUNIT_TEST_SUITE_END();
    public:
    void HashTableConstIteratorAdapter() CPPU_NOT_IMPLEMENTED
    void get() CPPU_NOT_IMPLEMENTED
    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator_ptr() CPPU_NOT_IMPLEMENTED
    void operator_inc() CPPU_NOT_IMPLEMENTED
    };
class HashTableIteratorAdapterTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( HashTableIteratorAdapterTest );
    CPPUNIT_TEST(HashTableIteratorAdapter);
    CPPUNIT_TEST(get);
    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator_ptr);
    CPPUNIT_TEST(operator_inc);
    CPPUNIT_TEST(operator_const);
            CPPUNIT_TEST_SUITE_END();
    public:
    void HashTableIteratorAdapter() CPPU_NOT_IMPLEMENTED
    void get() CPPU_NOT_IMPLEMENTED
    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator_ptr() CPPU_NOT_IMPLEMENTED
    void operator_inc() CPPU_NOT_IMPLEMENTED
    void operator_const() CPPU_NOT_IMPLEMENTED
    };



class HashTableFuncsTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( HashTableFuncsTest );
    CPPUNIT_TEST(swap);
    CPPUNIT_TEST(move_true);
    CPPUNIT_TEST(move_false);
    CPPUNIT_TEST(doubleHash);

    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);
    CPPUNIT_TEST(operator_equal_const);
    CPPUNIT_TEST(operator_diff_const);

            CPPUNIT_TEST_SUITE_END();
    public:
    void swap() CPPU_NOT_IMPLEMENTED
    void move_true() CPPU_NOT_IMPLEMENTED
    void move_false() CPPU_NOT_IMPLEMENTED
    void doubleHash() CPPU_NOT_IMPLEMENTED

    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED
    void operator_equal_const() CPPU_NOT_IMPLEMENTED
    void operator_diff_const() CPPU_NOT_IMPLEMENTED

};


#endif //remember to remove this line once this file is customized

