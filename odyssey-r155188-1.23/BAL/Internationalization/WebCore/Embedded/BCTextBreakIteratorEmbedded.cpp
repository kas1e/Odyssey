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

#include "config.h"
#include "Logging.h"
#include "TextBreakIterator.h"

#include "BALBase.h"
#include "NotImplemented.h"
#include "TextBreakIteratorInternalICU.h"
#include "PlatformString.h"
#include <wtf/Assertions.h>

namespace WebCore {
    
static bool isWordBreakChar(const UChar c)
{
    switch(c) {
    case ' ':
    case '\t':
    case '\n':
    case ',':
    case ';':
    case '.':
    case ':':
    case '"':
    case '?':
    case '!':
        return true;
    }
    
    return false;
}

    class TextBreakIterator
    {
    public:
        virtual ~TextBreakIterator(){};
        virtual int first() = 0;
        virtual int next() = 0;
        virtual int previous() = 0;
        inline int last() {
            return preceding(length - 1);
        }
        
        inline int following(int pos) {
            currentPos = pos;
            return next();
        }
        inline int preceding(int pos) {
            currentPos = pos;
            return previous();
        }
        int currentPos;
        const UChar *string;
        int length;
    };

    class WordBreakIterator : public TextBreakIterator
    {
    public:
        virtual int first();
        virtual int next();
        virtual int previous();
    };

    class CharBreakIterator : public TextBreakIterator
    {
    public:
        virtual int first();
        virtual int next();
        virtual int previous();
        Vector<UChar> layout;
    };

    int WordBreakIterator::first() {
        currentPos = 0;
        return currentPos;
    }

    int WordBreakIterator::next() {
        if (currentPos >= length) {
            currentPos = -1;
            return currentPos;
        }
        while (currentPos < length) {
            if (isWordBreakChar(string[currentPos]))
                break;
            ++currentPos;
        }
        return currentPos;
    }
    int WordBreakIterator::previous() {
        if (currentPos <= 0) {
            currentPos = -1;
            return currentPos;
        }
        while (currentPos > 0) {
            if (isWordBreakChar(string[currentPos]))
                break;
            --currentPos;
        }
        return (currentPos > 0) ? ++currentPos : -1;
    }

    int CharBreakIterator::first() {
        currentPos = 0;
        return currentPos;
    }
    
    int CharBreakIterator::next() {
        if (currentPos == length)
            return -1;
        currentPos++;
        return currentPos;
    }

    int CharBreakIterator::previous() {
        if (currentPos == 0)
            return -1;
        currentPos--;
        return currentPos;
    }


TextBreakIterator* wordBreakIterator(const UChar* string, int length)
{
    static WordBreakIterator *iterator = 0;
    if (!iterator)
        iterator = new WordBreakIterator;

    iterator->string = string;
    iterator->length = length;
    iterator->currentPos = 0;

    return iterator;
}

TextBreakIterator* characterBreakIterator(const UChar* string, int length)
{
    static CharBreakIterator *iterator = 0;
    if (!iterator)
        iterator = new CharBreakIterator;

    iterator->string = string;
    iterator->length = length;
    iterator->currentPos = 0;
    for( int i=0; i< length; i++ )
        iterator->layout.append( string[i] );

    return iterator;
}

TextBreakIterator* cursorMovementIterator(const UChar* string, int length)
{
    return characterBreakIterator(string, length);
}

TextBreakIterator* lineBreakIterator(const UChar*, int)
{
    notImplemented();
    return 0;
}

TextBreakIterator* sentenceBreakIterator(const UChar*, int)
{
    notImplemented();
    return 0;
}

int textBreakFirst(TextBreakIterator* bi)
{
    return bi->first();
}

int textBreakLast(TextBreakIterator* bi)
{
    return bi->last();
}

int textBreakNext(TextBreakIterator* bi)
{
    return bi->next();
}

int textBreakPrevious(TextBreakIterator* bi)
{
    return bi->previous();
}

int textBreakPreceding(TextBreakIterator* bi, int pos)
{
    return bi->preceding(pos);
}

int textBreakFollowing(TextBreakIterator* bi, int pos)
{
    return bi->following(pos);
}

int textBreakCurrent(TextBreakIterator* bi)
{
    return bi->currentPos;
}

bool isTextBreak(TextBreakIterator*, int)
{
    return true;
}

}
