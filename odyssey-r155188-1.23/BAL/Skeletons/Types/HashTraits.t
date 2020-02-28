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
#ifndef WTF_HashTraits_h
#define WTF_HashTraits_h
/**
 *  @file  HashTraits.t
 *  HashTraits description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#include "Assertions.h"
#include "HashFunctions.h"
#include <utility>
#include <limits>

namespace WTF {

    using std::pair;
    using std::make_pair;

    template<typename T> struct IsInteger           { static const bool value = false; };
    template<> struct IsInteger<bool>               { static const bool value = true; };
    template<> struct IsInteger<char>               { static const bool value = true; };
    template<> struct IsInteger<signed char>        { static const bool value = true; };
    template<> struct IsInteger<unsigned char>      { static const bool value = true; };
    template<> struct IsInteger<short>              { static const bool value = true; };
    template<> struct IsInteger<unsigned short>     { static const bool value = true; };
    template<> struct IsInteger<int>                { static const bool value = true; };
    template<> struct IsInteger<unsigned int>       { static const bool value = true; };
    template<> struct IsInteger<long>               { static const bool value = true; };
    template<> struct IsInteger<unsigned long>      { static const bool value = true; };
    template<> struct IsInteger<long long>          { static const bool value = true; };
    template<> struct IsInteger<unsigned long long> { static const bool value = true; };

#if !COMPILER(MSVC) || defined(_NATIVE_WCHAR_T_DEFINED)
    template<> struct IsInteger<wchar_t>            { static const bool value = true; };
#endif

    /**
     *  COMPILE_ASSERT description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    COMPILE_ASSERT(IsInteger<bool>::value, WTF_IsInteger_bool_true);
    /**
     *  COMPILE_ASSERT description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    COMPILE_ASSERT(IsInteger<char>::value, WTF_IsInteger_char_true);
    /**
     *  COMPILE_ASSERT description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    COMPILE_ASSERT(IsInteger<signed char>::value, WTF_IsInteger_signed_char_true);
    /**
     *  COMPILE_ASSERT description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    COMPILE_ASSERT(IsInteger<unsigned char>::value, WTF_IsInteger_unsigned_char_true);
    /**
     *  COMPILE_ASSERT description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    COMPILE_ASSERT(IsInteger<short>::value, WTF_IsInteger_short_true);
    /**
     *  COMPILE_ASSERT description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    COMPILE_ASSERT(IsInteger<unsigned short>::value, WTF_IsInteger_unsigned_short_true);
    /**
     *  COMPILE_ASSERT description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    COMPILE_ASSERT(IsInteger<int>::value, WTF_IsInteger_int_true);
    /**
     *  COMPILE_ASSERT description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    COMPILE_ASSERT(IsInteger<unsigned int>::value, WTF_IsInteger_unsigned_int_true);
    /**
     *  COMPILE_ASSERT description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    COMPILE_ASSERT(IsInteger<long>::value, WTF_IsInteger_long_true);
    /**
     *  COMPILE_ASSERT description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    COMPILE_ASSERT(IsInteger<unsigned long>::value, WTF_IsInteger_unsigned_long_true);
    /**
     *  COMPILE_ASSERT description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    COMPILE_ASSERT(IsInteger<long long>::value, WTF_IsInteger_long_long_true);
    /**
     *  COMPILE_ASSERT description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    COMPILE_ASSERT(IsInteger<unsigned long long>::value, WTF_IsInteger_unsigned_long_long_true);

#if !COMPILER(MSVC) || defined(_NATIVE_WCHAR_T_DEFINED)
    /**
     *  COMPILE_ASSERT description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    COMPILE_ASSERT(IsInteger<wchar_t>::value, WTF_IsInteger_wchar_t_true);
#endif

    /**
     *  COMPILE_ASSERT description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    COMPILE_ASSERT(!IsInteger<char*>::value, WTF_IsInteger_char_pointer_false);
    /**
     *  COMPILE_ASSERT description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    COMPILE_ASSERT(!IsInteger<const char* >::value, WTF_IsInteger_const_char_pointer_false);
    /**
     *  COMPILE_ASSERT description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    COMPILE_ASSERT(!IsInteger<volatile char* >::value, WTF_IsInteger_volatile_char_pointer__false);
    /**
     *  COMPILE_ASSERT description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    COMPILE_ASSERT(!IsInteger<double>::value, WTF_IsInteger_double_false);
    /**
     *  COMPILE_ASSERT description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    COMPILE_ASSERT(!IsInteger<float>::value, WTF_IsInteger_float_false);

    template<typename T> struct HashTraits;

    template<bool isInteger, typename T> struct GenericHashTraitsBase;

    template<typename T> struct GenericHashTraitsBase<false, T> {
        static const bool emptyValueIsZero = false;
        static const bool needsDestruction = true;
    };

    // default integer traits disallow both 0 and -1 as keys (max value instead of -1 for unsigned)
    template<typename T> struct GenericHashTraitsBase<true, T> {
        static const bool emptyValueIsZero = true;
        static const bool needsDestruction = false;
    /**
     * constructDeletedValue
     */
	static void constructDeletedValue(T& slot) ;
    /**
     *  isDeletedValue description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool isDeletedValue(T value) ;
    };

    template<typename T> struct GenericHashTraits : GenericHashTraitsBase<IsInteger<T>::value, T> {
        typedef T TraitType;
    /**
     *  emptyValue description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static T emptyValue() ;
    };

    template<typename T> struct HashTraits : GenericHashTraits<T> { };

    template<typename T> struct FloatHashTraits : GenericHashTraits<T> {
        static const bool needsDestruction = false;
    /**
     *  emptyValue description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static T emptyValue() ;
    /**
     *  constructDeletedValue description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void constructDeletedValue(T& slot) ;
    /**
     *  isDeletedValue description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool isDeletedValue(T value) ;
    };

    template<> struct HashTraits<float> : FloatHashTraits<float> { };
    template<> struct HashTraits<double> : FloatHashTraits<double> { };

    template<typename P> struct HashTraits<P*> : GenericHashTraits<P*> {
        static const bool emptyValueIsZero = true;
        static const bool needsDestruction = false;
    /**
     * constructDeletedValue
     */
	static void constructDeletedValue(P*& slot) ;
    /**
     *  isDeletedValue description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool isDeletedValue(P* value) ;
    };

    template<typename P> struct HashTraits<RefPtr<P> > : GenericHashTraits<RefPtr<P> > {
        static const bool emptyValueIsZero = true ;

    /**
     * constructDeletedValue
     */
	static void constructDeletedValue(RefPtr<P>& slot) ;

    /**
     *  isDeletedValue description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool isDeletedValue(const RefPtr<P>& value) ;
    };

    // special traits for pairs, helpful for their use in HashMap implementation

    template<typename FirstTraitsArg, typename SecondTraitsArg>     struct PairHashTraits : GenericHashTraits<pair<typename FirstTraitsArg::TraitType, typename SecondTraitsArg::TraitType> > {
        typedef FirstTraitsArg FirstTraits;
        typedef SecondTraitsArg SecondTraits;
        typedef pair<typename FirstTraits::TraitType, typename SecondTraits::TraitType> TraitType;

        static const bool emptyValueIsZero = FirstTraits::emptyValueIsZero && SecondTraits::emptyValueIsZer

        static const bool needsDestruction = FirstTraits::needsDestruction || SecondTraits::needsDestruction;
    /**
     * emptyValue
     */
        static TraitType emptyValue() ;

	static const bool needsDestruction = FirstTraits::needsDestruction || SecondTraits::needsDestruction ;

    /**
     *  constructDeletedValue description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void constructDeletedValue(TraitType& slot) ;
     /**
      * isDeletedValue
      */
	static bool isDeletedValue(const TraitType& value) ;

    };

    template<typename First, typename Second>     struct HashTraits<pair<First, Second> > : public PairHashTraits<HashTraits<First>, HashTraits<Second> > { };

} // namespace WTF

using WTF::HashTraits;
using WTF::PairHashTraits;

#endif // WTF_HashTrait
