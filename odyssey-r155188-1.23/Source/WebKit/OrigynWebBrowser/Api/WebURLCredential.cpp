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

#include "config.h"
#include "WebURLCredential.h"

#include "Credential.h"
#include "CString.h"
#include "WTFString.h"

using namespace WebCore;

class WebURLCredentialPrivate 
{
public:
    WebURLCredentialPrivate() {}
    WebURLCredentialPrivate(const WebCore::Credential& cred) : m_credential(cred) {}
    ~WebURLCredentialPrivate() {}

    WebCore::Credential m_credential;
};

WebURLCredential::WebURLCredential()
    : m_priv(new WebURLCredentialPrivate())
{
}

WebURLCredential::WebURLCredential(const WebCore::Credential& cred)
    : m_priv(new WebURLCredentialPrivate(cred))
{
}

WebURLCredential::~WebURLCredential()
{
    delete m_priv;
}

WebURLCredential* WebURLCredential::createInstance()
{
    WebURLCredential* instance = new WebURLCredential();
    return instance;
}

WebURLCredential* WebURLCredential::createInstance(const WebCore::Credential& cred)
{
    WebURLCredential* instance = new WebURLCredential(cred);
    return instance;
}

bool WebURLCredential::hasPassword()
{
    return m_priv->m_credential.hasPassword();
}

void WebURLCredential::initWithUser(const char* user, const char* password, WebURLCredentialPersistence persistence)
{
    CredentialPersistence corePersistence = CredentialPersistenceNone;
    switch (persistence) {
    case WebURLCredentialPersistenceNone:
        break;
    case WebURLCredentialPersistenceForSession:
        corePersistence = CredentialPersistenceForSession;
        break;
    case WebURLCredentialPersistencePermanent:
        corePersistence = CredentialPersistencePermanent;
        break;
    default:
        ASSERT_NOT_REACHED();
    }

    m_priv->m_credential = Credential(user, password, corePersistence);
}

const char* WebURLCredential::password()
{
    return strdup(m_priv->m_credential.password().utf8().data());
}

WebURLCredentialPersistence WebURLCredential::persistence()
{
    switch (m_priv->m_credential.persistence()) {
    case CredentialPersistenceNone:
        return WebURLCredentialPersistenceNone;
    case CredentialPersistenceForSession:
        return WebURLCredentialPersistenceForSession;
    case CredentialPersistencePermanent:
        return WebURLCredentialPersistencePermanent;
    default:
        ASSERT_NOT_REACHED();
    }
    return WebURLCredentialPersistenceNone;
}

const char* WebURLCredential::user()
{
    return strdup(m_priv->m_credential.user().utf8().data());
}


WebCore::Credential& WebURLCredential::credential()
{
    return m_priv->m_credential;
}

