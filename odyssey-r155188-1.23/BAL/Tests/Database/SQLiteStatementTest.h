#ifndef SQLiteStatement_h_CPPUNIT
#define SQLiteStatement_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSQLiteStatement.h"
class SQLiteStatementTest: public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SQLiteStatementTest);
//register each method:
    CPPUNIT_TEST( constructors);
    CPPUNIT_TEST( destructors);
    CPPUNIT_TEST( prepare);
    CPPUNIT_TEST( bindBlob);
    CPPUNIT_TEST( bindText);
    CPPUNIT_TEST( bindInt64);
    CPPUNIT_TEST( bindDouble);
    CPPUNIT_TEST( bindNull);
    CPPUNIT_TEST( bindValue);
    CPPUNIT_TEST( bindParameterCount);

    CPPUNIT_TEST( step);
    CPPUNIT_TEST( finalize);
    CPPUNIT_TEST( reset);
    
    CPPUNIT_TEST( prepareAndStep);
    
    CPPUNIT_TEST( executeCommand);
    
    CPPUNIT_TEST( returnsAtLeastOneResult);

    CPPUNIT_TEST( isExpired);

    CPPUNIT_TEST( columnCount);
    
    CPPUNIT_TEST( getColumnName);
    CPPUNIT_TEST( getColumnValue);
    CPPUNIT_TEST( getColumnText);
    CPPUNIT_TEST( getColumnDouble);
    CPPUNIT_TEST( getColumnInt);
    CPPUNIT_TEST( getColumnInt64);
    CPPUNIT_TEST( getColumnBlob);
    CPPUNIT_TEST( getColumnBlobAsVector);

    CPPUNIT_TEST( returnTextResults);
    CPPUNIT_TEST( returnIntResults);
    CPPUNIT_TEST( returnInt64Results);
    CPPUNIT_TEST( returnDoubleResults);

    CPPUNIT_TEST( database);
    
    CPPUNIT_TEST( query);
     CPPUNIT_TEST_SUITE_END();

public:
    void constructors() CPPU_NOT_IMPLEMENTED
    void destructors() CPPU_NOT_IMPLEMENTED
    void prepare() CPPU_NOT_IMPLEMENTED
    void bindBlob() CPPU_NOT_IMPLEMENTED
    void bindText() CPPU_NOT_IMPLEMENTED
    void bindInt64() CPPU_NOT_IMPLEMENTED
    void bindDouble() CPPU_NOT_IMPLEMENTED
    void bindNull() CPPU_NOT_IMPLEMENTED
    void bindValue() CPPU_NOT_IMPLEMENTED
    void bindParameterCount() CPPU_NOT_IMPLEMENTED

    void step() CPPU_NOT_IMPLEMENTED
    void finalize() CPPU_NOT_IMPLEMENTED
    void reset() CPPU_NOT_IMPLEMENTED
    
    void prepareAndStep() CPPU_NOT_IMPLEMENTED
    
    void executeCommand() CPPU_NOT_IMPLEMENTED
    
    void returnsAtLeastOneResult() CPPU_NOT_IMPLEMENTED

    void isExpired() CPPU_NOT_IMPLEMENTED

    void columnCount() CPPU_NOT_IMPLEMENTED
    
    void getColumnName() CPPU_NOT_IMPLEMENTED
    void getColumnValue() CPPU_NOT_IMPLEMENTED
    void getColumnText() CPPU_NOT_IMPLEMENTED
    void getColumnDouble() CPPU_NOT_IMPLEMENTED
    void getColumnInt() CPPU_NOT_IMPLEMENTED
    void getColumnInt64() CPPU_NOT_IMPLEMENTED
    void getColumnBlob() CPPU_NOT_IMPLEMENTED
    void getColumnBlobAsVector() CPPU_NOT_IMPLEMENTED

    void returnTextResults() CPPU_NOT_IMPLEMENTED
    void returnIntResults() CPPU_NOT_IMPLEMENTED
    void returnInt64Results() CPPU_NOT_IMPLEMENTED
    void returnDoubleResults() CPPU_NOT_IMPLEMENTED

    void database() CPPU_NOT_IMPLEMENTED
    
    void query() CPPU_NOT_IMPLEMENTED
    
};


#endif // SQLiteStatement_h
