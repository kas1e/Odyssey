#ifndef PathTraversalStateTest_h_CPPUNIT
#define PathTraversalStateTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCPathTraversalState.h"
class PathTraversalStateTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( PathTraversalStateTestTest );
//register each method:
    CPPUNIT_TEST(PathTraversalState);
    CPPUNIT_TEST(closeSubpath);
    CPPUNIT_TEST(moveTo);
    CPPUNIT_TEST(lineTo);
    CPPUNIT_TEST(quadraticBezierTo);
    CPPUNIT_TEST(cubicBezierTo);
 
    CPPUNIT_TEST_SUITE_END();


    public:
    void PathTraversalState() CPPU_NOT_IMPLEMENTED
    void closeSubpath() CPPU_NOT_IMPLEMENTED
    void moveTo() CPPU_NOT_IMPLEMENTED
    void lineTo() CPPU_NOT_IMPLEMENTED
    void quadraticBezierTo() CPPU_NOT_IMPLEMENTED
    void cubicBezierTo() CPPU_NOT_IMPLEMENTED
        
    };    

#endif

