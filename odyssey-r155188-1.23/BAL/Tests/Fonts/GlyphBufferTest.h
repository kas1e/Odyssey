#ifndef GlyphBufferTest_h_CPPUNIT
#define GlyphBufferTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCGlyphBuffer.h"
class GlyphBufferTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( GlyphBufferTestTest );
//register each method:
    CPPUNIT_TEST(isEmpty);
    CPPUNIT_TEST(size);
    
    CPPUNIT_TEST(clear);
    CPPUNIT_TEST(glyphs);
    CPPUNIT_TEST(advances);
    CPPUNIT_TEST(glyphs2);
    CPPUNIT_TEST(advances2);

    CPPUNIT_TEST(fontDataAt);
    
    CPPUNIT_TEST(swap);
    CPPUNIT_TEST(glyphAt);
    CPPUNIT_TEST(advanceAt);
    CPPUNIT_TEST(offsetAt);
    CPPUNIT_TEST(add);


    CPPUNIT_TEST_SUITE_END();


public:
    void isEmpty() CPPU_NOT_IMPLEMENTED
    void size() CPPU_NOT_IMPLEMENTED
    
    void clear() CPPU_NOT_IMPLEMENTED
    void glyphs() CPPU_NOT_IMPLEMENTED
    void advances() CPPU_NOT_IMPLEMENTED
    void glyphs2() CPPU_NOT_IMPLEMENTED
    void advances2() CPPU_NOT_IMPLEMENTED

    void fontDataAt() CPPU_NOT_IMPLEMENTED
    
    void swap() CPPU_NOT_IMPLEMENTED
    void glyphAt() CPPU_NOT_IMPLEMENTED
    void advanceAt() CPPU_NOT_IMPLEMENTED
    void offsetAt() CPPU_NOT_IMPLEMENTED
    void add() CPPU_NOT_IMPLEMENTED

};

#endif

