#ifndef PlatformWheelEventTest_h_CPPUNIT
#define PlatformWheelEventTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCPlatformWheelEvent.h"
class PlatformWheelEventTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( PlatformWheelEventTestTest );
//register each method:
    CPPUNIT_TEST(pos);
    CPPUNIT_TEST(globalPos);

    CPPUNIT_TEST(deltaX);
    CPPUNIT_TEST(deltaY);

    CPPUNIT_TEST(isAccepted);
    CPPUNIT_TEST(shiftKey);
    CPPUNIT_TEST(ctrlKey);
    CPPUNIT_TEST(altKey);
    CPPUNIT_TEST(metaKey);

    CPPUNIT_TEST(x);
    CPPUNIT_TEST(y);
    CPPUNIT_TEST(globalX);
    CPPUNIT_TEST(globalY);

    CPPUNIT_TEST(accept);
    CPPUNIT_TEST(ignore);
        
    CPPUNIT_TEST(isContinuous);
    CPPUNIT_TEST(continuousDeltaX);
    CPPUNIT_TEST(continuousDeltaY);

    CPPUNIT_TEST(PlatformWheelEvent);
 
    CPPUNIT_TEST_SUITE_END();

    public:
    void pos() CPPU_NOT_IMPLEMENTED
    void globalPos() CPPU_NOT_IMPLEMENTED

    void deltaX() CPPU_NOT_IMPLEMENTED
    void deltaY() CPPU_NOT_IMPLEMENTED

    void isAccepted() CPPU_NOT_IMPLEMENTED
    void shiftKey() CPPU_NOT_IMPLEMENTED
    void ctrlKey() CPPU_NOT_IMPLEMENTED
    void altKey() CPPU_NOT_IMPLEMENTED
    void metaKey() CPPU_NOT_IMPLEMENTED

    void x() CPPU_NOT_IMPLEMENTED
    void y() CPPU_NOT_IMPLEMENTED
    void globalX() CPPU_NOT_IMPLEMENTED
    void globalY() CPPU_NOT_IMPLEMENTED

    void accept() CPPU_NOT_IMPLEMENTED
    void ignore() CPPU_NOT_IMPLEMENTED
        
    void isContinuous() CPPU_NOT_IMPLEMENTED
    void continuousDeltaX() CPPU_NOT_IMPLEMENTED
    void continuousDeltaY() CPPU_NOT_IMPLEMENTED

    void PlatformWheelEvent() CPPU_NOT_IMPLEMENTED
    };


#endif // PlatformWheelEvent_h


