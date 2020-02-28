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
#ifndef WTF_VectorTraits_h
#define WTF_VectorTraits_h
/**
 *  @file  VectorTraits.t
 *  VectorTraits description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#include "RefPtr.h"
#include <utility>
#include <memory>

using std::pair;

namespace WTF {

    template <typename T> struct IsPod           { static const bool value = false; };
    template <> struct IsPod<bool>               { static const bool value = true; };
    template <> struct IsPod<char>               { static const bool value = true; };
    template <> struct IsPod<signed char>        { static const bool value = true; };
    template <> struct IsPod<unsigned char>      { static const bool value = true; };
    template <> struct IsPod<short>              { static const bool value = true; };
    template <> struct IsPod<unsigned short>     { static const bool value = true; };
    template <> struct IsPod<int>                { static const bool value = true; };
    template <> struct IsPod<unsigned int>       { static const bool value = true; };
    template <> struct IsPod<long>               { static const bool value = true; };
    template <> struct IsPod<unsigned long>      { static const bool value = true; };
    template <> struct IsPod<long long>          { static const bool value = true; };
    template <> struct IsPod<unsigned long long> { static const bool value = true; };
    template <> struct IsPod<float>              { static const bool value = true; };
    template <> struct IsPod<double>             { static const bool value = true; };
    template <> struct IsPod<long double>        { static const bool value = true; };
    template <typename P> struct IsPod<P *>      { static const bool value = true; };

    template<bool isPod, typename T>     class VectorTraitsBase;

    template<typename T>     struct VectorTraitsBase<false, T>
    {
        static const bool needsDestruction = true;
        static const bool needsInitialization = true;
        static const bool canInitializeWithMemset = false;
        static const bool canMoveWithMemcpy = false;
        static const bool canCopyWithMemcpy = false;
        static const bool canFillWithMemset = false;
        static const bool canCompareWithMemcmp = false;
    };

    template<typename T>     struct VectorTraitsBase<true, T>
    {
        static const bool needsDestruction = false;
        static const bool needsInitialization = false;
        static const bool canInitializeWithMemset = false;
        static const bool canMoveWithMemcpy = true;
        static const bool canCopyWithMemcpy = true;
    /**
     *  sizeof description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static const bool canFillWithMemset = sizeof(T) == sizeof(char);
        static const bool canCompareWithMemcmp = true;
    };

    template<typename T>     struct VectorTraits : VectorTraitsBase<IsPod<T>::value, T> { };

    struct SimpleClassVectorTraits
    {
        static const bool needsDestruction = true;
        static const bool needsInitialization = true;
        static const bool canInitializeWithMemset = true;
        static const bool canMoveWithMemcpy = true;
        static const bool canCopyWithMemcpy = false;
        static const bool canFillWithMemset = false;
        static const bool canCompareWithMemcmp = true;
    };

    // we know RefPtr is simple enough that initializing to 0 and moving with memcpy
    // (and then not destructing the original) will totally work
    template<typename P>     struct VectorTraits<RefPtr<P> > : SimpleClassVectorTraits { };
    
    template<typename P>     struct VectorTraits<std::auto_ptr<P> > : SimpleClassVectorTraits { };

    template<typename First, typename Second>     struct VectorTraits<pair<First, Second> >
    {
        typedef VectorTraits<First> FirstTraits;
        typedef VectorTraits<Second> SecondTraits;

        static const bool needsDestruction = FirstTraits::needsDestruction || SecondTraits::needsDestruction;
        static const bool needsInitialization = FirstTraits::needsInitialization || SecondTraits::needsInitialization;
        static const bool canInitializeWithMemset = FirstTraits::canInitializeWithMemset && SecondTraits::canInitializeWithMemset;
        static const bool canMoveWithMemcpy = FirstTraits::canMoveWithMemcpy && SecondTraits::canMoveWithMemcpy;
        static const bool canCopyWithMemcpy = FirstTraits::canCopyWithMemcpy && SecondTraits::canCopyWithMemcpy;
        static const bool canFillWithMemset = false;
        static const bool canCompareWithMemcmp = FirstTraits::canCompareWithMemcmp && SecondTraits::canCompareWithMemcmp;
    };

} // namespace WTF

using WTF::VectorTraits;
using WTF::SimpleClassVectorTraits;

#endif // WTF_VectorTraits_h




