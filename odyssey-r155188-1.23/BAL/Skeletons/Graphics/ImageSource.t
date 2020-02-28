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
#ifndef ImageSource_h
#define ImageSource_h
/**
 *  @file  ImageSource.t
 *  ImageSource description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:07 $
 */
#include "BALBase.h"

#include <wtf/Noncopyable.h>
#include <wtf/Vector.h>


namespace WKAL {

class IntSize;
class SharedBuffer;


const int cAnimationLoopOnce = -1;
const int cAnimationNone = -2;

class ImageSource : public WKALBase, Noncopyable {
public:
    /**
     * ImageSource default constructor
     * @code
     * ImageSource is;
     * @endcode
     */
    ImageSource();

    /**
     * ImageSource destructor
     * @code
     * delete is;
     * @endcode
     */
    ~ImageSource();

    /**
     * clear
     * @code
     * is->clear();
     * @endcode
     */
    void clear();

    /**
     * test if the ImageSource is initialized 
     * @param[out] : true if the ImageSource is initialized
     * @code
     * bool i = is->initialized();
     * @endcode
     */
    bool initialized() const;
    
    /**
     * set data
     * @param[in] : data
     * @param[in] : true if all data is received
     * @code
     * is->setData(d, true);
     * @endcode
     */
    void setData(SharedBuffer* data, bool allDataReceived);

    /**
     * test if the ImageSource size is available
     * @param[out] : true if the ImageSource size is available
     * @code
     * bool a = is->isSizeAvailable();
     * @endcode
     */
    bool isSizeAvailable();

    /**
     * get size
     * @param[out] : size
     * @code
     * IntSize s = is->size();
     * @endcode
     */
    IntSize size() const;
    

    /**
     * get frameSize at index
     * @param[in] : index
     * @param[out] : frameSize
     */
    IntSize frameSizeAtIndex(size_t) const;

    /**
     * get repetition count
     * @param[out] : count
     * @code
     * int c = is->repetitionCount();
     * @endcode
     */
    int repetitionCount();
    
    /**
     * frame count
     * @param[out] : count
     * @code
     * size_t c = is->frameCount();
     * @endcode
     */
    size_t frameCount() const;
    
    /**
     * create frame at index
     * @param[in] : index
     * @param[out] : native image 
     * @code
     * NativeImagePtr *i = is->createFrameAtIndex(0);
     * @endcode
     */
    NativeImagePtr createFrameAtIndex(size_t);
    
    /**
     * frame duration at index
     * @param[in] : index
     * @param[out] : duration
     * @code
     * float d = is->frameDurationAtIndex(0);
     * @endcode
     */
    float frameDurationAtIndex(size_t);

    /**
     * test if frame has alpha at index
     * @param[in] : index
     * @param[out] : true if frame has alpha at index
     * @code
     * bool a = is->frameHasAlphaAtIndex(0);
     * @endcode
     */
    bool frameHasAlphaAtIndex(size_t); // Whether or not the frame actually used any alpha.

    /**
     * test if the frame is complete at index
     * @param[in] : index
     * @param[out] : true if the frame is complete at index
     * @code
     * bool c = is->frameIsCompleteAtIndex(0);
     * @endcode
     */
    bool frameIsCompleteAtIndex(size_t); // Whether or not the frame is completely decoded.

private:
    NativeImageSourcePtr m_decoder;
};

}

#endif



