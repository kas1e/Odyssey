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
#ifndef StringTruncator_h
#define StringTruncator_h
/**
 *  @file  StringTruncator.t
 *  StringTruncator description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:06 $
 */
#include "BALBase.h"

namespace WKAL {
    
    class Font;
    class String;
    
    class StringTruncator : public WKALBase {
    public:
    /**
     * center truncate
     * @param[in] : text
     * @param[in] : max width
     * @param[in] : font
     * @param[in] : disable rounding hack value
     * @param[out] : the center text
     * @code
     * String c = StringTruncator::centerTruncate(s, 12, f);
     * @endcode
     */
        static String centerTruncate(const String&, float maxWidth, const Font&, bool disableRoundingHacks = true);
    /**
     * right truncate
     * @param[in] : text
     * @param[in] : max width
     * @param[in] : font
     * @param[in] : disable rounding hack value
     * @param[out] : the right text
     * @code
     * String c = StringTruncator::rightTruncate(s, 12, f);
     * @endcode
     */
        static String rightTruncate(const String&, float maxWidth, const Font&, bool disableRoundingHacks = true);

    /**
     * get width
     * @param[in] : text
     * @param[in] : font
     * @param[in] : disable rounding hack value
     * @param[out] : width
     * @code
     * float w = StringTruncator::width(s, f);
     * @endcode
     */
        static float width(const String&, const Font&, bool disableRoundingHacks = true);
    };
    
} // namespace WKAL

#endif // !defined(StringTruncator_h)




