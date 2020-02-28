#ifndef GetPtrTest_h_CPPUNIT
#define GetPtrTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCGetPtr.h"
class GetPtrTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( GetPtrTestTest );
//register each method:
    CPPUNIT_TEST(getPtr);

    CPPUNIT_TEST_SUITE_END();

    void getPtr() CPPU_NOT_IMPLEMENTED
};


#endif // WTF_GetPtr_h

