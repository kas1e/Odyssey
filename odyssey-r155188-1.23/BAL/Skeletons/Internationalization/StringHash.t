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
#ifndef StringHash_h
#define StringHash_h
/**
 *  @file  StringHash.t
 *  StringHash description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:09 $
 */
#include "BALBase.h"

#include "AtomicStringImpl.h"
#include "PlatformString.h"
#include <wtf/HashTraits.h>
#include <wtf/unicode/Unicode.h>

namespace WebCore {

    // FIXME: We should really figure out a way to put the computeHash function that's
    // currently a member function of StringImpl into this file so we can be a little
    // closer to having all the nearly-identical hash functions in one place.

    struct StringHash {
    /**
     * hash
     * @param[in] : key
     * @param[out] : hash key
     */
        static unsigned hash(StringImpl* key) ;

    /**
     * equal
     * @param[in] : StringImpl
     * @param[in] : StringImpl
     * @param[out] : status
     */
        static bool equal(StringImpl* a, StringImpl* b);

    /**
     * hash 
     * @param[in] : key
     * @param[out] : hash key
     */
        static unsigned hash(const RefPtr<StringImpl>& key) ;

    /**
     * equal
     * @param[in] : RefPtr<StringImpl>
     * @param[in] : RefPtr<StringImpl>
     * @param[out] : status
     */
        static bool equal(const RefPtr<StringImpl>& a, const RefPtr<StringImpl>& b);

    /**
     * hash
     * @param[in] : key
     * @param[out] : hash key
     */
        static unsigned hash(const String& key) ;

    /**
     * equal
     * @param[in] : string
     * @param[in] : string
     * @param[out] : status
     */
        static bool equal(const String& a, const String& b);

        static const bool safeToCompareToEmptyOrDeleted = false;
    };

    class CaseFoldingHash : public WebCoreBase {
    private:
        // Golden ratio - arbitrary start value to avoid mapping all 0's to all 0's
        static const unsigned PHI = 0x9e3779b9U;
    public:
        // Paul Hsieh's SuperFastHash
        // http://www.azillionmonkeys.com/qed/hash.html
    /**
     * hash
     * @param[in] : unicode characters
     * @param[in] : length
     * @param[out] : hash key
     */
        static unsigned hash(const UChar* data, unsigned length);

    /**
     * hash 
     * @param[in] : StringImpl
     * @param[out] : hash key
     */
        static unsigned hash(StringImpl* str);
        
    /**
     * hash 
     */
        static unsigned hash(const char* str, unsigned length);
        
    /**
     * equal
     */
        static bool equal(StringImpl* a, StringImpl* b);

    /**
     * hash 
     */
        static unsigned hash(const RefPtr<StringImpl>& key) ;

    /**
     * equal 
     */
        static bool equal(const RefPtr<StringImpl>& a, const RefPtr<StringImpl>& b);

    /**
     * hash 
     */
        static unsigned hash(const String& key);

    /**
     * equal
     */
        static bool equal(const String& a, const String& b);

        static const bool safeToCompareToEmptyOrDeleted = false;
    };

    // This hash can be used in cases where the key is a hash of a string, but we don't
    // want to store the string. It's not really specific to string hashing, but all our
    // current uses of it are for strings.
    struct AlreadyHashed : IntHash<unsigned> {
    /**
     * hash
     */
        static unsigned hash(unsigned key) ;

        // To use a hash value as a key for a hash table, we need to eliminate the
        // "deleted" value, which is negative one. That could be done by changing
        // the string hash function to never generate negative one, but this works
        // and is still relatively efficient.
    /**
     * avoidDeletedValue
     * @param[in] : hash
     * @param[out] : value
     */
        static unsigned avoidDeletedValue(unsigned hash);
    };

}

namespace WTF {

    template<> struct HashTraits<WebCore::String> : GenericHashTraits<WebCore::String> {
        static const bool emptyValueIsZero = true;
    /**
     * construct deletedValue
     * @param[in] : slot
     */
        static void constructDeletedValue(WebCore::String& slot) ;

    /**
     * is deleted value
     * @param[in] : slot
     * @param[out] : status
     */
        static bool isDeletedValue(const WebCore::String& slot) ;
    };

}

#endif




