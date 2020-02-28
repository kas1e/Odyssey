#ifndef TextBreakIteratorTest_h_CPPUNIT
#define TextBreakIteratorTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCTextBreakIterator.h"
class TextBreakIteratorTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( TextBreakIteratorTestTest );
//register each method:
    CPPUNIT_TEST(characterBreakIterator);
    CPPUNIT_TEST(wordBreakIterator);
    CPPUNIT_TEST(lineBreakIterator);
    CPPUNIT_TEST(sentenceBreakIterator);

    CPPUNIT_TEST(textBreakFirst);
    CPPUNIT_TEST(textBreakNext);
    CPPUNIT_TEST(textBreakCurrent);
    CPPUNIT_TEST(textBreakPreceding);
    CPPUNIT_TEST(textBreakFollowing);
    CPPUNIT_TEST(isTextBreak);


    CPPUNIT_TEST_SUITE_END();

    void characterBreakIterator() CPPU_NOT_IMPLEMENTED
    void wordBreakIterator() CPPU_NOT_IMPLEMENTED
    void lineBreakIterator() CPPU_NOT_IMPLEMENTED
    void sentenceBreakIterator() CPPU_NOT_IMPLEMENTED

    void textBreakFirst() CPPU_NOT_IMPLEMENTED
    void textBreakNext() CPPU_NOT_IMPLEMENTED
    void textBreakCurrent() CPPU_NOT_IMPLEMENTED
    void textBreakPreceding() CPPU_NOT_IMPLEMENTED
    void textBreakFollowing() CPPU_NOT_IMPLEMENTED
    void isTextBreak() CPPU_NOT_IMPLEMENTED


};

#endif

