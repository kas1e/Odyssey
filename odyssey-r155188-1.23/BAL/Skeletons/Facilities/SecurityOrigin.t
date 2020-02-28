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
#ifndef SecurityOrigin_h
#define SecurityOrigin_h
/**
 *  @file  SecurityOrigin.t
 *  SecurityOrigin description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:05 $
 */
#include "BALBase.h"

#include <wtf/RefCounted.h>
#include <wtf/PassRefPtr.h>
#include <wtf/Threading.h>

#include "PlatformString.h"

namespace WebCore {

    class KURL;
    
    class SecurityOrigin : public WebCoreBase, public ThreadSafeShared<SecurityOrigin> {
    public:
    /**
     * create from database identifier
     * @param[in] : identifier
     * @code
     * RefPtr<SecurityOrigin> s = SecurityOrigin::createFromDatabaseIdentifier(s);
     * @endcode
     */
        static PassRefPtr<SecurityOrigin> createFromDatabaseIdentifier(const String&);

    /**
     * create from string 
     * @param[in] : string
     * @code
     * RefPtr<SecurityOrigin> s = SecurityOrigin::createFromString(st);
     * @endcode
     */
        static PassRefPtr<SecurityOrigin> createFromString(const String&);

    /**
     * create from url
     * @param[in] : url
     * @code
     * RefPtr<SecurityOrigin> s = SecurityOrigin::create(url);
     * @endcode
     */
        static PassRefPtr<SecurityOrigin> create(const KURL&);

    /**
     * create empty
     * @code
     * RefPtr<SecurityOrigin> s = SecurityOrigin::createEmpty();
     * @endcode
     */
        static PassRefPtr<SecurityOrigin> createEmpty();

    /**
     * copy
     * @param[out] : SecurityOrigin
     * @code
     * RefPtr<SecurityOrigin> s1 = s->copy();
     * @endcode
     */
        PassRefPtr<SecurityOrigin> copy();

    /**
     * set domain from DOM 
     * @param[in] : domain
     * @code
     * s->setDomainFromDOM(d);
     * @endcode
     */
        void setDomainFromDOM(const String& newDomain);

    /**
     * get protocol
     * @param[out] : protocol
     * @code
     * String p = s->protocol();
     * @endcode
     */
        String protocol() const ;

    /**
     * get host
     * @param[out] : host
     * @code
     * String h = s->host();
     * @endcode
     */
        String host() const ;

    /**
     * get domain
     * @param[out] : domain
     * @code
     * String d = s->domain();
     * @endcode
     */
        String domain() const ;

    /**
     * get port
     * @param[out] : port
     * @code
     * String p = s->port();
     * @endcode
     */
        unsigned short port() const ;

    /**
     * Returns true if this SecurityOrigin can script objects in the given
     * SecurityOrigin.
     * @param[in] : security origin
     * @param[out] : status
     * @code
     * bool c = s->canAccess(s1);
     * @endcode
     */
        bool canAccess(const SecurityOrigin*) const;

    /**
     * Returns true if this SecurityOrigin can read content retrieved from
     * the given URL. For example, call this function before issuing
     * XMLHttpRequests.
     * @param[in] : url
     * @param[out] : status
     * @code
     * bool c = s->canRequest(url);
     * @endcode
     */
        bool canRequest(const KURL&) const;

    /**
     * return true if this SecurityOrigin can load local resources
     * @param[out] : status
     * @code
     * bool c = s->canLoadLocalResources();
     * @endcode
     */
        bool canLoadLocalResources() const ;

    /**
     * grant load local resources
     * @code
     * s->grantLoadLocalResources();
     * @endcode
     */
        void grantLoadLocalResources();
    
    /**
     * test if SecurityOrigin is secure transition to url
     * @param[in] : url
     * @param[out] : status
     * @code
     * bool c = s->isSecureTransitionTo(url);
     * @endcode
     */
        bool isSecureTransitionTo(const KURL&) const;

    /**
     * test if securityOrigin is local
     * @param[out] : status
     * @code
     * bool c = s->isLocal();
     * @endcode
     */
        bool isLocal() const;
    
    /**
     * test if securityOrigin is empty
     * @param[out] : status
     * @code
     * bool c = s->isEmpty();
     * @endcode
     */
        bool isEmpty() const;

    /**
     * to string 
     * @param[out] : string
     * @code
     * String st = s->toString();
     * @endcode
     */
        String toString() const;

    /**
     * Serialize the security origin for storage in the database. This format is
     * deprecated and should be used only for compatibility with old databases;
     * use toString() and createFromString() instead.
     * @param[out] : string
     * @code
     * String st = s->databaseIdentifier();
     * @endcode
     */
        String databaseIdentifier() const;

    /**
     * This method checks for equality between SecurityOrigins, not whether
     * one origin can access another.  It is used for hash table keys.
     * For access checks, use canAccess().
     * @param[in] : securityOrigin
     * @param[out] : status
     * @code
     * bool e = s->equal(s1);
     * @endcode
     */
        bool equal(const SecurityOrigin*) const;

    /**
     * This method checks for equality, ignoring the value of document.domain
     * (and whether it was set) but considering the host. It is used for postMessage.
     * @param[in] : securityOrigin
     * @param[out] : status
     * @code
     * bool e = s->isSameSchemeHostPort(s1);
     * @endcode
     */
        bool isSameSchemeHostPort(const SecurityOrigin*) const;

    private:
    /**
     * SecurityOrigin constructor
     */
        explicit SecurityOrigin(const KURL&);
    /**
     * SecurityOrigin constructor
     */
        explicit SecurityOrigin(const SecurityOrigin*);

        String m_protocol;
        String m_host;
        String m_domain;
        unsigned short m_port;
        bool m_noAccess;
        bool m_domainWasSetInDOM;
    };

} // namespace WebCore

#endif // SecurityOrigin_h

