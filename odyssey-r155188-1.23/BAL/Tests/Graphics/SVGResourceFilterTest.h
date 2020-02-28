#include "Platform.h"
#if ENABLE(SVG)
#ifndef SVGResourceFilterTest_h_CPPUNIT
#define SVGResourceFilterTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSVGResourceFilter.h"
class SVGResourceFilterTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SVGResourceFilterTestTest );
//register each method:

    CPPUNIT_TEST(destruct_SVGResourceFilterPlatformData);
    CPPUNIT_TEST(SVGResourceFilter);
    
    CPPUNIT_TEST(resourceType);

    CPPUNIT_TEST(filterBoundingBoxMode);
    CPPUNIT_TEST(setFilterBoundingBoxMode);

    CPPUNIT_TEST(effectBoundingBoxMode);
    CPPUNIT_TEST(setEffectBoundingBoxMode);
    CPPUNIT_TEST(xBoundingBoxMode);
    CPPUNIT_TEST(setXBoundingBoxMode);
    CPPUNIT_TEST(yBoundingBoxMode);
    CPPUNIT_TEST(setYBoundingBoxMode);
    CPPUNIT_TEST(filterRect);
    CPPUNIT_TEST(setFilterRect);
    CPPUNIT_TEST(filterBBoxForItemBBox);
    CPPUNIT_TEST(clearEffects);
    CPPUNIT_TEST(addFilterEffect);

    CPPUNIT_TEST(externalRepresentation);

    CPPUNIT_TEST(prepareFilter);
    CPPUNIT_TEST(applyFilter);
    
    CPPUNIT_TEST(platformData);
    CPPUNIT_TEST(effects);
    CPPUNIT_TEST(getFilterById);
 
    CPPUNIT_TEST_SUITE_END();


    void destruct_SVGResourceFilterPlatformData() CPPU_NOT_IMPLEMENTED
    void SVGResourceFilter() CPPU_NOT_IMPLEMENTED
    
    void resourceType() CPPU_NOT_IMPLEMENTED

    void filterBoundingBoxMode() CPPU_NOT_IMPLEMENTED
    void setFilterBoundingBoxMode() CPPU_NOT_IMPLEMENTED

    void effectBoundingBoxMode() CPPU_NOT_IMPLEMENTED
    void setEffectBoundingBoxMode() CPPU_NOT_IMPLEMENTED
    void xBoundingBoxMode() CPPU_NOT_IMPLEMENTED
    void setXBoundingBoxMode() CPPU_NOT_IMPLEMENTED
    void yBoundingBoxMode() CPPU_NOT_IMPLEMENTED
    void setYBoundingBoxMode() CPPU_NOT_IMPLEMENTED
    void filterRect() CPPU_NOT_IMPLEMENTED
    void setFilterRect() CPPU_NOT_IMPLEMENTED
    void filterBBoxForItemBBox() CPPU_NOT_IMPLEMENTED
    void clearEffects() CPPU_NOT_IMPLEMENTED
    void addFilterEffect() CPPU_NOT_IMPLEMENTED

    void externalRepresentation() CPPU_NOT_IMPLEMENTED

    void prepareFilter() CPPU_NOT_IMPLEMENTED
    void applyFilter() CPPU_NOT_IMPLEMENTED
    
    void platformData() CPPU_NOT_IMPLEMENTED
    void effects() CPPU_NOT_IMPLEMENTED
    void getFilterById() CPPU_NOT_IMPLEMENTED
    
};




#endif // SVGResourceFilter_h
#endif // ENABLE(SVG)

