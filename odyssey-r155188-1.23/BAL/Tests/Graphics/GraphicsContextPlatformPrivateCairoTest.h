#ifndef GraphicsContextPlatformPrivateCairoTest_h_CPPUNIT
#define GraphicsContextPlatformPrivateCairoTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCGraphicsContextPlatformPrivate.h"
class GraphicsContextPlatformPrivateCairoTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( GraphicsContextPlatformPrivateCairoTestTest );
//register each method:
    CPPUNIT_TEST(GraphicsContextPlatformPrivate);
    CPPUNIT_TEST(destruct_GraphicsContextPlatformPrivate);
    CPPUNIT_TEST(save);
    CPPUNIT_TEST(restore);
    CPPUNIT_TEST(clip);
    CPPUNIT_TEST(clip2);
    CPPUNIT_TEST(scale);
    CPPUNIT_TEST(rotate);
    CPPUNIT_TEST(translate);
    CPPUNIT_TEST(concatCTM);
    CPPUNIT_TEST(beginTransparencyLayer);
    CPPUNIT_TEST(endTransparencyLayer);
    CPPUNIT_TEST_SUITE_END();

public:
    void GraphicsContextPlatformPrivate() CPPU_NOT_IMPLEMENTED
    void destruct_GraphicsContextPlatformPrivate() CPPU_NOT_IMPLEMENTED
    void save() CPPU_NOT_IMPLEMENTED
    void restore() CPPU_NOT_IMPLEMENTED
    void clip() CPPU_NOT_IMPLEMENTED
    void clip2() CPPU_NOT_IMPLEMENTED
    void scale() CPPU_NOT_IMPLEMENTED
    void rotate() CPPU_NOT_IMPLEMENTED
    void translate() CPPU_NOT_IMPLEMENTED
    void concatCTM() CPPU_NOT_IMPLEMENTED
    void beginTransparencyLayer() CPPU_NOT_IMPLEMENTED
    void endTransparencyLayer() CPPU_NOT_IMPLEMENTED
};


#endif //remember to remove this line once this file is customized

