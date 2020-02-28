#ifndef SharedBufferTest_h_CPPUNIT
#define SharedBufferTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSharedBuffer.h"
class SharedBufferTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SharedBufferTestTest );
//register each method:

    CPPUNIT_TEST(create);
    CPPUNIT_TEST(create_const_char_star);
    CPPUNIT_TEST(create_const_unsigned_char_star);
    CPPUNIT_TEST(createWithContentsOfFile);
    CPPUNIT_TEST(adoptVector);
    CPPUNIT_TEST(data);
    CPPUNIT_TEST(size);
    CPPUNIT_TEST(buffer);
    CPPUNIT_TEST(isEmpty);
    CPPUNIT_TEST(append);
    CPPUNIT_TEST(clear);
    CPPUNIT_TEST(platformData);
    CPPUNIT_TEST(platformDataSize);
    CPPUNIT_TEST(copy);
        CPPUNIT_TEST_SUITE_END();


public:
    void create() CPPU_NOT_IMPLEMENTED
    void create_const_char_star() CPPU_NOT_IMPLEMENTED
    void create_const_unsigned_char_star() CPPU_NOT_IMPLEMENTED
    void createWithContentsOfFile() CPPU_NOT_IMPLEMENTED
    void adoptVector() CPPU_NOT_IMPLEMENTED
    void data() CPPU_NOT_IMPLEMENTED
    void size() CPPU_NOT_IMPLEMENTED
    void buffer() CPPU_NOT_IMPLEMENTED
    void isEmpty() CPPU_NOT_IMPLEMENTED
    void append() CPPU_NOT_IMPLEMENTED
    void clear() CPPU_NOT_IMPLEMENTED
    void platformData() CPPU_NOT_IMPLEMENTED
    void platformDataSize() CPPU_NOT_IMPLEMENTED
    void copy() CPPU_NOT_IMPLEMENTED
    
};
    

#endif

