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
#ifndef ResourceRequest_h
#define ResourceRequest_h
/**
 *  @file  ResourceRequest.t
 *  ResourceRequest description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:10 $
 */
#include "BALBase.h"

#include "ResourceRequestBase.h"

namespace WKAL {

    struct ResourceRequest : ResourceRequestBase {

    /**
     * ResourceRequest constructor
     * @param[in] : url
     * @code
     * ResourceRequest *r = new ResourceRequest(url);
     * @endcode
     */
        ResourceRequest(const String& url);

    /**
     * ResourceRequest constructor
     * @param[in] : url
     * @code
     * ResourceRequest *r = new ResourceRequest(url);
     * @endcode
     */
        ResourceRequest(const KURL& url);

    /**
     * ResourceRequest constructor
     * @param[in] : url
     * @param[in] : referrer
     * @param[in] : resource request cache policy
     * @code
     * ResourceRequest *r = new ResourceRequest(url, r, p);
     * @endcode
     */
        ResourceRequest(const KURL& url, const String& referrer, ResourceRequestCachePolicy policy = UseProtocolCachePolicy);

    /**
     * ResourceRequest default constructor
     * @code
     * ResourceRequest *r = new ResourceRequest();
     * @endcode
     */
        ResourceRequest();

    private:
        friend class ResourceRequestBase;

    /**
     * doUpdatePlatformRequest
     */
        void doUpdatePlatformRequest() ;
    /**
     * doUpdateResourceRequest 
     */
        void doUpdateResourceRequest() ;
    };

} // namespace WKAL

#endif // ResourceRequest_h




