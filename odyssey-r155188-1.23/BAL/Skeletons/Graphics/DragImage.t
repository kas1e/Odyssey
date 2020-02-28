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
#ifndef DragImage_h
#define DragImage_h
/**
 *  @file  DragImage.t
 *  DragImage description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:06 $
 */
#include "BALBase.h"

#include "IntSize.h"
#include "FloatSize.h"


//We need to #define YOffset as it needs to be shared with WebKit
#define DragLabelBorderYOffset 2

namespace WKAL {
    
    class CachedImage;
    class Frame;
    class Image;
    class KURL;
    class Range;
    class String;
    
    
    /**
     * get image size
     * @param[in] : drag image ref
     * @param[out] : size
     * @code
     * IntSize s = dragImageSize(dir);
     * @endcode
     */
    IntSize dragImageSize(DragImageRef);
    
    /**
     * These functions should be memory neutral, eg. if they return a newly allocated image, 
     * they should release the input image.  As a corollary these methods don't guarantee
     * the input image ref will still be valid after they have been called
     * @param[in] : drag image
     * @param[in] : size source 
     * @param[in] : size destination
     * @param[out] : drag image
     * @code
     * DragImageRef i = fitDragImageToMaxSize(im, s, d);
     * @endcode
     */
    DragImageRef fitDragImageToMaxSize(DragImageRef image, const IntSize& srcSize, const IntSize& size);

    /**
     * scale drag image
     * @param[in] : drag image
     * @param[in] : scale size
     * @param[out] : drag image
     * @code
     * DragImageRef i = scaleDragImage(im, s);
     * @endcode
     */
    DragImageRef scaleDragImage(DragImageRef, FloatSize scale);

    /**
     * dissolve drag image to fraction
     * @param[in] : drag image
     * @param[in] : delta
     * @param[out] : drag image
     * @code
     * DragImageRef i = dissolveDragImageToFraction(im, d);
     * @endcode
     */
    DragImageRef dissolveDragImageToFraction(DragImageRef image, float delta);
    
    /**
     * create drag image from image
     * @param[in] : image
     * @param[out] : drag image
     * @code
     * DragImageRef di = createDragImageFromImage(i);
     * @endcode
     */
    DragImageRef createDragImageFromImage(Image*);

    /**
     * create drag image for selection
     * @param[in] : frame
     * @param[out] : drag image
     * @code
     * DragImageRef i = createDragImageForSelection(f);
     * @endcode
     */
    DragImageRef createDragImageForSelection(Frame*);    

    /**
     * create drag image icon for cached image
     * @param[in] : cached image
     * @param[out] : drag image
     * @code
     * DragImageRef i = createDragImageIconForCachedImage(ci);
     * @endcode
     */
    DragImageRef createDragImageIconForCachedImage(CachedImage*);

    /**
     * delete drag image
     * @param[in] : drag image
     * @code
     * deleteDragImage(i);
     * @endcode
     */
    void deleteDragImage(DragImageRef);
}


#endif //!DragImage_h




