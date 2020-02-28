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
#ifndef GraphicsTypes_h
#define GraphicsTypes_h
/**
 *  @file  GraphicsTypes.t
 *  GraphicsTypes description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:07 $
 */
#include "BALBase.h"

namespace WKAL {

    class String;

    // Note: These constants exactly match the NSCompositeOperator constants of
    // AppKit on Mac OS X Tiger. If these ever change, we'll need to change the
    // Mac OS X Tiger platform code to map one to the other.
    enum CompositeOperator {
        CompositeClear,
        CompositeCopy,
        CompositeSourceOver,
        CompositeSourceIn,
        CompositeSourceOut,
        CompositeSourceAtop,
        CompositeDestinationOver,
        CompositeDestinationIn,
        CompositeDestinationOut,
        CompositeDestinationAtop,
        CompositeXOR,
        CompositePlusDarker,
        CompositeHighlight,
        CompositePlusLighter
    };

    enum LineCap { ButtCap, RoundCap, SquareCap };

    enum LineJoin { MiterJoin, RoundJoin, BevelJoin };

    enum HorizontalAlignment { AlignLeft, AlignRight, AlignHCenter };

    enum TextBaseline { AlphabeticTextBaseline, TopTextBaseline, MiddleTextBaseline, BottomTextBaseline, IdeographicTextBaseline, HangingTextBaseline };

    enum TextAlign { StartTextAlign, EndTextAlign, LeftTextAlign, CenterTextAlign, RightTextAlign };

    /**
     * get composite operator name
     * @param[in] : composite operator
     * @param[out] : name
     * @code
     * String n = compositeOperatorName(op);
     * @endcode
     */
    String compositeOperatorName(CompositeOperator);

    /**
     * parse Composite Operator
     * @param[in] : name
     * @param[out] : composite operator
     * @param[out] : true if name is found
     * @code
     * bool s = parseCompositeOperator(n, &op);
     * @endcode
     */
    bool parseCompositeOperator(const String&, CompositeOperator&);

    /**
     * get lineCap name
     * @param[in] : lineCap
     * @param[out] : name
     * @code
     * String n = lineCapName(l);
     * @endcode
     */
    String lineCapName(LineCap);

    /**
     * parse LineCap
     * @param[in] : name
     * @param[out] : lineCap 
     * @param[out] : true if name is found
     * @code
     * bool s = parseLineCap(n, &l);
     * @endcode
     */
    bool parseLineCap(const String&, LineCap&);

    /**
     * lineJoin name 
     * @param[in] : lineJoin
     * @param[out] : name
     * @code
     * String n = lineJoinName(l);
     * @endcode
     */
    String lineJoinName(LineJoin);

    /**
     * parse LineJoin
     */
    bool parseLineJoin(const String&, LineJoin&);

    /**
     * get textAlign name
     * @param[in] : textAlign
     * @param[out] : name
     */
    String textAlignName(TextAlign);

    /**
     * parse TextAlign
     * @param[in] : string
     * @param[in] : textAlign
     * @param[out] : status
     */
    bool parseTextAlign(const String&, TextAlign&);

    /**
     * textBaseline Name
     * @param[in] : TextBaseline
     * @param[out] : name
     */
    String textBaselineName(TextBaseline);

    /**
     * parseTextBaseline
     * @param[in] : string
     * @param[in] : TextBaseline
     * @param[out] : status
     */
    bool parseTextBaseline(const String&, TextBaseline&);
}

#endif
