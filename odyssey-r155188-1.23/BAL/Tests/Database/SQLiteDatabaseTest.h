#ifndef SQLiteDatabase_h_CPPUNIT
#define SQLiteDatabase_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSQLiteDatabase.h"
class SQLiteDatabaseTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SQLiteDatabaseTest );
//register each method:
   	CPPUNIT_TEST( constructors);
    CPPUNIT_TEST( destructors);
    CPPUNIT_TEST( open);
    CPPUNIT_TEST( isOpen);
    CPPUNIT_TEST( close);

    CPPUNIT_TEST( executeCommand);
    CPPUNIT_TEST( returnsAtLeastOneResult);
    
    CPPUNIT_TEST( tableExists);
    CPPUNIT_TEST( clearAllTables);
    CPPUNIT_TEST( runVacuumCommand);
    
    CPPUNIT_TEST( transactionInProgress);
    
    CPPUNIT_TEST( lastInsertRowID);
    CPPUNIT_TEST( lastChanges);

    CPPUNIT_TEST( setBusyTimeout);
    CPPUNIT_TEST( setBusyHandler);
    
    CPPUNIT_TEST( setFullsync);
    
    CPPUNIT_TEST( maximumSize);
    CPPUNIT_TEST( setMaximumSize);
    
    CPPUNIT_TEST( setSynchronous);
    
    CPPUNIT_TEST( lastError);
    CPPUNIT_TEST( lastErrorMsg);
    
    CPPUNIT_TEST( sqlite3Handle);
    
    CPPUNIT_TEST( setAuthorizer);

    CPPUNIT_TEST( lock);
    CPPUNIT_TEST( unlock);

    CPPUNIT_TEST_SUITE_END();

#if COMPILER(MSVC)
#pragma warning(disable: 4800)
#endif

public:
	void constructors()CPPU_NOT_IMPLEMENTED
    void destructors()CPPU_NOT_IMPLEMENTED
    void open()CPPU_NOT_IMPLEMENTED
    void isOpen()CPPU_NOT_IMPLEMENTED
    void close()CPPU_NOT_IMPLEMENTED

    void executeCommand()CPPU_NOT_IMPLEMENTED
    void returnsAtLeastOneResult()CPPU_NOT_IMPLEMENTED
    
    void tableExists()CPPU_NOT_IMPLEMENTED
    void clearAllTables()CPPU_NOT_IMPLEMENTED
    void runVacuumCommand()CPPU_NOT_IMPLEMENTED
    
    void transactionInProgress()CPPU_NOT_IMPLEMENTED
    
    void lastInsertRowID()CPPU_NOT_IMPLEMENTED
    void lastChanges()CPPU_NOT_IMPLEMENTED

    void setBusyTimeout()CPPU_NOT_IMPLEMENTED
    void setBusyHandler()CPPU_NOT_IMPLEMENTED
    
    void setFullsync()CPPU_NOT_IMPLEMENTED
    
    void maximumSize()CPPU_NOT_IMPLEMENTED
    void setMaximumSize()CPPU_NOT_IMPLEMENTED
    
    void setSynchronous()CPPU_NOT_IMPLEMENTED
    
    void lastError()CPPU_NOT_IMPLEMENTED
    void lastErrorMsg()CPPU_NOT_IMPLEMENTED
    
    void sqlite3Handle()CPPU_NOT_IMPLEMENTED
    
    void setAuthorizer()CPPU_NOT_IMPLEMENTED

    void lock()CPPU_NOT_IMPLEMENTED
    void unlock()CPPU_NOT_IMPLEMENTED

}; // class SQLiteDatabase

#endif
