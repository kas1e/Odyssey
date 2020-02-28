#ifndef PopupMenuTest_h_CPPUNIT
#define PopupMenuTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCPopupMenu.h"
class PopupMenuTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( PopupMenuTestTest );
//register each method:
    CPPUNIT_TEST(create);
    CPPUNIT_TEST(destruct_PopupMenu);
    
    CPPUNIT_TEST(disconnectClient);

    CPPUNIT_TEST(show);
    CPPUNIT_TEST(hide);

    CPPUNIT_TEST(updateFromElement);
    
    CPPUNIT_TEST(client);

    CPPUNIT_TEST(itemWritingDirectionIsNatural);


    CPPUNIT_TEST_SUITE_END();

public:
    void create() CPPU_NOT_IMPLEMENTED
    void destruct_PopupMenu() CPPU_NOT_IMPLEMENTED
    
    void disconnectClient() CPPU_NOT_IMPLEMENTED

    void show() CPPU_NOT_IMPLEMENTED
    void hide() CPPU_NOT_IMPLEMENTED

    void updateFromElement() CPPU_NOT_IMPLEMENTED
    
    void client() CPPU_NOT_IMPLEMENTED

    void itemWritingDirectionIsNatural() CPPU_NOT_IMPLEMENTED

};

#endif


