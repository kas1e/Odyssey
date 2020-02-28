#ifndef TextEncodingRegistryTest_h_CPPUNIT
#define TextEncodingRegistryTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCTextEncodingRegistry.h"
class TextEncodingRegistryTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( TextEncodingRegistryTestTest );
//register each method:
    CPPUNIT_TEST(newTextCodec);
    CPPUNIT_TEST(atomicCanonicalTextEncodingName);
    CPPUNIT_TEST(atomicCanonicalTextEncodingName2);
    CPPUNIT_TEST(noExtendedTextEncodingNameUsed);

    CPPUNIT_TEST_SUITE_END();

    void newTextCodec() CPPU_NOT_IMPLEMENTED
    void atomicCanonicalTextEncodingName() CPPU_NOT_IMPLEMENTED
    void atomicCanonicalTextEncodingName2() CPPU_NOT_IMPLEMENTED
    void noExtendedTextEncodingNameUsed() CPPU_NOT_IMPLEMENTED

};

#endif // TextEncodingRegistry_h

