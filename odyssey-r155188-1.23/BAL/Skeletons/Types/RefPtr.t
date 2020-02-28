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
#ifndef WTF_RefPtr_h
#define WTF_RefPtr_h
/**
 *  @file  RefPtr.t
 *  RefPtr description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#include <algorithm>
#include "AlwaysInline.h"

namespace WTF {

    enum PlacementNewAdoptType { PlacementNewAdopt };

    template <typename T> class PassRefPtr;

    enum HashTableDeletedValueType { HashTableDeletedValue };

    template <typename T> class RefPtr : public OWBALBase {
    public:
    /**
     *  RefPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        RefPtr();
    /**
     *  RefPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        RefPtr(T* ptr);
    /**
     *  RefPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        RefPtr(const RefPtr& o);
        // see comment in PassRefPtr.h for why this takes const reference
    /**
     *  RefPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template <typename U> RefPtr(const PassRefPtr<U>&);

        // Special constructor for cases where we overwrite an object in place.
    /**
     *  RefPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        RefPtr(PlacementNewAdoptType) ;

        // Hash table deleted values, which are only constructed and never copied or destroyed.
    /**
     *  RefPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        RefPtr(HashTableDeletedValueType);
    /**
     *  isHashTableDeletedValue description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool isHashTableDeletedValue() const ;

    /**
     *  ~RefPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ~RefPtr() ;
        
    /**
     *  RefPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template <typename U> RefPtr(const RefPtr<U>& o);
        
    /**
     *  get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T* get() const ;
        
    /**
     *  clear description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void clear() ;
    /**
     *  release description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        PassRefPtr<T> release() ;

    /**
     *  operator* description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T& operator*() const ;
    /**
     *  operator-> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ALWAYS_INLINE T* operator->() const ;
        
    /**
     *  operator! description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool operator!() const ;
    
        // This conversion operator allows implicit conversion to bool but not to other integer types.
        typedef T* RefPtr::*UnspecifiedBoolType;
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
        RefPtr& operator=(const RefPtr&);
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        RefPtr& operator=(T*);
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        RefPtr& operator=(const PassRefPtr<T>&);
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template <typename U> RefPtr& operator=(const RefPtr<U>&);
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template <typename U> RefPtr& operator=(const PassRefPtr<U>&);

    /**
     *  swap description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void swap(RefPtr&);

    private:
    /**
     *  hashTableDeletedValue description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static T* hashTableDeletedValue() ;

        T* m_ptr;
    };
    
    /**
     *  RefPtr<T>::RefPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> template <typename U> inline RefPtr<T>::RefPtr(const PassRefPtr<U>& o);

    /**
     *  RefPtr<T>::operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> inline RefPtr<T>& RefPtr<T>::operator=(const RefPtr<T>& o);
    
    /**
     *  RefPtr<T>::operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> template <typename U> inline RefPtr<T>& RefPtr<T>::operator=(const RefPtr<U>& o);
    
    /**
     *  RefPtr<T>::operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> inline RefPtr<T>& RefPtr<T>::operator=(T* optr);

    /**
     *  RefPtr<T>::operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> inline RefPtr<T>& RefPtr<T>::operator=(const PassRefPtr<T>& o);

    /**
     *  RefPtr<T>::operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> template <typename U> inline RefPtr<T>& RefPtr<T>::operator=(const PassRefPtr<U>& o);

    template <class T> inline void RefPtr<T>::swap(RefPtr<T>& o);

    template <class T> inline void swap(RefPtr<T>& a, RefPtr<T>& b);

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator==(const RefPtr<T>& a, const RefPtr<U>& b);

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator==(const RefPtr<T>& a, U* b);
    
    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator==(T* a, const RefPtr<U>& b) ;
    
    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator!=(const RefPtr<T>& a, const RefPtr<U>& b);

    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator!=(const RefPtr<T>& a, U* b);

    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator!=(T* a, const RefPtr<U>& b);
    
    /**
     *  static_pointer_cast description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline RefPtr<T> static_pointer_cast(const RefPtr<U>& p);

    /**
     *  const_pointer_cast description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline RefPtr<T> const_pointer_cast(const RefPtr<U>& p);

    /**
     *  getPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> inline T* getPtr(const RefPtr<T>& p);

} // namespace WTF

using WTF::RefPtr;
using WTF::static_pointer_cast;
using WTF::const_pointer_cast;

#endif // WTF_RefPtr_h




