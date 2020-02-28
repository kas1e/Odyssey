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
#ifndef CString_h
#define CString_h
/**
 *  @file  CString.t
 *  CString description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:08 $
 */
#include "BALBase.h"

#include "SharedBuffer.h"

#include <wtf/PassRefPtr.h>
#include <wtf/RefCounted.h>
#include <wtf/Vector.h>

namespace WebCore {

    class CStringBuffer : public WebCoreBase, public RefCounted<CStringBuffer> {
    public:
    /**
     * create CString Buffer
     * @param[in] : length
     * @param[out] : CStringBuffer
     * @code
     * RefPtr<CStringBuffer> c = CStringBuffer::create(l);
     * @endcode
     */
        static PassRefPtr<CStringBuffer> create(unsigned length) ;

    /**
     * get data
     * @param[out] : data
     * @code
     * char *d = c->data();
     * @endcode
     */
        char* data() ;

    /**
     * get length
     * @param[out] : length
     * @code
     * size_t l = c->length();
     * @endcode
     */
        size_t length() const ;
        
    /**
     * release buffer 
     * @param[out] : SharedBuffer
     * @code
     * RefPtr<SharedBuffer> s = c->releaseBuffer();
     * @endcode
     */
        PassRefPtr<SharedBuffer> releaseBuffer() ;

    private:
    /**
     * CStringBuffer constructor
     * @param[in] : length
     */
        CStringBuffer(unsigned length);

        Vector<char> m_vector;
    };

    // A container for a null-terminated char array supporting copy-on-write
    // assignment.  The contained char array may be null.
    class CString : public WebCoreBase {
    public:
    /**
     * CString default constructor
     */
        CString() ;

    /**
     * CString constructor
     * @param[in] : characters
     */
        CString(const char*);

    /**
     * CString constructor
     * @param[in] : characters
     * @param[in] : length
     */
        CString(const char*, unsigned length);

    /**
     * get new Uninitialized
     * @param[in] : length
     * @param[in] : character buffer
     * @param[out] : CString
     * @code
     * CString c = CString::newUninitialized(l, ch);
     * @endcode
     */
        static CString newUninitialized(size_t length, char*& characterBuffer);

    /**
     * get data 
     * @param[out] : data
     * @code
     * const char *d = c->data();
     * @endcode
     */
        const char* data() const;

    /**
     * get mutable data 
     * @param[out] : mutable data
     * @code
     * char *d = c->mutableData(); 
     * @endcode
     */
        char* mutableData();

    /**
     * get length 
     * @param[out] : length
     * @code
     * unsigned l = c->length();
     * @endcode
     */
        unsigned length() const;

    /**
     * test if the CString is null
     * @param[out] : true if the CString is null
     * @code
     * bool i = c->isNull();
     * @endcode
     */
        bool isNull() const ;
        
    /**
     * release buffer
     * @param[out] : Shared buffer
     * @code
     * RefPtr<SharedBuffer> s = c->releaseBuffer();
     * @endcode
     */
        PassRefPtr<SharedBuffer> releaseBuffer();

    private:
    /**
     * copyBufferIfNeeded
     */
        void copyBufferIfNeeded();
    /**
     * init
     */
        void init(const char*, unsigned length);
        RefPtr<CStringBuffer> m_buffer;
    };

    /**
     * operator== 
     */
    bool operator==(const CString& a, const CString& b);

    /**
     * operator!=
     */
    inline bool operator!=(const CString& a, const CString& b) ;

} // namespace WebCore

#endif // CString_h




