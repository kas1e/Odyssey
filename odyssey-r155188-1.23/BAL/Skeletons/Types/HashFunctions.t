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
#ifndef WTF_HashFunctions_h
#define WTF_HashFunctions_h
/**
 *  @file  HashFunctions.t
 *  HashFunctions description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#include "RefPtr.h"
#include <stdint.h>

namespace WTF {

    template<size_t size> struct IntTypes;
    template<> struct IntTypes<1> { typedef int8_t SignedType; typedef uint8_t UnsignedType; };
    template<> struct IntTypes<2> { typedef int16_t SignedType; typedef uint16_t UnsignedType; };
    template<> struct IntTypes<4> { typedef int32_t SignedType; typedef uint32_t UnsignedType; };
    template<> struct IntTypes<8> { typedef int64_t SignedType; typedef uint64_t UnsignedType; };

    // integer hash function

    // Thomas Wang's 32 Bit Mix Function: http://www.cris.com/~Ttwang/tech/inthash.htm
    /**
     * Compute a hash from a 1byte key.
     * @param[in] : a 1 byte key.
     * @param[out] : a hash.
     * @code
     * @endcode
     */
    inline unsigned intHash(uint8_t key8);

    // Thomas Wang's 32 Bit Mix Function: http://www.cris.com/~Ttwang/tech/inthash.htm
    /**
     * Compute a hash from 2 1bytes key.
     * @param[in] : a 2 bytes key.
     * @param[out] : a hash.
     * @code
     * @endcode
     */
    inline unsigned intHash(uint16_t key16);

    // Thomas Wang's 32 Bit Mix Function: http://www.cris.com/~Ttwang/tech/inthash.htm
    /**
     * Compute a hash from 4 1bytes key.
     * @param[in] : a 4 bytes key.
     * @param[out] : a hash.
     * @code
     * @endcode
     */
    inline unsigned intHash(uint32_t key) ;
    
    // Thomas Wang's 64 bit Mix Function: http://www.cris.com/~Ttwang/tech/inthash.htm
    /**
     * Compute a hash from 8 1bytes key.
     * @param[in] : a 8 bytes key.
     * @param[out] : a hash.
     * @code
     * @endcode
     */
    inline unsigned intHash(uint64_t key);

    template<typename T> struct IntHash {
    /**
     *  hash description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static unsigned hash(T key) ;
    /**
     *  equal description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool equal(T a, T b) ;
        static const bool safeToCompareToEmptyOrDeleted = true;
    };

    template<typename T> struct FloatHash {
    /**
     *  hash description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static unsigned hash(T key);
    /**
     *  equal description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool equal(T a, T b) ;
        static const bool safeToCompareToEmptyOrDeleted = true;
    };

    // pointer identity hash function

    template<typename T> struct PtrHash {
    /**
     *  hash description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static unsigned hash(T key);
    /**
     *  equal description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool equal(T a, T b) ;
        static const bool safeToCompareToEmptyOrDeleted = true;
    };
    template<typename P> struct PtrHash<RefPtr<P> > : PtrHash<P*> {
        using PtrHash<P*>::hash;
    /**
     *  hash description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static unsigned hash(const RefPtr<P>& key) ;
        using PtrHash<P*>::equal;
    /**
     *  equal description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool equal(const RefPtr<P>& a, const RefPtr<P>& b) ;
    /**
     *  equal description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool equal(P* a, const RefPtr<P>& b) ;
    /**
     *  equal description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool equal(const RefPtr<P>& a, P* b) ;
    };

    // default hash function for each type

    template<typename T> struct DefaultHash;

    template<typename T, typename U> struct PairHash {
    /**
     *  hash description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static unsigned hash(const std::pair<T, U>& p);
    /**
     *  equal description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool equal(const std::pair<T, U>& a, const std::pair<T, U>& b);
        static const bool safeToCompareToEmptyOrDeleted = DefaultHash<T>::Hash::safeToCompareToEmptyOrDeleted 
                                                            && DefaultHash<U>::Hash::safeToCompareToEmptyOrDeleted;
    };

    // make IntHash the default hash function for many integer types

    template<> struct DefaultHash<short> { typedef IntHash<unsigned> Hash; };
    template<> struct DefaultHash<unsigned short> { typedef IntHash<unsigned> Hash; };
    template<> struct DefaultHash<int> { typedef IntHash<unsigned> Hash; };
    template<> struct DefaultHash<unsigned> { typedef IntHash<unsigned> Hash; };
    template<> struct DefaultHash<long> { typedef IntHash<unsigned long> Hash; };
    template<> struct DefaultHash<unsigned long> { typedef IntHash<unsigned long> Hash; };
    template<> struct DefaultHash<long long> { typedef IntHash<unsigned long long> Hash; };
    template<> struct DefaultHash<unsigned long long> { typedef IntHash<unsigned long long> Hash; };

#if !COMPILER(MSVC) || defined(_NATIVE_WCHAR_T_DEFINED)
    template<> struct DefaultHash<wchar_t> { typedef IntHash<wchar_t> Hash; };
#endif

    template<> struct DefaultHash<float> { typedef FloatHash<float> Hash; };
    template<> struct DefaultHash<double> { typedef FloatHash<double> Hash; };

    // make PtrHash the default hash function for pointer types that don't specialize

    template<typename P> struct DefaultHash<P*> { typedef PtrHash<P*> Hash; };
    template<typename P> struct DefaultHash<RefPtr<P> > { typedef PtrHash<RefPtr<P> > Hash; };

    template<typename T, typename U> struct DefaultHash<std::pair<T, U> > { typedef PairHash<T, U> Hash; };

} // namespace WTF

using WTF::DefaultHash;
using WTF::IntHash;
using WTF::PtrHash;

#endif // WTF_HashFunctions_h




