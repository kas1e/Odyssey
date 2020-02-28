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
#ifndef WTF_PassRefPtr_h
#define WTF_PassRefPtr_h
/**
 *  @file  PassRefPtr.t
 *  PassRefPtr description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#include "AlwaysInline.h"

namespace WTF {

    template<typename T> class RefPtr;
    template<typename T> class PassRefPtr;
    /**
     *  adoptRef description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> PassRefPtr<T> adoptRef(T*);

    template<typename T> class PassRefPtr : public OWBALBase {
    public:
    /**
     *  PassRefPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        PassRefPtr();
    /**
     *  PassRefPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        PassRefPtr(T* ptr);
        // It somewhat breaks the type system to allow transfer of ownership out of
        // a const PassRefPtr. However, it makes it much easier to work with PassRefPtr
        // temporaries, and we don't really have a need to use real const PassRefPtrs 
        // anyway.
    /**
     *  PassRefPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        PassRefPtr(const PassRefPtr& o);
    /**
     *  PassRefPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template <typename U> PassRefPtr(const PassRefPtr<U>& o);

    /**
     *  ~PassRefPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ALWAYS_INLINE ~PassRefPtr() ;
        
        template <class U>          PassRefPtr(const RefPtr<U>& o);
        
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
     *  releaseRef description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T* releaseRef() const ;

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
        T* operator->() const ;
        
    /**
     *  operator! description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool operator!() const ;

        // This conversion operator allows implicit conversion to bool but not to other integer types.
        typedef T* PassRefPtr::*UnspecifiedBoolType;
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
        PassRefPtr& operator=(T*);
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        PassRefPtr& operator=(const PassRefPtr&);
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template <typename U> PassRefPtr& operator=(const PassRefPtr<U>&);
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template <typename U> PassRefPtr& operator=(const RefPtr<U>&);

    /**
     *  adoptRef<T> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        friend PassRefPtr adoptRef<T>(T*);
    private:
        // adopting constructor
    /**
     *  PassRefPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        PassRefPtr(T* ptr, bool);
        mutable T* m_ptr;
    };
    
    /**
     *  PassRefPtr<T>::operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> template <typename U> inline PassRefPtr<T>& PassRefPtr<T>::operator=(const RefPtr<U>& o) ;
    
    /**
     *  PassRefPtr<T>::operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> inline PassRefPtr<T>& PassRefPtr<T>::operator=(T* optr);

    /**
     *  PassRefPtr<T>::operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> inline PassRefPtr<T>& PassRefPtr<T>::operator=(const PassRefPtr<T>& ref);
    
    /**
     *  PassRefPtr<T>::operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> template <typename U> inline PassRefPtr<T>& PassRefPtr<T>::operator=(const PassRefPtr<U>& ref);
    
    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator==(const PassRefPtr<T>& a, const PassRefPtr<U>& b) ;

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator==(const PassRefPtr<T>& a, const RefPtr<U>& b) ;

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator==(const RefPtr<T>& a, const PassRefPtr<U>& b) ;

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator==(const PassRefPtr<T>& a, U* b) ;
    
    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator==(T* a, const PassRefPtr<U>& b) ;
    
    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator!=(const PassRefPtr<T>& a, const PassRefPtr<U>& b) ;

    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator!=(const PassRefPtr<T>& a, const RefPtr<U>& b) ;

    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator!=(const RefPtr<T>& a, const PassRefPtr<U>& b) ;

    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator!=(const PassRefPtr<T>& a, U* b);

    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline bool operator!=(T* a, const PassRefPtr<U>& b) ;
    
    /**
     *  adoptRef description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> inline PassRefPtr<T> adoptRef(T* p);

    /**
     *  static_pointer_cast description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline PassRefPtr<T> static_pointer_cast(const PassRefPtr<U>& p) ;

    /**
     *  const_pointer_cast description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T, typename U> inline PassRefPtr<T> const_pointer_cast(const PassRefPtr<U>& p) ;

    /**
     *  getPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> inline T* getPtr(const PassRefPtr<T>& p);

} // namespace WTF

using WTF::PassRefPtr;
using WTF::adoptRef;
using WTF::static_pointer_cast;
using WTF::const_pointer_cast;

#endif // WTF_PassRefPtr_h




