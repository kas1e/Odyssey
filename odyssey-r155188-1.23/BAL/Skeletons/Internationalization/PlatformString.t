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
#ifndef PlatformString_h
#define PlatformString_h
/**
 *  @file  PlatformString.t
 *  PlatformString description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:09 $
 */
#include "BALBase.h"

// This file would be called String.h, but that conflicts with <string.h>
// on systems without case-sensitive file systems.

#include "StringImpl.h"




namespace WebCore {

class CString;
class SharedBuffer;
struct StringHash;

class String : public WebCoreBase {
public:
    /**
     * String default constructor
     */
    String() ;

    /**
     * String constructor
     * @param[in] : unicode character
     * @param[in] : length
     */
    String(const UChar*, unsigned length);

    /**
     * String constructor
     * @param[in] : unicode character
     */
    String(const UChar*); // Specifically for null terminated UTF-16

    /**
     * String constructor
     * @param[in] : identifier
     */
    String(const JSC::Identifier&);

    /**
     * String constructor
     * @param[in] : unicode string
     */
    String(const JSC::UString&);

    /**
     * String constructor
     * @param[in] : string
     */
    String(const char*);

    /**
     * String constructor
     * @param[in] : string
     * @param[in] : length
     */
    String(const char*, unsigned length);

    /**
     * String constructor
     * @param[in] : StringImpl
     */
    String(StringImpl* i);

    /**
     * String constructor
     * @param[in] : PassRefPtr<StringImpl>
     */
    String(PassRefPtr<StringImpl> i);

    /**
     *  String constructor
     * @param[in] : RefPtr<StringImpl>
     */
    String(RefPtr<StringImpl> i);

    /**
     * swap
     * @param[in] : string
     * @code
     * s->swap(o);
     * @endcode
     */
    void swap(String& o) ;

    /**
     * String constructor
     * @param[in] : Hash table deleted values, which are only constructed and never copied or destroyed.
     */
    String(WTF::HashTableDeletedValueType);

    /**
     * test if String is HashTableDeletedValue 
     * @param[out] : status
     * @code
     * boo h = s->isHashTableDeletedValue();
     * @endcode
     */
    bool isHashTableDeletedValue() const ;

    /**
     * adopt
     * @param[in] : StringBuffer
     * @param[out] : string
     * @code
     * String s = String::adopt(buf);
     * @endcode
     */
    static String adopt(StringBuffer& buffer) ;

    /**
     * adopt 
     * @param[in] : vector of unicode character
     * @param[out] : String
     * @code
     * String s = String::adopt(v);
     * @endcode
     */
    static String adopt(Vector<UChar>& vector) ;


    /**
     * Convert to a UString
     * @code
     * UString u = (Ustring)s;
     * @endcode
     */
    operator JSC::UString() const;

    /**
     * get length 
     * @param[out] : length
     * @code
     * unsigned l = s->length();
     * @endcode
     */
    unsigned length() const;

    /**
     * get unicode characters
     * @param[out] : unicode characters
     * @code
     * const UChar *c = s->characters();
     * @endcode
     */
    const UChar* characters() const;

    /**
     * get characters with null termination
     * @param[out] : characters with null termination
     * @code
     * const UChar *u = s->charactersWithNullTermination();
     * @endcode
     */
    const UChar* charactersWithNullTermination();
    
    /**
     *  operator[]
     */
    UChar operator[](unsigned i) const; // if i >= length(), returns 0    

    /**
     * get character starting at index
     * @param[in] : index
     * @param[out] : unicode char
     * @code
     * UChar32 c = s->characterStartingAt(i);
     * @endcode
     */
    UChar32 characterStartingAt(unsigned) const; // Ditto.
    
    /**
     * test if String contains the character
     * @param[in] : character
     * @param[out] : status
     * @code
     * bool c = s->contains(c);
     * @endcode
     */
    bool contains(UChar c) const ;

    /**
     * test if String contains the string
     * @param[in] : string
     * @param[in] : case sentive status
     * @param[out] : status
     * @code
     * bool c = s->contains(str, false); 
     * @endcode
     */
    bool contains(const char* str, bool caseSensitive = true) const ;

    /**
     * test if String contains the string
     * @param[in] : string
     * @param[in] : case sensitive status
     * @param[out] : status
     * @code
     * bool c = s->contains(str);
     * @endcode
     */
    bool contains(const String& str, bool caseSensitive = true) const ;

    /**
     * find 
     * @param[in] : Uincode character
     * @param[in] : start position
     * @param[out] : character position or -1
     * @code
     * int f = s->find(c, 3);
     * @endcode
     */
    int find(UChar c, int start = 0) const;

    /**
     * append
     * @param[in] : string
     * @code
     * s->append(s1);
     * @endcode
     */
    void append(const String&);

    /**
     * append
     * @param[in] : character
     * @code
     * s->append(c);
     * @endcode
     */
    void append(char);

    /**
     * append
     * @param[in] : unicode character
     * @code
     * s->append(u);
     * @endcode
     */
    void append(UChar);

    /**
     * append 
     * @param[in] : unicode characters
     * @param[in] : length
     * @code
     * s->append(c, l);
     * @endcode
     */
    void append(const UChar*, unsigned length);

    /**
     * insert
     * @param[in] : string
     * @param[in] : position
     * @code
     * s->insert(s1, 4);
     * @endcode
     */
    void insert(const String&, unsigned pos);

    /**
     * insert
     * @param[in] : unicode character
     * @param[in] : length
     * @param[in] : position
     * @code
     * s->insert(c, l, p);
     * @endcode
     */
    void insert(const UChar*, unsigned length, unsigned pos);

    /**
     * replace
     * @param[in] : unicode character
     * @param[in] : unicode character
     * @param[out] : string
     * @code
     * String s1 = s->replace(a, b);
     * @endcode
     */
    String& replace(UChar a, UChar b) ;

    /**
     * replace
     * @param[in] : unicode char
     * @param[in] : string
     * @param[out] : string
     * @code
     * String s1 = s->replace(a, b);
     * @endcode
     */
    String& replace(UChar a, const String& b) ;

    /**
     * replace
     * @param[in] : string
     * @param[in] : string
     * @param[out] : string
     * @code
     * String s1 = s->replace(a, b);
     * @endcode
     */
    String& replace(const String& a, const String& b) ;

    /**
     * replace
     * @param[in] : index
     * @param[in] : len
     * @param[in] : string
     * @param[out] : string
     * @code
     * String s1 = s->replace(i, l, b);
     * @endcode
     */
    String& replace(unsigned index, unsigned len, const String& b) ;

    /**
     * truncate
     * @param[in] : length
     * @code
     * s->truncate(l);
     * @endcode
     */
    void truncate(unsigned len);

    /**
     * remove
     * @param[in] : position
     * @param[in] : length
     * @code
     * s->remove(p, l);
     * @endcode
     */
    void remove(unsigned pos, int len = 1);

    /**
     * substring
     * @param[in] : position
     * @param[in] : length
     * @param[out] : string
     * @code
     * String s1 = s->substring(p, l);
     * @endcode
     */
    String substring(unsigned pos, unsigned len = UINT_MAX) const;

    /**
     * left
     * @param[in] : length
     * @param[out] : string
     * @code
     * String s1 = s->left(l);
     * @endcode
     */
    String left(unsigned len) const ;

    /**
     * right
     * @param[in] : length
     * @param[out] : string
     * @code
     * String s1 = s->rigth();
     * @endcode
     */
    String right(unsigned len) const ;

    /**
     * Returns a lowercase/uppercase version of the string
     * @param[out] : string
     * @code
     * String s1 = s->lower();
     * @endcode
     */
    String lower() const;

    /**
     * upper
     * @param[out] : string
     * @code
     * String s1 = s->upper();
     * @endcode
     */
    String upper() const;

    /**
     * strip white space 
     * @param[out] : string
     * @code
     * String s1 = s->stripWhiteSpace();
     * @endcode
     */
    String stripWhiteSpace() const;

    /**
     * simplify white space
     * @param[out] : string
     * @code
     * String s1 = s->simplifyWhiteSpace();
     * @endcode
     */
    String simplifyWhiteSpace() const;
    
    /**
     * Return the string with case folded for case insensitive comparison.
     * @param[out] : string
     * @code
     * String s1 = s->foldCase();
     * @endcode
     */
    String foldCase() const;

    /**
     * number 
     * @param[in] : int
     * @param[out] : String
     * @code
     * String s = String::number(i);
     * @endcode
     */
    static String number(int);

    /**
     * number
     * @param[in] : unsigned
     * @param[out] : string
     * @code
     * String s = String::number(u);
     * @endcode
     */
    static String number(unsigned);

    /**
     * number
     * @param[in] : long
     * @param[out] : String
     * @code
     * String s = String::number(l);
     * @endcode
     */
    static String number(long);

    /**
     * number
     * @param[in] : unsigned long
     * @param[out] : string
     * @code
     * String s = String::number(ul);
     * @endcode
     */
    static String number(unsigned long);

    /**
     * number
     * @param[in] : long long
     * @param[out] : string
     * @code
     * String s = String::number(ll);
     * @endcode
     */
    static String number(long long);

    /**
     * number
     * @param[in] : unsigned long long
     * @param[out] : string
     * @code
     * String s = String::number(ull);
     * @endcode
     */
    static String number(unsigned long long);

    /**
     * number
     * @param[in] : double
     * @param[out] : string
     * @code
     * String s = String::number(d);
     * @endcode
     */
    static String number(double);
    
    /**
     * format 
     * @param[in] : string
     * @param[in] : ...
     * @param[out] : string
     */
    static String format(const char *, ...) WTF_ATTRIBUTE_PRINTF(1, 2);

    /**
     * split
     * @param[in] : separator
     * @param[out] : vector result
     * @code
     * s->split(s, v);
     * @endcode
     */
    void split(const String& separator, Vector<String>& result) const;

    /**
     * split
     * @param[in] : separator
     * @param[in] : allow empty entries status
     * @param[out] : vector result
     * @code
     * s->split(s, true, v);
     * @endcode
     */
    void split(const String& separator, bool allowEmptyEntries, Vector<String>& result) const;

    /**
     * split
     * @param[in] : separator
     * @param[out] : vector result
     * @code
     * s->split(s, v);
     * @endcode
     */
    void split(UChar separator, Vector<String>& result) const;

    /**
     * split
     * @param[in] : separator
     * @param[in] : allow empty entries
     * @param[out] : vector result
     * @code
     * s->split(s, false, v);
     * @endcode
     */
    void split(UChar separator, bool allowEmptyEntries, Vector<String>& result) const;

    /**
     * convert to int strict
     * @param[out] : status
     * @param[in] : base
     * @param[out] : int
     * @code
     * int i = s->toIntStrict(&ok);
     * @endcode
     */
    int toIntStrict(bool* ok = 0, int base = 10) const;

    /**
     * convert to unsigned int strict
     * @param[in] : base
     * @param[out] : status
     * @param[out] : unsigned int
     * @code
     * unsigned i = s->toUIntStrict(&ok, b);
     * @endcode
     */
    unsigned toUIntStrict(bool* ok = 0, int base = 10) const;

    /**
     * convert to int64 strict
     * @param[in] : base
     * @param[out] : status
     * @param[out] : int64
     * @code
     * int64_t i = s->toInt64Strict(&ok, b);
     * @endcode
     */
    int64_t toInt64Strict(bool* ok = 0, int base = 10) const;

    /**
     * convert to unsigned int64 strict
     * @param[in] : base
     * @param[out] : status
     * @param[out] : unsigned int64
     * @code
     * uint64_t i = s->toUInt64Strict(&ok, b);
     * @endcode
     */
    uint64_t toUInt64Strict(bool* ok = 0, int base = 10) const;

    /**
     * convert to int
     * @param[out] : status
     * @param[out] : int
     * @code
     * int i = s->toInt();
     * @endcode
     */
    int toInt(bool* ok = 0) const;

    /**
     * convert to unsigned int
     * @param[out] : status
     * @param[out] : unsigned int
     * @code
     * unsigned i = s->toUInt();
     * @endcode
     */
    unsigned toUInt(bool* ok = 0) const;

    /**
     * convert to int64
     * @param[out] : status
     * @param[out] : int64
     * @code
     * int64_t i = s->toInt64();
     * @endcode
     */
    int64_t toInt64(bool* ok = 0) const;

    /**
     * convert to unsigned int64
     * @param[out] : status
     * @param[out] : unsigned int64
     * @code
     * uint64_t i = s->toUInt64();
     * @endcode
     */
    uint64_t toUInt64(bool* ok = 0) const;

    /**
     * convert to double
     * @param[out] : status
     * @param[out] : double
     * @code
     * double d = s->toDouble();
     * @endcode
     */
    double toDouble(bool* ok = 0) const;

    /**
     * convert to float
     * @param[out] : status
     * @param[out] : float
     * @code
     * float f = s->toFloat();
     * @endcode
     */
    float toFloat(bool* ok = 0) const;

    /**
     * convert to length array
     * @param[out] : length
     * @param[out] : length array
     * @code
     * Length *l = s->toLengthArray(le);
     * @endcode
     */
    Length* toLengthArray(int& len) const;

    /**
     * convert to coords array
     * @param[out] : length
     * @param[out] : length array
     * @code
     * Length *l = s->toCoordsArray(len);
     * @endcode
     */
    Length* toCoordsArray(int& len) const;

    /**
     * percentage 
     * @param[out] : percentage
     * @param[out] : status
     * @code
     * bool p = s->percentage(p);
     * @endcode
     */
    bool percentage(int& percentage) const;

    /**
     * Makes a deep copy. Helpful only if you need to use a String on another thread.
     * Since the underlying StringImpl objects are immutable, there's no other reason
     * to ever prefer copy() over plain old assignment.
     * @param[out] : string
     * @code
     * String c = s->copy();
     * @endcode
     */
    String copy() const;

    /**
     * test if the String is null
     * @param[out] : status
     * @code
     * bool n = s->isNull();
     * @endcode
     */
    bool isNull() const ;

    /**
     * test if the String is empty
     * @param[out] : status
     * @code
     * bool e = s->isEmpty();
     * @endcode
     */
    bool isEmpty() const;

    /**
     * get impl
     * @param[out] : StringImpl
     * @code
     * StringImpl *si = s->impl();
     * @endcode
     */
    StringImpl* impl() const ;

#ifndef NDEBUG
    /**
     * ascii
     * @param[out] : character vector 
     * @code
     * Vector<char> a = s->ascii();
     * @endcode
     */
    Vector<char> ascii() const;
#endif

    /**
     * latin1
     * @param[out] : CString
     * @code
     * CString l = s->latin1();
     * @endcode
     */
    CString latin1() const;

    /**
     * utf8
     * @param[out] : CString
     * @code
     * CString u = s->utf8();
     * @endcode
     */
    CString utf8() const;

    /**
     * fromUTF8
     * @param[in] : string
     * @param[in] : length
     * @param[out] : String
     * @code
     * String s = String::fromUTF8(s1, l);
     * @endcode
     */
    static String fromUTF8(const char*, size_t);

    /**
     * fromUTF8
     * @param[in] : string
     * @param[out] : string
     * @code
     * String s = String::fromUTF8(s1);
     * @endcode
     */
    static String fromUTF8(const char*);

    /**
     * Determines the writing direction using the Unicode Bidi Algorithm rules P2 and P3.
     * @param[out] : direction
     * @code
     * WTF::Unicode::Direction d = s->defaultWritingDirection();
     * @endcode
     */
    WTF::Unicode::Direction defaultWritingDirection() const ;

private:
    RefPtr<StringImpl> m_impl;
};

    /**
     * operator+ 
     */
String operator+(const String&, const String&);

    /**
     *  operator+
     */
String operator+(const String&, const char*);

    /**
     *  operator+
     */
String operator+(const char*, const String&);

    /**
     *  operator+= 
     */
inline String& operator+=(String& a, const String& b) ;

    /**
     *  operator== 
     */
inline bool operator==(const String& a, const String& b) ;

    /**
     *  operator== 
     */
inline bool operator==(const String& a, const char* b) ;

    /**
     *  operator==
     */
inline bool operator==(const char* a, const String& b) ;

    /**
     *  operator!= 
     */
inline bool operator!=(const String& a, const String& b) ;

    /**
     *  operator!= 
     */
inline bool operator!=(const String& a, const char* b) ;

    /**
     *  operator!= 
     */
inline bool operator!=(const char* a, const String& b) ;

    /**
     *  equalIgnoringCase
     */
inline bool equalIgnoringCase(const String& a, const String& b) ;

    /**
     *  equalIgnoringCase 
     */
inline bool equalIgnoringCase(const String& a, const char* b) ;

    /**
     *  equalIgnoringCase
     */
inline bool equalIgnoringCase(const char* a, const String& b) ;

    /**
     *  operator!
     */
inline bool operator!(const String& str) ;

    /**
     *  swap 
     */
inline void swap(String& a, String& b) ;

// String Operations

    /**
     *  charactersAreAllASCII 
     */
bool charactersAreAllASCII(const UChar*, size_t);

    /**
     *  charactersToIntStrict
     */
int charactersToIntStrict(const UChar*, size_t, bool* ok = 0, int base = 10);

    /**
     *  charactersToUIntStrict 
     */
unsigned charactersToUIntStrict(const UChar*, size_t, bool* ok = 0, int base = 10);

    /**
     *  charactersToInt64Strict
     */
int64_t charactersToInt64Strict(const UChar*, size_t, bool* ok = 0, int base = 10);

    /**
     *  charactersToUInt64Strict
     */
uint64_t charactersToUInt64Strict(const UChar*, size_t, bool* ok = 0, int base = 10);

    /**
     *  charactersToInt
     */
int charactersToInt(const UChar*, size_t, bool* ok = 0); // ignores trailing garbage

    /**
     *  charactersToUInt
     */
unsigned charactersToUInt(const UChar*, size_t, bool* ok = 0); // ignores trailing garbage

    /**
     *  charactersToInt64
     */
int64_t charactersToInt64(const UChar*, size_t, bool* ok = 0); // ignores trailing garbage

    /**
     *  charactersToUInt64 
     */
uint64_t charactersToUInt64(const UChar*, size_t, bool* ok = 0); // ignores trailing garbage

    /**
     *  charactersToDouble
     */
double charactersToDouble(const UChar*, size_t, bool* ok = 0);

    /**
     *  charactersToFloat
     */
float charactersToFloat(const UChar*, size_t, bool* ok = 0);

    /**
     *  find 
     */
int find(const UChar*, size_t, UChar, int startPosition = 0);

    /**
     *  reverseFind 
     */
int reverseFind(const UChar*, size_t, UChar, int startPosition = -1);

    /**
     *  append 
     */
void append(Vector<UChar>&, const String&);

    /**
     *  find
     */
inline int find(const UChar* characters, size_t length, UChar character, int startPosition);

    /**
     *  reverseFind 
     */
inline int reverseFind(const UChar* characters, size_t length, UChar character, int startPosition);

    /**
     *  append 
     */
inline void append(Vector<UChar>& vector, const String& string);

    /**
     *  utf8Buffer 
     */
PassRefPtr<SharedBuffer> utf8Buffer(const String&);

} // namespace WebCore

namespace WTF {

    // StringHash is the default hash for String
    template<typename T> struct DefaultHash;
    template<> struct DefaultHash<WebCore::String> {
        typedef WebCore::StringHash Hash;
    };

}

#endif


