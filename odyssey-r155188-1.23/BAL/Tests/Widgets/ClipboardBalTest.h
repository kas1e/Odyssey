#ifndef ClipboardBalTest_h_CPPUNIT
#define ClipboardBalTest_h_CPPUNIT

#include "config.h"
#include <cppunit/extensions/HelperMacros.h>
#include "BCClipboard.h"
class ClipboardBalTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ClipboardBalTestTest );
//register each method:
    CPPUNIT_TEST(ClipboardBal);
    CPPUNIT_TEST(destruct_ClipboardBal);


    CPPUNIT_TEST(clearData);
    CPPUNIT_TEST(clearAllData);
    CPPUNIT_TEST(getData);
    CPPUNIT_TEST(setData);

    CPPUNIT_TEST(types);
    CPPUNIT_TEST(dragLocation);
    CPPUNIT_TEST(dragImage);
    CPPUNIT_TEST(setDragImage);
    CPPUNIT_TEST(dragImageElement);
    CPPUNIT_TEST(setDragImageElement);

    CPPUNIT_TEST(createDragImage);
    CPPUNIT_TEST(declareAndWriteDragImage);
    CPPUNIT_TEST(writeURL);
    CPPUNIT_TEST(writeRange);

    CPPUNIT_TEST(hasData);


    CPPUNIT_TEST_SUITE_END();


    public:
    void ClipboardBal() CPPU_NOT_IMPLEMENTED
    void destruct_ClipboardBal() CPPU_NOT_IMPLEMENTED


    void clearData() CPPU_NOT_IMPLEMENTED
    void clearAllData() CPPU_NOT_IMPLEMENTED
    void getData() CPPU_NOT_IMPLEMENTED
    void setData() CPPU_NOT_IMPLEMENTED

    void types() CPPU_NOT_IMPLEMENTED
    void dragLocation() CPPU_NOT_IMPLEMENTED
    void dragImage() CPPU_NOT_IMPLEMENTED
    void setDragImage() CPPU_NOT_IMPLEMENTED
    void dragImageElement() CPPU_NOT_IMPLEMENTED
    void setDragImageElement() CPPU_NOT_IMPLEMENTED

    void createDragImage() CPPU_NOT_IMPLEMENTED
    void declareAndWriteDragImage() CPPU_NOT_IMPLEMENTED
    void writeURL() CPPU_NOT_IMPLEMENTED
    void writeRange() CPPU_NOT_IMPLEMENTED

    void hasData() CPPU_NOT_IMPLEMENTED

    };

#endif



