#ifndef UnitBezierTest_h_CPPUNIT
#define UnitBezierTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCUnitBezier.h"
class UnitBezierTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( UnitBezierTestTest );
//register each method:
    CPPUNIT_TEST(UnitBezier);
    CPPUNIT_TEST(sampleCurveX);
    CPPUNIT_TEST(sampleCurveY);
    CPPUNIT_TEST(sampleCurveDerivativeX);
    CPPUNIT_TEST(solveCurveX);
    CPPUNIT_TEST(solve);
    CPPUNIT_TEST_SUITE_END();
    public:
    void UnitBezier() CPPU_NOT_IMPLEMENTED
    void sampleCurveX() CPPU_NOT_IMPLEMENTED
    void sampleCurveY() CPPU_NOT_IMPLEMENTED
    void sampleCurveDerivativeX() CPPU_NOT_IMPLEMENTED
    void solveCurveX() CPPU_NOT_IMPLEMENTED
    void solve() CPPU_NOT_IMPLEMENTED
    };
#endif

