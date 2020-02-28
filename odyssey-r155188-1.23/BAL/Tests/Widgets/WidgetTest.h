#ifndef WidgetTest_h_CPPUNIT
#define WidgetTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCWidget.h"
class WidgetTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( WidgetTestTest );
//register each method:
    CPPUNIT_TEST(Widget);
    CPPUNIT_TEST(destruct_Widget);

    CPPUNIT_TEST(setEnabled);
    CPPUNIT_TEST(isEnabled);

    CPPUNIT_TEST(x);
    CPPUNIT_TEST(y);
    CPPUNIT_TEST(width);
    CPPUNIT_TEST(height);
    CPPUNIT_TEST(size);
    CPPUNIT_TEST(resize);
    CPPUNIT_TEST(resize_IntSize);
    CPPUNIT_TEST(pos);
    CPPUNIT_TEST(move);
    CPPUNIT_TEST(move_IntPoint);

    CPPUNIT_TEST(paint);
    CPPUNIT_TEST(invalidate);
    CPPUNIT_TEST(invalidateRect);

    CPPUNIT_TEST(setFrameGeometry);
    CPPUNIT_TEST(frameGeometry);

    CPPUNIT_TEST(setFocus);

    CPPUNIT_TEST(setCursor);
    CPPUNIT_TEST(cursor);

    CPPUNIT_TEST(show);
    CPPUNIT_TEST(hide);

    CPPUNIT_TEST(setIsSelected);

    CPPUNIT_TEST(setClient);
    CPPUNIT_TEST(client);

    CPPUNIT_TEST(isFrameView);
    CPPUNIT_TEST(isPluginView);

    CPPUNIT_TEST(removeFromParent);

    CPPUNIT_TEST(windowClipRect);

    CPPUNIT_TEST(handleEvent);

    CPPUNIT_TEST(setContainingWindow);
    CPPUNIT_TEST(containingWindow);


    CPPUNIT_TEST(setParent);
    CPPUNIT_TEST(parent);

    CPPUNIT_TEST(geometryChanged);

    CPPUNIT_TEST(convertToContainingWindow_IntRect);
    CPPUNIT_TEST(convertToContainingWindow_IntPoint);
    CPPUNIT_TEST(convertFromContainingWindow);

    CPPUNIT_TEST(convertChildToSelf);
    CPPUNIT_TEST(convertSelfToChild);

    CPPUNIT_TEST(suppressInvalidation);
    CPPUNIT_TEST(setSuppressInvalidation);

    CPPUNIT_TEST(balWidget);


    CPPUNIT_TEST_SUITE_END();

    public:
    void Widget() CPPU_NOT_IMPLEMENTED
    void destruct_Widget() CPPU_NOT_IMPLEMENTED

    void setEnabled() CPPU_NOT_IMPLEMENTED
    void isEnabled() CPPU_NOT_IMPLEMENTED

    void x() CPPU_NOT_IMPLEMENTED
    void y() CPPU_NOT_IMPLEMENTED
    void width() CPPU_NOT_IMPLEMENTED
    void height() CPPU_NOT_IMPLEMENTED
    void size() CPPU_NOT_IMPLEMENTED
    void resize() CPPU_NOT_IMPLEMENTED
    void resize_IntSize() CPPU_NOT_IMPLEMENTED
    void pos() CPPU_NOT_IMPLEMENTED
    void move() CPPU_NOT_IMPLEMENTED
    void move_IntPoint() CPPU_NOT_IMPLEMENTED

    void paint() CPPU_NOT_IMPLEMENTED
    void invalidate() CPPU_NOT_IMPLEMENTED
    void invalidateRect() CPPU_NOT_IMPLEMENTED

    void setFrameGeometry() CPPU_NOT_IMPLEMENTED
    void frameGeometry() CPPU_NOT_IMPLEMENTED

    void setFocus() CPPU_NOT_IMPLEMENTED

    void setCursor() CPPU_NOT_IMPLEMENTED
    void cursor() CPPU_NOT_IMPLEMENTED

    void show() CPPU_NOT_IMPLEMENTED
    void hide() CPPU_NOT_IMPLEMENTED

    void setIsSelected() CPPU_NOT_IMPLEMENTED

    void setClient() CPPU_NOT_IMPLEMENTED
    void client() CPPU_NOT_IMPLEMENTED

    void isFrameView() CPPU_NOT_IMPLEMENTED
    void isPluginView() CPPU_NOT_IMPLEMENTED

    void removeFromParent() CPPU_NOT_IMPLEMENTED

    void windowClipRect() CPPU_NOT_IMPLEMENTED

    void handleEvent() CPPU_NOT_IMPLEMENTED

    void setContainingWindow() CPPU_NOT_IMPLEMENTED
    void containingWindow() CPPU_NOT_IMPLEMENTED


    void setParent() CPPU_NOT_IMPLEMENTED
    void parent() CPPU_NOT_IMPLEMENTED

    void geometryChanged() CPPU_NOT_IMPLEMENTED

    void convertToContainingWindow_IntRect() CPPU_NOT_IMPLEMENTED
    void convertToContainingWindow_IntPoint() CPPU_NOT_IMPLEMENTED
    void convertFromContainingWindow() CPPU_NOT_IMPLEMENTED

    void convertChildToSelf() CPPU_NOT_IMPLEMENTED
    void convertSelfToChild() CPPU_NOT_IMPLEMENTED

    void suppressInvalidation() CPPU_NOT_IMPLEMENTED
    void setSuppressInvalidation() CPPU_NOT_IMPLEMENTED

    void balWidget() CPPU_NOT_IMPLEMENTED


    };

#endif // Widget_h

