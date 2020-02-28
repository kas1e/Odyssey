#ifndef TreeSharedTest_h_CPPUNIT
#define TreeSharedTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "Platform.h"
#include "BCTreeShared.h"
class TreeSharedTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( TreeSharedTestTest );
//register each method:
    CPPUNIT_TEST(TreeShared);
    CPPUNIT_TEST(TreeShared_T);
    CPPUNIT_TEST(destruct_TreeShared);
    CPPUNIT_TEST(ref);
    CPPUNIT_TEST(deref);
    CPPUNIT_TEST(hasOneRef);
    CPPUNIT_TEST(refCount);
    CPPUNIT_TEST(setParent);
    CPPUNIT_TEST(parent);
    CPPUNIT_TEST_SUITE_END();


public:
    void TreeShared() CPPU_NOT_IMPLEMENTED
    void TreeShared_T() CPPU_NOT_IMPLEMENTED
    void destruct_TreeShared() CPPU_NOT_IMPLEMENTED
    void ref() CPPU_NOT_IMPLEMENTED
    void deref() CPPU_NOT_IMPLEMENTED
    void hasOneRef() CPPU_NOT_IMPLEMENTED
    void refCount() CPPU_NOT_IMPLEMENTED
    void setParent() CPPU_NOT_IMPLEMENTED
    void parent() CPPU_NOT_IMPLEMENTED
};


#endif // TreeShared.h

