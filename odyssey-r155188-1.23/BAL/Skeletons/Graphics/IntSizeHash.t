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
#ifndef IntSizeHash_h
#define IntSizeHash_h
/**
 *  @file  IntSizeHash.t
 *  IntSizeHash description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:07 $
 */
#include "BALBase.h"

#include "IntSize.h"
#include <wtf/HashMap.h>
#include <wtf/HashSet.h>

using WebCore::IntSize;

namespace WTF {

    template<> struct IntHash<IntSize> {
    /**
     * hash 
     * @param[in] : hash key
     * @param[out] : hash result
     * @code
     * unsigned h = ih->hash(k);
     * @endcode
     */
        static unsigned hash(const IntSize& key) ;

    /**
     * test if the IntSize are equal
     * @param[in] : IntSize
     * @param[in] : IntSize
     * @param[out] : true if the IntSize are equal
     * @code
     * bool e = ih->equal(s1, s2);
     * @endcode
     */
        static bool equal(const IntSize& a, const IntSize& b) ;
        static const bool safeToCompareToEmptyOrDeleted = true;
    };
    template<> struct DefaultHash<IntSize> { typedef IntHash<IntSize> Hash; };
    
    template<> struct HashTraits<IntSize> : GenericHashTraits<IntSize> {
        static const bool emptyValueIsZero = true;
        static const bool needsDestruction = false;
    /**
     * construct deleted value 
     * @param[in] : size
     */
        static void constructDeletedValue(IntSize& slot) ;
    /**
     * test if it's a deleted value
     * @param[in] : value
     * @param[out] : true if it's a deleted value
     */
        static bool isDeletedValue(const IntSize& value) ;
    };
} // namespace WTF

#endif




