#ifndef ImageObserverTest_h_CPPUNIT
#define ImageObserverTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCImageObserver.h"
class ImageObserverTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ImageObserverTestTest );
//register each method:
    CPPUNIT_TEST(decodedSizeChanged);
    CPPUNIT_TEST(didDraw);

    CPPUNIT_TEST(shouldPauseAnimation);
    CPPUNIT_TEST(animationAdvanced);

    CPPUNIT_TEST_SUITE_END();

public:
    void decodedSizeChanged() CPPU_NOT_IMPLEMENTED
    void didDraw() CPPU_NOT_IMPLEMENTED

    void shouldPauseAnimation() CPPU_NOT_IMPLEMENTED
    void animationAdvanced() CPPU_NOT_IMPLEMENTED
};


#endif

