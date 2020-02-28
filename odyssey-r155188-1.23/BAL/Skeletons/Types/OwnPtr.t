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
#ifndef WTF_OwnPtr_h
#define WTF_OwnPtr_h
/**
 *  @file  OwnPtr.t
 *  OwnPtr description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#include <algorithm>
#include <wtf/Assertions.h>
#include <wtf/Noncopyable.h>


namespace WTF {

    // Unlike most of our smart pointers, OwnPtr can take either the pointer type or the pointed-to type.

    // FIXME: Share a single RemovePointer class template with RetainPtr.     template <typename T> struct OwnPtrRemovePointer { typedef T type; };
    template <typename T> struct OwnPtrRemovePointer<T*> { typedef T type; };

    /**
     *  deleteOwnedPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> inline void deleteOwnedPtr(T* ptr);


    template <typename T> class OwnPtr : public OWBALBase, Noncopyable {
    public:
        typedef typename OwnPtrRemovePointer<T>::type ValueType;
        typedef ValueType* PtrType;

    /**
     *  OwnPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        explicit OwnPtr(PtrType ptr = 0);
    /**
     *  ~OwnPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ~OwnPtr() ;

    /**
     *  get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        PtrType get() const ;
    /**
     *  release description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        PtrType release() ;

    /**
     *  set description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void set(PtrType ptr) ;
    /**
     *  clear description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void clear() ;

    /**
     *  operator* description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ValueType& operator*() const ;
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
        typedef PtrType OwnPtr::*UnspecifiedBoolType;
    /**
     *  UnspecifiedBoolType description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        operator UnspecifiedBoolType() const ;

    /**
     *  swap description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void swap(OwnPtr& o) ;

    private:
        PtrType m_ptr;
    };
    
    /**
     *  swap description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> inline void swap(OwnPtr<T>& a, OwnPtr<T>& b) ;

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator==(const OwnPtr<T>& a, U* b);
    
    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator==(T* a, const OwnPtr<U>& b) ;

    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator!=(const OwnPtr<T>& a, U* b);

    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator!=(T* a, const OwnPtr<U>& b);
    
    /**
     *  getPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> inline typename OwnPtr<T>::PtrType getPtr(const OwnPtr<T>& p);

} // namespace WTF

using WTF::OwnPtr;

#endif // WTF_OwnPtr_h




