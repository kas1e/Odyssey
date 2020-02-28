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
#ifndef WTF_OwnArrayPtr_h
#define WTF_OwnArrayPtr_h
/**
 *  @file  OwnArrayPtr.t
 *  OwnArrayPtr description
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

    template <typename T> class OwnArrayPtr : public OWBALBase, Noncopyable {
    public:
    /**
     *  OwnArrayPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        explicit OwnArrayPtr(T* ptr = 0);
    /**
     *  ~OwnArrayPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ~OwnArrayPtr() ;

    /**
     *  get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T* get() const ;
    /**
     *  release description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T* release() ;

    /**
     *  set description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void set(T* ptr) ;
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
     *  operator[] description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T& operator[](std::ptrdiff_t i) const ;

    /**
     *  operator! description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool operator!() const ;

        // This conversion operator allows implicit conversion to bool but not to other integer types.
        typedef T* OwnArrayPtr::*UnspecifiedBoolType;
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
        void swap(OwnArrayPtr& o) ;

    private:
    /**
     *  safeDelete description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void safeDelete() ;

        T* m_ptr;
    };
    
    /**
     *  swap description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> inline void swap(OwnArrayPtr<T>& a, OwnArrayPtr<T>& b) ;

    /**
     *  getPtr description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T> inline T* getPtr(const OwnArrayPtr<T>& p);

} // namespace WTF

using WTF::OwnArrayPtr;

#endif // WTF_OwnArrayPtr_h




