#ifndef BidiContextTest_h_CPPUNIT
#define BidiContextTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCBidiContext.h"
class BidiContextTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( BidiContextTestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);
    CPPUNIT_TEST(ref);
    CPPUNIT_TEST(deref);
    CPPUNIT_TEST(parent);
    CPPUNIT_TEST(level);
    CPPUNIT_TEST(dir);
    CPPUNIT_TEST(override);

    CPPUNIT_TEST(operator_equal);

    CPPUNIT_TEST_SUITE_END();



// class BidiContext {
public:
    void constructors() CPPU_NOT_IMPLEMENTED
    void destructors() CPPU_NOT_IMPLEMENTED
    void ref() CPPU_NOT_IMPLEMENTED
    void deref() CPPU_NOT_IMPLEMENTED
    void parent() CPPU_NOT_IMPLEMENTED
    void level() CPPU_NOT_IMPLEMENTED
    void dir() CPPU_NOT_IMPLEMENTED
    void override() CPPU_NOT_IMPLEMENTED

    void operator_equal() CPPU_NOT_IMPLEMENTED
};



#endif // BidiContext_h

