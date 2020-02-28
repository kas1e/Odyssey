#ifndef PopupMenuClientTest_h_CPPUNIT
#define PopupMenuClientTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCPopupMenuClient.h"
class PopupMenuClientTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( PopupMenuClientTestTest );
//register each method:
    CPPUNIT_TEST(destruct_PopupMenuClient);
    CPPUNIT_TEST(valueChanged);

    CPPUNIT_TEST(itemText);
    CPPUNIT_TEST(itemIsEnabled);
    CPPUNIT_TEST(itemBackgroundColor);
    CPPUNIT_TEST(itemStyle);
    CPPUNIT_TEST(clientStyle);
    CPPUNIT_TEST(clientDocument);
    CPPUNIT_TEST(clientInsetLeft);
    CPPUNIT_TEST(clientInsetRight);
    CPPUNIT_TEST(clientPaddingLeft);
    CPPUNIT_TEST(clientPaddingRight);
    CPPUNIT_TEST(listSize);
    CPPUNIT_TEST(selectedIndex);
    CPPUNIT_TEST(hidePopup);
    CPPUNIT_TEST(itemIsSeparator);
    CPPUNIT_TEST(itemIsLabel);
    CPPUNIT_TEST(itemIsSelected);
    CPPUNIT_TEST(shouldPopOver);
    CPPUNIT_TEST(valueShouldChangeOnHotTrack);
    CPPUNIT_TEST(setTextFromItem);
    CPPUNIT_TEST(fontSelector);


    CPPUNIT_TEST_SUITE_END();


public:
    void destruct_PopupMenuClient() CPPU_NOT_IMPLEMENTED
    void valueChanged() CPPU_NOT_IMPLEMENTED

    void itemText() CPPU_NOT_IMPLEMENTED
    void itemIsEnabled() CPPU_NOT_IMPLEMENTED
    void itemBackgroundColor() CPPU_NOT_IMPLEMENTED
    void itemStyle() CPPU_NOT_IMPLEMENTED
    void clientStyle() CPPU_NOT_IMPLEMENTED
    void clientDocument() CPPU_NOT_IMPLEMENTED
    void clientInsetLeft() CPPU_NOT_IMPLEMENTED
    void clientInsetRight() CPPU_NOT_IMPLEMENTED
    void clientPaddingLeft() CPPU_NOT_IMPLEMENTED
    void clientPaddingRight() CPPU_NOT_IMPLEMENTED
    void listSize() CPPU_NOT_IMPLEMENTED
    void selectedIndex() CPPU_NOT_IMPLEMENTED
    void hidePopup() CPPU_NOT_IMPLEMENTED
    void itemIsSeparator() CPPU_NOT_IMPLEMENTED
    void itemIsLabel() CPPU_NOT_IMPLEMENTED
    void itemIsSelected() CPPU_NOT_IMPLEMENTED
    void shouldPopOver() CPPU_NOT_IMPLEMENTED
    void valueShouldChangeOnHotTrack() CPPU_NOT_IMPLEMENTED
    void setTextFromItem() CPPU_NOT_IMPLEMENTED
    void fontSelector() CPPU_NOT_IMPLEMENTED

};


#endif


