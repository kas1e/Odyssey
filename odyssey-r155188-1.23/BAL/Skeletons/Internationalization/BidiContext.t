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
#ifndef BidiContext_h
#define BidiContext_h
/**
 *  @file  BidiContext.t
 *  BidiContext description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:08 $
 */
#include "BALBase.h"

#include <wtf/Assertions.h>
#include <wtf/RefPtr.h>
#include <wtf/unicode/Unicode.h>

namespace WebCore {

// Used to keep track of explicit embeddings.
class BidiContext : public WebCoreBase {
public:
    /**
     * BidiContext constructor
     * @param[in] : level
     * @param[in] : direction
     * @param[in] : override
     * @param[in] : parent
     * @code
     * BidiContext *b = new BidiContext(l, d, o, p);
     * @endcode
     */
    BidiContext(unsigned char level, WTF::Unicode::Direction direction, bool override = false, BidiContext* parent = 0);

    /**
     * add ref
     * @code
     * b->ref();
     * @endcode
     */
    void ref() const ;

    /**
     * deref
     * @code
     * b->deref();
     * @endcode
     */
    void deref() const;

    /**
     * get parent
     * @param[out] : BidiContext
     * @code
     * BidiContext *bp = b->parent();
     * @endcode
     */
    BidiContext* parent() const ;

    /**
     * get level 
     * @param[out] : level
     * @code
     * unsigned char l = b->level();
     * @endcode
     */
    unsigned char level() const ;

    /**
     * get direction
     * @param[out] : direction
     * @code
     * WTF::Unicode::Direction d = b->dir();
     * @endcode
     */
    WTF::Unicode::Direction dir() const ;

    /**
     * get override 
     * @param[out] : status
     * @code
     * bool o = b->override();
     * @endcode
     */
    bool override() const ;

private:
    unsigned char m_level;
    unsigned m_direction : 5; // Direction
    bool m_override : 1;
    RefPtr<BidiContext> m_parent;
    mutable int m_refCount;
};

    /**
     *  operator== 
     */
bool operator==(const BidiContext&, const BidiContext&);

} // namespace WebCore

#endif // BidiContext_h




