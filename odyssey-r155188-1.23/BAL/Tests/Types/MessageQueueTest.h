#ifndef MessageQueueTest_h_CPPUNIT
#define MessageQueueTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCMessageQueue.h"
class MessageQueueTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( MessageQueueTestTest );
//register each method:
    CPPUNIT_TEST(MessageQueue);
        
    CPPUNIT_TEST(append);
    CPPUNIT_TEST(prepend);
    CPPUNIT_TEST(waitForMessage);
    CPPUNIT_TEST(tryGetMessage);
    CPPUNIT_TEST(kill);
    CPPUNIT_TEST(killed);
 
    CPPUNIT_TEST_SUITE_END();

    public:
    void MessageQueue() CPPU_NOT_IMPLEMENTED
        
    void append() CPPU_NOT_IMPLEMENTED
    void prepend() CPPU_NOT_IMPLEMENTED
    void waitForMessage() CPPU_NOT_IMPLEMENTED
    void tryGetMessage() CPPU_NOT_IMPLEMENTED
    void kill() CPPU_NOT_IMPLEMENTED
    void killed() CPPU_NOT_IMPLEMENTED
    };

#endif // MessageQueue_h

