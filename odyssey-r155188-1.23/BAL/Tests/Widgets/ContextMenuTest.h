#ifndef ContextMenuTest_h_CPPUNIT
#define ContextMenuTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "Platform.h"
#include "BCContextMenu.h"
class ContextMenuTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ContextMenuTestTest );
//register each method:
    CPPUNIT_TEST(ContextMenu);
    CPPUNIT_TEST(ContextMenu_withPlatformMenuDescription);
    CPPUNIT_TEST(destruct_ContextMenu);

    CPPUNIT_TEST(populate);
    CPPUNIT_TEST(addInspectElementItem);
    CPPUNIT_TEST(checkOrEnableIfNeeded);

    CPPUNIT_TEST(insertItem);
    CPPUNIT_TEST(appendItem);
        
    CPPUNIT_TEST(itemWithAction);
    CPPUNIT_TEST(itemAtIndex);

    CPPUNIT_TEST(itemCount);

    CPPUNIT_TEST(hitTestResult);
    CPPUNIT_TEST(controller);

    CPPUNIT_TEST(platformDescription);
    CPPUNIT_TEST(setPlatformDescription);

    CPPUNIT_TEST(releasePlatformDescription);


    CPPUNIT_TEST_SUITE_END();

    public:
    void ContextMenu() CPPU_NOT_IMPLEMENTED
    void ContextMenu_withPlatformMenuDescription() CPPU_NOT_IMPLEMENTED
    void destruct_ContextMenu() CPPU_NOT_IMPLEMENTED

    void populate() CPPU_NOT_IMPLEMENTED
    void addInspectElementItem() CPPU_NOT_IMPLEMENTED
    void checkOrEnableIfNeeded() CPPU_NOT_IMPLEMENTED

    void insertItem() CPPU_NOT_IMPLEMENTED
    void appendItem() CPPU_NOT_IMPLEMENTED
        
    void itemWithAction() CPPU_NOT_IMPLEMENTED
    void itemAtIndex() CPPU_NOT_IMPLEMENTED

    void itemCount() CPPU_NOT_IMPLEMENTED

    void hitTestResult() CPPU_NOT_IMPLEMENTED
    void controller() CPPU_NOT_IMPLEMENTED

    void platformDescription() CPPU_NOT_IMPLEMENTED
    void setPlatformDescription() CPPU_NOT_IMPLEMENTED

    void releasePlatformDescription() CPPU_NOT_IMPLEMENTED


    };


#endif // ContextMenu_h


