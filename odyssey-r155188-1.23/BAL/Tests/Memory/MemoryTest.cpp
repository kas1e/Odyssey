#include "MemoryTest.h"

// Registers the fixture into the 'registry'
CPPUNIT_TEST_SUITE_REGISTRATION( MemoryTest );


using namespace WTF;
void MemoryTest::setUp()
{
}


void MemoryTest::tearDown()
{
}

void checkFill(char* ptr,unsigned int sz)
{
      //check that all data can be written
    for (unsigned int j=0;j<sz;++j)
    {
        ptr[j]=j;
    }

}

void MemoryTest::testMalloc()
{
// Set up
  // Process
  const int     nbSizes=4;
  const int     sizes[]={1,100,1024,1024*1024};
  for (int i=0;i<nbSizes;++i)
  {
      int size=sizes[i];
      char* foobar=(char*)fastMalloc(size);
      CPPUNIT_ASSERT( foobar != NULL );

      checkFill(foobar,size);
      fastFree(foobar);

  }


  {
      char* foobar=(char*)fastMalloc(1024);
      CPPUNIT_ASSERT(foobar != NULL);
      char* foobar2=(char*)fastRealloc(foobar,2048);
      CPPUNIT_ASSERT(foobar2 != NULL);
      checkFill(foobar2,2048);
      fastFree(foobar2);
  }

#if !defined(USE_SYSTEM_MALLOC) || !(USE_SYSTEM_MALLOC)
  {
      char* foobar=new char[1024];
      CPPUNIT_ASSERT(foobar != NULL);
      delete(foobar);
  }
#endif


}

void MemoryTest::testMallocStress()
{
  // Set up

  // Process & Check
  for(int i=0; i<100; i++){
      testMalloc();
  }

}

