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
#ifndef SharedBuffer_h
#define SharedBuffer_h
/**
 *  @file  SharedBuffer.t
 *  SharedBuffer description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#include "PlatformString.h"
#include <wtf/RefCounted.h>
#include <wtf/Forward.h>
#include <wtf/Vector.h>



namespace WebCore {

class SharedBuffer : public WebCoreBase, public RefCounted<SharedBuffer> {
public:
    /**
     *  create description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    static PassRefPtr<SharedBuffer> create() ;
    /**
     *  create description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    static PassRefPtr<SharedBuffer> create(const char* c, int i) ;
    /**
     *  create description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    static PassRefPtr<SharedBuffer> create(const unsigned char* c, int i) ;

    /**
     *  createWithContentsOfFile description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    static PassRefPtr<SharedBuffer> createWithContentsOfFile(const String& filePath);

    /**
     *  adoptVector description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    static PassRefPtr<SharedBuffer> adoptVector(Vector<char>& vector);
    

    /**
     *  data description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    const char* data() const;
    /**
     *  size description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    unsigned size() const;
    /**
     *  &buffer description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    const Vector<char> &buffer() ;

    /**
     *  isEmpty description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool isEmpty() const ;

    /**
     *  append description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void append(const char*, int);
    /**
     *  clear description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void clear();
    /**
     *  platformData description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    const char* platformData() const;
    /**
     *  platformDataSize description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    unsigned platformDataSize() const;

    /**
     *  copy description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    PassRefPtr<SharedBuffer> copy() const;
    
private:
    /**
     *  SharedBuffer description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    SharedBuffer();
    /**
     *  SharedBuffer description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    SharedBuffer(const char*, int);
    /**
     *  SharedBuffer description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    SharedBuffer(const unsigned char*, int);
    
    /**
     *  clearPlatformData description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void clearPlatformData();
    /**
     *  maybeTransferPlatformData description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void maybeTransferPlatformData();
    /**
     *  hasPlatformData description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool hasPlatformData() const;
    
    Vector<char> m_buffer;
};
    
}

#endif




