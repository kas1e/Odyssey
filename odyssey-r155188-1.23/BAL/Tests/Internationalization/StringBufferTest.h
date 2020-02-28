#ifndef StringBufferTest_h_CPPUNIT
#define StringBufferTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCFastMalloc.h"
#include "BCStringBuffer.h"
class StringBufferTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( StringBufferTestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);

    CPPUNIT_TEST(shrink);
    CPPUNIT_TEST(resize);
    CPPUNIT_TEST(length);
    CPPUNIT_TEST(characters);

    CPPUNIT_TEST(operator__);

    CPPUNIT_TEST(release);


    CPPUNIT_TEST_SUITE_END();

public:
    void constructors() CPPU_NOT_IMPLEMENTED
    void destructors() CPPU_NOT_IMPLEMENTED

    void shrink() CPPU_NOT_IMPLEMENTED
    void resize() CPPU_NOT_IMPLEMENTED
    void length() CPPU_NOT_IMPLEMENTED
    void characters() CPPU_NOT_IMPLEMENTED

    void operator__() CPPU_NOT_IMPLEMENTED

    void release() CPPU_NOT_IMPLEMENTED

};


#endif

