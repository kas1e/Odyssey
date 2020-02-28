#ifndef EventLoopTest_h_CPPUNIT
#define EventLoopTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCEventLoop.h"
class EventLoopTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( EventLoopTestTest );
//register each method:
    CPPUNIT_TEST(EventLoop);
    CPPUNIT_TEST(cycle);
    CPPUNIT_TEST(ended);

    CPPUNIT_TEST_SUITE_END();


    public:
    void EventLoop() CPPU_NOT_IMPLEMENTED
    void cycle() CPPU_NOT_IMPLEMENTED
    void ended() CPPU_NOT_IMPLEMENTED
    };


#endif // EventLoop_h

