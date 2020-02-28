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
#include "Collator.h"
#include <string.h>

#if USE(ICU_UNICODE) && !UCONFIG_NO_COLLATION

#include "Assertions.h"
#include "Threading.h"

namespace WTF {

Collator::Collator(const char* locale)
: m_collator(0)
, m_locale(locale ? strdup(locale) : 0)
, m_lowerFirst(false)
{
}

std::auto_ptr<Collator> Collator::userDefault()
{
    return std::auto_ptr<Collator>(new Collator(0));
}

Collator::~Collator()
{
    releaseCollator();
    free(m_locale);
}

void Collator::setOrderLowerFirst(bool lowerFirst)
{
    m_lowerFirst = lowerFirst;
}

Collator::Result Collator::collate(const UChar* lhs, size_t lhsLength, const UChar* rhs, size_t rhsLength) const
{
    if (!m_collator)
        createCollator();

    if (lhsLength > rhsLength)
        return Greater;
    else if (lhsLength < rhsLength)
        return Less;

    bool isEqual = true;
    for(size_t i=0; i<lhsLength; i++) {
        if (lhs[i] != rhs[i]) {
            isEqual = false;
            break;
        }
    }

    if (isEqual)
        return Equal;
    else
        return Less;
}

void Collator::createCollator() const
{
    
}

void Collator::releaseCollator()
{
    
}

}

#endif
