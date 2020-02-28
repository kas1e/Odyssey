#ifndef PlatformKeyboardEventTest_h_CPPUNIT
#define PlatformKeyboardEventTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCPlatformKeyboardEvent.h"
class PlatformKeyboardEventTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( PlatformKeyboardEventTestTest );
//register each method:
    CPPUNIT_TEST(type);
    CPPUNIT_TEST(disambiguateKeyDownEvent);
    CPPUNIT_TEST(text);
    CPPUNIT_TEST(unmodifiedText);
    CPPUNIT_TEST(windowsVirtualKeyCode);
    CPPUNIT_TEST(setWindowsVirtualKeyCode);
    CPPUNIT_TEST(keyIdentifier);
    CPPUNIT_TEST(isAutoRepeat);
    CPPUNIT_TEST(setIsAutoRepeat);
    CPPUNIT_TEST(isKeypad);
    CPPUNIT_TEST(shiftKey);
    CPPUNIT_TEST(ctrlKey);
    CPPUNIT_TEST(altKey);
    CPPUNIT_TEST(metaKey);
    CPPUNIT_TEST(modifiers);
    CPPUNIT_TEST(currentCapsLockState);
    CPPUNIT_TEST(PlatformKeyboardEvent);
    CPPUNIT_TEST(balEventKey);

    CPPUNIT_TEST_SUITE_END();

    public:
    void type() CPPU_NOT_IMPLEMENTED
    void disambiguateKeyDownEvent() CPPU_NOT_IMPLEMENTED
    void text() CPPU_NOT_IMPLEMENTED
    void unmodifiedText() CPPU_NOT_IMPLEMENTED
    void windowsVirtualKeyCode() CPPU_NOT_IMPLEMENTED
    void setWindowsVirtualKeyCode() CPPU_NOT_IMPLEMENTED
    void keyIdentifier() CPPU_NOT_IMPLEMENTED
    void isAutoRepeat() CPPU_NOT_IMPLEMENTED
    void setIsAutoRepeat() CPPU_NOT_IMPLEMENTED
    void isKeypad() CPPU_NOT_IMPLEMENTED
    void shiftKey() CPPU_NOT_IMPLEMENTED
    void ctrlKey() CPPU_NOT_IMPLEMENTED
    void altKey() CPPU_NOT_IMPLEMENTED
    void metaKey() CPPU_NOT_IMPLEMENTED
    void modifiers() CPPU_NOT_IMPLEMENTED
    void currentCapsLockState() CPPU_NOT_IMPLEMENTED
    void PlatformKeyboardEvent() CPPU_NOT_IMPLEMENTED
    void balEventKey() CPPU_NOT_IMPLEMENTED
    };

#endif // PlatformKeyboardEvent_h

