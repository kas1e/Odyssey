#include "Platform.h"
#if ENABLE(SVG)
#ifndef SVGResourceClipperTest_h_CPPUNIT
#define SVGResourceClipperTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSVGResourceClipper.h"
class SVGResourceClipperTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SVGResourceClipperTestTest );
//register each method:
    CPPUNIT_TEST(ClipDataList_addPath);
    CPPUNIT_TEST(ClipDataList_clear);
    CPPUNIT_TEST(ClipDataList_clipData);
    CPPUNIT_TEST(ClipDataList_isEmpty);

    CPPUNIT_TEST(create);
    CPPUNIT_TEST(destruct_SVGResourceClipper);
      
    CPPUNIT_TEST(resetClipData);
    CPPUNIT_TEST(addClipData);

    CPPUNIT_TEST(clipData);
        
    CPPUNIT_TEST(resourceType);
    CPPUNIT_TEST(externalRepresentation);

    CPPUNIT_TEST(applyClip);
    CPPUNIT_TEST(operator_left_windrule);
    CPPUNIT_TEST(operator_left_clipdata);
    CPPUNIT_TEST(getClipperById);


    CPPUNIT_TEST_SUITE_END();

    public:
    void ClipDataList_addPath() CPPU_NOT_IMPLEMENTED
    void ClipDataList_clear() CPPU_NOT_IMPLEMENTED
    void ClipDataList_clipData() CPPU_NOT_IMPLEMENTED
    void ClipDataList_isEmpty() CPPU_NOT_IMPLEMENTED

    void create() CPPU_NOT_IMPLEMENTED
    void destruct_SVGResourceClipper() CPPU_NOT_IMPLEMENTED
      
    void resetClipData() CPPU_NOT_IMPLEMENTED
    void addClipData() CPPU_NOT_IMPLEMENTED

    void clipData() CPPU_NOT_IMPLEMENTED
        
    void resourceType() CPPU_NOT_IMPLEMENTED
    void externalRepresentation() CPPU_NOT_IMPLEMENTED

    void applyClip() CPPU_NOT_IMPLEMENTED
    void operator_left_windrule() CPPU_NOT_IMPLEMENTED
    void operator_left_clipdata() CPPU_NOT_IMPLEMENTED
    void getClipperById() CPPU_NOT_IMPLEMENTED


    };




#endif // SVGResourceClipper_h
#endif

