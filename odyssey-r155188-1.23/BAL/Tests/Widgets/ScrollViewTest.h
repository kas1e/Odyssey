#ifndef ScrollViewTest_h_CPPUNIT
#define ScrollViewTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCScrollView.h"
class ScrollViewTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ScrollViewTestTest );
//register each method:
    CPPUNIT_TEST(ScrollView);
    CPPUNIT_TEST(destruct_ScrollView);

    CPPUNIT_TEST(visibleWidth);
    CPPUNIT_TEST(visibleHeight);
    CPPUNIT_TEST(visibleContentRect);
    CPPUNIT_TEST(visibleContentRectConsideringExternalScrollers);

    CPPUNIT_TEST(contentsWidth);
    CPPUNIT_TEST(contentsHeight);
    CPPUNIT_TEST(contentsX);
    CPPUNIT_TEST(contentsY);
    CPPUNIT_TEST(scrollOffset);
    CPPUNIT_TEST(scrollBy);
    CPPUNIT_TEST(scrollRectIntoViewRecursively);

    CPPUNIT_TEST(setContentsPos);

    CPPUNIT_TEST(setVScrollbarMode);
    CPPUNIT_TEST(setHScrollbarMode);

    CPPUNIT_TEST(setScrollbarsMode);

    CPPUNIT_TEST(suppressScrollbars);

    CPPUNIT_TEST(vScrollbarMode);
    CPPUNIT_TEST(hScrollbarMode);

    CPPUNIT_TEST(addChild);
    CPPUNIT_TEST(removeChild);

    CPPUNIT_TEST(resizeContents);
    CPPUNIT_TEST(updateContents);
    CPPUNIT_TEST(update);

    CPPUNIT_TEST(windowToContents_IntPoint);
    CPPUNIT_TEST(contentsToWindow_IntPoint);
    CPPUNIT_TEST(windowToContents_IntRect);
    CPPUNIT_TEST(contentsToWindow_IntRect);

    CPPUNIT_TEST(setStaticBackground);

    CPPUNIT_TEST(inWindow);

    CPPUNIT_TEST(scrollbarUnderMouse);

    CPPUNIT_TEST(wheelEvent);

    CPPUNIT_TEST(scroll);

#if HAVE(ACCESSIBILITY)
    CPPUNIT_TEST(contentsToScreen);
    CPPUNIT_TEST(screenToContents);
#endif


    CPPUNIT_TEST(paint);

    CPPUNIT_TEST(convertChildToSelf);
    CPPUNIT_TEST(convertSelfToChild);

    CPPUNIT_TEST(geometryChanged);
    CPPUNIT_TEST(setFrameGeometry);

    CPPUNIT_TEST(addToDirtyRegion);
    CPPUNIT_TEST(scrollBackingStore);
    CPPUNIT_TEST(updateBackingStore);

    CPPUNIT_TEST(setBalAdjustments);


    CPPUNIT_TEST_SUITE_END();


    public:
    void ScrollView() CPPU_NOT_IMPLEMENTED
    void destruct_ScrollView() CPPU_NOT_IMPLEMENTED

    void visibleWidth() CPPU_NOT_IMPLEMENTED
    void visibleHeight() CPPU_NOT_IMPLEMENTED
    void visibleContentRect() CPPU_NOT_IMPLEMENTED
    void visibleContentRectConsideringExternalScrollers() CPPU_NOT_IMPLEMENTED

    void contentsWidth() CPPU_NOT_IMPLEMENTED
    void contentsHeight() CPPU_NOT_IMPLEMENTED
    void contentsX() CPPU_NOT_IMPLEMENTED
    void contentsY() CPPU_NOT_IMPLEMENTED
    void scrollOffset() CPPU_NOT_IMPLEMENTED
    void scrollBy() CPPU_NOT_IMPLEMENTED
    void scrollRectIntoViewRecursively() CPPU_NOT_IMPLEMENTED

    void setContentsPos() CPPU_NOT_IMPLEMENTED

    void setVScrollbarMode() CPPU_NOT_IMPLEMENTED
    void setHScrollbarMode() CPPU_NOT_IMPLEMENTED

    void setScrollbarsMode() CPPU_NOT_IMPLEMENTED

    void suppressScrollbars() CPPU_NOT_IMPLEMENTED

    void vScrollbarMode() CPPU_NOT_IMPLEMENTED
    void hScrollbarMode() CPPU_NOT_IMPLEMENTED

    void addChild() CPPU_NOT_IMPLEMENTED
    void removeChild() CPPU_NOT_IMPLEMENTED

    void resizeContents() CPPU_NOT_IMPLEMENTED
    void updateContents() CPPU_NOT_IMPLEMENTED
    void update() CPPU_NOT_IMPLEMENTED

    void windowToContents_IntPoint() CPPU_NOT_IMPLEMENTED
    void contentsToWindow_IntPoint() CPPU_NOT_IMPLEMENTED
    void windowToContents_IntRect() CPPU_NOT_IMPLEMENTED
    void contentsToWindow_IntRect() CPPU_NOT_IMPLEMENTED

    void setStaticBackground() CPPU_NOT_IMPLEMENTED

    void inWindow() CPPU_NOT_IMPLEMENTED

    void scrollbarUnderMouse() CPPU_NOT_IMPLEMENTED

    void wheelEvent() CPPU_NOT_IMPLEMENTED

    void scroll() CPPU_NOT_IMPLEMENTED

#if HAVE(ACCESSIBILITY)
    void contentsToScreen() CPPU_NOT_IMPLEMENTED
    void screenToContents() CPPU_NOT_IMPLEMENTED
#endif


    void paint() CPPU_NOT_IMPLEMENTED

    void convertChildToSelf() CPPU_NOT_IMPLEMENTED
    void convertSelfToChild() CPPU_NOT_IMPLEMENTED

    void geometryChanged() CPPU_NOT_IMPLEMENTED
    void setFrameGeometry() CPPU_NOT_IMPLEMENTED

    void addToDirtyRegion() CPPU_NOT_IMPLEMENTED
    void scrollBackingStore() CPPU_NOT_IMPLEMENTED
    void updateBackingStore() CPPU_NOT_IMPLEMENTED

    void setBalAdjustments() CPPU_NOT_IMPLEMENTED


    }; // class ScrollView




#endif // ScrollView_h


