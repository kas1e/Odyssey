#ifndef AutodrainedPoolTest_h_CPPUNIT
#define AutodrainedPoolTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "Platform.h"
#include "BCAutodrainedPool.h"
class AutodrainedPoolTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( AutodrainedPoolTestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);
    CPPUNIT_TEST(cycle);

    CPPUNIT_TEST_SUITE_END();



//class AutodrainedPool : Noncopyable {
public:
    void constructors() CPPU_NOT_IMPLEMENTED
    void destructors() CPPU_NOT_IMPLEMENTED 
    void cycle() CPPU_NOT_IMPLEMENTED
    
};

#endif



