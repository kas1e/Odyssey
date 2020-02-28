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
#ifndef TextBreakIterator_h
#define TextBreakIterator_h
/**
 *  @file  TextBreakIterator.t
 *  TextBreakIterator description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:09 $
 */
#include "BALBase.h"

#include <wtf/unicode/Unicode.h>

namespace WebCore {

    class TextBreakIterator;

    // Note: The returned iterator is good only until you get another iterator.
    /**
     * get character break iterator
     * @param[in] : unicode character
     * @param[in] : length
     * @param[out] : TextBreakIterator
     */
    TextBreakIterator* characterBreakIterator(const UChar*, int length);

    /**
     * get word break iterator 
     * @param[in] : unicode character
     * @param[in] : length
     * @param[out] : TextBreakIterator
     */
    TextBreakIterator* wordBreakIterator(const UChar*, int length);

    /**
     * get line break iterator
     * @param[in] : unicode char
     * @param[in] : length
     * @param[out] : TextBreakIterator
     */
    TextBreakIterator* lineBreakIterator(const UChar*, int length);

    /**
     * get sentence break iterator
     * @param[in] : unicode char
     * @param[in] : length
     * @param[out] : TextBreakIterator
     */
    TextBreakIterator* sentenceBreakIterator(const UChar*, int length);

    /**
     * get text break first 
     * @param[in] : TextBreakIterator
     * @param[out] : position
     */
    int textBreakFirst(TextBreakIterator*);

    /**
     * get text break next 
     * @param[in] : TextBreakIterator
     * @param[out] : position
     */
    int textBreakNext(TextBreakIterator*);

    /**
     * get text break current
     * @param[in] : TextBreakIterator
     * @param[out] : position
     */
    int textBreakCurrent(TextBreakIterator*);

    /**
     * get text break preceding
     * @param[in] : TextBreakIterator
     * @param[in] : position
     * @param[out] : position
     */
    int textBreakPreceding(TextBreakIterator*, int);

    /**
     * get text break following 
     * @param[in] : TextBreakIterator
     * @param[in] : position
     * @param[out] : position
     */
    int textBreakFollowing(TextBreakIterator*, int);

    /**
     * test if it's a text break
     * @param[in] : TextBreakIterator
     * @param[in] : position
     * @param[out] : status
     */
    bool isTextBreak(TextBreakIterator*, int);

    const int TextBreakDone = -1;

}

#endif




