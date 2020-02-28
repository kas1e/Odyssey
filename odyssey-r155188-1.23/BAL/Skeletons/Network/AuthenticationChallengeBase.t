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
#ifndef AuthenticationChallengeBase_h
#define AuthenticationChallengeBase_h
/**
 *  @file  AuthenticationChallengeBase.t
 *  AuthenticationChallengeBase description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:10 $
 */
#include "BALBase.h"

#include "Credential.h"
#include "ProtectionSpace.h"
#include "ResourceResponse.h"
#include "ResourceError.h"

namespace WKAL {

class AuthenticationChallenge;

class AuthenticationChallengeBase : public WKALBase {
public:
    /**
     * AuthenticationChallengeBase default constructor
     * @code
     * AuthenticationChallengeBase *a = new AuthenticationChallengeBase();
     * @endcode
     */
    AuthenticationChallengeBase();

    /**
     * AuthenticationChallengeBase constructor
     * @param[in] : protection space
     * @param[in] : proposed credential
     * @param[in] : previous failure count
     * @param[in] : resource response
     * @param[in] : error
     * @code
     * AuthenticationChallengeBase *a = new AuthenticationChallengeBase(ps, pc, pfc, re, e);
     * @endcode
     */
    AuthenticationChallengeBase(const ProtectionSpace& protectionSpace, const Credential& proposedCredential, unsigned previousFailureCount, const ResourceResponse& response, const ResourceError& error);

    /**
     * get previous failure count
     * @param[out] : failure count
     * @code
     * unsigned c = a->previousFailureCount();
     * @endcode
     */
    unsigned previousFailureCount() const;

    /**
     * get proposed credential
     * @param[out] : proposed credential
     * @code
     * Credential c = a->proposedCredential();
     * @endcode
     */
    const Credential& proposedCredential() const;

    /**
     * get protection space
     * @param[out] : protection space
     * @code
     * ProtectionSpace s = a->protectionSpace();
     * @endcode
     */
    const ProtectionSpace& protectionSpace() const;

    /**
     * get failure response
     * @param[out] : failure response
     * @code
     * ResourceResponse r = a->failureResponse();
     * @endcode
     */
    const ResourceResponse& failureResponse() const;

    /**
     * error
     * @param[out] : resource error
     * @code
     * ResourceError e = a->error();
     * @endcode
     */
    const ResourceError& error() const;
    
    /**
     * test if AuthenticationChallengeBase is null
     * @param[out] : true if AuthenticationChallengeBase is null
     * @code
     * bool n = a->isNull();
     * @endcode
     */
    bool isNull() const;

    /**
     * nullify
     * @code
     * a->nullify();
     * @endcode
     */
    void nullify();

    /**
     * compare
     * @param[in] : AuthenticationChallenge
     * @param[in] : AuthenticationChallenge
     * @param[out] : true if the two AuthenticationChallenge is equal
     * @code
     * bool e = AuthenticationChallenge::compare(a, b);
     * @endcode
     */
    static bool compare(const AuthenticationChallenge& a, const AuthenticationChallenge& b);

protected:
    // The AuthenticationChallenge subclass may "shadow" this method to compare platform specific fields
    /**
     * platform compare
     * @param[in] : AuthenticationChallengeBase
     * @param[in] : AuthenticationChallengeBase
     * @param[out] : true if the two AuthenticationChallenge is equal
     */
    static bool platformCompare(const AuthenticationChallengeBase& a, const AuthenticationChallengeBase& b) ;

    bool m_isNull;
    ProtectionSpace m_protectionSpace;
    Credential m_proposedCredential;
    unsigned m_previousFailureCount;
    ResourceResponse m_failureResponse;
    ResourceError m_error;
};

    /**
     *  operator== 
     */
inline bool operator==(const AuthenticationChallenge& a, const AuthenticationChallenge& b) ;
    /**
     *  operator!= 
     */
inline bool operator!=(const AuthenticationChallenge& a, const AuthenticationChallenge& b) ;

}

#endif




