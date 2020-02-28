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
#ifndef AtomicString_h
#define AtomicString_h
/**
 *  @file  AtomicString.t
 *  AtomicString description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:08 $
 */
#include "BALBase.h"

#include "AtomicStringImpl.h"
#include "PlatformString.h"

namespace WebCore {

class AtomicString : public WebCoreBase {
public:
    /**
     * init atomic string
     * @code
     * AtomicString::init();
     * @endcode
     */
    static void init();

    /**
     * AtomicString default constructor
     * @code
     * AtomicString a;
     * @endcode
     */
    AtomicString() ;

    /**
     * AtomicString constructor
     * @param[in] : characters
     * @code
     * AtomicString a(c);
     * @endcode
     */
    AtomicString(const char* s);

    /**
     * AtomicString constructor
     * @param[in] : unicode characters
     * @param[in] : length
     * @code
     * AtomicString a(c, l);
     * @endcode
     */
    AtomicString(const UChar* s, int length);

    /**
     * AtomicString constructor
     * @param[in] : unicode characters
     * @code
     * AtomicString a(c);
     * @endcode
     */
    AtomicString(const UChar* s);

    /**
     * AtomicString constructor
     * @param[in] : unicode string
     * @code
     * AtomicString a(s);
     * @endcode
     */
    AtomicString(const JSC::UString& s);

    /**
     * AtomicString constructor
     * @param[in] : identifier
     * @code
     * AtomicString a(i);
     * @endcode
     */
    AtomicString(const JSC::Identifier& s);

    /**
     * AtomicString constructor
     * @param[in] : StringImpl
     * @code
     * AtomicString a(si);
     * @endcode
     */
    AtomicString(StringImpl* imp);

    /**
     * AtomicString constructor
     * @param[in] : AtomicStringImpl
     * @code
     * AtomicString a(ai);
     * @endcode
     */
    AtomicString(AtomicStringImpl* imp);

    /**
     * AtomicString constructor
     * @param[in] : string
     * @code
     * AtomicString a(s);
     * @endcode
     */
    AtomicString(const String& s);

    /**
     * find
     * @param[in] : identifier
     * @param[out] : AtomicStringImpl
     * @code
     * AtomicStringImpl *ai = AtomicString::find(i);
     * @endcode
     */
    static AtomicStringImpl* find(const JSC::Identifier&);

    /**
     * operator const String&
     */
    operator const String&() const ;

    /**
     * get string
     * @param[out] : string
     * @code
     * String s = a.string();
     * @endcode
     */
    const String& string() const ;


    /**
     * Convert to a UString
     * @code
     * UString u = (UString)a;
     * @endcode
     */
    operator JSC::UString() const;

    /**
     * get AtomicStringImpl
     * @param[out] : AtomicStringImpl
     * @code
     * AtomicStringImpl *ai = a.impl();
     * @endcode
     */
    AtomicStringImpl* impl() const ;
    
    /**
     * get characters
     * @param[out] : unicode characters
     * @code
     * UChar *u = a.characters();
     * @endcode
     */
    const UChar* characters() const ;

    /**
     * get length 
     * @param[out] : length
     * @code
     * unsigned l = a.length();
     * @endcode
     */
    unsigned length() const ;
    
    /**
     * operator[] 
     * @param[in] : index
     * @param[out] : unicode charater
     */
    UChar operator[](unsigned int i) const ;
    
    /**
     * test if AtomicString contains the character
     * @param[in] : character
     * @param[out] : true if AtomicString contains the character
     * @code
     * bool c = a.contains(ch);
     * @endcode
     */
    bool contains(UChar c) const ;

    /**
     * test if AtomicString contains the character
     * @param[in] : AtomicString
     * @param[in] : use case sensitivity
     * @param[out] : true if AtomicString contains the character
     * @code
     * bool c = a.contains(ch, false);
     * @endcode
     */
    bool contains(const AtomicString& s, bool caseSensitive = true) const;

    /**
     * find character
     * @param[in] : character
     * @param[in] : start position
     * @param[out] : position of character or -1 if the character is not found
     * @code
     * int p = a.find(c, 3);
     * @endcode
     */
    int find(UChar c, int start = 0) const ;

    /**
     * find AtomicString
     * @param[in] : AtomicString
     * @param[in] : start position
     * @param[in] : use case sensitivity
     * @param[out] : position of character or -1 if the character is not found
     * @code
     * int p = a.find(a1, 3, false);
     * @endcode
     */
    int find(const AtomicString& s, int start = 0, bool caseSentitive = true) const;
    
    /**
     * test if AtomicString starts with the AtomicString given in parameter
     * @param[in] : AtomicString
     * @param[in] : use case sensitivity
     * @param[out] : true if AtomicString starts with the AtomicString given in parameter
     * @code
     * bool s = a.startsWith(a1, false);
     * @endcode
     */
    bool startsWith(const AtomicString& s, bool caseSensitive = true) const;

    /**
     * test if AtomicString ends with the AtomicString given in parameter
     * @param[in] : AtomicString
     * @param[in] : use case sensitivity
     * @param[out] : true if AtomicString ends with the AtomicString given in parameter
     * @code
     * bool s = a.endsWith(a1, false);
     * @endcode
     */
    bool endsWith(const AtomicString& s, bool caseSensitive = true) const;
    
    /**
     * convert AtomicString to int
     * @param[out] : status
     * @param[out] : int
     * @code
     * int i = a.toInt(&ok);
     * @endcode
     */
    int toInt(bool* ok = 0) const ;

    /**
     * convert AtomicString to double
     * @param[out] : status
     * @param[out] : double
     * @code
     * double d = a.toDouble(&ok);
     * @endcode
     */
    double toDouble(bool* ok = 0) const ;

    /**
     * convert AtomicString to float
     * @param[out] : status
     * @param[out] : float
     * @code
     * float f = a.toFloat(&ok);
     * @endcode
     */
    float toFloat(bool* ok = 0) const ;

    /**
     * convert AtomicString to percentage
     * @param[out] : percentage
     * @param[out] : status
     * @code
     * bool s = a.percentage(p);
     * @endcode
     */
    bool percentage(int& p) const ;

    /**
     * convert AtomicString to length array
     * @param[out] : array length
     * @param[out] : length array
     * @code
     * Length *l = a.toLengthArray(len);
     * @endcode
     */
    Length* toLengthArray(int& len) const ;

    /**
     * convet to coords array
     * @param[out] : array length
     * @param[out] : coords
     * @code
     * Length *l = a.toCoordsArray(len);
     * @endcode
     */
    Length* toCoordsArray(int& len) const ;

    /**
     * test if the AtomicString is null
     * @param[out] : true if the AtomicString is null
     * @code
     * bool n = a.isNull();
     * @endcode
     */
    bool isNull() const ;

    /**
     * test if the AtomicString is empty
     * @param[out] : true if the AtomicString is empty
     * @code
     * bool e = a.isEmpty();
     * @endcode
     */
    bool isEmpty() const ;

    /**
     * remove
     * @param[in] : string
     * @code
     * AtomicString::remove(s);
     * @endcode
     */
    static void remove(StringImpl*);
    

private:
    String m_string;
    
    /**
     * add
     */
    static PassRefPtr<StringImpl> add(const char*);

    /**
     * add
     */
    static PassRefPtr<StringImpl> add(const UChar*, int length);

    /**
     * add
     */
    static PassRefPtr<StringImpl> add(const UChar*);

    /**
     * add
     */
    static PassRefPtr<StringImpl> add(StringImpl*);

    /**
     * add
     */
    static PassRefPtr<StringImpl> add(const JSC::UString&);

    /**
     * add
     */
    static PassRefPtr<StringImpl> add(const JSC::Identifier&);
};

    /**
     * operator==
     */
inline bool operator==(const AtomicString& a, const AtomicString& b) ;

    /**
     * operator==
     */
bool operator==(const AtomicString& a, const char* b);

    /**
     * operator==
     */
inline bool operator==(const AtomicString& a, const String& b) ;

    /**
     * operator== 
     */
inline bool operator==(const char* a, const AtomicString& b) ;

    /**
     * operator== 
     */
inline bool operator==(const String& a, const AtomicString& b) ;

    /**
     * operator!= 
     */
inline bool operator!=(const AtomicString& a, const AtomicString& b) ;

    /**
     * operator!=
     */
inline bool operator!=(const AtomicString& a, const char *b) ;

    /**
     * operator!= 
     */
inline bool operator!=(const AtomicString& a, const String& b) ;

    /**
     * operator!=
     */
inline bool operator!=(const char* a, const AtomicString& b) ;

    /**
     * operator!=
     */
inline bool operator!=(const String& a, const AtomicString& b) ;

    /**
     * equalIgnoringCase 
     */
inline bool equalIgnoringCase(const AtomicString& a, const AtomicString& b) ;

    /**
     * equalIgnoringCase
     */
inline bool equalIgnoringCase(const AtomicString& a, const char* b) ;

    /**
     * equalIgnoringCase
     */
inline bool equalIgnoringCase(const AtomicString& a, const String& b) ;

    /**
     * equalIgnoringCase
     */
inline bool equalIgnoringCase(const char* a, const AtomicString& b) ;

    /**
     * equalIgnoringCase
     */
inline bool equalIgnoringCase(const String& a, const AtomicString& b) ;

// Define external global variables for the commonly used atomic strings.
#ifndef ATOMICSTRING_HIDE_GLOBALS
    extern const AtomicString nullAtom;
    extern const AtomicString emptyAtom;
    extern const AtomicString textAtom;
    extern const AtomicString commentAtom;
    extern const AtomicString starAtom;
#endif

} // namespace WebCore

#endif // AtomicString_h


