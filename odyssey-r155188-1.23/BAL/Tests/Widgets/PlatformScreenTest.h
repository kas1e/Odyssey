#ifndef PlatformScreenTest_h_CPPUNIT
#define PlatformScreenTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCPlatformScreen.h"
class PlatformScreenTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( PlatformScreenTestTest );
//register each method:
    CPPUNIT_TEST(screenDepth);
    CPPUNIT_TEST(screenDepthPerComponent);
    CPPUNIT_TEST(screenIsMonochrome);

    CPPUNIT_TEST(screenRect);
    CPPUNIT_TEST(screenAvailableRect);


    CPPUNIT_TEST_SUITE_END();


    public:
    void screenDepth() CPPU_NOT_IMPLEMENTED
    void screenDepthPerComponent() CPPU_NOT_IMPLEMENTED
    void screenIsMonochrome() CPPU_NOT_IMPLEMENTED

    void screenRect() CPPU_NOT_IMPLEMENTED
    void screenAvailableRect() CPPU_NOT_IMPLEMENTED


};
#endif // PlatformScreen_h



