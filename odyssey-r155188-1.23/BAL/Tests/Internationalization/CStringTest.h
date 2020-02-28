#ifndef CStringTest_h_CPPUNIT
#define CStringTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCCString.h"
class CStringTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( CStringTestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);

    CPPUNIT_TEST(create);

    CPPUNIT_TEST(data);
    CPPUNIT_TEST(length);
        
    CPPUNIT_TEST(releaseBuffer);

//    class CString {
    CPPUNIT_TEST(newUninitialized);

    CPPUNIT_TEST(cstring_data);
    CPPUNIT_TEST(mutableData);
    CPPUNIT_TEST(cstring_length);

    CPPUNIT_TEST(isNull);
        
    CPPUNIT_TEST(cstring_releaseBuffer);


    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);


    CPPUNIT_TEST_SUITE_END();

//    class CStringBuffer : public RefCounted<CStringBuffer> {
    public:
    void constructors() CPPU_NOT_IMPLEMENTED
    void destructors() CPPU_NOT_IMPLEMENTED

    void create() CPPU_NOT_IMPLEMENTED

    void data() CPPU_NOT_IMPLEMENTED
    void length() CPPU_NOT_IMPLEMENTED
        
    void releaseBuffer() CPPU_NOT_IMPLEMENTED

//    class CString {
    void newUninitialized() CPPU_NOT_IMPLEMENTED

    void cstring_data() CPPU_NOT_IMPLEMENTED
    void mutableData() CPPU_NOT_IMPLEMENTED
    void cstring_length() CPPU_NOT_IMPLEMENTED

    void isNull() CPPU_NOT_IMPLEMENTED
        
    void cstring_releaseBuffer() CPPU_NOT_IMPLEMENTED


    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED

};

#endif // CString_h

