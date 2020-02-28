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
#ifndef WTF_ASCIICType_h
#define WTF_ASCIICType_h
/**
 *  @file  ASCIICType.t
 *  ASCIICType description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:10 $
 */
#include "BALBase.h"

#include <wtf/Platform.h>

// The behavior of many of the functions in the <ctype.h> header is dependent
// on the current locale. But in the WebKit project, all uses of those functions
// are in code processing something that's not locale-specific. These equivalents
// for some of the <ctype.h> functions are named more explicitly, not dependent
// on the C library locale, and we should also optimize them as needed.

// All functions return false or leave the character unchanged if passed a character
// that is outside the range 0-7F. So they can be used on Unicode strings or
// characters if the intent is to do processing only if the character is ASCII.

namespace WTF {

    /**
     *  isASCIIAlpha description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIAlpha(char c) ;
    /**
     *  isASCIIAlpha description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIAlpha(unsigned short c) ;
#if !COMPILER(MSVC) || defined(_NATIVE_WCHAR_T_DEFINED)
    /**
     *  isASCIIAlpha description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIAlpha(wchar_t c) ;
#endif
    /**
     *  isASCIIAlpha description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIAlpha(int c) ;

    /**
     *  isASCIIAlphanumeric description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIAlphanumeric(char c) ;
    /**
     *  isASCIIAlphanumeric description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIAlphanumeric(unsigned short c) ;
#if !COMPILER(MSVC) || defined(_NATIVE_WCHAR_T_DEFINED)
    /**
     *  isASCIIAlphanumeric description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIAlphanumeric(wchar_t c) ;
#endif
    /**
     *  isASCIIAlphanumeric description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIAlphanumeric(int c) ;

    /**
     *  isASCIIDigit description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIDigit(char c) ;
    /**
     *  isASCIIDigit description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIDigit(unsigned short c) ;
#if !COMPILER(MSVC) || defined(_NATIVE_WCHAR_T_DEFINED)
    /**
     *  isASCIIDigit description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIDigit(wchar_t c) ;
#endif
    /**
     *  isASCIIDigit description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIDigit(int c) ;

    /**
     *  isASCIIHexDigit description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIHexDigit(char c) ;
    /**
     *  isASCIIHexDigit description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIHexDigit(unsigned short c) ;
#if !COMPILER(MSVC) || defined(_NATIVE_WCHAR_T_DEFINED)
    /**
     *  isASCIIHexDigit description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIHexDigit(wchar_t c) ;
#endif
    /**
     *  isASCIIHexDigit description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIHexDigit(int c) ;


    /**
     *  isASCIIOctalDigit description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIOctalDigit(char c) ;


    /**
     *  isASCIIOctalDigit description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIOctalDigit(unsigned short c) ;


    /**
     *  isASCIIOctalDigit description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIOctalDigit(wchar_t c) ;


    /**
     *  isASCIIOctalDigit description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIOctalDigit(int c) ;

    /**
     *  isASCIILower description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIILower(char c) ;
    /**
     *  isASCIILower description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIILower(unsigned short c) ;
#if !COMPILER(MSVC) || defined(_NATIVE_WCHAR_T_DEFINED)
    /**
     *  isASCIILower description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIILower(wchar_t c) ;
#endif
    /**
     *  isASCIILower description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIILower(int c) ;

    /**
     *  isASCIIUpper description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIUpper(char c) ;
    /**
     *  isASCIIUpper description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIUpper(unsigned short c) ;
#if !COMPILER(MSVC) || defined(_NATIVE_WCHAR_T_DEFINED)
    /**
     *  isASCIIUpper description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIUpper(wchar_t c) ;
#endif
    /**
     *  isASCIIUpper description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIIUpper(int c) ;

    /*
        Statistics from a run of Apple's page load test for callers of isASCIISpace:

            character          count
            ---------          -----
            non-spaces         689383
        20  space              294720
        0A  \n                 89059
        09  \t                 28320
        0D  \r                 0
        0C  \f                 0
        0B  \v                 0
    */
    inline bool isASCIISpace(char c) { return c <= ' ' && (c == ' ' || (c <= 0xD && c >= 0x9)); }
    /**
     *  isASCIISpace description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIISpace(unsigned short c) ;
#if !COMPILER(MSVC) || defined(_NATIVE_WCHAR_T_DEFINED)
    /**
     *  isASCIISpace description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIISpace(wchar_t c) ;
#endif
    /**
     *  isASCIISpace description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline bool isASCIISpace(int c) ;

    /**
     *  toASCIILower description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline char toASCIILower(char c) ;
    /**
     *  toASCIILower description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline unsigned short toASCIILower(unsigned short c) ;
#if !COMPILER(MSVC) || defined(_NATIVE_WCHAR_T_DEFINED)
    /**
     *  toASCIILower description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline wchar_t toASCIILower(wchar_t c) ;
#endif
    /**
     *  toASCIILower description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline int toASCIILower(int c) ;

    /**
     *  toASCIIUpper description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline char toASCIIUpper(char c) ;
    /**
     *  toASCIIUpper description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline unsigned short toASCIIUpper(unsigned short c) ;
#if !COMPILER(MSVC) || defined(_NATIVE_WCHAR_T_DEFINED)
    /**
     *  toASCIIUpper description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline wchar_t toASCIIUpper(wchar_t c) ;
#endif
    /**
     *  toASCIIUpper description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline int toASCIIUpper(int c) ;

    /**
     *  toASCIIHexValue description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline int toASCIIHexValue(char c) ;
    /**
     *  toASCIIHexValue description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline int toASCIIHexValue(unsigned short c) ;
#if !COMPILER(MSVC) || defined(_NATIVE_WCHAR_T_DEFINED)
    /**
     *  toASCIIHexValue description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline int toASCIIHexValue(wchar_t c) ;
#endif
    /**
     *  toASCIIHexValue description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline int toASCIIHexValue(int c) ;

}

#endif
