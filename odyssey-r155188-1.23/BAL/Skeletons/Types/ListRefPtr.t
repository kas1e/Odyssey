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
#ifndef WTF_ListRefPtr_h
#define WTF_ListRefPtr_h
/**
 *  @file  ListRefPtr.t
 *  ListRefPtr description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#include <wtf/RefPtr.h>

namespace WTF {

    // Specialized version of RefPtr desgined for use in singly-linked lists. 
    // Derefs the list iteratively to avoid recursive derefing that can overflow the stack.
    template <typename T> class ListRefPtr : public OWBALBase, public RefPtr<T> {
    public:
    /**
     *  ListRefPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ListRefPtr();
    /**
     *  ListRefPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ListRefPtr(T* ptr);
    /**
     *  ListRefPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ListRefPtr(const RefPtr<T>& o);
        // see comment in PassRefPtr.h for why this takes const reference
    /**
     *  ListRefPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template <typename U> ListRefPtr(const PassRefPtr<U>& o);

    /**
     *  ~ListRefPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ~ListRefPtr();
        
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ListRefPtr& operator=(T* optr) ;
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ListRefPtr& operator=(const RefPtr<T>& o) ;
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ListRefPtr& operator=(const PassRefPtr<T>& o) ;
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template <typename U> ListRefPtr& operator=(const RefPtr<U>& o) ;
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template <typename U> ListRefPtr& operator=(const PassRefPtr<U>& o) ;
    };

    /**
     *  getPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> inline T* getPtr(const ListRefPtr<T>& p);

} // namespace WTF

using WTF::ListRefPtr;

#endif // WTF_ListRefPtr_h




