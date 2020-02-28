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
#ifndef ResourceHandleClient_h
#define ResourceHandleClient_h
/**
 *  @file  ResourceHandleClient.t
 *  ResourceHandleClient description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:10 $
 */
#include "BALBase.h"

#include <wtf/RefCounted.h>
#include <wtf/Platform.h>
#include <wtf/RefPtr.h>



namespace WKAL {
    class AuthenticationChallenge;
    class Credential;
    class KURL;
    class ResourceHandle;
    class ResourceError;
    class ResourceRequest;
    class ResourceResponse;

    enum CacheStoragePolicy {
        StorageAllowed,
        StorageAllowedInMemoryOnly,
        StorageNotAllowed,
    };
    
    class ResourceHandleClient : public WKALBase {
    public:
    /**
     * ~ResourceHandleClient destructor
     * @code
     * delete r;
     * @endcode
     */
        virtual ~ResourceHandleClient() ;

        // request may be modified
    /**
     * will send request
     * @param[in] : resource handle
     * @param[in] : resource request
     * @param[in] : resource response
     * @code
     * r->willSendRequest(rh, rr, rre);
     * @endcode
     */
        virtual void willSendRequest(ResourceHandle*, ResourceRequest&, const ResourceResponse& redirectResponse) ;


    /**
     * Did send data.
     * @param[in] : a pointer to a rasource handle.
     * @param[in] : the bytes sent.
     * @param[in] : the total bytes sent.
     * @code
     * @endcode
     */
        virtual void didSendData(ResourceHandle*, unsigned long long bytesSent, unsigned long long totalBytesToBeSent) ;

    /**
     * did receive response
     * @param[in] : Resource handle
     * @param[in] : Resource response
     * @code
     * r->didReceiveResponse(rh, rr);
     * @endcode
     */
        virtual void didReceiveResponse(ResourceHandle*, const ResourceResponse&) ;

    /**
     * did receive data
     * @param[in] : resource handle
     * @param[in] : data
     * @param[in] : length
     * @param[in] : length received
     * @code
     * r->didReceiveData(rh, c, l, lr);
     * @endcode
     */
        virtual void didReceiveData(ResourceHandle*, const char*, int, int lengthReceived) ;

    /**
     * did finish loading
     * @param[in] : resource handle
     * @code
     * r->didFinishLoading(rh);
     * @endcode
     */
        virtual void didFinishLoading(ResourceHandle*) ;

    /**
     * did fail
     * @param[in] : resource handle
     * @param[in] : resource error
     * @code
     * r->didFail(rh, re);
     * @endcode
     */
        virtual void didFail(ResourceHandle*, const ResourceError&) ;

    /**
     * was blocked
     * @param[in] : resource handle
     * @code
     * r->wasBlocked(rh);
     * @endcode
     */
        virtual void wasBlocked(ResourceHandle*) ;

    /**
     * cannot show URL
     * @param[in] : resource handle
     * @code
     * r->cannotShowURL(rh);
     * @endcode
     */
        virtual void cannotShowURL(ResourceHandle*) ;

    /**
     * will cache response
     * @param[in] : resource handle
     * @param[in] : cache storage policy
     * @code
     * r->willCacheResponse(rh, csp);
     * @endcode
     */
        virtual void willCacheResponse(ResourceHandle*, CacheStoragePolicy&) ;

    /**
     * did receive authentication challenge
     * @param[in] : resource handle
     * @param[in] : authentification challenge
     * @code
     * r->didReceiveAuthenticationChallenge(rh, ac);
     * @endcode
     */
        virtual void didReceiveAuthenticationChallenge(ResourceHandle*, const AuthenticationChallenge&) ;

    /**
     * did cancel authentication challenge
     * @param[in] : resource handle
     * @param[in] : authentication challenge
     * @code
     * r->didCancelAuthenticationChallenge(rh, ac);
     * @endcode
     */
        virtual void didCancelAuthenticationChallenge(ResourceHandle*, const AuthenticationChallenge&) ;

    /**
     * received credential
     * @param[in] : resource handle
     * @param[in] : authentication challenge
     * @param[in] : credential
     * @code
     * r->receivedCredential(rh, ac, c);
     * @endcode
     */
        virtual void receivedCredential(ResourceHandle*, const AuthenticationChallenge&, const Credential&) ;

    /**
     * received request to continue without credential
     * @param[in] : resource handle
     * @param[in] : authentication challenge
     * @code
     * r->receivedRequestToContinueWithoutCredential(rh, ac);
     * @endcode
     */
        virtual void receivedRequestToContinueWithoutCredential(ResourceHandle*, const AuthenticationChallenge&) ;

    /**
     * received cancellation
     * @param[in] : resource handle
     * @param[in] : authentication challenge
     * @code
     * r->receivedCancellation(rh, ac);
     * @endcode
     */
        virtual void receivedCancellation(ResourceHandle*, const AuthenticationChallenge&) ;

    };

}

#endif



