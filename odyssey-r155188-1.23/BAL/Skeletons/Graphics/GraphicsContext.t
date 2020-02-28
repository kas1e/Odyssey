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
#ifndef GraphicsContext_h
#define GraphicsContext_h
/**
 *  @file  GraphicsContext.t
 *  GraphicsContext description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:07 $
 */
#include "BALBase.h"

#include "FloatRect.h"
#include "Image.h"
#include "IntRect.h"
#include "Path.h"
#include "TextDirection.h"
#include <wtf/Noncopyable.h>
#include <wtf/Platform.h>





namespace WKAL {

    const int cMisspellingLineThickness = 3;
    const int cMisspellingLinePatternWidth = 4;
    const int cMisspellingLinePatternGapWidth = 1;

    class AffineTransform;
    class Font;
    class Generator;
    class Gradient;
    class GraphicsContextPrivate;
    class GraphicsContextPlatformPrivate;
    class ImageBuffer;
    class KURL;
    class Path;
    class Pattern;
    class TextRun;

    // These bits can be ORed together for a total of 8 possible text drawing modes.
    const int cTextInvisible = 0;
    const int cTextFill = 1;
    const int cTextStroke = 2;
    const int cTextClip = 4;

    enum StrokeStyle {
        NoStroke,
        SolidStroke,
        DottedStroke,
        DashedStroke
    };

    class GraphicsContext : public WKALBase, Noncopyable {
    public:
    /**
     * GraphicsContext constructor
     * @param[in] : platform graphics context
     * @code
     * GraphicsContext *gc = new GraphicsContext(pgc);
     * @endcode
     */
        GraphicsContext(PlatformGraphicsContext*);

    /**
     * GraphicsContext destructor
     * @code
     * delete gc;
     * @endcode
     */
        ~GraphicsContext();

    /**
     * get platform graphic context
     * @param[out] : platform graphic context
     * @code
     * PlatformGraphicsContext *pgc = gc->platformContext();
     * @endcode
     */
        PlatformGraphicsContext* platformContext() const;

    /**
     * get font
     * @param[out] : font
     * @code
     * font f = gc->font();
     * @endcode
     */
        const Font& font() const;

    /**
     * set font
     * @param[in] : font
     * @code
     * gc->setFont(f);
     * @endcode
     */
        void setFont(const Font&);

    /**
     * get stroke thickness
     * @param[out] : stroke thickness
     * @code
     * float f = gc->strokeThickness();
     * @endcode
     */
        float strokeThickness() const;

    /**
     * set stroke thickness
     * @param[in] : stroke thickness
     * @code
     * gc->setStrokeThickness(f);
     * @endcode
     */
        void setStrokeThickness(float);

    /**
     * get stroke style
     * @param[out] : stroke style
     * @code
     * StrokeStyle ss = gc->strokeStyle();
     * @endcode
     */
        StrokeStyle strokeStyle() const;

    /**
     * set stroke style
     * @param[in] : stroke style
     * @code
     * gc->setStrokeStyle(ss);
     * @endcode
     */
        void setStrokeStyle(const StrokeStyle& style);

    /**
     * stroke color
     * @param[out] : stroke color
     * @code
     * Color c = gc->strokeColor();
     * @endcode
     */
        Color strokeColor() const;

    /**
     * set stroke color
     * @param[in] : stroke color
     * @code
     * gc->setStrokeColor(c);
     * @endcode
     */
        void setStrokeColor(const Color&);

    /**
     * set stroke pattern
     */
        void setStrokePattern(PassRefPtr<Pattern>);

    /**
     * set stroke gradient
     */
        void setStrokeGradient(PassRefPtr<Gradient>);

    /**
     * fill rule
     */
        WindRule fillRule() const;

    /**
     * set fill rule
     */
        void setFillRule(WindRule);


    /**
     * fill color
     * @param[out] : fill color
     * @code
     * Color c = gc->fillColor();
     * @endcode
     */
        Color fillColor() const;

    /**
     * set fill color
     * @param[in] : fill color
     * @code
     * gc->setFillColor(c);
     * @endcode
     */
        void setFillColor(const Color&);

    /**
     * set fill pattern
     */
        void setFillPattern(PassRefPtr<Pattern>);
    
    /**
     * set fill gradient
     */
        void setFillGradient(PassRefPtr<Gradient>);

    /**
     * save context
     * @code
     * gc->save();
     * @endcode
     */
        void save();

    /**
     * restore context
     * @code
     * gc->restore();
     * @endcode
     */
        void restore();

        // These draw methods will do both stroking and filling.
    /**
     * draw rect
     * @param[in] : rect
     * @code
     * gc->drawRect(r);
     * @endcode
     */
        void drawRect(const IntRect&);

    /**
     * draw line
     * @param[in] : start point
     * @param[in] : end point
     * @code
     * gc->drawLine(p0, p1);
     * @endcode
     */
        void drawLine(const IntPoint&, const IntPoint&);

    /**
     * draw ellipse
     * @param[in] : rect which contains the ellipse
     * @code
     * gc->drawEllipse(r);
     * @endcode
     */
        void drawEllipse(const IntRect&);

    /**
     * draw convex polygon
     * @param[in] : number of points
     * @param[in] : start point
     * @param[in] : should antialias
     * @code
     * gc->drawConvexPolygon(n, p);
     * @endcode
     */
        void drawConvexPolygon(size_t numPoints, const FloatPoint*, bool shouldAntialias = false);

    /**
     * draw path
     */
        void drawPath();

    /**
     * fill path
     */
        void fillPath();

    /**
     * stroke path
     */
        void strokePath();


        // Arc drawing (used by border-radius in CSS) just supports stroking at the moment.
    /**
     * stroke arc
     * @param[in] : rect
     * @param[in] : start angle
     * @param[in] : angle span
     * @code
     * gc->strokeArc(r, sa, as);
     * @endcode
     */
        void strokeArc(const IntRect&, int startAngle, int angleSpan);

    /**
     * fill rect
     * @param[in] : rect
     * @code
     * gc->fillRect(r);
     * @endcode
     */
        void fillRect(const FloatRect&);

    /**
     * fill rect
     * @param[in] : rect
     * @param[out] : color fill
     * @code
     * gc->fillRect(r, c);
     * @endcode
     */
        void fillRect(const FloatRect&, const Color&);

    /**
     * fill rect
     * @param[in] : rect
     * @param[in] : generator
     * @code
     * gc->fillRect(r, g);
     * @endcode
     */
        void fillRect(const FloatRect&, Generator&);

    /**
     * fill rounded rect
     * @param[in] : rect
     * @param[in] : top left
     * @param[in] : top right
     * @param[in] : bottom left
     * @param[in] : bottom right
     * @param[in] : color fill
     * @code
     * gc->fillRoundedRect(r, tl, tr, bl, br, c):
     * @endcode
     */
        void fillRoundedRect(const IntRect&, const IntSize& topLeft, const IntSize& topRight, const IntSize& bottomLeft, const IntSize& bottomRight, const Color&);

    /**
     * clear rect
     * @param[in] : rect
     * @code
     * gc->clearRect();
     * @endcode
     */
        void clearRect(const FloatRect&);

    /**
     * stroke rect
     * @param[in] : rect
     * @code
     * gc->strokeRect(r);
     * @endcode
     */
        void strokeRect(const FloatRect&);

    /**
     * stroke rect
     * @param[in] : rect
     * @param[in] : line width
     * @code
     * gc->strokeRect(r, lw);
     * @endcode
     */
        void strokeRect(const FloatRect&, float lineWidth);

    /**
     * draw image
     * @param[in] : image
     * @param[in] : start point
     * @param[in] : composite operator
     * @code
     * gc->drawImage(i, p, op);
     * @endcode
     */
        void drawImage(Image*, const IntPoint&, CompositeOperator = CompositeSourceOver);

    /**
     * draw image
     * @param[in] : image
     * @param[in] : rect
     * @param[in] : composite operator
     * @param[in] : use low quality scale
     * @code
     * gc->drawImage(i, r, op, true);
     * @endcode
     */
        void drawImage(Image*, const IntRect&, CompositeOperator = CompositeSourceOver, bool useLowQualityScale = false);

    /**
     * drawImage
     * @param[in] : image
     * @param[in] : destination point
     * @param[in] : source point
     * @param[in] : composite operator
     * @code
     * gc->drawImage(i, dest, src, op);
     * @endcode
     */
        void drawImage(Image*, const IntPoint& destPoint, const IntRect& srcRect, CompositeOperator = CompositeSourceOver);

    /**
     * draw image
     * @param[in] : image
     * @param[in] : destination rect
     * @param[in] : source rect
     * @param[in] : composite operator
     * @param[in] : use low quality scale
     * @code
     * gc->drawImage(i, dest, src, op, true);
     * @endcode
     */
        void drawImage(Image*, const IntRect& destRect, const IntRect& srcRect, CompositeOperator = CompositeSourceOver, bool useLowQualityScale = false);

    /**
     * draw image
     * @param[in] : image
     * @param[in] : destination rect
     * @param[in] : source rect
     * @param[in] : composite operator
     * @param[in] : use low quality scale
     * @code
     * gc->drawImage(i, dest, src, op, true);
     * @endcode
     */
        void drawImage(Image*, const FloatRect& destRect, const FloatRect& srcRect = FloatRect(0, 0, -1, -1),
                       CompositeOperator = CompositeSourceOver, bool useLowQualityScale = false);

    /**
     * draw tiled image
     * @param[in] : image
     * @param[in] : destination rect
     * @param[in] : source rect
     * @param[in] : tile size
     * @param[in] : composite operator
     * @code
     * gc->drawTiledImage(i, dest, src, size, op);
     * @endcode
     */
        void drawTiledImage(Image*, const IntRect& destRect, const IntPoint& srcPoint, const IntSize& tileSize,
                       CompositeOperator = CompositeSourceOver);

    /**
     * drawTiledImage
     * @param[in] : image
     * @param[in] : destination rect
     * @param[in] : source rect
     * @param[in] : horizontal rule
     * @param[in] : vertical rule
     * @param[in] : composite operator
     * @code
     * gc->drawTiledImage(i, dest, src, hr, vh, op);
     * @endcode
     */
        void drawTiledImage(Image*, const IntRect& destRect, const IntRect& srcRect, 
                            Image::TileRule hRule = Image::StretchTile, Image::TileRule vRule = Image::StretchTile,
                            CompositeOperator = CompositeSourceOver);


    /**
     * Set the image interpolation quality.
     * @param[in] : The quality of the interpolation.
     * @code
     * @endcode
     */
        void setImageInterpolationQuality(InterpolationQuality);




    /**
     * Get the image interpolation quality.
     * @return InterpolationQuality the interpolation quality
     * @code
     * @endcode
     */
        InterpolationQuality imageInterpolationQuality() const;



    /**
     * Clip context: no graphics outside the rect will be drawn.
     * @param[in] FloatRect the rect setting the clip.
     * @code
     * gc->clip(r);
     * @endcode
     */
        void clip(const FloatRect&);

    /**
     * add rounded rect clip
     * @param[in] : rect
     * @param[in] : top left size
     * @param[in] : top right size
     * @param[in] : bottom left size
     * @param[in] : bottom right size
     * @code
     * gc->addRoundedRectClip(r, tl, tr, bk, br);
     * @endcode
     */
        void addRoundedRectClip(const IntRect&, const IntSize& topLeft, const IntSize& topRight, const IntSize& bottomLeft, const IntSize& bottomRight);

    /**
     * add inner rounded rect clip
     * @param[in] : rect
     * @param[in] : thickness
     * @code
     * gc->addInnerRoundedRectClip(r, t);
     * @endcode
     */
        void addInnerRoundedRectClip(const IntRect&, int thickness);

    /**
     * clip out
     * @param[in] : rect
     * @code
     * gc->clipOut(r);
     * @endcode
     */
        void clipOut(const IntRect&);

    /**
     * clip out ellipse in rect
     * @param[in] : rect
     * @code
     * gc->clipOutEllipseInRect(r);
     * @endcode
     */
        void clipOutEllipseInRect(const IntRect&);

    /**
     * clip out rounded rect
     * @param[in] : rect
     * @param[in] : top left size
     * @param[in] : top right size
     * @param[in] : bottom left size
     * @param[in] : bottom right size
     * @code
     * gc->clipOutRoundedRect(r, tl, tr, bl, br);
     * @endcode
     */
        void clipOutRoundedRect(const IntRect&, const IntSize& topLeft, const IntSize& topRight, const IntSize& bottomLeft, const IntSize& bottomRight);

    /**
     * clip to image buffer
     * @param[in] : rect
     * @param[in] : image buffer
     * @code
     * gc->clipToImageBuffer(r, i);
     * @endcode
     */
        void clipToImageBuffer(const FloatRect&, const ImageBuffer*);

    /**
     * get text drawing mode
     * @param[out] : text drawing mode
     * @code
     * int m = gc->textDrawingMode();
     * @endcode
     */
        int textDrawingMode();

    /**
     * set text drawing mode
     * @param[in] : text drawing mode
     * @code
     * gc->setTextDrawingMode(m);
     * @endcode
     */
        void setTextDrawingMode(int);

    /**
     * draw text
     * @param[in] : textRun
     * @param[in] : start point
     * @param[in] : start range
     * @param[in] : end range
     * @code
     * gc->drawText(t, p);
     * @endcode
     */
        void drawText(const TextRun&, const IntPoint&, int from = 0, int to = -1);

    /**
     * draw bidi text
     * @param[in] : textRun
     * @param[in] : start point
     * @code
     * gc->drawBidiText(t, p);
     * @endcode
     */
        void drawBidiText(const TextRun&, const FloatPoint&);

    /**
     * draw highlight for text
     * @param[in] : textRun
     * @param[in] : start point
     * @param[in] : height
     * @param[in] : background color
     * @param[in] : start range
     * @param[in] : end range
     * @code
     * gc->drawHighlightForText(t, p, h, c);
     * @endcode
     */
        void drawHighlightForText(const TextRun&, const IntPoint&, int h, const Color& backgroundColor, int from = 0, int to = -1);

    /**
     * round to device pixels
     * @param[in] : rect
     * @param[out] : rect
     * @code
     * FloatRect r = gc->roundToDevicePixels(rect);
     * @endcode
     */
        FloatRect roundToDevicePixels(const FloatRect&);

    /**
     * draw line for text
     * @param[in] : start point
     * @param[in] : width
     * @param[in] : is printing
     * @code
     * gc->drawLineForText(p, w, true);
     * @endcode
     */
        void drawLineForText(const IntPoint&, int width, bool printing);

    /**
     * draw line for misspelling or bad grammar
     * @param[in] : start point
     * @param[in] : width
     * @param[in] : is grammar
     * @code
     * gc->drawLineForMisspellingOrBadGrammar(p, w, true);
     * @endcode
     */
        void drawLineForMisspellingOrBadGrammar(const IntPoint&, int width, bool grammar);

    /**
     * test if the painting is disabled
     * @param[out] : true if the painting is disabled
     * @code
     * bool p = gc->paintingDisabled();
     * @endcode
     */
        bool paintingDisabled() const;

    /**
     * set painting disabled
     * @param[in] : status
     * @code
     * gc->setPaintingDisabled(true);
     * @endcode
     */
        void setPaintingDisabled(bool);

    /**
     * updating control tints
     * @param[out] : status
     * @code
     * bool u = gc->updatingControlTints();
     * @endcode
     */
        bool updatingControlTints() const;

    /**
     * set updating control tints
     * @param[in] : status
     * @code
     * gc->setUpdatingControlTints(true);
     * @endcode
     */
        void setUpdatingControlTints(bool);

    /**
     * begin transparency layer
     * @param[in] : opacity
     * @code
     * gc->beginTransparencyLayer(o);
     * @endcode
     */
        void beginTransparencyLayer(float opacity);

    /**
     * end transparency layer
     * @code
     * gc->endTransparencyLayer();
     * @endcode
     */
        void endTransparencyLayer();

    /**
     * set shadow value
     * @param[in] : size
     * @param[in] : blur value
     * @param[in] : color
     * @code
     * gc->setShadow(s, b, c);
     * @endcode
     */
        void setShadow(const IntSize&, int blur, const Color&);

    /**
     * get shadow value
     * @param[out] : size
     * @param[out] : color
     * @param[out] : shadow value
     * @param[out] : status
     * @code
     * gc->getShadow(&s, &b, &c);
     * @endcode
     */
        bool getShadow(IntSize&, int&, Color&) const;

    /**
     * clear shadow
     * @code
     * gc->clearShadow();
     * @endcode
     */
        void clearShadow();

    /**
     * init focus ring
     * @param[in] : width
     * @param[in] : offset
     * @code
     * gc->initFocusRing(w, o);
     * @endcode
     */
        void initFocusRing(int width, int offset);

    /**
     * add focus ring rect
     * @param[in] : rect
     * @code
     * gc->addFocusRingRect(r);
     * @endcode
     */
        void addFocusRingRect(const IntRect&);

    /**
     * draw focus ring
     * @param[in] : color
     * @code
     * gc->drawFocusRing(c);
     * @endcode
     */
        void drawFocusRing(const Color&);

    /**
     * clear focus ring
     * @code
     * gc->clearFocusRing();
     * @endcode
     */
        void clearFocusRing();

    /**
     * focus ring bounding rect
     * @param[out] : rect
     * @code
     * IntRect r = gc->focusRingBoundingRect();
     * @endcode
     */
        IntRect focusRingBoundingRect();

    /**
     * set lineCap
     * @param[in] : lineCap
     * @code
     * gc->setLineCap(l);
     * @endcode
     */
        void setLineCap(LineCap);

    /**
     * set lineJoin
     * @param[in] : lineJoin
     * @code
     * gc->setLineJoin(l);
     * @endcode
     */
        void setLineJoin(LineJoin);

    /**
     * set miter limit
     * @param[in] : limit
     * @code
     * gc->setMiterLimit(l);
     * @endcode
     */
        void setMiterLimit(float);

    /**
     * set alpha
     * @param[in] : alpha value
     * @code
     * gc->setAlpha();
     * @endcode
     */
        void setAlpha(float);


    /**
     * get Alpha
     * @param[out] : return alpha value
     */
        float getAlpha();

    /**
     * set composite operation
     * @param[in] : composite operator
     * @code
     * gc->setCompositeOperation(op);
     * @endcode
     */
        void setCompositeOperation(CompositeOperator);

    /**
     * begin path
     * @code
     * gc->beginPath();
     * @endcode
     */
        void beginPath();

    /**
     * add path
     * @param[in] : path
     * @code
     * gc->addPath(p);
     * @endcode
     */
        void addPath(const Path&);

    /**
     * clip
     * @param[in] : path
     * @code
     * gc->clip(p);
     * @endcode
     */
        void clip(const Path&);

    /**
     * clipOut
     * @param[in] : path
     * @code
     * gc->clipOut(p);
     * @endcode
     */
        void clipOut(const Path&);

    /**
     * scale
     * @param[in] : scale value
     * @code
     * gc->scale(s);
     * @endcode
     */
        void scale(const FloatSize&);

    /**
     * rotate
     * @param[in] : angle in radians
     * @code
     * gc->rotate(a);
     * @endcode
     */
        void rotate(float angleInRadians);

    /**
     * translate
     * @param[in] : x value
     * @param[in] : y value
     * @code
     * gc->translate(3.2, 5.4);
     * @endcode
     */
        void translate(float x, float y);

    /**
     * get origin
     * @code
     * IntPoint p = gc->origin();
     * @endcode
     */
        IntPoint origin();

    /**
     * set URL for rect
     * @param[in] : url
     * @param[in] : rect
     * @code
     * gc->setURLForRect(url, rect);
     * @endcode
     */
        void setURLForRect(const KURL&, const IntRect&);

    /**
     * concatCTM
     * @param[in] : affine transform
     * @code
     * gc->concatCTM(a);
     * @endcode
     */
        void concatCTM(const AffineTransform&);

    /**
     * getCTM
     * @param[out] : affine transform
     * @code
     * AffineTransform a = gc->getCTM();
     * @endcode
     */
        AffineTransform getCTM() const;

    /**
     * set use antialiasing
     * @param[in] : status
     * @code
     * gc->setUseAntialiasing();
     * @endcode
     */
        void setUseAntialiasing(bool = true);

    /**
     * set BalExposeEvent
     * @param[in] : BalExposeEvent
     * @code
     * gc->setBalExposeEvent(ev);
     * @endcode
     */
        void setBalExposeEvent(BalEventExpose*);

    /**
     * get BalDrawable
     * @param[out] : BalDrawable
     * @code
     * BalDrawable *b = gc->balDrawable();
     * @endcode
     */
        BalDrawable* balDrawable() const;

    /**
     * get BalExposeEvent
     * @param[out] : BalExposeEvent
     * @code
     * BalExposeEvent *e = gc->balExposeEvent();
     * @endcode
     */
        BalEventExpose* balExposeEvent() const;

    private:
    /**
     * savePlatformState
     */
        void savePlatformState();
    /**
     * restorePlatformState
     */
        void restorePlatformState();
    /**
     * setPlatformTextDrawingMode
     */
        void setPlatformTextDrawingMode(int);
     /**
      * setPlatformFont
      */
        void setPlatformFont(const Font& font);
    /**
     * setPlatformStrokeColor
     */
        void setPlatformStrokeColor(const Color&);
    /**
     * setPlatformStrokePattern
     */
	void setPlatformStrokePattern(Pattern*);
    /**
     * setPlatformStrokeGradient
     */
	void setPlatformStrokeGradient(Gradient*);

    /**
     * setPlatformStrokeStyle
     */
        void setPlatformStrokeStyle(const StrokeStyle&);
    /**
     * setPlatformStrokeThickness
     */
        void setPlatformStrokeThickness(float);
    /**
     * setPlatformFillColor
     */
        void setPlatformFillColor(const Color&);
    /**
     * setPlatformFillPattern
     */
        void setPlatformFillPattern(Pattern*);
    /**
     * setPlatformFillGradient
     */
        void setPlatformFillGradient(Gradient*);
    /**
     * setPlatformShadow
     */
        void setPlatformShadow(const IntSize&, int blur, const Color&);
    /**
     * clearPlatformShadow
     */
        void clearPlatformShadow();

    /**
     * focusRingWidth
     */
        int focusRingWidth() const;
    /**
     * focusRingOffset
     */
        int focusRingOffset() const;
    /**
     * focusRingRects
     */
        const Vector<IntRect>& focusRingRects() const;

    /**
     * createGraphicsContextPrivate
     */
        static GraphicsContextPrivate* createGraphicsContextPrivate();
    /**
     * destroyGraphicsContextPrivate
     */
        static void destroyGraphicsContextPrivate(GraphicsContextPrivate*);

        GraphicsContextPrivate* m_common;
        GraphicsContextPlatformPrivate* m_data; // Deprecated; m_commmon can just be downcasted. To be removed.
    };

} // namespace WKAL

#endif // GraphicsContext
