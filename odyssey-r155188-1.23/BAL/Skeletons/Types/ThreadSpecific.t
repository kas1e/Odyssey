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
#ifndef WTF_ThreadSpecific_h
#define WTF_ThreadSpecific_h
/**
 *  @file  ThreadSpecific.t
 *  ThreadSpecific description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#include <wtf/Noncopyable.h>

// Windows currently doesn't use pthreads for basic threading, but implementing destructor functions is easier
// with pthreads, so we use it here.
#include <pthread.h>

namespace WTF {

template<typename T> class ThreadSpecific : Noncopyable {
public:
    /**
     *  ThreadSpecific description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    ThreadSpecific();
    /**
     *  operator-> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T* operator->();
    /**
     *  T* description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    operator T*();
    /**
     *  operator* description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T& operator*();
    /**
     *  ~ThreadSpecific description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    ~ThreadSpecific();

private:
    /**
     *  get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T* get();
    /**
     *  set description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void set(T*);
    /**
     *  destroy description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void static destroy(void* ptr);

    struct Data : Noncopyable {
    /**
     *  Data description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Data(T* value, ThreadSpecific<T>* owner);

        T* value;
        ThreadSpecific<T>* owner;
    };

    pthread_key_t m_key;
};

    /**
     *  ThreadSpecific<T>::ThreadSpecific description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
template<typename T> inline ThreadSpecific<T>::ThreadSpecific();

    /**
     *  ThreadSpecific<T>::~ThreadSpecific description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
template<typename T> inline ThreadSpecific<T>::~ThreadSpecific();

    /**
     *  ThreadSpecific<T>::get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
template<typename T> inline T* ThreadSpecific<T>::get();

    /**
     *  ThreadSpecific<T>::set description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
template<typename T> inline void ThreadSpecific<T>::set(T* ptr);

    /**
     *  ThreadSpecific<T>::destroy description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
template<typename T> inline void ThreadSpecific<T>::destroy(void* ptr);


    /**
     *  T* description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
template<typename T> inline ThreadSpecific<T>::operator T*();

    /**
     *  ThreadSpecific<T>::operator-> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
template<typename T> inline T* ThreadSpecific<T>::operator->();

    /**
     *  ThreadSpecific<T>::operator* description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
template<typename T> inline T& ThreadSpecific<T>::operator*();

}

#endif




