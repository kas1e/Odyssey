#ifndef SegmentedStringTest_h_CPPUNIT
#define SegmentedStringTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCFastMalloc.h"
#include "BCSegmentedString.h"
class SegmentedStringTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SegmentedStringTestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);
    
    CPPUNIT_TEST(clearSub);
    
    CPPUNIT_TEST(excludeLineNumbersSub);
    CPPUNIT_TEST(doNotExcludeLineNumbers);

    CPPUNIT_TEST(setExcludeLineNumbersSub);

//class SegmentedString {
    CPPUNIT_TEST(operator_equal);

    CPPUNIT_TEST(clear);

    CPPUNIT_TEST(append);
    CPPUNIT_TEST(prepend);
    
    CPPUNIT_TEST(excludeLineNumbers);
    CPPUNIT_TEST(setExcludeLineNumbers);

    CPPUNIT_TEST(push);
    CPPUNIT_TEST(isEmpty);
    CPPUNIT_TEST(length);

    CPPUNIT_TEST(advance);
    CPPUNIT_TEST(advancePastNewline);
    CPPUNIT_TEST(advancePastNonNewline);
    CPPUNIT_TEST(escaped);
    
    CPPUNIT_TEST(toString);

    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator_arrow);
 
    CPPUNIT_TEST_SUITE_END();



//class SegmentedSubstring {
public:
    void constructors() CPPU_NOT_IMPLEMENTED
    void destructors() CPPU_NOT_IMPLEMENTED
    
    void clearSub() CPPU_NOT_IMPLEMENTED
    
    void excludeLineNumbersSub() CPPU_NOT_IMPLEMENTED
    void doNotExcludeLineNumbers() CPPU_NOT_IMPLEMENTED

    void setExcludeLineNumbersSub() CPPU_NOT_IMPLEMENTED

//class SegmentedString {
    void operator_equal() CPPU_NOT_IMPLEMENTED

    void clear() CPPU_NOT_IMPLEMENTED

    void append() CPPU_NOT_IMPLEMENTED
    void prepend() CPPU_NOT_IMPLEMENTED
    
    void excludeLineNumbers() CPPU_NOT_IMPLEMENTED
    void setExcludeLineNumbers() CPPU_NOT_IMPLEMENTED

    void push() CPPU_NOT_IMPLEMENTED
    void isEmpty() CPPU_NOT_IMPLEMENTED
    void length() CPPU_NOT_IMPLEMENTED

    void advance() CPPU_NOT_IMPLEMENTED
    void advancePastNewline() CPPU_NOT_IMPLEMENTED
    void advancePastNonNewline() CPPU_NOT_IMPLEMENTED
    void escaped() CPPU_NOT_IMPLEMENTED
    
    void toString() CPPU_NOT_IMPLEMENTED

    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator_arrow() CPPU_NOT_IMPLEMENTED
    
};


#endif

