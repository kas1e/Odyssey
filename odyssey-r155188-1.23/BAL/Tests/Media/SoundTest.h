#ifndef SoundTest_h_CPPUNIT
#define SoundTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSound.h"
class SoundTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SoundTestTest );
//register each method:

    CPPUNIT_TEST( systemBeep );
    CPPUNIT_TEST_SUITE_END();

    void systemBeep() CPPU_NOT_IMPLEMENTED

};

#endif // Sound_h

