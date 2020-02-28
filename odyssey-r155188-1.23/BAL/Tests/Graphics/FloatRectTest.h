#ifndef FloatRectTest_h_CPPUNIT
#define FloatRectTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCFloatRect.h"
class FloatRectTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( FloatRectTestTest );
//register each method:
    CPPUNIT_TEST(FloatRect);
    CPPUNIT_TEST(FloatRect_location);
    CPPUNIT_TEST(FloatRect_xywh);
    CPPUNIT_TEST(FloatRect_intRect);
    CPPUNIT_TEST(narrowPrecision);

    CPPUNIT_TEST(location);
    CPPUNIT_TEST(size);

    CPPUNIT_TEST(setLocation);
    CPPUNIT_TEST(setSize);

    CPPUNIT_TEST(x);
    CPPUNIT_TEST(y);
    CPPUNIT_TEST(width);
    CPPUNIT_TEST(height);

    CPPUNIT_TEST(setX);
    CPPUNIT_TEST(setY);
    CPPUNIT_TEST(setWidth);
    CPPUNIT_TEST(setHeight);

    CPPUNIT_TEST(isEmpty);

    CPPUNIT_TEST(right);
    CPPUNIT_TEST(bottom);

    CPPUNIT_TEST(move);
    CPPUNIT_TEST(move_xy);

    CPPUNIT_TEST(intersects);
    CPPUNIT_TEST(contains_rect);

    CPPUNIT_TEST(intersect);
    CPPUNIT_TEST(unite);

    CPPUNIT_TEST(contains_xy);
    CPPUNIT_TEST(contains);

    CPPUNIT_TEST(inflateX);
    CPPUNIT_TEST(inflateY);
    CPPUNIT_TEST(inflate);
    CPPUNIT_TEST(scale);

    CPPUNIT_TEST(intersection);
    CPPUNIT_TEST(unionRect);
    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);
    CPPUNIT_TEST(enclosingIntRect);


    CPPUNIT_TEST_SUITE_END();

public:
    void FloatRect() CPPU_NOT_IMPLEMENTED
    void FloatRect_location() CPPU_NOT_IMPLEMENTED
    void FloatRect_xywh() CPPU_NOT_IMPLEMENTED
    void FloatRect_intRect() CPPU_NOT_IMPLEMENTED
    void narrowPrecision() CPPU_NOT_IMPLEMENTED

    void location() CPPU_NOT_IMPLEMENTED
    void size() CPPU_NOT_IMPLEMENTED

    void setLocation() CPPU_NOT_IMPLEMENTED
    void setSize() CPPU_NOT_IMPLEMENTED

    void x() CPPU_NOT_IMPLEMENTED
    void y() CPPU_NOT_IMPLEMENTED
    void width() CPPU_NOT_IMPLEMENTED
    void height() CPPU_NOT_IMPLEMENTED

    void setX() CPPU_NOT_IMPLEMENTED
    void setY() CPPU_NOT_IMPLEMENTED
    void setWidth() CPPU_NOT_IMPLEMENTED
    void setHeight() CPPU_NOT_IMPLEMENTED

    void isEmpty() CPPU_NOT_IMPLEMENTED

    void right() CPPU_NOT_IMPLEMENTED
    void bottom() CPPU_NOT_IMPLEMENTED

    void move() CPPU_NOT_IMPLEMENTED
    void move_xy() CPPU_NOT_IMPLEMENTED

    void intersects() CPPU_NOT_IMPLEMENTED
    void contains_rect() CPPU_NOT_IMPLEMENTED

    void intersect() CPPU_NOT_IMPLEMENTED
    void unite() CPPU_NOT_IMPLEMENTED

    void contains_xy() CPPU_NOT_IMPLEMENTED
    void contains() CPPU_NOT_IMPLEMENTED

    void inflateX() CPPU_NOT_IMPLEMENTED
    void inflateY() CPPU_NOT_IMPLEMENTED
    void inflate() CPPU_NOT_IMPLEMENTED
    void scale() CPPU_NOT_IMPLEMENTED

    void intersection() CPPU_NOT_IMPLEMENTED
    void unionRect() CPPU_NOT_IMPLEMENTED
    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED
    void enclosingIntRect() CPPU_NOT_IMPLEMENTED


};


#endif

