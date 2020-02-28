#include "Platform.h"
#if ENABLE(SVG)
#ifndef SVGPaintServerSolidTest_h_CPPUNIT
#define SVGPaintServerSolidTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSVGPaintServerSolid.h"
class SVGPaintServerSolidTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SVGPaintServerSolidTestTest );
//register each method:
    CPPUNIT_TEST(create);
    CPPUNIT_TEST(destruct_SVGPaintServerSolid);

    CPPUNIT_TEST(type);

    CPPUNIT_TEST(color);
    CPPUNIT_TEST(setColor);

    CPPUNIT_TEST(externalRepresentation);


    CPPUNIT_TEST_SUITE_END();


    public:
    void create() CPPU_NOT_IMPLEMENTED
    void destruct_SVGPaintServerSolid() CPPU_NOT_IMPLEMENTED

    void type() CPPU_NOT_IMPLEMENTED

    void color() CPPU_NOT_IMPLEMENTED
    void setColor() CPPU_NOT_IMPLEMENTED

    void externalRepresentation() CPPU_NOT_IMPLEMENTED

    };


#endif // SVGPaintServerSolid_h

#endif

