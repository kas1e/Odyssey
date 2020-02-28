#ifndef GlyphPageTreeNodeTest_h_CPPUNIT
#define GlyphPageTreeNodeTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCGlyphPageTreeNode.h"
class GlyphPageTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( GlyphPageTestTest );
//register each method:
    CPPUNIT_TEST(GlyphPage);
    CPPUNIT_TEST(GlyphPage_GlyphPageTreeNode);

    CPPUNIT_TEST(glyphDataForCharacter);
    CPPUNIT_TEST(setGlyphDataForCharacter);
    CPPUNIT_TEST(setGlyphDataForIndex);
    CPPUNIT_TEST(owner);
    CPPUNIT_TEST(fill);
    CPPUNIT_TEST_SUITE_END();
public:
    void GlyphPage() CPPU_NOT_IMPLEMENTED
    void GlyphPage_GlyphPageTreeNode() CPPU_NOT_IMPLEMENTED

    void glyphDataForCharacter() CPPU_NOT_IMPLEMENTED
    void setGlyphDataForCharacter() CPPU_NOT_IMPLEMENTED
    void setGlyphDataForIndex() CPPU_NOT_IMPLEMENTED
    void owner() CPPU_NOT_IMPLEMENTED
    void fill() CPPU_NOT_IMPLEMENTED
};

class GlyphPageTreeNodeTest: public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( GlyphPageTreeNodeTest);
//register each method:
    CPPUNIT_TEST(GlyphPageTreeNode);
    CPPUNIT_TEST(destruct_GlyphPageTreeNode);

    CPPUNIT_TEST(getRootChild);
    CPPUNIT_TEST(pruneTreeCustomFontData);
    CPPUNIT_TEST(pruneTreeFontData);

    CPPUNIT_TEST(pruneCustomFontData);
    CPPUNIT_TEST(pruneFontData);

    CPPUNIT_TEST(parent);
    CPPUNIT_TEST(getChild);

    CPPUNIT_TEST(page);

    CPPUNIT_TEST(level);

    CPPUNIT_TEST(isSystemFallback);

    CPPUNIT_TEST(treeGlyphPageCount);
    CPPUNIT_TEST(pageCount);

    CPPUNIT_TEST_SUITE_END();
public:
    void GlyphPageTreeNode() CPPU_NOT_IMPLEMENTED
    void destruct_GlyphPageTreeNode() CPPU_NOT_IMPLEMENTED

    void getRootChild() CPPU_NOT_IMPLEMENTED
    void pruneTreeCustomFontData() CPPU_NOT_IMPLEMENTED
    void pruneTreeFontData() CPPU_NOT_IMPLEMENTED

    void pruneCustomFontData() CPPU_NOT_IMPLEMENTED
    void pruneFontData() CPPU_NOT_IMPLEMENTED

    void parent() CPPU_NOT_IMPLEMENTED
    void getChild() CPPU_NOT_IMPLEMENTED

    void page() CPPU_NOT_IMPLEMENTED

    void level() CPPU_NOT_IMPLEMENTED

    void isSystemFallback() CPPU_NOT_IMPLEMENTED

    void treeGlyphPageCount() CPPU_NOT_IMPLEMENTED
    void pageCount() CPPU_NOT_IMPLEMENTED

};


#endif // GlyphPageTreeNode_h

