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
#ifndef SQLiteTransaction_h
#define SQLiteTransaction_h
/**
 *  @file  SQLiteTransaction.t
 *  SQLiteTransaction description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:05 $
 */
#include "BALBase.h"

#include <wtf/Noncopyable.h>

namespace WebCore {

class SQLiteDatabase;

class SQLiteTransaction : public Noncopyable
{
public:
    /**
     * Constructor for SQLiteTransaction.
     * @param[in] : a reference to a SQLiteDatabase.
     * @see SQLiteDatabase()
     * @code
     * @endcode
     */
    SQLiteTransaction(SQLiteDatabase& db);

    /**
     * Destructor for SQLiteTransaction.
     * @code
     * @endcode
     */
    ~SQLiteTransaction();
    
    /**
     * Do a BEGIN transaction.
     * @code
     * @endcode
     */
    void begin();

    /**
     * Do a COMMIT transaction.
     * @code
     * @endcode
     */
    void commit();

    /**
     * Do a ROLLBACK transaction.
     * @code
     * @endcode
     */
    void rollback();

    /**
     * Stop transaction.
     * @code
     * @endcode
     */
    void stop();
    
    /**
     * Check wether a transaction is in progress.
     * @param[out] : true if a transaction is in progress, else otherwise.
     * @code
     * @endcode
     */
    bool inProgress() const ;
private:
    SQLiteDatabase& m_db;
    bool m_inProgress;

};

} // namespace WebCore

#endif // SQLiteTransation_H





