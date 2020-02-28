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
#ifndef ResourceResponse_h
#define ResourceResponse_h
/**
 *  @file  ResourceResponse.t
 *  ResourceResponse description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:10 $
 */
#include "BALBase.h"

#include "ResourceResponseBase.h"

namespace WKAL {

class ResourceResponse : public WKALBase, public ResourceResponseBase {
public:
    /**
     * ResourceResponse default constructor
     * @code
     * ResourceResponse r;
     * @endcode
     */
    ResourceResponse();

    /**
     * ResourceResponse construtor
     * @param[in] : url
     * @param[in] : mime type
     * @param[in] : expected lenght
     * @param[in] : text encoding name
     * @param[in] : file name
     * @code
     * ResourceResponse *r = new ResourceResponse(u, m, e, t, f);
     * @endcode
     */
    ResourceResponse(const KURL& url, const String& mimeType, long long expectedLength, const String& textEncodingName, const String& filename);

    /**
     * set response fired 
     * @param[in] : fired
     * @code
     * r->setResponseFired(f);
     * @endcode
     */
    void setResponseFired(bool fired) ;

    /**
     * get response fired
     * @param[out] : fired
     * @code
     * bool f = r->responseFired();
     * @endcode
     */
    bool responseFired() ;

private:
    bool m_responseFired;
};

} // namespace WKAL

#endif // ResourceResponse_h




