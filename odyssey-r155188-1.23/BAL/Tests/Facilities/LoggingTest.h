#ifndef LoggingTest_h_CPPUNIT
#define LoggingTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCLogging.h"
class LoggingTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( LoggingTestTest );
//register each method:
	CPPUNIT_TEST(InitializeLoggingChannelsIfNecessary);
    CPPUNIT_TEST_SUITE_END();



    void InitializeLoggingChannelsIfNecessary() CPPU_NOT_IMPLEMENTED
};
#endif // Logging_h

