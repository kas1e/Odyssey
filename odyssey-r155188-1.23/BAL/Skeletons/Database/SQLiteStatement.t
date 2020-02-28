/*
 * Copyright (C) 2008 Pleyo.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1.  Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 * 2.  Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 * 3.  Neither the name of Pleyo nor the names of
 *     its contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY PLEYO AND ITS CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL PLEYO OR ITS CONTRIBUTORS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#ifndef SQLiteStatement_h
#define SQLiteStatement_h
/**
 *  @file  SQLiteStatement.t
 *  SQLiteStatement description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:05 $
 */
#include "BALBase.h"

#include "SQLiteDatabase.h"

struct sqlite3_stmt;

namespace WebCore {

class SQLValue;

class SQLiteStatement : public WebCoreBase, public Noncopyable {
public:
    /**
     * Constructor for SQLiteStatement.
     * @param[in] : a reference to a SQLiteDatabase.
     * @param[in] : a string representing a SQL query.
     * @code
     * @endcode
     */
    SQLiteStatement(SQLiteDatabase&, const String&);

    /**
     * Destructor for SQLiteStatement.
     * @code
     * @endcode
     */
    ~SQLiteStatement();
    
    /**
     * To execute an SQL query, it must first be compiled into a byte-code program. This method will prepare database for such a thing.
     * @param[out] : an integer representing either a successful status or an error.
     * @code
     * @endcode
     */
    int prepare();

    /**
     * Bind a blob value to prepared statement.
     * @param[in] : The index of the parameter to be set.
     * @param[in] : The blob to bind to the parameter.
     * @param[in] : The number of bytes in the parameter.
     * @param[out] : an integer representing either a successful status or an error.
     * @code
     * @endcode
     */
    int bindBlob(int index, const void* blob, int size);

    /**
     * Bind a text to prepared statement.
     * @param[in] : The index of the parameter to be set.
     * @param[in] : The text to bind to the parameter.
     * @param[out] : an integer representing either a successful status or an error.
     * @code
     * @endcode
     */
    int bindText(int index, const String&);

    /**
     * Bind a int64 to prepared statement.
     * @param[in] : The index of the parameter to be set.
     * @param[in] : The long integer to bind to the parameter.
     * @param[out] : an integer representing either a successful status or an error.
     * @code
     * @endcode
     */
    int bindInt64(int index, int64_t);

    /**
     * Bind a double to prepared statement.
     * @param[in] : The index of the parameter to be set.
     * @param[in] : The double value to bind to the parameter.
     * @param[out] : an integer representing either a successful status or an error.
     * @code
     * @endcode
     */
    int bindDouble(int index, double);

    /**
     * Bind nothing to prepared statement.
     * @param[in] : The index of the parameter to be set.
     * @param[out] : an integer representing either a successful status or an error.
     * @code
     * @endcode
     */
    int bindNull(int index);

    /**
     * Bind a SQLValue to prepared statement.
     * @param[in] : The index of the parameter to be set.
     * @param[in] : The SQLValue to bind to the parameter.
     * @param[out] : an integer representing either a successful status or an error.
     * @code
     * @endcode
     */
    int bindValue(int index, const SQLValue&);

    /**
     * Find the number of SQL parameters in a prepared statement.
     * @param[out] : The number of SQL parameters.
     * @code
     * @endcode
     */
    unsigned bindParameterCount() const;

    /**
     * Evaluate a statement after a prepare().
     * @param[out] : an integer representing either a successful status or an error.
     * @code
     * @endcode
     */
    int step();

    /**
     * Delete a prepared statement.
     * @param[out] : an integer representing either a successful status or an error.
     * @code
     * @endcode
     */
    int finalize();

    /**
     * Reset a prepared statement object.
     * @param[out] : an integer representing either a successful status or an error.
     * @code
     * @endcode
     */
    int reset();
    
    /**
     * Do a prepare() followed by a step().
     * @param[out] : an integer representing either a successful status or an error.
     * @code
     * @endcode
     */
    int prepareAndStep() ;
    
    // prepares, steps, and finalizes the query.
    // returns true if all 3 steps succeed with step() returning SQLITE_DONE
    // returns false otherwise  
    /**
     * Prepares, steps, and finalizes the query.
     * @param[out] : returns true if all 3 steps succeed with step() returning SQLITE_DONE.
     * @code
     * @endcode
     */
    bool executeCommand();
    
    // prepares, steps, and finalizes.  
    // returns true is step() returns SQLITE_ROW
    // returns false otherwise
    /**
     * Prepare, step, and finalize.
     * @param[out] : returns true is step() returns SQLITE_ROW.
     * @code
     * @endcode
     */
    bool returnsAtLeastOneResult();

    /**
     * Check wether statement has expired or not.
     * @param[out] : returns true if statement has expires else otherwise.
     * @code
     * @endcode
     */
    bool isExpired();

    // Returns -1 on last-step failing.  Otherwise, returns number of rows
    // returned in the last step()
    /**
     * Returns number of rows.
     * @param[out] : number of rows, -1 otherwise.
     * @code
     * @endcode
     */
    int columnCount();
    
    /**
     * Get the name assigned to a particular column in the result set of a SELECT statement.
     * @param[in] : the column number.
     * @param[out] : a pointer to a zero-terminated UTF16 string.
     * @code
     * @endcode
     */
    String getColumnName(int col);

    /**
     * Get information about a single column of the current result row of a query.
     * @param[in] : the column number.
     * @param[out] : a SQLValue.
     * @code
     * @endcode
     */
    SQLValue getColumnValue(int col);

    /**
     * Get information about a single column of the current result row of a query.
     * @param[in] : the column number.
     * @param[out] : a text.
     * @code
     * @endcode
     */
    String getColumnText(int col);

    /**
     * Get information about a single column of the current result row of a query.
     * @param[in] : the column number.
     * @param[out] : a double.
     * @code
     * @endcode
     */
    double getColumnDouble(int col);

    /**
     * Get information about a single column of the current result row of a query.
     * @param[in] : the column number.
     * @param[out] : an integer.
     * @code
     * @endcode
     */
    int getColumnInt(int col);

    /**
     * Get information about a single column of the current result row of a query.
     * @param[in] : the column number.
     * @param[out] : a long integer.
     * @code
     * @endcode
     */
    int64_t getColumnInt64(int col);

    /**
     * Get information about a single column of the current result row of a query.
     * @param[in] : the column number.
     * @param[out] : a pointer.
     * @code
     * @endcode
     */
    const void* getColumnBlob(int col, int& size);

    /**
     * Get information about a single column of the current result row of a query.
     * @param[in] : the column number.
     * @param[in] : a reference to a char vector. 
     * @code
     * @endcode
     */
    void getColumnBlobAsVector(int col, Vector<char>&);

    /**
     * Get information about a column of the current result row of a query.
     * @param[in] : the column number.
     * @param[in] : a reference to a string vector.
     * @param[out] : returns true on success.
     * @code
     * @endcode
     */
    bool returnTextResults(int col, Vector<String>&);

    /**
     * Get information about a column of the current result row of a query.
     * @param[in] : the column number.
     * @param[in] : a reference to a int vector.
     * @param[out] : returns true on success.
     * @code
     * @endcode
     */
    bool returnIntResults(int col, Vector<int>&);

    /**
     * Get information about a column of the current result row of a query.
     * @param[in] : the column number.
     * @param[in] : a reference to a long integer vector.
     * @param[out] : returns true on success.
     * @code
     * @endcode
     */
    bool returnInt64Results(int col, Vector<int64_t>&);

    /**
     * Get information about a column of the current result row of a query.
     * @param[in] : the column number.
     * @param[in] : a reference to a double vector.
     * @param[out] : returns true on success.
     * @code
     * @endcode
     */
    bool returnDoubleResults(int col, Vector<double>&);

    /**
     * Retrieve a pointer to a SQLiteDatabase.
     * @param[out] : a pointer to SQLiteDatabase.
     * @code
     * @endcode
     */
    SQLiteDatabase* database() ;
    
    /**
     * Get the query.
     * @param[out] : a string representing a query.
     * @code
     * @endcode
     */
    const String& query() const ;
    
private:
    SQLiteDatabase& m_database;
    String m_query;
    sqlite3_stmt* m_statement;
#ifndef NDEBUG
    bool m_isPrepared;
#endif
};

} // namespace WebCore

#endif // SQLiteStatement_h

