#ifndef SQLVALUETEST_H
#define SQLVALUETEST_H

#include <cppunit/extensions/HelperMacros.h>
#include "BCFastMalloc.h"

class MemoryTest : public CppUnit::TestFixture
{
  CPPUNIT_TEST_SUITE( MemoryTest );
  CPPUNIT_TEST( testMalloc );
  CPPUNIT_TEST( testMallocStress );
  CPPUNIT_TEST_SUITE_END();

public:
  void setUp();
  void tearDown();

  void testMalloc();
  void testMallocStress();
};

#endif  // MONEYTEST_H
