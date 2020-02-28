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
#ifndef FontFamily_h
#define FontFamily_h
/**
 *  @file  FontFamily.t
 *  FontFamily description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:06 $
 */
#include "BALBase.h"

#include "AtomicString.h"
#include <wtf/RefCounted.h>
#include <wtf/ListRefPtr.h>

namespace WKAL {

class SharedFontFamily;

class FontFamily : public WKALBase {
public:
    /**
     * FontFamily default constructor
     * @code
     * FontFamily *ff = new FontFamily();
     * @endcode
     */
    FontFamily() ;

    /**
     * FontFamily constructor by copy
     * @param[in] : FontFamily
     * @code
     * FontFamily *ff = new FontFamily(ffc);
     * @endcode
     */
    FontFamily(const FontFamily&);    

    /**
     *  operator= 
     * @param[in] : FontFamily
     * @param[out] : FontFamily
     * @code
     * FontFamily ffe = ff;
     * @endcode
     */
    FontFamily& operator=(const FontFamily&);

    /**
     * set font family 
     * @param[in] : family name
     * @code
     * ff->setFamily(familyName);
     * @endcode
     */
    void setFamily(const AtomicString& family) ;

    /**
     * get family name
     * @param[out] : family name
     * @code
     * AtomicString s = ff->family();
     * @endcode
     */
    const AtomicString& family() const ;

    /**
     * get family empty status
     * @param[out] : status
     * @code
     * bool empty = ff->familyIsEmpty();
     * @endcode
     */
    bool familyIsEmpty() const ;

    /**
     * get next family
     * @param[out] : font family
     * @code
     * FontFamily *ffn = ff->next();
     * @endcode
     */
    const FontFamily* next() const;

    /**
     * append a family
     * @param[in] : SharedFontFamily
     * @code
     * ff->appendFamily(sff);
     * @endcode
     */
    void appendFamily(PassRefPtr<SharedFontFamily>);

    /**
     * release next
     * @param[out] : SharedFontFamily
     * @code
     * SharedFontFamily sff = ff->releaseNext();
     * @endcode
     */
    PassRefPtr<SharedFontFamily> releaseNext();

private:
    AtomicString m_family;
    ListRefPtr<SharedFontFamily> m_next;
};

class SharedFontFamily : public WKALBase, public FontFamily, public RefCounted<SharedFontFamily> {
public:
    /**
     * create a SharedFontFamily
     * @param[out] : SharedFontFamily
     * @code
     * RefPtr<SharedFontFamily> sff = SharedFontFamily::create();
     * @endcode
     */
    static PassRefPtr<SharedFontFamily> create();

private:
    /**
     * SharedFontFamily private constructor
     */
    SharedFontFamily() ;
};

    /**
     * operator==
     */
bool operator==(const FontFamily&, const FontFamily&);

    /**
     * operator!=
     */
inline bool operator!=(const FontFamily& a, const FontFamily& b) ;

    /**
     * next
     */
inline const FontFamily* FontFamily::next() const;

    /**
     * appendFamily
     */
inline void FontFamily::appendFamily(PassRefPtr<SharedFontFamily> family);

    /**
     * releaseNext
     */
inline PassRefPtr<SharedFontFamily> FontFamily::releaseNext();

}

#endif




