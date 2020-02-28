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
#ifndef FontSelector_h
#define FontSelector_h
/**
 *  @file  FontSelector.t
 *  FontSelector description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:06 $
 */
#include "BALBase.h"

#include <wtf/RefCounted.h>

namespace WKAL {

class AtomicString;
class FontData;
class FontDescription;

class FontSelector : public WKALBase, public RefCounted<FontSelector> {
public:
    /**
     * ~FontSelector destructor
     * @code
     * delete fontSelector;
     * @endcode
     */
    virtual ~FontSelector() ;

    /**
     * get font data
     * @param[in] : font description
     * @param[in] : family name
     * @param[out] : font data
     * @code
     * FontData *fd = fs->getFontData(fd, name);
     * @endcode
     */
    virtual FontData* getFontData(const FontDescription&, const AtomicString& familyName) = 0;

    /**
     * fontCachei Invalidated 
     * @code
     * fs->fontCacheInvalidated();
     * @endcode
     */
    virtual void fontCacheInvalidated() ;
    
};

} // namespace WKAL

#endif // FontSelector_h



