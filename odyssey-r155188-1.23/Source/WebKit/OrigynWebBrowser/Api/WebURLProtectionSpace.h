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

#ifndef WebURLProtectionSpace_h
#define WebURLProtectionSpace_h


/**
 *  @file  WebURLProtectionSpace.h
 *  WebURLProtectionSpace description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/04 21:14:07 $
 */
#include "BALBase.h"
#include <ProtectionSpace.h>
#include <ProtectionSpace.h>

#define WebURLProtectionSpaceHTTP "http"
#define WebURLProtectionSpaceHTTPS "https"
#define WebURLProtectionSpaceFTP "ftp"
#define WebURLProtectionSpaceFTPS "ftps"
#define WebURLProtectionSpaceHTTPProxy "http"
#define WebURLProtectionSpaceHTTPSProxy "https"
#define WebURLProtectionSpaceFTPProxy "ftp"
#define WebURLProtectionSpaceSOCKSProxy "SOCKS"
#define WebURLAuthenticationMethodDefault "WebURLAuthenticationMethodDefault"
#define WebURLAuthenticationMethodHTTPBasic "WebURLAuthenticationMethodHTTPBasic"
#define WebURLAuthenticationMethodHTTPDigest "WebURLAuthenticationMethodHTTPDigest"
#define WebURLAuthenticationMethodHTMLForm "WebURLAuthenticationMethodHTMLForm"


class WebURLProtectionSpace
{
public:

    /**
     * create a new instance of WebURLProtectionSpace
     */
    static WebURLProtectionSpace* createInstance();

    /**
     * create a new instance of WebURLProtectionSpace
     */
    static WebURLProtectionSpace* createInstance(const WebCore::ProtectionSpace&);
private:

    /**
     *  WebURLProtectionSpace constructor
     */
    WebURLProtectionSpace(const WebCore::ProtectionSpace&);
public:

    /**
     * WebURLProtectionSpace destructor
     */
    virtual ~WebURLProtectionSpace();

    /**
     * get authentication method
     */
    virtual WTF::String authenticationMethod();

    /**
     * get host
     */
    virtual WTF::String host();

    /**
     * initialize WebURLProtectionSpace with host
     */
    virtual void initWithHost(WTF::String host, int port, WTF::String protocol, WTF::String realm,  WTF::String authenticationMethod);

    /**
     * init with proxy host
     */
    virtual void initWithProxyHost(WTF::String host, int port, WTF::String proxyType, WTF::String realm, WTF::String authenticationMethod);

    /**
     * test if the protection space is a proxy
     */
    virtual bool isProxy();

    /**
     * get port
     */
    virtual int port();

    /**
     * get protocol
     */
    virtual WTF::String protocol();

    /**
     * get proxy type
     */
    virtual WTF::String proxyType();

    /**
     * get realm
     */
    virtual WTF::String realm();

    /**
     * test if protectionSpace receives credential securely
     */
    virtual bool receivesCredentialSecurely();

    /**
     * get protectionSpace
     */
    const WebCore::ProtectionSpace& protectionSpace() const;

protected:
    WebCore::ProtectionSpace m_protectionSpace;
};


#endif
