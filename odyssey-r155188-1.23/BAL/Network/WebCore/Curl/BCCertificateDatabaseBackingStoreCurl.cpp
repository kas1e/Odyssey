/*
 * Copyright (C) 2009 Pleyo.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY APPLE INC. ``AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL APPLE COMPUTER, INC. OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <config.h>
#include "CertificateBackingStore.h"

#include "CertificateCache.h"
#include "KURL.h"
#include "Logging.h"
#include "SQLiteStatement.h"

namespace WebCore {

static String tableName = "certificates";

CertificateBackingStore::CertificateBackingStore(CertificateCache* certificatesCache)
    : m_certificateCache(certificatesCache)
{
}

CertificateBackingStore::~CertificateBackingStore()
{
}

bool CertificateBackingStore::tableExists()
{
    return m_db.isOpen() && m_db.tableExists(tableName);
}

void CertificateBackingStore::open(const String& certificateFilePath)
{
    if (m_db.isOpen())
        close();

    if (!m_db.open(certificateFilePath)) {
        LOG(Network, "Could not open the certificate database. No certificates will be stored!");
        return;
    }

    if (tableExists()) {
        getStoredCertificates();
        return;
    }

    String createTableQuery("CREATE TABLE ");
    createTableQuery.append(tableName);
    createTableQuery.append(" (url TEXT UNIQUE ON CONFLICT REPLACE, certificatePath TEXT, keyPath TEXT, keyPassword TEXT);");

    if (!m_db.executeCommand(createTableQuery)) {
        LOG(Network, "Could not create the table to store the certificates into. No certificate will be stored!");
        close();
    }

}

void CertificateBackingStore::close()
{
    m_db.close();
}

void CertificateBackingStore::add(const String& url, const CertificateInfo& certificateInfo)
{
    if (!tableExists())
        return;

    String insertQuery("INSERT INTO ");
    insertQuery.append(tableName);
    insertQuery.append(" (url, certificatePath, keyPath, keyPassword) VALUES (?1, ?2, ?3, ?4);");
    SQLiteStatement insertStatement(m_db, insertQuery);

    if (insertStatement.prepare()) {
        LOG(Network, "Cannot save certificate (preparing the SQL statement failed)");
        return;
    }

    // Binds all the values
    if (insertStatement.bindText(1, url) || insertStatement.bindText(2, certificateInfo.certificatePath())
        || insertStatement.bindText(3, certificateInfo.keyPath()) || insertStatement.bindText(4, certificateInfo.keyPassword())) {
        LOG(Network, "Cannot save certificate (binding value on the SQL statement failed)");
        return;
    }

    if (!insertStatement.executeCommand()) {
        LOG(Network, "Cannot save certificate (executing the SQL statement failed)");
        return;
    }

}

void CertificateBackingStore::remove(const String& url)
{
    if (!tableExists())
        return;

    String deleteQuery("DELETE FROM ");
    deleteQuery.append(tableName);
    deleteQuery.append(" WHERE url=?1;");
    SQLiteStatement deleteStatement(m_db, deleteQuery);

    if (deleteStatement.prepare()) {
        LOG(Network, "Cannot delete certificate");
        return;
    }

    // Binds all the values
    if (deleteStatement.bindText(1, url)) {
        LOG(Network, "Cannot delete certificate");
        return;
    }

    if (!deleteStatement.executeCommand()) {
        LOG(Network, "Cannot delete the certificate from database");
        return;
    }

}

void CertificateBackingStore::clear()
{
    if (!tableExists())
        return;

    String deleteQuery("DELETE * from ");
    deleteQuery.append(tableName);
    deleteQuery.append(";");

    SQLiteStatement deleteStatement(m_db, deleteQuery);
    if (deleteStatement.prepare()) {
        LOG(Network, "Could not prepare DELETE * statement");
        return;
    }

    if (!deleteStatement.executeCommand()) {
        LOG(Network, "Cannot delete certificate from database");
        return;
    }
}

void CertificateBackingStore::getStoredCertificates()
{
    ASSERT(tableExists());    
    
    String selectQuery("SELECT url, certificatePath, keyPath, keyPassword FROM ");
    selectQuery.append(tableName);
    selectQuery.append(";");

    SQLiteStatement selectStatement(m_db, selectQuery);

    if (selectStatement.prepare()) {
        LOG(Network, "Cannot retrieved certificates from the database");
        return;
    }

    while (selectStatement.step() == SQLResultRow) {
        // There is a row to fetch
        String url = selectStatement.getColumnText(0);
        String certificatePath = selectStatement.getColumnText(1);
        String keyPath = selectStatement.getColumnText(2);
        String keyPassword = selectStatement.getColumnText(3);

        m_certificateCache->addWithoutBackingStoreUpdate(KURL(KURL(), url), certificatePath, keyPath, keyPassword);
    }
}

} // namespace WebCore
