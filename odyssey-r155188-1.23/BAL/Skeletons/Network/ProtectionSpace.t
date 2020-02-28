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
#ifndef ProtectionSpace_h
#define ProtectionSpace_h
/**
 *  @file  ProtectionSpace.t
 *  ProtectionSpace description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:10 $
 */
#include "BALBase.h"

#include "PlatformString.h"

namespace WKAL {

enum ProtectionSpaceServerType {
  ProtectionSpaceServerHTTP = 1,
  ProtectionSpaceServerHTTPS = 2,
  ProtectionSpaceServerFTP = 3,
  ProtectionSpaceServerFTPS = 4,
  ProtectionSpaceProxyHTTP = 5,
  ProtectionSpaceProxyHTTPS = 6,
  ProtectionSpaceProxyFTP = 7,
  ProtectionSpaceProxySOCKS = 8
};

enum ProtectionSpaceAuthenticationScheme {
  ProtectionSpaceAuthenticationSchemeDefault = 1,
  ProtectionSpaceAuthenticationSchemeHTTPBasic = 2,
  ProtectionSpaceAuthenticationSchemeHTTPDigest = 3,
  ProtectionSpaceAuthenticationSchemeHTMLForm = 4,
  ProtectionSpaceAuthenticationSchemeNTLM = 5,
  ProtectionSpaceAuthenticationSchemeNegotiate = 6,
};

class ProtectionSpace : public WKALBase {

public:
    /**
     * ProtectionSpace default constructor
     * @code
     * ProtectionSpace p;
     * @endcode
     */
    ProtectionSpace();

    /**
     * ProtectionSpace
     * @param[in] : host
     * @param[in] : port
     * @param[in] : protection space server type
     * @param[in] : realm
     * @param[in] : protection space authentication scheme
     * @param[out] : description
     * @code
     * ProtectionSpace *p = new ProtectionSpace(h, p, psst, r, psas);
     * @endcode
     */
    ProtectionSpace(const String& host, int port, ProtectionSpaceServerType, const String& realm, ProtectionSpaceAuthenticationScheme);
    
    /**
     * get host value
     * @param[out] : host value
     * @code
     * String h = p->host();
     * @endcode
     */
    const String& host() const;

    /**
     * get port 
     * @param[out] : port
     * @code
     * int p = p->port();
     * @endcode
     */
    int port() const;

    /**
     * get server type 
     * @param[out] : protection space server type
     * @code
     * ProtectionSpaceServerType s = p->serverType;
     * @endcode
     */
    ProtectionSpaceServerType serverType() const;

    /**
     * test if ProtectionSpace is proxy
     * @param[out] : true if ProtectionSpace is proxy
     * @code
     * bool proxy = p->isProxy();
     * @endcode
     */
    bool isProxy() const;

    /**
     * get realm value
     * @param[out] : realm
     * @code
     * String r = p->realm();
     * @endcode
     */
    const String& realm() const;

    /**
     * get authenticationScheme value
     * @param[out] : protection space authentication scheme
     * @code
     * ProtectionSpaceAuthenticationScheme s = p->authenticationScheme();
     * @endcode
     */
    ProtectionSpaceAuthenticationScheme authenticationScheme() const;
    
    /**
     * test if ProtectionSpace receives credential securely
     * @param[out] : true if ProtectionSpace receives credential securely
     * @code
     * bool r = p->receivesCredentialSecurely();
     * @endcode
     */
    bool receivesCredentialSecurely() const;

private:
    String m_host;
    int m_port;
    ProtectionSpaceServerType m_serverType;
    String m_realm;
    ProtectionSpaceAuthenticationScheme m_authenticationScheme;
};

    /**
     *  operator== 
     */
bool operator==(const ProtectionSpace& a, const ProtectionSpace& b);
    /**
     *  operator!= 
     */
inline bool operator!=(const ProtectionSpace& a, const ProtectionSpace& b) ;
    
}
#endif




