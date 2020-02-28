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
#ifndef ImageObserver_h
#define ImageObserver_h
/**
 *  @file  ImageObserver.t
 *  ImageObserver description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:07 $
 */
#include "BALBase.h"

namespace WKAL {

class Image;

// Interface for notification about changes to an image, including decoding,
// drawing, and animating.
class ImageObserver : public WKALBase {
protected:
    /**
     * ImageObserver destructor
     * @code
     * delete io;
     * @endcode
     */
    virtual ~ImageObserver() ;

public:
    /**
     * decoded size changed
     * @param[in] : image
     * @param[in] : delta
     * @code
     * io->decodedSizeChanged(i, d);
     * @endcode
     */
    virtual void decodedSizeChanged(const Image*, int delta) = 0;

    /**
     * did draw
     * @param[in] : image
     * @code
     * io->didDraw(i);
     * @endcode
     */
    virtual void didDraw(const Image*) = 0;

    /**
     * should pause animation
     * @param[in] : image
     * @param[out] : true if animation is paused
     * @code
     * bool a = io->shouldPauseAnimation(i);
     * @endcode
     */
    virtual bool shouldPauseAnimation(const Image*) = 0;

    /**
     * animation advanced
     * @param[in] : image
     * @code
     * io->animationAdvanced(i);
     * @endcode
     */
    virtual void animationAdvanced(const Image*) = 0;
};

}

#endif




