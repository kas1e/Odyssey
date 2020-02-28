#ifndef PathTest_h_CPPUNIT
#define PathTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "Platform.h"
#include "BCPath.h"
class PathTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( PathTestTest );
//register each method:
    CPPUNIT_TEST(Path);
    CPPUNIT_TEST(destruct_Path);

    CPPUNIT_TEST(Path_copy);
    CPPUNIT_TEST(operator_copy);

    CPPUNIT_TEST(contains);
    CPPUNIT_TEST(boundingRect);
        
    CPPUNIT_TEST(length);
    CPPUNIT_TEST(pointAtLength);
    CPPUNIT_TEST(normalAngleAtLength);

    CPPUNIT_TEST(clear);
    CPPUNIT_TEST(isEmpty);

    CPPUNIT_TEST(moveTo);
    CPPUNIT_TEST(addLineTo);
    CPPUNIT_TEST(addQuadCurveTo);
    CPPUNIT_TEST(addBezierCurveTo);
    CPPUNIT_TEST(addArcTo);
    CPPUNIT_TEST(closeSubpath);

    CPPUNIT_TEST(addArc);
    CPPUNIT_TEST(addRect);
    CPPUNIT_TEST(addEllipse);

    CPPUNIT_TEST(translate);

    CPPUNIT_TEST(setWindingRule);
    CPPUNIT_TEST(windingRule);

    CPPUNIT_TEST(debugString);

    CPPUNIT_TEST(platformPath);

    CPPUNIT_TEST(createRoundedRectangle);
    CPPUNIT_TEST(createRoundedRectangle_args);
    CPPUNIT_TEST(createRectangle);
    CPPUNIT_TEST(createEllipse);
    CPPUNIT_TEST(createCircle);
    CPPUNIT_TEST(createLine);

    CPPUNIT_TEST(apply);
    CPPUNIT_TEST(transform);


    CPPUNIT_TEST_SUITE_END();

    public:
    void Path() CPPU_NOT_IMPLEMENTED
    void destruct_Path() CPPU_NOT_IMPLEMENTED

    void Path_copy() CPPU_NOT_IMPLEMENTED
    void operator_copy() CPPU_NOT_IMPLEMENTED

    void contains() CPPU_NOT_IMPLEMENTED
    void boundingRect() CPPU_NOT_IMPLEMENTED
        
    void length() CPPU_NOT_IMPLEMENTED
    void pointAtLength() CPPU_NOT_IMPLEMENTED
    void normalAngleAtLength() CPPU_NOT_IMPLEMENTED

    void clear() CPPU_NOT_IMPLEMENTED
    void isEmpty() CPPU_NOT_IMPLEMENTED

    void moveTo() CPPU_NOT_IMPLEMENTED
    void addLineTo() CPPU_NOT_IMPLEMENTED
    void addQuadCurveTo() CPPU_NOT_IMPLEMENTED
    void addBezierCurveTo() CPPU_NOT_IMPLEMENTED
    void addArcTo() CPPU_NOT_IMPLEMENTED
    void closeSubpath() CPPU_NOT_IMPLEMENTED

    void addArc() CPPU_NOT_IMPLEMENTED
    void addRect() CPPU_NOT_IMPLEMENTED
    void addEllipse() CPPU_NOT_IMPLEMENTED

    void translate() CPPU_NOT_IMPLEMENTED

    void setWindingRule() CPPU_NOT_IMPLEMENTED
    void windingRule() CPPU_NOT_IMPLEMENTED

    void debugString() CPPU_NOT_IMPLEMENTED

    void platformPath() CPPU_NOT_IMPLEMENTED

    void createRoundedRectangle() CPPU_NOT_IMPLEMENTED
    void createRoundedRectangle_args() CPPU_NOT_IMPLEMENTED
    void createRectangle() CPPU_NOT_IMPLEMENTED
    void createEllipse() CPPU_NOT_IMPLEMENTED
    void createCircle() CPPU_NOT_IMPLEMENTED
    void createLine() CPPU_NOT_IMPLEMENTED

    void apply() CPPU_NOT_IMPLEMENTED
    void transform() CPPU_NOT_IMPLEMENTED

    };


#endif

