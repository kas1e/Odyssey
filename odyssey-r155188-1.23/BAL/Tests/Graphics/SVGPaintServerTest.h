#include "Platform.h"
#if ENABLE(SVG)

#ifndef SVGPaintServerTest_h_CPPUNIT
#define SVGPaintServerTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSVGPaintServer.h"
class SVGPaintServerTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SVGPaintServerTestTest );
//register each method:
    CPPUNIT_TEST(destruct_SVGPaintServer);

    CPPUNIT_TEST(resourceType);

    CPPUNIT_TEST(type);
    CPPUNIT_TEST(externalRepresentation);

    CPPUNIT_TEST(draw);
    CPPUNIT_TEST(teardown);
    CPPUNIT_TEST(renderPath);

    CPPUNIT_TEST(setup);

    CPPUNIT_TEST(strokePaintServer);
    CPPUNIT_TEST(fillPaintServer);
    CPPUNIT_TEST(sharedSolidPaintServer);

    CPPUNIT_TEST(operator_left);
    CPPUNIT_TEST(getPaintServerById);
    CPPUNIT_TEST(dashArrayFromRenderingStyle);


    CPPUNIT_TEST_SUITE_END();

    public:
    void destruct_SVGPaintServer() CPPU_NOT_IMPLEMENTED

    void resourceType() CPPU_NOT_IMPLEMENTED

    void type() CPPU_NOT_IMPLEMENTED
    void externalRepresentation() CPPU_NOT_IMPLEMENTED

    void draw() CPPU_NOT_IMPLEMENTED
    void teardown() CPPU_NOT_IMPLEMENTED
    void renderPath() CPPU_NOT_IMPLEMENTED

    void setup() CPPU_NOT_IMPLEMENTED

    void strokePaintServer() CPPU_NOT_IMPLEMENTED
    void fillPaintServer() CPPU_NOT_IMPLEMENTED
    void sharedSolidPaintServer() CPPU_NOT_IMPLEMENTED

    void operator_left() CPPU_NOT_IMPLEMENTED
    void getPaintServerById() CPPU_NOT_IMPLEMENTED
    void dashArrayFromRenderingStyle() CPPU_NOT_IMPLEMENTED

    };


#endif // SVGPaintServer_h

#endif

