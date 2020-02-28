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
#ifndef ResourceRequestBase_h
#define ResourceRequestBase_h
/**
 *  @file  ResourceRequestBase.t
 *  ResourceRequestBase description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:10 $
 */
#include "BALBase.h"

#include "FormData.h"
#include "KURL.h"
#include "HTTPHeaderMap.h"

namespace WKAL {

    enum ResourceRequestCachePolicy {
        UseProtocolCachePolicy, // normal load
        ReloadIgnoringCacheData, // reload
        ReturnCacheDataElseLoad, // back/forward or encoding change - allow stale data
        ReturnCacheDataDontLoad, // results of a post - allow stale data and only use cache
    };

    class ResourceRequest;

    // Do not use this type directly.  Use ResourceRequest instead.
    class ResourceRequestBase : public WKALBase {
    public:
    /**
     * test if ResourceRequestBase is null
     * @param[out] : true if ResourceRequestBase is null
     * @code
     * bool i = r->isNull();
     * @endcode
     */
        bool isNull() const;

    /**
     * test if ResourceRequestBase is empty
     * @param[out] : true if ResourceRequestBase is empty
     * @code
     * bool i = r->isEmpty();
     * @endcode
     */
        bool isEmpty() const;

    /**
     * get url
     * @param[out] : url
     * @code
     * KURL url = r->url();
     * @endcode
     */
        const KURL& url() const;

    /**
     * set URL 
     * @param[in] : url
     * @code
     * r->setURL(url);
     * @endcode
     */
        void setURL(const KURL& url);

    /**
     * get cache policy
     * @param[out] : resource request cache policy
     * @code
     * ResourceRequestCachePolicy p = r->cachePolicy();
     * @endcode
     */
        ResourceRequestCachePolicy cachePolicy() const;

    /**
     * set cache policy
     * @param[in] : resource request cache policy
     * @code
     * r->setCachePolicy(c);
     * @endcode
     */
        void setCachePolicy(ResourceRequestCachePolicy cachePolicy);
        
    /**
     * get timeout interval
     * @param[out] : timeout interval
     * @code
     * double t = r->timeoutInterval();
     * @endcode
     */
        double timeoutInterval() const;

    /**
     * set timeout interval
     * @param[in] : timeout interval
     * @code
     * r->setTimeoutInterval(t);
     * @endcode
     */
        void setTimeoutInterval(double timeoutInterval);
        
    /**
     * get main document URL
     * @param[out] : main document URL
     * @code
     * KURL u = r->mainDocumentURL();
     * @endcode
     */
        const KURL& mainDocumentURL() const;

    /**
     * set main document URL
     * @param[in] : main document URL
     * @code
     * r->setMainDocumentURL(url);
     * @endcode
     */
        void setMainDocumentURL(const KURL& mainDocumentURL);
        
    /**
     * get http method
     * @param[out] : http method
     * @code
     * String h = r->httpMethod();
     * @endcode
     */
        const String& httpMethod() const;

    /**
     * set HTTP method
     * @param[in] : http method
     * @code
     * r->setHTTPMethod(h);
     * @endcode
     */
        void setHTTPMethod(const String& httpMethod);
        
    /**
     * get http header fields
     * @param[out] : http header map
     * @code
     * HTTPHeaderMap h = r->httpHeaderFields();
     * @endcode
     */
        const HTTPHeaderMap& httpHeaderFields() const;

    /**
     * get http header field
     * @param[in] : name
     * @param[out] : http header field
     * @code
     * String h = r->httpHeaderField(n);
     * @endcode
     */
        String httpHeaderField(const String& name) const;

    /**
     * set HTTP header field
     * @param[in] : name
     * @param[in] : value
     * @code
     * r->setHTTPHeaderField(n, v);
     * @endcode
     */
        void setHTTPHeaderField(const String& name, const String& value);

    /**
     * add HTTP header field
     * @param[in] : name
     * @param[in] : value
     * @code
     * r->addHTTPHeaderField(n, v);
     * @endcode
     */
        void addHTTPHeaderField(const String& name, const String& value);

    /**
     * add HTTP Header Fields
     * @param[in] : HTTP Header Map
     * @code
     * r->addHTTPHeaderFields(m);
     * @endcode
     */
        void addHTTPHeaderFields(const HTTPHeaderMap& headerFields);
        
    /**
     * get http content type 
     * @param[out] : content type
     * @code
     * String c = r->httpContentType();
     * @endcode
     */
        String httpContentType() const ;

    /**
     * set HTTP content type
     * @param[in] : http content type
     * @code
     * r->setHTTPContentType(h);
     * @endcode
     */
        void setHTTPContentType(const String& httpContentType) ;
        
    /**
     * get http referrer 
     * @param[out] : http referer
     * @code
     * String h = r->httpReferrer();
     * @endcode
     */
        String httpReferrer() const ;

    /**
     * set HTTP referrer
     * @param[in] : http referrer
     * @code
     * r->setHTTPReferrer(h);
     * @endcode
     */
        void setHTTPReferrer(const String& httpReferrer) ;

    /**
     * clear HTTP referrer
     * @code
     * r->clearHTTPReferrer();
     * @endcode
     */
        void clearHTTPReferrer() ;
        
    /**
     * get http user agent 
     * @param[out] : user agent
     * @code
     * String ua = r->httpUserAgent();
     * @endcode
     */
        String httpUserAgent() const ;

    /**
     * set HTTP user agent
     * @param[in] : user agent
     * @code
     * r->setHTTPUserAgent(ua);
     * @endcode
     */
        void setHTTPUserAgent(const String& httpUserAgent) ;

    /**
     * get http accept 
     * @param[out] : http accept
     * @code
     * String a = r->httpAccept();
     * @endcode
     */
        String httpAccept() const ;

    /**
     * set HTTP accept
     * @param[in] : HTTP accept
     * @code
     * r->setHTTPAccept(a);
     * @endcode
     */
        void setHTTPAccept(const String& httpAccept) ;

    /**
     * get http body
     * @param[out] : form data
     * @code
     * FormData *fd = r->httpBody();
     * @endcode
     */
        FormData* httpBody() const;

    /**
     * set HTTP body 
     * @param[in] : form data
     * @code
     * r->setHTTPBody(h);
     * @endcode
     */
        void setHTTPBody(PassRefPtr<FormData> httpBody);
        
    /**
     * test if the cookies is allowed
     * @param[out] : bool a = r->allowHTTPCookies();
     * @code
     * bool a = r->allowHTTPCookies();
     * @endcode
     */
        bool allowHTTPCookies() const;

    /**
     * set allow HTTP cookies
     * @param[in] : allow HTTP cookies
     * @code
     * r->setAllowHTTPCookies(a);
     * @endcode
     */
        void setAllowHTTPCookies(bool allowHTTPCookies);

    /**
     * get is conditional
     * @param[out] : value
     * @code
     * bool i = r->isConditional();
     * @endcode
     */
        bool isConditional() const;
        
    protected:
        // Used when ResourceRequest is initialized from a platform representation of the request
    /**
     *  ResourceRequestBase constructor
     */
        ResourceRequestBase();

    /**
     *  ResourceRequestBase constructor
     */
        ResourceRequestBase(const KURL& url, ResourceRequestCachePolicy policy);

    /**
     * updatePlatformRequest 
     */
        void updatePlatformRequest() const; 

    /**
     *  updateResourceRequest 
     */
        void updateResourceRequest() const; 

        static const int defaultTimeoutInterval = 60;

        KURL m_url;

        ResourceRequestCachePolicy m_cachePolicy;
        double m_timeoutInterval;
        KURL m_mainDocumentURL;
        String m_httpMethod;
        HTTPHeaderMap m_httpHeaderFields;
        RefPtr<FormData> m_httpBody;
        bool m_allowHTTPCookies;
        mutable bool m_resourceRequestUpdated;
        mutable bool m_platformRequestUpdated;

    private:
    /**
     * asResourceRequest 
     */
        const ResourceRequest& asResourceRequest() const;
    };

    /**
     * equalIgnoringHeaderFields
     */
    bool equalIgnoringHeaderFields(const ResourceRequestBase&, const ResourceRequestBase&);

    /**
     *  operator== 
     */
    bool operator==(const ResourceRequestBase&, const ResourceRequestBase&);
    /**
     *  operator!= 
     */
    inline bool operator!=(ResourceRequestBase& a, const ResourceRequestBase& b) ;

} // namespace WKAL

#endif // ResourceRequestBase_h




