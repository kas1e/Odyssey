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
#ifndef PlatformScreen_h
#define PlatformScreen_h
/**
 *  @file  PlatformScreen.t
 *  PlatformScreen description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:12 $
 */
#include "BALBase.h"

#include "FloatRect.h"
#include <wtf/Forward.h>
#include <wtf/RefPtr.h>


namespace WKAL {

    class FloatRect;
    class Widget;

    /**
     * get screen depth 
     * @param[in] : widget
     * @param[out] : screen depth
     * @code
     * int s = screenDepth(w);
     * @endcode
     */
    int screenDepth(Widget*);

    /**
     * get screen depth per component
     * @param[in] : widget
     * @param[out] : screen depth per component
     * @code
     * int s = screenDepthPerComponent(w);
     * @endcode
     */
    int screenDepthPerComponent(Widget*);

    /**
     * test if the screen is monochrome
     * @param[in] : widget
     * @param[out] : true if the screen is monochrome
     * @code
     * bool m = screenIsMonochrome(w);
     * @endcode
     */
    bool screenIsMonochrome(Widget*);

    /**
     * get screen rect
     * @param[in] : widget
     * @param[out] : screen rect
     * @code
     * FloatRect r = screenRect(w);
     * @endcode
     */
    FloatRect screenRect(Widget*);

    /**
     * get screen available rect 
     * @param[in] : widget
     * @param[out] : screen available rect
     * @code
     * FloatRect r = screenAvailableRect(w);
     * @endcode
     */
    FloatRect screenAvailableRect(Widget*);


} // namespace WKAL

#endif // PlatformScreen_h




