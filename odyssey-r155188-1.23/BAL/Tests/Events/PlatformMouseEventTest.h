#ifndef PlatformMouseEventTest_h_CPPUNIT
#define PlatformMouseEventTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCPlatformMouseEvent.h"
class PlatformMouseEventTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( PlatformMouseEventTestTest );
//register each method:
    CPPUNIT_TEST(PlatformMouseEvent);
    CPPUNIT_TEST(PlatformMouseEvent_params);

    CPPUNIT_TEST(pos);
    CPPUNIT_TEST(x);
    CPPUNIT_TEST(y);
    CPPUNIT_TEST(globalX);
    CPPUNIT_TEST(globalY);
    CPPUNIT_TEST(button);
    CPPUNIT_TEST(eventType);
    CPPUNIT_TEST(clickCount);
    CPPUNIT_TEST(shiftKey);
    CPPUNIT_TEST(ctrlKey);
    CPPUNIT_TEST(altKey);
    CPPUNIT_TEST(metaKey);
    CPPUNIT_TEST(modifierFlags);
        
    CPPUNIT_TEST(timestamp);

    CPPUNIT_TEST(PlatformMouseEvent_button);
    CPPUNIT_TEST(PlatformMouseEvent_motion);
 
    CPPUNIT_TEST_SUITE_END();


    public:
    void PlatformMouseEvent() CPPU_NOT_IMPLEMENTED
    void PlatformMouseEvent_params() CPPU_NOT_IMPLEMENTED

    void pos() CPPU_NOT_IMPLEMENTED
    void x() CPPU_NOT_IMPLEMENTED
    void y() CPPU_NOT_IMPLEMENTED
    void globalX() CPPU_NOT_IMPLEMENTED
    void globalY() CPPU_NOT_IMPLEMENTED
    void button() CPPU_NOT_IMPLEMENTED
    void eventType() CPPU_NOT_IMPLEMENTED
    void clickCount() CPPU_NOT_IMPLEMENTED
    void shiftKey() CPPU_NOT_IMPLEMENTED
    void ctrlKey() CPPU_NOT_IMPLEMENTED
    void altKey() CPPU_NOT_IMPLEMENTED
    void metaKey() CPPU_NOT_IMPLEMENTED
    void modifierFlags() CPPU_NOT_IMPLEMENTED
        
    void timestamp() CPPU_NOT_IMPLEMENTED

    void PlatformMouseEvent_button() CPPU_NOT_IMPLEMENTED
    void PlatformMouseEvent_motion() CPPU_NOT_IMPLEMENTED
    };


#endif // PlatformMouseEvent_h

