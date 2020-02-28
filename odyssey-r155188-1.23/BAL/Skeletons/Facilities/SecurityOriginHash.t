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
#ifndef SecurityOriginHash_h
#define SecurityOriginHash_h
/**
 *  @file  SecurityOriginHash.t
 *  SecurityOriginHash description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:05 $
 */
#include "BALBase.h"

#include "KURL.h"
#include "SecurityOrigin.h"
#include <wtf/RefPtr.h>

namespace WebCore {

struct SecurityOriginHash {
    /**
     * hash
     * @param[in] : SecurityOrigin
     * @param[out] : key
     * @code
     * unsigned k = soh->hash(o);
     * @endcode
     */
    static unsigned hash(SecurityOrigin* origin);

    /**
     * hash
     * @param[in] : SecurityOrigin
     * @param[out] : key
     * @code
     * unsigned k = soh->hash(o);
     * @endcode
     */
    static unsigned hash(const RefPtr<SecurityOrigin>& origin);

    /**
     * equal
     * @param[in] : SecurityOrigin
     * @param[in] : SecurityOrigin
     * @param[out] : status
     * @code
     * bool c = soh->equal(s1, s2);
     * @endcode
     */
    static bool equal(SecurityOrigin* a, SecurityOrigin* b);

    /**
     * equal
     * @param[in] : SecurityOrigin
     * @param[in] : SecurityOrigin
     * @param[out] : status
     * @code
     * bool c = soh->equal(s1, s2);
     * @endcode
     */
    static bool equal(SecurityOrigin* a, const RefPtr<SecurityOrigin>& b);

    /**
     * equal
     * @param[in] : SecurityOrigin
     * @param[in] : SecurityOrigin
     * @param[out] : status
     * @code
     * bool c = soh->equal(s1, s2);
     * @endcode
     */
    static bool equal(const RefPtr<SecurityOrigin>& a, SecurityOrigin* b);

    /**
     * equal
     * @param[in] : SecurityOrigin
     * @param[in] : SecurityOrigin
     * @param[out] : status
     * @code
     * bool c = soh->equal(s1, s2);
     * @endcode
     */
    static bool equal(const RefPtr<SecurityOrigin>& a, const RefPtr<SecurityOrigin>& b);

    static const bool safeToCompareToEmptyOrDeleted = false;
};

} // namespace WebCore

#endif




