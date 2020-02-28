#ifndef SQLiteTransaction_h_CPPUNIT
#define SQLiteTransaction_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSQLiteTransaction.h"
class SQLiteTransactionTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SQLiteTransactionTest );
//register each method:
    CPPUNIT_TEST( constructors);
    CPPUNIT_TEST( destructors);
    CPPUNIT_TEST( begin);
    CPPUNIT_TEST( commit);
    CPPUNIT_TEST( rollback);
    CPPUNIT_TEST( stop);
    
    CPPUNIT_TEST( inProgress);
    CPPUNIT_TEST_SUITE_END();

public:
    void constructors() CPPU_NOT_IMPLEMENTED
    void destructors() CPPU_NOT_IMPLEMENTED
    void begin() CPPU_NOT_IMPLEMENTED
    void commit() CPPU_NOT_IMPLEMENTED
    void rollback() CPPU_NOT_IMPLEMENTED
    void stop() CPPU_NOT_IMPLEMENTED
    
    void inProgress() CPPU_NOT_IMPLEMENTED
};

#endif // SQLiteTransation_H

