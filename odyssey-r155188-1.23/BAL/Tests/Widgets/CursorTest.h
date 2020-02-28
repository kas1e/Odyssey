#ifndef CursorTest_h_CPPUNIT
#define CursorTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCCursor.h"
class CursorTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( CursorTestTest );
//register each method:
    CPPUNIT_TEST(Cursor);

    CPPUNIT_TEST(Cursor_Image);
    CPPUNIT_TEST(Cursor_copy);
    CPPUNIT_TEST(destruct_Cursor);
    CPPUNIT_TEST(operator_copy);

    CPPUNIT_TEST(Cursor_PlatformCursor);
    CPPUNIT_TEST(impl);
    CPPUNIT_TEST(pointerCursor);
    CPPUNIT_TEST(crossCursor);
    CPPUNIT_TEST(handCursor);
    CPPUNIT_TEST(moveCursor);
    CPPUNIT_TEST(iBeamCursor);
    CPPUNIT_TEST(waitCursor);
    CPPUNIT_TEST(helpCursor);
    CPPUNIT_TEST(eastResizeCursor);
    CPPUNIT_TEST(northResizeCursor);
    CPPUNIT_TEST(northEastResizeCursor);
    CPPUNIT_TEST(northWestResizeCursor);
    CPPUNIT_TEST(southResizeCursor);
    CPPUNIT_TEST(southEastResizeCursor);
    CPPUNIT_TEST(southWestResizeCursor);
    CPPUNIT_TEST(westResizeCursor);
    CPPUNIT_TEST(northSouthResizeCursor);
    CPPUNIT_TEST(eastWestResizeCursor);
    CPPUNIT_TEST(northEastSouthWestResizeCursor);
    CPPUNIT_TEST(northWestSouthEastResizeCursor);
    CPPUNIT_TEST(columnResizeCursor);
    CPPUNIT_TEST(rowResizeCursor);
    CPPUNIT_TEST(verticalTextCursor);
    CPPUNIT_TEST(cellCursor);
    CPPUNIT_TEST(contextMenuCursor);
    CPPUNIT_TEST(noDropCursor);
    CPPUNIT_TEST(notAllowedCursor);
    CPPUNIT_TEST(progressCursor);
    CPPUNIT_TEST(aliasCursor);
    CPPUNIT_TEST(zoomInCursor);
    CPPUNIT_TEST(zoomOutCursor);
    CPPUNIT_TEST(copyCursor);
    CPPUNIT_TEST(noneCursor);


    CPPUNIT_TEST_SUITE_END();


    public:
    void Cursor() CPPU_NOT_IMPLEMENTED

    void Cursor_Image() CPPU_NOT_IMPLEMENTED
    void Cursor_copy() CPPU_NOT_IMPLEMENTED
    void destruct_Cursor() CPPU_NOT_IMPLEMENTED
    void operator_copy() CPPU_NOT_IMPLEMENTED

    void Cursor_PlatformCursor() CPPU_NOT_IMPLEMENTED
    void impl() CPPU_NOT_IMPLEMENTED
    void pointerCursor() CPPU_NOT_IMPLEMENTED
    void crossCursor() CPPU_NOT_IMPLEMENTED
    void handCursor() CPPU_NOT_IMPLEMENTED
    void moveCursor() CPPU_NOT_IMPLEMENTED
    void iBeamCursor() CPPU_NOT_IMPLEMENTED
    void waitCursor() CPPU_NOT_IMPLEMENTED
    void helpCursor() CPPU_NOT_IMPLEMENTED
    void eastResizeCursor() CPPU_NOT_IMPLEMENTED
    void northResizeCursor() CPPU_NOT_IMPLEMENTED
    void northEastResizeCursor() CPPU_NOT_IMPLEMENTED
    void northWestResizeCursor() CPPU_NOT_IMPLEMENTED
    void southResizeCursor() CPPU_NOT_IMPLEMENTED
    void southEastResizeCursor() CPPU_NOT_IMPLEMENTED
    void southWestResizeCursor() CPPU_NOT_IMPLEMENTED
    void westResizeCursor() CPPU_NOT_IMPLEMENTED
    void northSouthResizeCursor() CPPU_NOT_IMPLEMENTED
    void eastWestResizeCursor() CPPU_NOT_IMPLEMENTED
    void northEastSouthWestResizeCursor() CPPU_NOT_IMPLEMENTED
    void northWestSouthEastResizeCursor() CPPU_NOT_IMPLEMENTED
    void columnResizeCursor() CPPU_NOT_IMPLEMENTED
    void rowResizeCursor() CPPU_NOT_IMPLEMENTED
    void verticalTextCursor() CPPU_NOT_IMPLEMENTED
    void cellCursor() CPPU_NOT_IMPLEMENTED
    void contextMenuCursor() CPPU_NOT_IMPLEMENTED
    void noDropCursor() CPPU_NOT_IMPLEMENTED
    void notAllowedCursor() CPPU_NOT_IMPLEMENTED
    void progressCursor() CPPU_NOT_IMPLEMENTED
    void aliasCursor() CPPU_NOT_IMPLEMENTED
    void zoomInCursor() CPPU_NOT_IMPLEMENTED
    void zoomOutCursor() CPPU_NOT_IMPLEMENTED
    void copyCursor() CPPU_NOT_IMPLEMENTED
    void noneCursor() CPPU_NOT_IMPLEMENTED


    };


#endif // Cursor_h





