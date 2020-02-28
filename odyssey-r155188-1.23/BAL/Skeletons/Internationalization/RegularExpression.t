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
#ifndef RegularExpression_h
#define RegularExpression_h
/**
 *  @file  RegularExpression.t
 *  RegularExpression description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:09 $
 */
#include "BALBase.h"

#include <wtf/RefPtr.h>

namespace WebCore {

class String;

class RegularExpression : public WebCoreBase {
public:
    /**
     * RegularExpression default constructor
     */
    RegularExpression();

    /**
     * RegularExpression constructor
     * @param[in] : string
     * @param[in] : case sensitive status
     */
    RegularExpression(const String&, bool caseSensitive = false);

    /**
     * RegularExpression constructor
     * @param[in] : string
     */
    RegularExpression(const char*);

    /**
     * RegularExpression destructor
     */
    ~RegularExpression();

    /**
     * RegularExpression constructor by copy
     * @param[in] : RegularExpression
     */
    RegularExpression(const RegularExpression&);

    /**
     *  operator= 
     */
    RegularExpression& operator=(const RegularExpression&);

    /**
     * get pattern 
     * @param[out] : pattern
     * @code
     * String p = s->pattern();
     * @endcode
     */
    String pattern() const;

    /**
     * match
     * @param[in] : string
     * @param[in] : start position
     * @param[in] : length
     * @param[out] : value
     * @code
     * int i = s->match(s1, 2, 5);
     * @endcode
     */
    int match(const String&, int startFrom = 0, int* matchLength = 0) const;

    /**
     * search
     * @param[in] : string
     * @param[in] : start position
     * @param[out] : position or -1
     * @code
     * int p = s->search(s1, 4);
     * @endcode
     */
    int search(const String&, int startFrom = 0) const;

    /**
     * searchRev
     * @param[in] : string
     * @param[out] : position or -1
     * @code
     * int p = s->searchRev(s1);
     * @endcode
     */
    int searchRev(const String&) const;

    /**
     * get position
     * @param[in] : n
     * @param[out] : position
     * @code
     * int p = s->pos(n);
     * @endcode
     */
    int pos(int n = 0);

    /**
     * test if the String matched length
     * @param[out] : length
     * @code
     * int l = s->matchedLength();
     * @endcode
     */
    int matchedLength() const;

private:
    class Private;    
    RefPtr<Private> d;
};

    /**
     *  replace 
     */
void replace(String&, const RegularExpression&, const String&);

} // namespace WebCore

#endif // RegularExpression_h




