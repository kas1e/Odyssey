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
#ifndef ResourceResponseBase_h
#define ResourceResponseBase_h
/**
 *  @file  ResourceResponseBase.t
 *  ResourceResponseBase description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:10 $
 */
#include "BALBase.h"

#include "HTTPHeaderMap.h"
#include "KURL.h"

namespace WKAL {

class ResourceResponse;

// Do not use this class directly, use the class ResponseResponse instead
class ResourceResponseBase : public WKALBase {
 public:

    /**
     * test if ResourceResponseBase is null
     * @param[out] : true if ResourceResponseBase is null
     * @code
     * bool i = r->isNull();
     * @endcode
     */
    bool isNull() const ;

    /**
     * test if ResourceResponseBase is HTTP
     * @param[out] : true if ResourceResponseBase is HTTP
     * @code
     * bool h = r->isHTTP();
     * @endcode
     */
    bool isHTTP() const;

    /**
     * get url 
     * @param[out] : url
     * @code
     * KURL u = r->url();
     * @endcode
     */
    const KURL& url() const;

    /**
     * set url 
     * @param[in] : url
     * @code
     * r->setUrl(u);
     * @endcode
     */
    void setUrl(const KURL& url);

    /**
     * get mime type
     * @param[out] : mime type
     * @code
     * String m = r->mimeType();
     * @endcode
     */
    const String& mimeType() const;

    /**
     * set mime type 
     * @param[in] : mime type
     * @code
     * r->setMimeType(m);
     * @endcode
     */
    void setMimeType(const String& mimeType);

    /**
     * expected content length
     * @param[out] : length
     * @code
     * long long e = r->expectedContentLength();
     * @endcode
     */
    long long expectedContentLength() const;

    /**
     * set expected content length
     * @param[in] : length
     * @code
     * r->setExpectedContentLength(e);
     * @endcode
     */
    void setExpectedContentLength(long long expectedContentLength);

    /**
     * get text encoding name
     * @param[out] : text encoding name
     * @code
     * String t = r->textEncodingName();
     * @endcode
     */
    const String& textEncodingName() const;

    /**
     * set text encoding name
     * @param[in] : encoding name
     * @code
     * r->setTextEncodingName(n);
     * @endcode
     */
    void setTextEncodingName(const String& name);

    // FIXME should compute this on the fly
    /**
     * get suggested file name
     * @param[out] : file name
     * @code
     * String f = r->suggestedFilename();
     * @endcode
     */
    const String& suggestedFilename() const;

    /**
     * set suggested file name
     * @param[in] : file name
     * @code
     * r->setSuggestedFilename(name);
     * @endcode
     */
    void setSuggestedFilename(const String&);

    /**
     * get http status code
     * @param[out] : status code
     * @code
     * int c = r->httpStatusCode();
     * @endcode
     */
    int httpStatusCode() const;

    /**
     * set HTTP status code
     * @param[in] : status code
     * @code
     * r->setHTTPStatusCode(c);
     * @endcode
     */
    void setHTTPStatusCode(int);
    
    /**
     * get http status text 
     * @param[out] : http status text
     * @code
     * String s = r->httpStatusText();
     * @endcode
     */
    const String& httpStatusText() const;

    /**
     * set HTTP status text
     * @param[in] : status
     * @code
     * r->setHTTPStatusText(s);
     * @endcode
     */
    void setHTTPStatusText(const String&);
    
    /**
     * get http header field
     * @param[in] : name
     * @param[out] : header field
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
     * get http header fields
     * @param[out] : HTTP header map
     * @code
     * HTTPHeaderMap h = r->httpHeaderFields();
     * @endcode
     */
    const HTTPHeaderMap& httpHeaderFields() const;

    /**
     * test if the message is multipart
     * @param[out] : true if the message is multipart
     * @code
     * bool m = r->isMultipart();
     * @endcode
     */
    bool isMultipart() const ;

    /**
     * test if the ResourceResponseBase is attachment
     * @param[out] : true if the ResourceResponseBase is attachment
     * @code
     * bool a = r->isAttachment();
     * @endcode
     */
    bool isAttachment() const;

    /**
     * set expiration date 
     * @param[in] : expiration date
     * @code
     * r->setExpirationDate(d);
     * @endcode
     */
    void setExpirationDate(time_t);

    /**
     * get expiration date
     * @param[out] : expiration date
     * @code
     * time_t e = r->expirationDate();
     * @endcode
     */
    time_t expirationDate() const;

    /**
     * set last modified date
     * @param[in] : last modified date
     * @code
     * r->setLastModifiedDate(d);
     * @endcode
     */
    void setLastModifiedDate(time_t);

    /**
     * get last modified date
     * @param[out] : last modified date
     * @code
     * time_t t = r->lastModifiedDate(); 
     * @endcode
     */
    time_t lastModifiedDate() const;

    /**
     * compare
     * @param[in] : resource response
     * @param[in] : resource response
     * @param[out] : true if the two ResourceResponse is equal
     * @code
     * bool c = ResourceResponseBase::compare(a, b);
     * @endcode
     */
    static bool compare(const ResourceResponse& a, const ResourceResponse& b);

 protected:
    /**
     * ResourceResponseBase default constructor
     */
    ResourceResponseBase()  ;

    /**
     * ResourceResponseBase constructor
     */
    ResourceResponseBase(const KURL& url, const String& mimeType, long long expectedLength, const String& textEncodingName, const String& filename);

    /**
     * lazyInit
     */
    void lazyInit() const;

    // The ResourceResponse subclass may "shadow" this method to lazily initialize platform specific fields
    /**
     * platformLazyInit
     */
    void platformLazyInit() ;

    // The ResourceResponse subclass may "shadow" this method to compare platform specific fields
    /**
     * platformCompare 
     */
    static bool platformCompare(const ResourceResponse& a, const ResourceResponse& b) ;

    KURL m_url;
    String m_mimeType;
    long long m_expectedContentLength;
    String m_textEncodingName;
    String m_suggestedFilename;
    int m_httpStatusCode;
    String m_httpStatusText;
    HTTPHeaderMap m_httpHeaderFields;
    time_t m_expirationDate;
    time_t m_lastModifiedDate;
    bool m_isNull;

};

    /**
     * operator== 
     */
inline bool operator==(const ResourceResponse& a, const ResourceResponse& b) ;
    /**
     * operator!= 
     */
inline bool operator!=(const ResourceResponse& a, const ResourceResponse& b) ;

} // namespace WKAL

#endif // ResourceResponseBase_h




