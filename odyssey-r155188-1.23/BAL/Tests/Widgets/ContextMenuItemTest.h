#ifndef ContextMenuItemTest_h_CPPUNIT
#define ContextMenuItemTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "Platform.h"
#include "BCContextMenuItem.h"
class ContextMenuItemTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ContextMenuItemTestTest );
//register each method:
    CPPUNIT_TEST(ContextMenuItem_PlatformMenuItemDescription);
    CPPUNIT_TEST(ContextMenuItem_ContextMenu);
    CPPUNIT_TEST(ContextMenuItem_ContextMenuItemType_ContextMenuAction);
    CPPUNIT_TEST(ContextMenuItem_BalMenuItem);
    CPPUNIT_TEST(destruct_ContextMenuItem);

    CPPUNIT_TEST(releasePlatformDescription);

    CPPUNIT_TEST(type);
    CPPUNIT_TEST(setType);

    CPPUNIT_TEST(action);
    CPPUNIT_TEST(setAction);

    CPPUNIT_TEST(title);
    CPPUNIT_TEST(setTitle);

    CPPUNIT_TEST(platformSubMenu);
    CPPUNIT_TEST(setSubMenu);

    CPPUNIT_TEST(setChecked);
        
    CPPUNIT_TEST(setEnabled);
    CPPUNIT_TEST(enabled);

    CPPUNIT_TEST(createNativeMenuItem);


    CPPUNIT_TEST_SUITE_END();


    public:
    void ContextMenuItem_PlatformMenuItemDescription() CPPU_NOT_IMPLEMENTED
    void ContextMenuItem_ContextMenu() CPPU_NOT_IMPLEMENTED
    void ContextMenuItem_ContextMenuItemType_ContextMenuAction() CPPU_NOT_IMPLEMENTED
    void ContextMenuItem_BalMenuItem() CPPU_NOT_IMPLEMENTED
    void destruct_ContextMenuItem() CPPU_NOT_IMPLEMENTED

    void releasePlatformDescription() CPPU_NOT_IMPLEMENTED

    void type() CPPU_NOT_IMPLEMENTED
    void setType() CPPU_NOT_IMPLEMENTED

    void action() CPPU_NOT_IMPLEMENTED
    void setAction() CPPU_NOT_IMPLEMENTED

    void title() CPPU_NOT_IMPLEMENTED
    void setTitle() CPPU_NOT_IMPLEMENTED

    void platformSubMenu() CPPU_NOT_IMPLEMENTED
    void setSubMenu() CPPU_NOT_IMPLEMENTED

    void setChecked() CPPU_NOT_IMPLEMENTED
        
    void setEnabled() CPPU_NOT_IMPLEMENTED
    void enabled() CPPU_NOT_IMPLEMENTED

    void createNativeMenuItem() CPPU_NOT_IMPLEMENTED

    };


#endif // ContextMenuItem_h


