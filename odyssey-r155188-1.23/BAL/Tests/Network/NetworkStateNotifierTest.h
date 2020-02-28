#ifndef NetworkStateNotifierTest_h_CPPUNIT
#define NetworkStateNotifierTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "Platform.h"
#include "BCNetworkStateNotifier.h"
class NetworkStateNotifierTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( NetworkStateNotifierTestTest );
//register each method:
    CPPUNIT_TEST(NetworkStateNotifier);
    CPPUNIT_TEST(setNetworkStateChangedFunction);
    
    CPPUNIT_TEST(onLine);
    
    CPPUNIT_TEST(updateState);
    CPPUNIT_TEST(networkStateNotifier);


    CPPUNIT_TEST_SUITE_END();

public:
    void NetworkStateNotifier() CPPU_NOT_IMPLEMENTED
    void setNetworkStateChangedFunction() CPPU_NOT_IMPLEMENTED
    
    void onLine() CPPU_NOT_IMPLEMENTED
    
    void updateState() CPPU_NOT_IMPLEMENTED
    void networkStateNotifier() CPPU_NOT_IMPLEMENTED

    
};

#endif // NetworkStateNotifier_h

