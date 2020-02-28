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
#ifndef SegmentedString_h
#define SegmentedString_h
/**
 *  @file  SegmentedString.t
 *  SegmentedString description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:09 $
 */
#include "BALBase.h"

#include "PlatformString.h"
#include <wtf/Deque.h>

namespace WebCore {

class SegmentedString;

class SegmentedSubstring : public WebCoreBase {
public:
    /**
     * SegmentedSubstring default constructor
     */
    SegmentedSubstring();

    /**
     * SegmentedSubstring constructor
     * @param[in] : string
     */
    SegmentedSubstring(const String& str);

    /**
     * SegmentedSubstring constructor
     * @param[in] : unicode characters
     * @param[out] : length
     */
    SegmentedSubstring(const UChar* str, int length);

    /**
     * clear
     * @code
     * s->clear();
     * @endcode
     */
    void clear() ;
    
    /**
     * exclude line numbers
     * @param[out] : status
     * @code
     * bool e = s->excludeLineNumbers();
     * @endcode
     */
    bool excludeLineNumbers() const ;

    /**
     * do not exclude line numbers
     * @param[out] : status
     * @code
     * bool d = s->doNotExcludeLineNumbers();
     * @endcode
     */
    bool doNotExcludeLineNumbers() const ;

    /**
     * set exclude line numbers
     * @code
     * s->setExcludeLineNumbers();
     * @endcode
     */
    void setExcludeLineNumbers() ;

    /**
     * append string to SegmentedSubstring
     * @param[in] : string
     * @code
     * s->appendTo(str);
     * @endcode
     */
    void appendTo(String& str) const;

public:
    int m_length;
    const UChar* m_current;

private:
    String m_string;
    bool m_doNotExcludeLineNumbers;
};

class SegmentedString {
public:
    /**
     * SegmentedString default constructor
     */
    SegmentedString();

    /**
     * SegmentedString constructor
     * @param[in] : unicode characters
     * @param[in] : length
     */
    SegmentedString(const UChar* str, int length);

    /**
     * SegmentedString constructor
     * @param[in] : string
     */
    SegmentedString(const String& str);

    /**
     * SegmentedString constructor by copy
     * @param[in] : SegmentedString
     */
    SegmentedString(const SegmentedString&);

    /**
     * operator= 
     */
    const SegmentedString& operator=(const SegmentedString&);

    /**
     * clear
     * @code
     * s->clear();
     * @endcode
     */
    void clear();

    /**
     * append
     * @param[in] : SegmentedString
     * @code
     * s->append(s1);
     * @endcode
     */
    void append(const SegmentedString&);

    /**
     * prepend
     * @param[in] : SegmentedString
     * @code
     * s->prepend(s1);
     * @endcode
     */
    void prepend(const SegmentedString&);
    
    /**
     * exclude line numbers
     * @param[out] : status
     * @code
     * bool e = s->excludeLineNumbers();
     * @endcode
     */
    bool excludeLineNumbers() const ;

    /**
     * set exclude line numbers
     * @code
     * s->setExcludeLineNumbers();
     * @endcode
     */
    void setExcludeLineNumbers();

    /**
     * push
     * @param[in] : unicode character
     * @code
     * s->push(c);
     * @endcode
     */
    void push(UChar c);
    
    /**
     * test if the SegmentedString is empty
     * @param[out] : status
     * @code
     * s->isEmpty();
     * @endcode
     */
    bool isEmpty() const ;

    /**
     * get length
     * @param[out] : length
     * @code
     * unsigned l = s->length();
     * @endcode
     */
    unsigned length() const;

    /**
     * advance
     * @code
     * s->advance();
     * @endcode
     */
    void advance();
    
    /**
     * advance past new line
     * @param[in] : line number
     * @code
     * s->advancePastNewline(l);
     * @endcode
     */
    void advancePastNewline(int& lineNumber);
    
    /**
     * advance past non new line
     * @code
     * s->advancePastNonNewline();
     * @endcode
     */
    void advancePastNonNewline();
    
    /**
     * advance
     * @param[in] : line number
     * @code
     * s->advance(l);
     * @endcode
     */
    void advance(int& lineNumber);
    
    /**
     * escaped
     * @code
     * s->escaped();
     * @endcode
     */
    bool escaped() const ;
    
    /**
     * to string
     * @code
     * String t = s->toString();
     * @endcode
     */
    String toString() const;

    /**
     * operator*
     */
    const UChar& operator*() const ;

    /**
     * operator-> 
     */
    const UChar* operator->() const ;
    
private:
    /**
     * append 
     */
    void append(const SegmentedSubstring&);

    /**
     * prepend
     */
    void prepend(const SegmentedSubstring&);

    /**
     * advanceSlowCase
     */
    void advanceSlowCase();

    /**
     * advanceSlowCase
     */
    void advanceSlowCase(int& lineNumber);

    /**
     * advanceSubstring 
     */
    void advanceSubstring();

    /**
     * current 
     */
    const UChar* current() const ;

    UChar m_pushedChar1;
    UChar m_pushedChar2;
    SegmentedSubstring m_currentString;
    const UChar* m_currentChar;
    Deque<SegmentedSubstring> m_substrings;
    bool m_composite;
};

}

#endif




