#include "Platform.h"
#if ENABLE(SVG)
#ifndef SVGResourceMaskerTest_h_CPPUNIT
#define SVGResourceMaskerTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSVGResourceMasker.h"
class SVGResourceMaskerTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SVGResourceMaskerTestTest );
//register each method:
    CPPUNIT_TEST(create);
    CPPUNIT_TEST(destruct_SVGResourceMasker);
        
    CPPUNIT_TEST(invalidate);
        
    CPPUNIT_TEST(resourceType);
    CPPUNIT_TEST(externalRepresentation);

    CPPUNIT_TEST(applyMask);
    CPPUNIT_TEST(getMaskerById);


    CPPUNIT_TEST_SUITE_END();


    public:
    void create() CPPU_NOT_IMPLEMENTED
    void destruct_SVGResourceMasker() CPPU_NOT_IMPLEMENTED
        
    void invalidate() CPPU_NOT_IMPLEMENTED
        
    void resourceType() CPPU_NOT_IMPLEMENTED
    void externalRepresentation() CPPU_NOT_IMPLEMENTED

    void applyMask() CPPU_NOT_IMPLEMENTED
    void getMaskerById() CPPU_NOT_IMPLEMENTED

    };



#endif // SVGResourceMasker_h
#endif

