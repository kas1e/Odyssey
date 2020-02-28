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
#ifndef SQLDatabase_h
#define SQLDatabase_h
/**
 *  @file  SQLiteDatabase.t
 *  SQLiteDatabase description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:05 $
 */
#include "BALBase.h"

#include "PlatformString.h"
#include <wtf/Threading.h>

#if COMPILER(MSVC)
#pragma warning(disable: 4800)
#endif

struct sqlite3;

namespace WebCore {

class SQLiteAuthorizer;
class SQLiteStatement;
class SQLiteTransaction;

extern const int SQLResultDone;
extern const int SQLResultError;
extern const int SQLResultOk;
extern const int SQLResultRow;
extern const int SQLResultSchema;
extern const int SQLResultFull;

class SQLiteDatabase : public WebCoreBase, public Noncopyable {
    friend class SQLiteTransaction;
public:
    /**
     * Constructor for SQLiteDatabase.
     * @code
     * @endcode
     */
    SQLiteDatabase();

    /**
     * Destructor for SQLiteDatabase.
     * @code
     * @endcode
     */
    ~SQLiteDatabase();

    /**
     * Open a database from a filename.
     * @param[in] : a file name.
     * @param[out] : returns true for a successful operation.
     * @code
     * @endcode
     */
    bool open(const String& filename);

    /**
     * Check wether database is already opened.
     * @param[out] : returns true if database is already opened.
     * @code
     * @endcode
     */
    bool isOpen() const ;

    /**
     * Close a database.
     * @code
     * @endcode
     */
    void close();

    /**
     * execute a command.
     * @param[in] : the command to execute in a string format.
     * @param[out] : returns true on sucess.
     * @code
     * @endcode
     */
    bool executeCommand(const String&);

    /**
     * Check wether at least one result can be returned.
     * @param[in] : a string.
     * @param[out] : returns true if at least one result can be returned.
     * @code
     * @endcode
     */
    bool returnsAtLeastOneResult(const String&);
    
    /**
     * Check wether table exists.
     * @param[in] : a table name.
     * @param[out] : returns true if table exists.
     * @code
     * @endcode
     */
    bool tableExists(const String&);

    /**
     * Clear all tables.
     * @code
     * @endcode
     */
    void clearAllTables();

    /**
     * Run a vacuum command.
     * @code
     * @endcode
     */
    void runVacuumCommand();
    
    /**
     * Check wether a transaction is in progress.
     * @param[out] : returns true if a transaction is in progress.
     * @code
     * @endcode
     */
    bool transactionInProgress() const ;
    
    /**
     * Get the rowid of the most recent successful INSERT into the database.
     * @param[in] : description
     * @param[out] : returns the rowid of the most recent successful INSERT into the database.
     * @code
     * @endcode
     */
    int64_t lastInsertRowID();

    /**
     * This function returns the number of database rows that were changed or inserted or deleted by the most recently completed SQL statement.
     * @param[out] : the number of database rows that were changed or inserted or deleted by the most recently completed SQL statement.
     * @code
     * @endcode
     */
    int lastChanges();

    /**
     * Sets a busy handler that sleeps for a while when a table is locked.
     * @param[in] : the number of milliseconds to sleep.
     * @code
     * @endcode
     */
    void setBusyTimeout(int ms);

    /**
     * This routine identifies a callback function that might be invoked whenever an attempt is made to open a database table that another thread or process has locked.
     * @param[in] : the callback to invoke.
     * @code
     * @endcode
     */
    void setBusyHandler(int(*)(void*, int));
    
    /**
     * Force a full database synchronisation.
     * @param[in] : a boolean to force or not the synchronisation.
     * @code
     * @endcode
     */
    void setFullsync(bool);
    
    // Gets/sets the maximum size in bytes
    // Depending on per-database attributes, the size will only be settable in units that are the page size of the database, which is established at creation
    // These chunks will never be anything other than 512, 1024, 2048, 4096, 8192, 16384, or 32768 bytes in size.
    // setMaximumSize() will round the size down to the next smallest chunk if the passed size doesn't align.
    /**
     * Get maximum size.
     * @param[out] : the maximum size (will never be anything other than 512, 1024, 2048, 4096, 8192, 16384, or 32768 bytes in size). 
     * @code
     * @endcode
     */
    int64_t maximumSize();
    
    /**
     * Set the maximum size. It will round the size down to the next smallest chunk if the passed size doesn't align.
     * @param[in] : the size to set. Depending on per-database attributes, the size will only be settable in units that are the page size of the database, which is established at creation. 
     * @code
     * @endcode
     */
    void setMaximumSize(int64_t);
    
    // The SQLite SYNCHRONOUS pragma can be either FULL, NORMAL, or OFF
    // FULL - Any writing calls to the DB block until the data is actually on the disk surface
    // NORMAL - SQLite pauses at some critical moments when writing, but much less than FULL
    // OFF - Calls return immediately after the data has been passed to disk
    enum SynchronousPragma { SyncOff = 0, SyncNormal = 1, SyncFull = 2 };
    /**
     * Set synchronous database which can be either FULL, NORMAL or OFF.
     * @param[in] : a Synchronous pragma which can be:
     * FULL - Any writing calls to the DB block until the data is actually on the disk surface.
     * NORMAL - SQLite pauses at some critical moments when writing, but much less than FULL.
     * OFF - Calls return immediately after the data has been passed to disk.
     * @code
     * @endcode
     */
    void setSynchronous(SynchronousPragma);
    
    /**
     * Get the error code for the most recently failed interface call to the database.
     * @param[out] : an integer representing the error code.
     * @code
     * @endcode
     */
    int lastError();

    /**
     * Get an error description for the most recently failed interface call to the database.
     * @param[out] : a message describing the error.
     * @code
     * @endcode
     */
    const char* lastErrorMsg();
    
    /**
     * Get a pointer to the database.
     * @param[out] : the pointer to the database.
     * @code
     * @endcode
     */
    sqlite3* sqlite3Handle() const ;
    
    /**
     * Set an authorizer for the database.
     * @param[in] : a PassRefPtr to an SQLiteAuthorizer (@see SQLiteAuthorizer())
     * @code
     * @endcode
     */
    void setAuthorizer(PassRefPtr<DatabaseAuthorizer>);

    // (un)locks the database like a mutex
    /**
     * Lock the database.
     * @code
     * @endcode
     */
    void lock();

    /**
     * Unlock the database.
     * @code
     * @endcode
     */
    void unlock();

private:
    /**
     * Generic method to retrieve credential on an action on the database.
     * @param[in] : a pointer to some user data which is in fact a way to retrieve a SQLiteAuthorizer.
     * @param[in] : an integer representing an Authorizer Action Codes.
     * @param[in] : a string passed as first parameter to retrieve credential.
     * @param[in] : a string passed as second parameter to retrieve credential.
     * @param[in] : a database name.
     * @param[in] : a trigger or view name.
     * @param[out] : returns an integer which can be either equal to SQLAuthAllow or equal to SQLAuthDeny.
     * @see SQLiteAuthorizer() to know more about credential.
     * @code
     * @endcode
     */
    static int authorizerFunction(void*, int, const char*, const char*, const char*, const char*);

    /**
     * Enable/Disable authorizer.
     * @param[in] : boolean to enable or disable authorizer.
     * @code
     * @endcode
     */
    void enableAuthorizer(bool enable);
    
    /**
     * Get the page size.
     * @param[out] : an integer representing the size of a page.
     * @code
     * @endcode
     */
    int pageSize();
    
    sqlite3* m_db;
    int m_lastError;
    int m_pageSize;
    
    bool m_transactionInProgress;
    
    Mutex m_authorizerLock;
    RefPtr<SQLiteAuthorizer> m_authorizer;

    Mutex m_lockingMutex;
    ThreadIdentifier m_openingThread;
    
}; // class SQLiteDatabase

} // namespace WebCore

#endif




