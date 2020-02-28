#ifndef IntRectTest_h_CPPUNIT
#define IntRectTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCIntRect.h"
class IntRectTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( IntRectTestTest );
//register each method:
    CPPUNIT_TEST(IntRect);
    CPPUNIT_TEST(IntRect_location_sz);
    CPPUNIT_TEST(IntRect_xywh);
    CPPUNIT_TEST(IntRect_copy);
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

    CPPUNIT_TEST(topLeft);
    CPPUNIT_TEST(topRight);
    CPPUNIT_TEST(bottomLeft);
    CPPUNIT_TEST(bottomRight);

    CPPUNIT_TEST(isEmpty);

    CPPUNIT_TEST(right);
    CPPUNIT_TEST(bottom);

    CPPUNIT_TEST(move);
    CPPUNIT_TEST(move2);

    CPPUNIT_TEST(intersects);
    CPPUNIT_TEST(contains);

    CPPUNIT_TEST(contains_xy);
    CPPUNIT_TEST(contains_point);

    CPPUNIT_TEST(intersect);
    CPPUNIT_TEST(unite);

    CPPUNIT_TEST(inflateX);
    CPPUNIT_TEST(inflateY);
    CPPUNIT_TEST(inflate);
    CPPUNIT_TEST(scale);

    CPPUNIT_TEST(IntRect_rect);
    CPPUNIT_TEST(operator_BalRectangle);
    CPPUNIT_TEST(intersection);
    CPPUNIT_TEST(unionRect);
    CPPUNIT_TEST(operator_eq);
    CPPUNIT_TEST(operator_diff);


    CPPUNIT_TEST_SUITE_END();

public:
    void IntRect() CPPU_NOT_IMPLEMENTED
    void IntRect_location_sz() CPPU_NOT_IMPLEMENTED
    void IntRect_xywh() CPPU_NOT_IMPLEMENTED
    void IntRect_copy() CPPU_NOT_IMPLEMENTED
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

    void topLeft() CPPU_NOT_IMPLEMENTED
    void topRight() CPPU_NOT_IMPLEMENTED
    void bottomLeft() CPPU_NOT_IMPLEMENTED
    void bottomRight() CPPU_NOT_IMPLEMENTED

    void isEmpty() CPPU_NOT_IMPLEMENTED

    void right() CPPU_NOT_IMPLEMENTED
    void bottom() CPPU_NOT_IMPLEMENTED

    void move() CPPU_NOT_IMPLEMENTED
    void move2() CPPU_NOT_IMPLEMENTED

    void intersects() CPPU_NOT_IMPLEMENTED
    void contains() CPPU_NOT_IMPLEMENTED

    void contains_xy() CPPU_NOT_IMPLEMENTED
    void contains_point() CPPU_NOT_IMPLEMENTED

    void intersect() CPPU_NOT_IMPLEMENTED
    void unite() CPPU_NOT_IMPLEMENTED

    void inflateX() CPPU_NOT_IMPLEMENTED
    void inflateY() CPPU_NOT_IMPLEMENTED
    void inflate() CPPU_NOT_IMPLEMENTED
    void scale() CPPU_NOT_IMPLEMENTED

    void IntRect_rect() CPPU_NOT_IMPLEMENTED
    void operator_BalRectangle() CPPU_NOT_IMPLEMENTED
    void intersection() CPPU_NOT_IMPLEMENTED
    void unionRect() CPPU_NOT_IMPLEMENTED
    void operator_eq() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED

};



#endif // IntRect_h

