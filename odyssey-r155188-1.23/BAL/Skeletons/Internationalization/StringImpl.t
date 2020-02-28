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
#ifndef StringImpl_h
#define StringImpl_h
/**
 *  @file  StringImpl.t
 *  StringImpl description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:09 $
 */
#include "BALBase.h"

#include <kjs/identifier.h>
#include <limits.h>
#include <wtf/ASCIICType.h>
#include <wtf/Forward.h>
#include <wtf/RefCounted.h>
#include <wtf/Vector.h>
#include <wtf/unicode/Unicode.h>



namespace WebCore {

class AtomicString;
class StringBuffer;

struct CStringTranslator;
struct HashAndCharactersTranslator;
struct Length;
struct StringHash;
struct UCharBufferTranslator;

class StringImpl : public WebCoreBase, public RefCounted<StringImpl> {
    friend class AtomicString;
    friend struct CStringTranslator;
    friend struct HashAndCharactersTranslator;
    friend struct UCharBufferTranslator;
private:
    /**
     * StringImpl default constructor
     */
    StringImpl();

    /**
     * StringImpl constructor
     * @param[in] : unicode characters
     * @param[in] : length
     */
    StringImpl(const UChar*, unsigned length);

    /**
     * StringImpl constructor
     * @param[in] : string
     * @param[in] : length
     */
    StringImpl(const char*, unsigned length);

    struct AdoptBuffer { };
    /**
     * StringImpl constructor
     * @param[in] : unicode characters
     * @param[in] : length
     * @param[in] : adopt buffer
     */
    StringImpl(UChar*, unsigned length, AdoptBuffer);

    struct WithTerminatingNullCharacter { };
    /**
     * StringImpl constructor by copy
     * @param[in] : StringImpl
     * @param[in] : with terminating null character 
     */
    StringImpl(const StringImpl&, WithTerminatingNullCharacter);

    // For AtomicString.
    /**
     * StringImpl constructor
     * @param[in] : unicode characters
     * @param[in] : length
     * @param[in] : hash key
     */
    StringImpl(const UChar*, unsigned length, unsigned hash);

    /**
     * StringImpl constructor
     * @param[in] : string
     * @param[in] : length
     * @param[in] : hash key
     */
    StringImpl(const char*, unsigned length, unsigned hash);

public:
    /**
     * ~StringImpl destructor
     */
    ~StringImpl();

    /**
     * create StringImpl
     * @param[in] : unicode characters
     * @param[in] : length
     * @param[out] : StringImpl
     * @code
     * RefPtr<StringImpl> s = StringImpl::create(u,l);
     * @endcode
     */
    static PassRefPtr<StringImpl> create(const UChar*, unsigned length);

    /**
     * create StringImpl
     */
    static PassRefPtr<StringImpl> create(const char*, unsigned length);

    /**
     * create StringImpl
     */
    static PassRefPtr<StringImpl> create(const char*);

    /**
     * create StringImpl with terminating null character
     */
    static PassRefPtr<StringImpl> createWithTerminatingNullCharacter(const StringImpl&);

    /**
     * create StringImpl stripping null characters 
     */
    static PassRefPtr<StringImpl> createStrippingNullCharacters(const UChar*, unsigned length);

    /**
     * adopt
     * @param[in] : StringBuffer
     * @param[out] : StringImpl
     */
    static PassRefPtr<StringImpl> adopt(StringBuffer&);

    /**
     * adopt
     * @param[in] : vector of unicode character
     * @param[out] : StringImpl
     */
    static PassRefPtr<StringImpl> adopt(Vector<UChar>&);

    /**
     * get characters 
     * @param[out] : characters
     * @code
     * UChar *c = s->characters();
     * @endcode
     */
    const UChar* characters() ;

    /**
     * get length 
     * @param[out] : length
     * @code
     * unsigned l = s->length();
     * @endcode
     */
    unsigned length() ;

    /**
     * has terminating null character
     * @param[out] : status
     * @code
     * @endcode
     */
    bool hasTerminatingNullCharacter() ;

    /**
     * hash 
     * @param[out] : hash key
     * @code
     * unsigned h = s->hash();
     * @endcode
     */
    unsigned hash() ;

    /**
     * compute hash
     * @param[in] : unicode characters
     * @param[in] : length
     * @param[out] : hash key
     */
    static unsigned computeHash(const UChar*, unsigned len);

    /**
     * compute hash
     * @param[in] : string
     */
    static unsigned computeHash(const char*);
    
    /**
     * Makes a deep copy. Helpful only if you need to use a String on another thread.
     * Since StringImpl objects are immutable, there's no other reason to make a copy.
     * @param[out] : StringImpl
     */
    PassRefPtr<StringImpl> copy();

    /**
     * get substring
     * @param[in] : start position
     * @param[in] : length
     * @param[out] : StringImpl
     */
    PassRefPtr<StringImpl> substring(unsigned pos, unsigned len = UINT_MAX);

    /**
     * operator[] 
     */
    UChar operator[](unsigned i) ;

    /**
     * get character starting at index
     * @param[in] : index
     * @param[out] : character
     */
    UChar32 characterStartingAt(unsigned);

    /**
     * to length 
     * @param[out] : length
     */
    Length toLength();

    /**
     * test if StringImpl contains only whitespace
     * @param[out] : status
     * @code
     * bool c = s->containsOnlyWhitespace();
     * @endcode
     */
    bool containsOnlyWhitespace();

    /**
     * @see String
     */
    int toIntStrict(bool* ok = 0, int base = 10);

    /**
     * @see String
     */
    unsigned toUIntStrict(bool* ok = 0, int base = 10);

    /**
     * @see String
     */
    int64_t toInt64Strict(bool* ok = 0, int base = 10);

    /**
     * @see String
     */
    uint64_t toUInt64Strict(bool* ok = 0, int base = 10);

    /**
     * @see String
     */
    int toInt(bool* ok = 0); // ignores trailing garbage

    /**
     * @see String
     */
    unsigned toUInt(bool* ok = 0); // ignores trailing garbage

    /**
     * @see String
     */
    int64_t toInt64(bool* ok = 0); // ignores trailing garbage

    /**
     * @see String
     */
    uint64_t toUInt64(bool* ok = 0); // ignores trailing garbage

    /**
     * @see String
     */
    double toDouble(bool* ok = 0);

    /**
     * @see String
     */
    float toFloat(bool* ok = 0);

    /**
     * @see String
     */
    Length* toCoordsArray(int& len);

    /**
     * @see String
     */
    Length* toLengthArray(int& len);

    /**
     * test if StringImpl is lower
     * @param[out] : status
     */
    bool isLower();

    /**
     * get lower StringImpl
     * @param[out] : StringImpl
     */
    PassRefPtr<StringImpl> lower();

    /**
     * get upper StringImpl
     * @param[out] : StringImpl
     */
    PassRefPtr<StringImpl> upper();

    /**
     * secure
     * @param[in] : unicode character
     * @param[out] : StringImpl
     */
    PassRefPtr<StringImpl> secure(UChar aChar);

    /**
     * capitalize
     * @param[in] : previous character
     * @param[out] : StringImpl
     */
    PassRefPtr<StringImpl> capitalize(UChar previousCharacter);

    /**
     * get foldCase StringImpl
     * @param[out] : StringImpl
     */
    PassRefPtr<StringImpl> foldCase();

    /**
     * strip white space
     * @param[out] : StringImpl
     */
    PassRefPtr<StringImpl> stripWhiteSpace();

    /**
     * simplify white space
     * @param[out] : StringImpl
     */
    PassRefPtr<StringImpl> simplifyWhiteSpace();

    /**
     * find 
     * @param[in] : string
     * @param[in] : start position
     * @param[in] : case sensitive status
     * @param[out] : position or -1 if not found
     */
    int find(const char*, int index = 0, bool caseSensitive = true);

    /**
     * find 
     * @param[in] : unicode character
     * @param[in] : start position
     * @param[out] : position or -1 if not found
     */
    int find(UChar, int index = 0);

    /**
     * find 
     * @param[in] : StringImpl
     * @param[in] : start position
     * @param[in] : case sensitive status
     * @param[out] : position or -1 if not found
     */
    int find(StringImpl*, int index, bool caseSensitive = true);

    /**
     * reverse find 
     * @param[in] : unicode character
     * @param[in] : start position
     * @param[out] : position or -1 if not found
     */
    int reverseFind(UChar, int index);

    /**
     * reverse find 
     * @param[in] : StringImpl
     * @param[in] : start position
     * @param[in] : case sensitive status
     * @param[out] : position or -1 if not found
     */
    int reverseFind(StringImpl*, int index, bool caseSensitive = true);
    
    /**
     * test if StringImpl starts with the StringImpl
     * @param[in] : StringImpl
     * @param[in] : case sensitive status
     * @param[out] : status
     */
    bool startsWith(StringImpl* m_data, bool caseSensitive = true) ;

    /**
     * test if StringImpl ends with StringImpl
     * @param[in] : StringImpl
     * @param[in] : case sensitive status
     * @param[out] : status
     */
    bool endsWith(StringImpl*, bool caseSensitive = true);

    /**
     * replace
     * @param[in] : unicode character
     * @param[in] : unicode character
     * @param[out] : StringImpl
     */
    PassRefPtr<StringImpl> replace(UChar, UChar);

    /**
     * replace 
     */
    PassRefPtr<StringImpl> replace(UChar, StringImpl*);
    /**
     * replace
     */
    PassRefPtr<StringImpl> replace(StringImpl*, StringImpl*);

    /**
     * replace 
     */
    PassRefPtr<StringImpl> replace(unsigned index, unsigned len, StringImpl*);

    /**
     * create a StringImpl empty
     * @param[out] : StringImpl
     */
    static StringImpl* empty();

    /**
     * ascii
     * @param[out] : vector of char
     */
    Vector<char> ascii();

    /**
     * get default writing direction
     * @param[out] : direction
     */
    WTF::Unicode::Direction defaultWritingDirection();


private:
    unsigned m_length;
    const UChar* m_data;
    mutable unsigned m_hash;
    bool m_inTable;
    bool m_hasTerminatingNullCharacter;
};

    /**
     * equal
     */
bool equal(StringImpl*, StringImpl*);

    /**
     * equal 
     */
bool equal(StringImpl*, const char*);

    /**
     * equal
     */
inline bool equal(const char* a, StringImpl* b) ;

    /**
     * equalIgnoringCase
     */
bool equalIgnoringCase(StringImpl*, StringImpl*);

    /**
     * equalIgnoringCase
     */
bool equalIgnoringCase(StringImpl*, const char*);

    /**
     * equalIgnoringCase
     */
inline bool equalIgnoringCase(const char* a, StringImpl* b) ;

// Golden ratio - arbitrary start value to avoid mapping all 0's to all 0's
// or anything like that.
const unsigned phi = 0x9e3779b9U;

// Paul Hsieh's SuperFastHash
// http://www.azillionmonkeys.com/qed/hash.html
    /**
     * computeHash
     */
inline unsigned StringImpl::computeHash(const UChar* data, unsigned length);

// Paul Hsieh's SuperFastHash
// http://www.azillionmonkeys.com/qed/hash.html
    /**
     * computeHash
     */
inline unsigned StringImpl::computeHash(const char* data);

    /**
     * isSpaceOrNewline
     */
static inline bool isSpaceOrNewline(UChar c);

}

namespace WTF {

    // WebCore::StringHash is the default hash for StringImpl* and RefPtr<StringImpl>
    template<typename T> struct DefaultHash;
    template<> struct DefaultHash<WebCore::StringImpl*> {
        typedef WebCore::StringHash Hash;
    };
    template<> struct DefaultHash<RefPtr<WebCore::StringImpl> > {
        typedef WebCore::StringHash Hash;
    };

}

#endif




