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
#ifndef WTF_Collator_h
#define WTF_Collator_h
/**
 *  @file  Collator.t
 *  Collator description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:09 $
 */
#include "BALBase.h"

#include <memory>
#include <wtf/Noncopyable.h>
#include <wtf/unicode/Unicode.h>

struct UCollator;

namespace WTF {

    class Collator : public OWBALBase, Noncopyable {
    public:
        enum Result { Equal = 0, Greater = 1, Less = -1 };

    /**
     * Collator constructor
     * @param[in] : locale
     */
        Collator(const char* locale); // Parsing is lenient; e.g. language identifiers (such as "en-US") are accepted, too.

    /**
     * Collator destructor
     */
        ~Collator();

    /**
     * set order lower first 
     * @param[in] : status
     * @code
     * c->setOrderLowerFirst(s);
     * @endcode
     */
        void setOrderLowerFirst(bool);

    /**
     * get user default
     * @param[out] : collator
     * @code
     * std::auto_ptr<Collator> c = Collator::userDefault();
     * @endcode
     */
        static std::auto_ptr<Collator> userDefault();

    /**
     * collate : compare the both characters
     * @param[in] : unicode characters
     * @param[in] : length
     * @param[in] : unicode characters
     * @param[in] : length
     * @param[out] : result
     * @code
     * Result r = c->collate(c1, l1, c2, l2);
     * @endcode
     */
        Result collate(const ::UChar*, size_t, const ::UChar*, size_t) const;

    private:
    /**
     * createCollator constructor
     */
        void createCollator() const;

    /**
     * releaseCollator
     */
        void releaseCollator();
        mutable UCollator* m_collator;
        char* m_locale;
        bool m_lowerFirst;
    };
}

using WTF::Collator;

#endif




