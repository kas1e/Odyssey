#ifndef DragDataTest_h_CPPUNIT
#define DragDataTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCDragData.h"
class DragDataTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( DragDataTestTest );
//register each method:
    CPPUNIT_TEST(DragData);
    CPPUNIT_TEST(clientPosition);
    CPPUNIT_TEST(globalPosition);
    CPPUNIT_TEST(platformData);
    CPPUNIT_TEST(draggingSourceOperationMask);
    CPPUNIT_TEST(createClipboard);
    CPPUNIT_TEST(containsURL);
    CPPUNIT_TEST(containsPlainText);
    CPPUNIT_TEST(containsCompatibleContent);
    CPPUNIT_TEST(asURL);
    CPPUNIT_TEST(asPlainText);
    CPPUNIT_TEST(asFilenames);
    CPPUNIT_TEST(asColor);
    CPPUNIT_TEST(asFragment);
    CPPUNIT_TEST(canSmartReplace);
    CPPUNIT_TEST(containsColor);
    CPPUNIT_TEST(containsFiles);
    CPPUNIT_TEST_SUITE_END();

    public:
    void DragData() CPPU_NOT_IMPLEMENTED
    void clientPosition() CPPU_NOT_IMPLEMENTED
    void globalPosition() CPPU_NOT_IMPLEMENTED
    void platformData() CPPU_NOT_IMPLEMENTED
    void draggingSourceOperationMask() CPPU_NOT_IMPLEMENTED
    void createClipboard() CPPU_NOT_IMPLEMENTED
    void containsURL() CPPU_NOT_IMPLEMENTED
    void containsPlainText() CPPU_NOT_IMPLEMENTED
    void containsCompatibleContent() CPPU_NOT_IMPLEMENTED
    void asURL() CPPU_NOT_IMPLEMENTED
    void asPlainText() CPPU_NOT_IMPLEMENTED
    void asFilenames() CPPU_NOT_IMPLEMENTED
    void asColor() CPPU_NOT_IMPLEMENTED
    void asFragment() CPPU_NOT_IMPLEMENTED
    void canSmartReplace() CPPU_NOT_IMPLEMENTED
    void containsColor() CPPU_NOT_IMPLEMENTED
    void containsFiles() CPPU_NOT_IMPLEMENTED
};
    

#endif //!DragData_h


