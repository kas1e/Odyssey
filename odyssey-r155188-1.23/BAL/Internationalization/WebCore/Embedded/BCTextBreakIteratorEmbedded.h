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

#include <wtf/unicode/Unicode.h>

namespace WebCore {

    class TextBreakIterator;

    // Note: The returned iterator is good only until you get another iterator.

    // Iterates over "extended grapheme clusters", as defined in UAX #29.
    // Note that platform implementations may be less sophisticated - e.g. ICU prior to
    // version 4.0 only supports "legacy grapheme clusters".
    // Use this for general text processing, e.g. string truncation.
    TextBreakIterator* characterBreakIterator(const UChar*, int length);
    
    // This is similar to character break iterator in most cases, but is subject to
    // platform UI conventions. One notable example where this can be different
    // from character break iterator is Thai prepend characters, see bug 24342.
    // Use this for insertion point and selection manipulations.
    TextBreakIterator* cursorMovementIterator(const UChar*, int length);

    TextBreakIterator* wordBreakIterator(const UChar*, int length);
    TextBreakIterator* lineBreakIterator(const UChar*, int length);
    TextBreakIterator* sentenceBreakIterator(const UChar*, int length);

    int textBreakFirst(TextBreakIterator*);
    int textBreakLast(TextBreakIterator*);
    int textBreakNext(TextBreakIterator*);
    int textBreakPrevious(TextBreakIterator*);
    int textBreakCurrent(TextBreakIterator*);
    int textBreakPreceding(TextBreakIterator*, int);
    int textBreakFollowing(TextBreakIterator*, int);
    bool isTextBreak(TextBreakIterator*, int);

    const int TextBreakDone = -1;

}

#endif
