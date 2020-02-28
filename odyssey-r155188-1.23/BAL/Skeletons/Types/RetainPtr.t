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
#ifndef RetainPtr_h
#define RetainPtr_h
/**
 *  @file  RetainPtr.t
 *  RetainPtr description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#include <algorithm>
#include <CoreFoundation/CoreFoundation.h>


namespace WTF {

    template <typename T> struct RemovePointer {
        typedef T type;
    };

    template <typename T> struct RemovePointer<T*> {
        typedef T type;
    };

    // Unlike most most of our smart pointers, RetainPtr can take either the pointer type or the pointed-to type,
    // so both RetainPtr<NSDictionary> and RetainPtr<CFDictionaryRef> will work.

    enum AdoptCFTag { AdoptCF };
    enum AdoptNSTag { AdoptNS };
    

    template <typename T> class RetainPtr : public OWBALBase {
    public:
        typedef typename RemovePointer<T>::type ValueType;
        typedef ValueType* PtrType;

    /**
     *  RetainPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        RetainPtr();
    /**
     *  RetainPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        RetainPtr(PtrType ptr);

    /**
     *  RetainPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        RetainPtr(AdoptCFTag, PtrType ptr);
    /**
     *  RetainPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        RetainPtr(AdoptNSTag, PtrType ptr);
        
    /**
     *  RetainPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        RetainPtr(const RetainPtr& o);

    /**
     *  ~RetainPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ~RetainPtr() ;
        
    /**
     *  RetainPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template <typename U> RetainPtr(const RetainPtr<U>& o);
        
    /**
     *  get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        PtrType get() const ;
        
    /**
     *  releaseRef description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        PtrType releaseRef() ;
        
    /**
     *  operator-> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        PtrType operator->() const ;
        
    /**
     *  operator! description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool operator!() const ;
    
        // This conversion operator allows implicit conversion to bool but not to other integer types.
        typedef PtrType RetainPtr::*UnspecifiedBoolType;
    /**
     *  UnspecifiedBoolType description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        operator UnspecifiedBoolType() const ;
        
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        RetainPtr& operator=(const RetainPtr&);
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template <typename U> RetainPtr& operator=(const RetainPtr<U>&);
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        RetainPtr& operator=(PtrType);
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template <typename U> RetainPtr& operator=(U*);

    /**
     *  adoptCF description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void adoptCF(PtrType);
    /**
     *  adoptNS description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void adoptNS(PtrType);
        
    /**
     *  swap description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void swap(RetainPtr&);

    private:
        PtrType m_ptr;
    };
    
    /**
     *  RetainPtr<T>::operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> inline RetainPtr<T>& RetainPtr<T>::operator=(const RetainPtr<T>& o);
    
    /**
     *  RetainPtr<T>::operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> template <typename U> inline RetainPtr<T>& RetainPtr<T>::operator=(const RetainPtr<U>& o);
    
    /**
     *  RetainPtr<T>::operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> inline RetainPtr<T>& RetainPtr<T>::operator=(PtrType optr);

    /**
     *  RetainPtr<T>::adoptCF description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> inline void RetainPtr<T>::adoptCF(PtrType optr);

    /**
     *  RetainPtr<T>::adoptNS description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> inline void RetainPtr<T>::adoptNS(PtrType optr);
    
    /**
     *  RetainPtr<T>::operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> template <typename U> inline RetainPtr<T>& RetainPtr<T>::operator=(U* optr);

    template <class T> inline void RetainPtr<T>::swap(RetainPtr<T>& o);

    template <class T> inline void swap(RetainPtr<T>& a, RetainPtr<T>& b);

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator==(const RetainPtr<T>& a, const RetainPtr<U>& b);

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator==(const RetainPtr<T>& a, U* b);
    
    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator==(T* a, const RetainPtr<U>& b) ;
    
    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator!=(const RetainPtr<T>& a, const RetainPtr<U>& b);

    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator!=(const RetainPtr<T>& a, U* b);

    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator!=(T* a, const RetainPtr<U>& b);

} // namespace WTF

using WTF::AdoptCF;
using WTF::AdoptNS;
using WTF::RetainPtr;

#endif // WTF_RetainPtr_h




