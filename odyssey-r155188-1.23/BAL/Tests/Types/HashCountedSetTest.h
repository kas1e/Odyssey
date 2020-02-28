#ifndef HashCountedSetTest_h_CPPUNIT
#define HashCountedSetTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCHashCountedSet.h"
class HashCountedSetTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( HashCountedSetTestTest );
//register each method:
    CPPUNIT_TEST(HashCountedSet);
        
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
    CPPUNIT_TEST(count);

    CPPUNIT_TEST(add);
        
    CPPUNIT_TEST(remove);
    CPPUNIT_TEST(removeItr);
 
    CPPUNIT_TEST(clear);
    CPPUNIT_TEST(copyToVectorWithType);

    CPPUNIT_TEST(copyToVector);
 
    CPPUNIT_TEST_SUITE_END();

    void HashCountedSet() CPPU_NOT_IMPLEMENTED
        
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
    void count() CPPU_NOT_IMPLEMENTED

    void add() CPPU_NOT_IMPLEMENTED
        
    void remove() CPPU_NOT_IMPLEMENTED
    void removeItr() CPPU_NOT_IMPLEMENTED
 
    void clear() CPPU_NOT_IMPLEMENTED
    void copyToVectorWithType() CPPU_NOT_IMPLEMENTED

    void copyToVector() CPPU_NOT_IMPLEMENTED
        
    
    


};


#endif /* WTF_HashCountedSet_h */

