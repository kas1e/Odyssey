#ifndef AtomicStringTest_h_CPPUNIT
#define AtomicStringTest_h_CPPUNIT

#include "config.h"
#include <cppunit/extensions/HelperMacros.h>
#include "BCAtomicString.h"
class AtomicStringTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( AtomicStringTestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);
    CPPUNIT_TEST(init);



    CPPUNIT_TEST(find);

    CPPUNIT_TEST(operator_const_String);
    CPPUNIT_TEST(string);

    CPPUNIT_TEST(operator_KJS__Identifier);
    CPPUNIT_TEST(operator_KJS__UString);

    CPPUNIT_TEST(impl);
    
    CPPUNIT_TEST(characters);
    CPPUNIT_TEST(length);
    
    CPPUNIT_TEST(operator__);
    
    CPPUNIT_TEST(contains);

    CPPUNIT_TEST(startsWith);
    CPPUNIT_TEST(endsWith);
    
    CPPUNIT_TEST(toInt);
    CPPUNIT_TEST(toDouble);
    CPPUNIT_TEST(toFloat);
    CPPUNIT_TEST(percentage);
    CPPUNIT_TEST(toLengthArray);
    CPPUNIT_TEST(toCoordsArray);

    CPPUNIT_TEST(isNull);
    CPPUNIT_TEST(isEmpty);

    CPPUNIT_TEST(remove);
    
#ifdef __OBJC__
    CPPUNIT_TEST(AtomicString_NSString);
    CPPUNIT_TEST(operator_NSString);
#endif


//multiple tests for each
    CPPUNIT_TEST(operators_equal);
    CPPUNIT_TEST(operators_diff);
    CPPUNIT_TEST(equalIgnoringCase);


    CPPUNIT_TEST_SUITE_END();


//class AtomicString {
public:
    void constructors() CPPU_NOT_IMPLEMENTED
    void destructors() CPPU_NOT_IMPLEMENTED
    void init() CPPU_NOT_IMPLEMENTED



    void find() CPPU_NOT_IMPLEMENTED

    void operator_const_String() CPPU_NOT_IMPLEMENTED
    void string() CPPU_NOT_IMPLEMENTED

    void operator_KJS__Identifier() CPPU_NOT_IMPLEMENTED
    void operator_KJS__UString() CPPU_NOT_IMPLEMENTED

    void impl() CPPU_NOT_IMPLEMENTED
    
    void characters() CPPU_NOT_IMPLEMENTED
    void length() CPPU_NOT_IMPLEMENTED
    
    void operator__() CPPU_NOT_IMPLEMENTED
    
    void contains() CPPU_NOT_IMPLEMENTED

    
    void startsWith() CPPU_NOT_IMPLEMENTED
    void endsWith() CPPU_NOT_IMPLEMENTED
    
    void toInt() CPPU_NOT_IMPLEMENTED
    void toDouble() CPPU_NOT_IMPLEMENTED
    void toFloat() CPPU_NOT_IMPLEMENTED
    void percentage() CPPU_NOT_IMPLEMENTED
    void toLengthArray() CPPU_NOT_IMPLEMENTED
    void toCoordsArray() CPPU_NOT_IMPLEMENTED

    void isNull() CPPU_NOT_IMPLEMENTED
    void isEmpty() CPPU_NOT_IMPLEMENTED

    void remove() CPPU_NOT_IMPLEMENTED
    
#ifdef __OBJC__
    void AtomicString_NSString() CPPU_NOT_IMPLEMENTED
    void operator_NSString() CPPU_NOT_IMPLEMENTED
#endif


//multiple tests for each
    void operators_equal() CPPU_NOT_IMPLEMENTED
    void operators_diff() CPPU_NOT_IMPLEMENTED
    void equalIgnoringCase() CPPU_NOT_IMPLEMENTED


};

#endif // AtomicString_h

