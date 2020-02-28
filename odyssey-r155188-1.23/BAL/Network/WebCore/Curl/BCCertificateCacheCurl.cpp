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

#include "config.h"
#include "CertificateCache.h"

#include "BALBase.h"
#include "FileSystem.h"
#include "KURL.h"

namespace WebCore {

CertificateCache::CertificateCache()
    : m_backingStore(this)
{
    m_backingStore.open(pathByAppendingComponent(OWB_DATA, "certificates.db"));
}

CertificateCache::~CertificateCache()
{
    m_backingStore.close();
}

const CertificateInfo* CertificateCache::getCertificateInfo(const KURL& url) const
{
    HashMap<String, CertificateInfo>::const_iterator infoIterator = m_certificateInfoCache.find(url.host());
    if (infoIterator == m_certificateInfoCache.end())
        return 0;

    return &(*infoIterator).value;
}

void CertificateCache::add(const KURL& url, const String& certificatePath, const String& keyPath, const String& keyPassword)
{
    HashMap<String, CertificateInfo >::AddResult iter = m_certificateInfoCache.add(url.host(), CertificateInfo(certificatePath, keyPath, keyPassword));
    m_backingStore.add(url.host(), iter.iterator->value);
}

void CertificateCache::addWithoutBackingStoreUpdate(const KURL& url, const String& certificatePath, const String& keyPath, const String& keyPassword)
{
    m_certificateInfoCache.add(url.host(), CertificateInfo(certificatePath, keyPath, keyPassword));
}

void CertificateCache::remove(const KURL& url)
{
    m_certificateInfoCache.remove(url.host());
    m_backingStore.remove(url.host());
}

void CertificateCache::clear()
{
    m_certificateInfoCache.clear();
    m_backingStore.clear();
}

} // namespace WebCore
