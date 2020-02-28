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
#ifndef Credential_h
#define Credential_h
/**
 *  @file  Credential.t
 *  Credential description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:10 $
 */
#include "BALBase.h"

#include "PlatformString.h"

namespace WKAL {

enum CredentialPersistence {
    CredentialPersistenceNone,
    CredentialPersistenceForSession,
    CredentialPersistencePermanent
};
    
class Credential : public WKALBase {

public:
    /**
     * Credential default constructor
     * @code
     * Credential c;
     * @endcode
     */
    Credential();

    /**
     * Credential constructor
     * @param[in] : user
     * @param[in] : password
     * @param[in] : credential persistence
     * @code
     * Credential *c = new Credential(u, p, cp);
     * @endcode
     */
    Credential(const String& user, const String& password, CredentialPersistence);
    
    /**
     * get user
     * @param[out] : user
     * @code
     * String u = c->user();
     * @endcode
     */
    const String& user() const;

    /**
     * get password
     * @param[out] : password
     * @code
     * String p = c->password();
     * @endcode
     */
    const String& password() const;

    /**
     * test if Credential has password
     * @param[out] : true if Credential has password
     * @code
     * bool p = c->hasPassword();
     * @endcode
     */
    bool hasPassword() const;

    /**
     * get persistence
     * @param[out] : credential persistence
     * @code
     * CredentialPersistence cp = c->persistence();
     * @endcode
     */
    CredentialPersistence persistence() const;
    
private:
    String m_user;
    String m_password;
    CredentialPersistence m_persistence;
};

    /**
     *  operator== 
     */
bool operator==(const Credential& a, const Credential& b);
    /**
     *  operator!= 
     */
inline bool operator!=(const Credential& a, const Credential& b) ;
    
};
#endif




