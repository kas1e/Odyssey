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
#ifndef CookieJar_h
#define CookieJar_h
/**
 *  @file  CookieJar.t
 *  CookieJar description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:10 $
 */
#include "BALBase.h"


namespace WKAL {

    class KURL;
    class String;
    class Document;

    /**
     * get cookies
     * @param[in] : Document
     * @param[in] : url
     * @param[out] : cookies string
     * @code
     * String c = cookies(d, url);
     * @endcode
     */
    String cookies(const Document* document, const KURL&);

    /**
     * set cookies
     * @param[in] : Document
     * @param[in] : url
     * @param[in] : policy base url
     * @param[in] : cookies string
     * @code
     * setCookies(d, url, baseUrl, c);
     * @endcode
     */
    void setCookies(Document* document, const KURL&, const KURL& policyBaseURL, const String&);

    /**
     * test if the cookies is enabled
     * @param[in] : document
     * @param[out] : true if the cookies is enabled
     * @code
     * bool e = cookiesEnabled(d);
     * @endcode
     */
    bool cookiesEnabled(const Document* document);
}

#endif




