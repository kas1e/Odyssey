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
#ifndef ResourceErrorBase_h
#define ResourceErrorBase_h
/**
 *  @file  ResourceErrorBase.t
 *  ResourceErrorBase description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:10 $
 */
#include "BALBase.h"

#include "PlatformString.h"

namespace WKAL {

class ResourceError;

class ResourceErrorBase : public WKALBase {
public:
    /**
     * test if the ResourceErrorBase is null
     * @param[out] : true if the ResourceErrorBase is null
     * @code
     * bool i = r->isNull();
     * @endcode
     */
    bool isNull() const ;

    /**
     * get domain value
     * @param[out] : domain value
     * @code
     * String d = r->domain();
     * @endcode
     */
    const String& domain() const ;

    /**
     * get error code
     * @param[out] : error code
     * @code
     * int e = r->errorCode();
     * @endcode
     */
    int errorCode() const ;

    /**
     * get failing URL 
     * @param[out] : failing url
     * @code
     * String f = r->failingURL();
     * @endcode
     */
    const String& failingURL() const ;

    /**
     * get localized description
     * @param[out] : localized description
     * @code
     * String l = r->localizedDescription();
     * @endcode
     */
    const String& localizedDescription() const ;

    /**
     * set is cancellation value
     * @param[in] : value
     * @code
     * r->setIsCancellation(c);
     * @endcode
     */
    void setIsCancellation(bool isCancellation) ;

    /**
     * get is cancellation value
     * @param[out] : value
     * @code
     * bool c = r->isCancellation();
     * @endcode
     */
    bool isCancellation() const ;

    /**
     * compare
     * @param[in] : error
     * @param[in] : error
     * @param[out] : true if the two error are equal
     * @code
     * bool c = ResourceError::compare(a, b);
     * @endcode
     */
    static bool compare(const ResourceError& a, const ResourceError& b);

protected:
    /**
     * ResourceErrorBase constructor
     */
    ResourceErrorBase();

    /**
     *  ResourceErrorBase constructor
     */
    ResourceErrorBase(const String& domain, int errorCode, const String& failingURL, const String& localizedDescription);

    /**
     * lazyInit
     */
    void lazyInit() const;

    // The ResourceError subclass may "shadow" this method to lazily initialize platform specific fields
    /**
     * platformLazyInit
     */
    void platformLazyInit() ;

    // The ResourceError subclass may "shadow" this method to compare platform specific fields
    /**
     * platformCompare
     */
    static bool platformCompare(const ResourceError& a, const ResourceError& b) ;

    String m_domain;
    int m_errorCode;
    String m_failingURL;
    String m_localizedDescription;
    bool m_isNull;
    bool m_isCancellation;
};

    /**
     *  operator== 
     */
inline bool operator==(const ResourceError& a, const ResourceError& b) ;
    /**
     *  operator!= 
     */
inline bool operator!=(const ResourceError& a, const ResourceError& b) ;

} // namespace WKAL

#endif // ResourceErrorBase_h_




