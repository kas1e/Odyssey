#ifndef RefCountedTest_h_CPPUNIT
#define RefCountedTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCRefCounted.h"
class RefCountedTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( RefCountedTestTest );
//register each method:
    CPPUNIT_TEST(RefCounted);
    CPPUNIT_TEST(ref);
    CPPUNIT_TEST(deref);
    CPPUNIT_TEST(hasOneRef);
    CPPUNIT_TEST(refCount);
    CPPUNIT_TEST_SUITE_END();

public:
    void RefCounted() CPPU_NOT_IMPLEMENTED
    void ref() CPPU_NOT_IMPLEMENTED
    void deref() CPPU_NOT_IMPLEMENTED
    void hasOneRef() CPPU_NOT_IMPLEMENTED
    void refCount() CPPU_NOT_IMPLEMENTED
};


#endif // RefCounted_h

