#ifndef GraphicsContextTest_h_CPPUNIT
#define GraphicsContextTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCGraphicsContext.h"
class GraphicsContextTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( GraphicsContextTestTest );
//register each method:
    CPPUNIT_TEST(GraphicsContext);
    CPPUNIT_TEST(destruct_GraphicsContext);
    CPPUNIT_TEST(platformContext);

    CPPUNIT_TEST(font);
    CPPUNIT_TEST(setFont);
        
    CPPUNIT_TEST(strokeThickness);
    CPPUNIT_TEST(setStrokeThickness);
    CPPUNIT_TEST(strokeStyle);
    CPPUNIT_TEST(setStrokeStyle);
    CPPUNIT_TEST(strokeColor);
    CPPUNIT_TEST(setStrokeColor);

    CPPUNIT_TEST(fillColor);
    CPPUNIT_TEST(setFillColor);
        
    CPPUNIT_TEST(save);
    CPPUNIT_TEST(restore);
        
    CPPUNIT_TEST(drawRect);
    CPPUNIT_TEST(drawLine);
    CPPUNIT_TEST(drawEllipse);
    CPPUNIT_TEST(drawConvexPolygon);

    CPPUNIT_TEST(strokeArc);
        
    CPPUNIT_TEST(fillRect_int);
    CPPUNIT_TEST(fillRect_float);
    CPPUNIT_TEST(fillRect_generator);
    CPPUNIT_TEST(fillRoundedRect);
    CPPUNIT_TEST(clearRect);
    CPPUNIT_TEST(strokeRect);

    CPPUNIT_TEST(drawImage);
    CPPUNIT_TEST(drawImage_quality);
    CPPUNIT_TEST(drawImage_compositeOp);
    CPPUNIT_TEST(drawImage_compositeOp_quality);
    CPPUNIT_TEST(drawImage_floatRect);
    CPPUNIT_TEST(drawTiledImage);
    CPPUNIT_TEST(drawTiledImage_rect);

    CPPUNIT_TEST(setUseLowQualityImageInterpolation);
    CPPUNIT_TEST(useLowQualityImageInterpolation);

    CPPUNIT_TEST(clip);
    CPPUNIT_TEST(addRoundedRectClip);
    CPPUNIT_TEST(addInnerRoundedRectClip);
    CPPUNIT_TEST(clipOut);
    CPPUNIT_TEST(clipOutEllipseInRect);
    CPPUNIT_TEST(clipOutRoundedRect);
    CPPUNIT_TEST(clipToImageBuffer);

    CPPUNIT_TEST(textDrawingMode);
    CPPUNIT_TEST(setTextDrawingMode);

    CPPUNIT_TEST(drawText);
    CPPUNIT_TEST(drawBidiText);
    CPPUNIT_TEST(drawHighlightForText);

    CPPUNIT_TEST(roundToDevicePixels);
        
    CPPUNIT_TEST(drawLineForText);
    CPPUNIT_TEST(drawLineForMisspellingOrBadGrammar);
        
    CPPUNIT_TEST(paintingDisabled);
    CPPUNIT_TEST(setPaintingDisabled);
        
    CPPUNIT_TEST(updatingControlTints);
    CPPUNIT_TEST(setUpdatingControlTints);
    CPPUNIT_TEST(beginTransparencyLayer);
    CPPUNIT_TEST(endTransparencyLayer);

    CPPUNIT_TEST(setShadow);
    CPPUNIT_TEST(getShadow);
    CPPUNIT_TEST(clearShadow);

    CPPUNIT_TEST(initFocusRing);
    CPPUNIT_TEST(addFocusRingRect);
    CPPUNIT_TEST(drawFocusRing);
    CPPUNIT_TEST(clearFocusRing);
    CPPUNIT_TEST(focusRingBoundingRect);

    CPPUNIT_TEST(setLineCap);
    CPPUNIT_TEST(setLineJoin);
    CPPUNIT_TEST(setMiterLimit);

    CPPUNIT_TEST(setAlpha);
    CPPUNIT_TEST(setCompositeOperation);
    CPPUNIT_TEST(beginPath);
    CPPUNIT_TEST(addPath);
    CPPUNIT_TEST(clip2);
    CPPUNIT_TEST(clipOut2);
    CPPUNIT_TEST(scale);
    CPPUNIT_TEST(rotate);
    CPPUNIT_TEST(translate);
    CPPUNIT_TEST(origin);
    CPPUNIT_TEST(setURLForRect);
    CPPUNIT_TEST(concatCTM);
    CPPUNIT_TEST(getCTM);

    CPPUNIT_TEST(setUseAntialiasing);

    CPPUNIT_TEST(balDrawable);
    CPPUNIT_TEST(balExposeEvent);
    CPPUNIT_TEST(translatePoint);


    CPPUNIT_TEST_SUITE_END();

    public:
    void GraphicsContext() CPPU_NOT_IMPLEMENTED
    void destruct_GraphicsContext() CPPU_NOT_IMPLEMENTED
    void platformContext() CPPU_NOT_IMPLEMENTED

    void font() CPPU_NOT_IMPLEMENTED
    void setFont() CPPU_NOT_IMPLEMENTED
        
    void strokeThickness() CPPU_NOT_IMPLEMENTED
    void setStrokeThickness() CPPU_NOT_IMPLEMENTED
    void strokeStyle() CPPU_NOT_IMPLEMENTED
    void setStrokeStyle() CPPU_NOT_IMPLEMENTED
    void strokeColor() CPPU_NOT_IMPLEMENTED
    void setStrokeColor() CPPU_NOT_IMPLEMENTED

    void fillColor() CPPU_NOT_IMPLEMENTED
    void setFillColor() CPPU_NOT_IMPLEMENTED
        
    void save() CPPU_NOT_IMPLEMENTED
    void restore() CPPU_NOT_IMPLEMENTED
        
    void drawRect() CPPU_NOT_IMPLEMENTED
    void drawLine() CPPU_NOT_IMPLEMENTED
    void drawEllipse() CPPU_NOT_IMPLEMENTED
    void drawConvexPolygon() CPPU_NOT_IMPLEMENTED

    void strokeArc() CPPU_NOT_IMPLEMENTED
        
    void fillRect_int() CPPU_NOT_IMPLEMENTED
    void fillRect_float() CPPU_NOT_IMPLEMENTED
    void fillRect_generator() CPPU_NOT_IMPLEMENTED
    void fillRoundedRect() CPPU_NOT_IMPLEMENTED
    void clearRect() CPPU_NOT_IMPLEMENTED
    void strokeRect() CPPU_NOT_IMPLEMENTED

    void drawImage() CPPU_NOT_IMPLEMENTED
    void drawImage_quality() CPPU_NOT_IMPLEMENTED
    void drawImage_compositeOp() CPPU_NOT_IMPLEMENTED
    void drawImage_compositeOp_quality() CPPU_NOT_IMPLEMENTED
    void drawImage_floatRect() CPPU_NOT_IMPLEMENTED
    void drawTiledImage() CPPU_NOT_IMPLEMENTED
    void drawTiledImage_rect() CPPU_NOT_IMPLEMENTED

    void setUseLowQualityImageInterpolation() CPPU_NOT_IMPLEMENTED
    void useLowQualityImageInterpolation() CPPU_NOT_IMPLEMENTED

    void clip() CPPU_NOT_IMPLEMENTED
    void addRoundedRectClip() CPPU_NOT_IMPLEMENTED
    void addInnerRoundedRectClip() CPPU_NOT_IMPLEMENTED
    void clipOut() CPPU_NOT_IMPLEMENTED
    void clipOutEllipseInRect() CPPU_NOT_IMPLEMENTED
    void clipOutRoundedRect() CPPU_NOT_IMPLEMENTED
    void clipToImageBuffer() CPPU_NOT_IMPLEMENTED

    void textDrawingMode() CPPU_NOT_IMPLEMENTED
    void setTextDrawingMode() CPPU_NOT_IMPLEMENTED

    void drawText() CPPU_NOT_IMPLEMENTED
    void drawBidiText() CPPU_NOT_IMPLEMENTED
    void drawHighlightForText() CPPU_NOT_IMPLEMENTED

    void roundToDevicePixels() CPPU_NOT_IMPLEMENTED
        
    void drawLineForText() CPPU_NOT_IMPLEMENTED
    void drawLineForMisspellingOrBadGrammar() CPPU_NOT_IMPLEMENTED
        
    void paintingDisabled() CPPU_NOT_IMPLEMENTED
    void setPaintingDisabled() CPPU_NOT_IMPLEMENTED
        
    void updatingControlTints() CPPU_NOT_IMPLEMENTED
    void setUpdatingControlTints() CPPU_NOT_IMPLEMENTED
    void beginTransparencyLayer() CPPU_NOT_IMPLEMENTED
    void endTransparencyLayer() CPPU_NOT_IMPLEMENTED

    void setShadow() CPPU_NOT_IMPLEMENTED
    void getShadow() CPPU_NOT_IMPLEMENTED
    void clearShadow() CPPU_NOT_IMPLEMENTED

    void initFocusRing() CPPU_NOT_IMPLEMENTED
    void addFocusRingRect() CPPU_NOT_IMPLEMENTED
    void drawFocusRing() CPPU_NOT_IMPLEMENTED
    void clearFocusRing() CPPU_NOT_IMPLEMENTED
    void focusRingBoundingRect() CPPU_NOT_IMPLEMENTED

    void setLineCap() CPPU_NOT_IMPLEMENTED
    void setLineJoin() CPPU_NOT_IMPLEMENTED
    void setMiterLimit() CPPU_NOT_IMPLEMENTED

    void setAlpha() CPPU_NOT_IMPLEMENTED
    void setCompositeOperation() CPPU_NOT_IMPLEMENTED
    void beginPath() CPPU_NOT_IMPLEMENTED
    void addPath() CPPU_NOT_IMPLEMENTED
    void clip2() CPPU_NOT_IMPLEMENTED
    void clipOut2() CPPU_NOT_IMPLEMENTED
    void scale() CPPU_NOT_IMPLEMENTED
    void rotate() CPPU_NOT_IMPLEMENTED
    void translate() CPPU_NOT_IMPLEMENTED
    void origin() CPPU_NOT_IMPLEMENTED
    void setURLForRect() CPPU_NOT_IMPLEMENTED
    void concatCTM() CPPU_NOT_IMPLEMENTED
    void getCTM() CPPU_NOT_IMPLEMENTED

    void setUseAntialiasing() CPPU_NOT_IMPLEMENTED

    void balDrawable() CPPU_NOT_IMPLEMENTED
    void balExposeEvent() CPPU_NOT_IMPLEMENTED
    void translatePoint() CPPU_NOT_IMPLEMENTED

    };


#endif // GraphicsContext_h

