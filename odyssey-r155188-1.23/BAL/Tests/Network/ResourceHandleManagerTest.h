#ifndef ResourceHandleManagerTest_h_CPPUNIT
#define ResourceHandleManagerTest_h_CPPUNIT

#include "config.h"
#include <cppunit/extensions/HelperMacros.h>
#include "BCResourceHandleManager.h"
class ResourceHandleManagerTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ResourceHandleManagerTestTest );
//register each method:
    CPPUNIT_TEST(sharedInstance);
    CPPUNIT_TEST(add);
    CPPUNIT_TEST(cancel);
    CPPUNIT_TEST(setCookieJarFileName);

    CPPUNIT_TEST(dispatchSynchronousJob);

    CPPUNIT_TEST(setupPOST);
    CPPUNIT_TEST(setupPUT);


    CPPUNIT_TEST_SUITE_END();


public:
    void sharedInstance() CPPU_NOT_IMPLEMENTED
    void add() CPPU_NOT_IMPLEMENTED
    void cancel() CPPU_NOT_IMPLEMENTED
    void setCookieJarFileName() CPPU_NOT_IMPLEMENTED

    void dispatchSynchronousJob() CPPU_NOT_IMPLEMENTED

    void setupPOST() CPPU_NOT_IMPLEMENTED
    void setupPUT() CPPU_NOT_IMPLEMENTED

};


#endif

