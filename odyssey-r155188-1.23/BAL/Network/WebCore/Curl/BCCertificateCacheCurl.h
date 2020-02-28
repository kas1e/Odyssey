/*
 * Copyright (C) 2009 Pleyo.  All rights reserved.
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

#ifndef CertificateCache_h
#define CertificateCache_h

#include "CertificateBackingStore.h"
#include "HashMap.h"
#include "WTFString.h"
#include "StringHash.h"

namespace WebCore {

class KURL;

class CertificateInfo {
public:
    explicit CertificateInfo()
    {
    }

    CertificateInfo(String certificatePath, String keyPath, String keyPassword)
        : m_certificatePath(certificatePath)
        , m_keyPath(keyPath)
        , m_keyPassword(keyPassword)
    {
    }

    const String& certificatePath() const { return m_certificatePath; }
    const String& keyPath() const { return m_keyPath; }
    const String keyPassword() const { return m_keyPassword; }

private:
    String m_certificatePath;
    String m_keyPath;
    String m_keyPassword;
};


/**
 * This is used by the cURL backend to store the client certificate, key and password.
 */
class CertificateCache {
public:
    CertificateCache();
    ~CertificateCache();

    /**
     * getCertificateInfo
     * @brief return the information for the passed URL
     * @param url the url for which to get the certificate information
     * @return the found result or 0 if no information are found for this URL.
     */
    const CertificateInfo* getCertificateInfo(const KURL&) const;

    void add(const KURL& /*url*/, const String& /*certificatePath*/, const String& /*keyPath*/, const String& /*keyPassword*/);

    void remove(const KURL&);
    void clear();

private:
    friend class CertificateBackingStore;

    void addWithoutBackingStoreUpdate(const KURL& /*url*/, const String& /*certificatePath*/, const String& /*keyPath*/, const String& /*keyPassword*/);

    HashMap<String, CertificateInfo > m_certificateInfoCache;
    CertificateBackingStore m_backingStore;
};

} // namespace WebCore

#endif //CertificateCache_h
