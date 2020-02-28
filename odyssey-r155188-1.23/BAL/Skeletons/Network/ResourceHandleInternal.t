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
#ifndef ResourceHandleInternal_h
#define ResourceHandleInternal_h
/**
 *  @file  ResourceHandleInternal.t
 *  ResourceHandleInternal description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:10 $
 */
#include "BALBase.h"

#include "ResourceHandle.h"
#include "ResourceRequest.h"
#include "AuthenticationChallenge.h"
#include "Timer.h"



#include <curl/curl.h>
#include "FormDataStreamCurl.h"




// The allocations and releases in ResourceHandleInternal are
// Cocoa-exception-free (either simple Foundation classes or
// WebCoreResourceLoaderImp which avoids doing work in dealloc).

namespace WKAL {
    class ResourceHandleClient;

    class ResourceHandleInternal : public WKALBase, Noncopyable {
    public:
    /**
     * ResourceHandleInternal constructor
     * @param[in] : resource handle
     * @param[in] : resource resquest
     * @param[in] : resource handle client
     * @param[in] : defers loading
     * @param[in] : should content sniff
     * @param[in] : might download from handle
     * @code
     * ResourceHandleInternal *r = new ResourceHandleInternal(l, r, c, d, s, m);
     * @endcode
     */
        ResourceHandleInternal(ResourceHandle* loader, const ResourceRequest& request, ResourceHandleClient* c, bool defersLoading, bool shouldContentSniff, bool mightDownloadFromHandle);
        
    /**
     * ResourceHandleInternal destructor
     * @code
     * delete r;
     * @endcode
     */
        ~ResourceHandleInternal();

    /**
     * get client
     * @param[out] : resource handle client
     * @code
     * ResourceHandleClient *rhc = r->client();
     * @endcode
     */
        ResourceHandleClient* client() ;
        ResourceHandleClient* m_client;
        
        ResourceRequest m_request;
        
        int status;

        bool m_defersLoading;
        bool m_shouldContentSniff;
        bool m_mightDownloadFromHandle;
        CURL* m_handle;
        char* m_url;
        struct curl_slist* m_customHeaders;
        ResourceResponse m_response;
        bool m_cancelled;

        FormDataStream m_formDataStream;
        Vector<char> m_postBytes;
        QNetworkReplyHandler* m_job;
        AuthenticationChallenge m_currentWebChallenge;

        ResourceHandle::FailureType m_failureType;
        Timer<ResourceHandle> m_failureTimer;
    };

} // namespace WKAL

#endif // ResourceHandleInternal_h




