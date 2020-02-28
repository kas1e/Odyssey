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
#ifndef WTF_StringExtras_h
#define WTF_StringExtras_h
/**
 *  @file  StringExtras.t
 *  StringExtras description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#include <stdio.h>
#include <stdarg.h>

#if COMPILER(MSVC)

    /**
     * snprintf place output followed by the null byte, ’\0’ , in consecutive bytes starting at *str; it is the user’s responsibility to ensure  that  enough  space  is available.
     * @param[in] : a string
     * @param[in] : size of the buffer
     * @param[in] : variadics parameters.
     * @param[out] : return the number of bytes that would be written to str had n been sufficiently large excluding the terminating null byte.
     * @code
     * @endcode
     */
inline int snprintf(char *str, size_t size, const char* format, ...) ;
    /**
     * strcasecmp compare, while ignoring differences in case, the string pointed to by s1 to the string pointed to by s2.
     * @param[in] : a string
     * @param[in] : a string
     * @param[out] :  return an integer greater than, equal to, or less than 0, if the string pointed to by s1 is, ignoring case, greater than, equal to, or less than the string pointed to by s2, respectively.
     * @code
     * @endcode
     */
inline int strcasecmp(const char* s1, const char* s2) ;
    

#if COMPILER(MSVC7)
// MSVC8 and above define this function
#define vsnprintf snprintf
#endif

    /**
     * strncasecmp compare, while ignoring differences in case, not more than n bytes from the string pointed to by s1 to the string pointed to by s2.
     * @param[in] : a string
     * @param[in] : a string
     * @param[in] : an integer
     * @param[out] : return an integer greater than, equal to, or less than 0, if the possibly null-terminated array pointed to by s1  is, ignoring case, greater than, equal to, or less than the possibly null-terminated array pointed to by s2, respectively.
     * @code
     * @endcode
     */
inline int strncasecmp(const char* s1, const char* s2, size_t len) ;

#endif

#endif // WTF_StringExtras_h



