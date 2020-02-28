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
#ifndef ResourceHandle_h
#define ResourceHandle_h
/**
 *  @file  ResourceHandle.t
 *  ResourceHandle description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:10 $
 */
#include "BALBase.h"

#include "AuthenticationChallenge.h"
#include "HTTPHeaderMap.h"
#include <wtf/OwnPtr.h>






namespace WKAL {

class AuthenticationChallenge;
class Credential;
class FormData;
class Frame;
class KURL;
class ResourceError;
class ResourceHandleClient;
class ResourceHandleInternal;
class ResourceRequest;
class ResourceResponse;
class SchedulePair;
class SharedBuffer;
class SubresourceLoader;
class SubresourceLoaderClient;

template <typename T> class Timer;

class ResourceHandle : public WKALBase, public RefCounted<ResourceHandle> {
private:
    /**
     * ResourceHandle constructor
     * @param[in] : resource request
     * @param[in] : resource handle client
     * @param[in] : defers loading
     * @param[in] : should content sniff
     * @param[in] : might download from handle
     * @code
     * ResourceHandle *r = new ResourceHandle(rr, rhc, df, scs, mdfh);
     * @endcode
     */
    ResourceHandle(const ResourceRequest&, ResourceHandleClient*, bool defersLoading, bool shouldContentSniff, bool mightDownloadFromHandle);

    enum FailureType {
        BlockedFailure,
        InvalidURLFailure
    };

public:
    // FIXME: should not need the Frame
    /**
     * create
     * @param[in] : resource request
     * @param[in] : resource handle client
     * @param[in] : defers loading
     * @param[in] : should content sniff
     * @param[in] : might download from handle 
     * @code
     * RefPtr<ResourceHandle> r = ResourceHandle::create(rr, rhc, df, scs, mdfh);
     * @endcode
     */
    static PassRefPtr<ResourceHandle> create(const ResourceRequest&, ResourceHandleClient*, Frame*, bool defersLoading, bool shouldContentSniff, bool mightDownloadFromHandle = false);

    /**
     * load resource synchronously
     * @param[in] : resource request
     * @param[in] : resource error
     * @param[in] : data
     * @param[in] : frame
     * @code
     * ResourceHandle::loadResourceSynchronously(rr, re, rre, d, f);
     * @endcode
     */
    static void loadResourceSynchronously(const ResourceRequest&, ResourceError&, ResourceResponse&, Vector<char>& data, Frame* frame);

    /**
     * get will load from cache
     * @param[in] : resource request
     * @param[out] : value
     * @code
     * bool w = ResourceHandle::willLoadFromCache(rr);
     * @endcode
     */
    static bool willLoadFromCache(ResourceRequest&);
    
    /**
     * ResourceHandle destruction
     * @code
     * delete r;
     * @endcode
     */
    ~ResourceHandle();

    /**
     * did receive authentication challenge
     * @param[in] : authentication challenge
     * @code
     * r->didReceiveAuthenticationChallenge(ac);
     * @endcode
     */
    void didReceiveAuthenticationChallenge(const AuthenticationChallenge&);

    /**
     * received credential
     * @param[in] : authentication challenge
     * @param[in] : credential
     * @code
     * r->receivedCredential(a, c);
     * @endcode
     */
    void receivedCredential(const AuthenticationChallenge&, const Credential&);

    /**
     * received request to continue without credential
     * @param[in] : authentication challenge
     * @code
     * r->receivedRequestToContinueWithoutCredential(ac);
     * @endcode
     */
    void receivedRequestToContinueWithoutCredential(const AuthenticationChallenge&);

    /**
     * received cancellation
     * @param[in] : authentication challenge
     * @code
     * r->receivedCancellation(ac);
     * @endcode
     */
    void receivedCancellation(const AuthenticationChallenge&);

    /**
     * set host allows any HTTPS certificate
     * @param[in] : host
     * @code
     * ResourceHandle::setHostAllowsAnyHTTPSCertificate(s);
     * @endcode
     */
    static void setHostAllowsAnyHTTPSCertificate(const String&);

    /**
     * set client certificate
     * @param[in] : host
     * @param[in] : data
     * @code
     * ResourceHandle::setClientCertificate(h, c);
     * @endcode
     */
    static void setClientCertificate(const String& host, CFDataRef);

    /**
     * get buffered data
     * @param[out] : buffered data
     * @code
     * RefPtr<SharedBuffer> s = r->bufferedData();
     * @endcode
     */
    PassRefPtr<SharedBuffer> bufferedData();

    /**
     * test if ResourceHandle supports buffered data
     * @param[out] : true if ResourceHandle supports buffered data
     * @code
     * bool s = ResourceHandle::supportsBufferedData();
     * @endcode
     */
    static bool supportsBufferedData();

    /**
     * get resource handle internal
     * @param[out] : ResourceHandleInternal
     * @code
     * ResourceHandleInternal *rhi = r->getInternal();
     * @endcode
     */
    ResourceHandleInternal* getInternal() ;

    // Used to work around the fact that you don't get any more NSURLConnection callbacks until you return from the one you're in.
    /**
     * test if ResourceHandle loads blocked
     * @param[out] : true if ResourceHandle loads blocked
     * @code
     * bool l = ResourceHandle::loadsBlocked();
     * @endcode
     */
    static bool loadsBlocked();    
    
    /**
     * clear authentication
     * @code
     * r->clearAuthentication();
     * @endcode
     */
    void clearAuthentication();

    /**
     * cancel
     * @code
     * r->cancel();
     * @endcode
     */
    void cancel();

    // The client may be 0, in which case no callbacks will be made.
    /**
     * get client
     * @param[out] : resource handle client
     * @code
     * ResourceHandleClient *c = r->client();
     * @endcode
     */
    ResourceHandleClient* client() const;

    /**
     * set client
     * @param[in] : resource handle client
     * @code
     * r->setClient(rhc);
     * @endcode
     */
    void setClient(ResourceHandleClient*);

    /**
     * set defers loading
     * @param[in] : value
     * @code
     * r->setDefersLoading(b);
     * @endcode
     */
    void setDefersLoading(bool);
      
    /**
     * get request
     * @param[out] : resource request
     * @code
     * ResourceRequest rr = r->request();
     * @endcode
     */
    const ResourceRequest& request() const;

    /**
     * fire failure
     * @param[in] : timer
     * @code
     * r->fireFailure(t);
     * @endcode
     */
    void fireFailure(Timer<ResourceHandle>*);

private:

    /**
     * scheduleFailure
     */
void scheduleFailure(FailureType);

    /**
     * start
     */
    bool start(Frame*);

    friend class ResourceHandleInternal;
    OwnPtr<ResourceHandleInternal> d;
};

}

#endif // ResourceHandle_h




