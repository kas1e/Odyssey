#ifndef GraphicsTypesTest_h_CPPUNIT
#define GraphicsTypesTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCGraphicsTypes.h"
class GraphicsTypesTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( GraphicsTypesTestTest );
//register each method:

    CPPUNIT_TEST(compositeOperatorName);
    CPPUNIT_TEST(parseCompositeOperator);

    CPPUNIT_TEST(lineCapName);
    CPPUNIT_TEST(parseLineCap);

    CPPUNIT_TEST(lineJoinName);
    CPPUNIT_TEST(parseLineJoin);


    CPPUNIT_TEST_SUITE_END();


    void compositeOperatorName() CPPU_NOT_IMPLEMENTED
    void parseCompositeOperator() CPPU_NOT_IMPLEMENTED

    void lineCapName() CPPU_NOT_IMPLEMENTED
    void parseLineCap() CPPU_NOT_IMPLEMENTED

    void lineJoinName() CPPU_NOT_IMPLEMENTED
    void parseLineJoin() CPPU_NOT_IMPLEMENTED

};

#endif

