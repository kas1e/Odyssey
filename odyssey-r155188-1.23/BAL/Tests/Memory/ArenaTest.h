#ifndef ArenaTest_h_CPPUNIT
#define ArenaTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCArena.h"
class ArenaTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( ArenaTestTest );
//register each method:

    CPPUNIT_TEST(InitArenaPool_);
    CPPUNIT_TEST(FinishArenaPool_);
    CPPUNIT_TEST(FreeArenaPool_);
    CPPUNIT_TEST(ArenaAllocate_);

    CPPUNIT_TEST(ARENA_ALIGN_);
    CPPUNIT_TEST(INIT_ARENA_POOL_);
    CPPUNIT_TEST(ARENA_ALLOCATE_);
    CPPUNIT_TEST(ARENA_GROW_);
    CPPUNIT_TEST(ARENA_MARK_);
    CPPUNIT_TEST(UPTRDIFF_);

#ifdef DEBUG
    CPPUNIT_TEST(CLEAR_UNUSED_);
    CPPUNIT_TEST(CLEAR_ARENA_);
#endif

    CPPUNIT_TEST(ARENA_RELEASE_);
    CPPUNIT_TEST(ARENA_DESTROY_);

    CPPUNIT_TEST_SUITE_END();

    public:


    void InitArenaPool_() CPPU_NOT_IMPLEMENTED
    void FinishArenaPool_() CPPU_NOT_IMPLEMENTED
    void FreeArenaPool_() CPPU_NOT_IMPLEMENTED
    void ArenaAllocate_() CPPU_NOT_IMPLEMENTED

    void ARENA_ALIGN_() CPPU_NOT_IMPLEMENTED
    void INIT_ARENA_POOL_() CPPU_NOT_IMPLEMENTED
    void ARENA_ALLOCATE_() CPPU_NOT_IMPLEMENTED
    void ARENA_GROW_() CPPU_NOT_IMPLEMENTED
    void ARENA_MARK_() CPPU_NOT_IMPLEMENTED
    void UPTRDIFF_() CPPU_NOT_IMPLEMENTED

#ifdef DEBUG
    void CLEAR_UNUSED_() CPPU_NOT_IMPLEMENTED
    void CLEAR_ARENA_() CPPU_NOT_IMPLEMENTED
#endif

    void ARENA_RELEASE_() CPPU_NOT_IMPLEMENTED
    void ARENA_DESTROY_() CPPU_NOT_IMPLEMENTED
};

#endif

