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
#include "RenderThemeGeneric.h"

#include "GraphicsContext.h"
#include "Logging.h"
#include "InputElement.h"
#include "Pen.h"
#include "RenderBox.h"
#include "RenderObject.h"

#include <cstdio>

#define THEME_COLOR 204
#define THEME_FONT  210

// Generic state constants
#define TS_NORMAL    1
#define TS_HOVER     2
#define TS_ACTIVE    3
#define TS_DISABLED  4
#define TS_FOCUSED   5

// Button constants
#define BP_BUTTON    1
#define BP_RADIO     2
#define BP_CHECKBOX  3

// Textfield constants
#define TFP_TEXTFIELD 1
#define TFS_READONLY  6


namespace WebCore {

PassRefPtr<RenderTheme> RenderThemeBal::create()
{
    return adoptRef(new RenderThemeBal());
}

PassRefPtr<RenderTheme> RenderTheme::themeForPage(Page* page)
{
    static RenderTheme* rt = RenderThemeBal::create().releaseRef();
    return rt;
}

void RenderThemeBal::addIntrinsicMargins(RenderStyle* style) const
{
    // Cut out the intrinsic margins completely if we end up using a small font size
    if (style->fontSize() < 11)
        return;

    // Intrinsic margin value.
    const int m = 2;

    // FIXME: Using width/height alone and not also dealing with min-width/max-width is flawed.
    if (style->width().isIntrinsicOrAuto()) {
        if (style->marginLeft().quirk())
            style->setMarginLeft(Length(m, Fixed));
        if (style->marginRight().quirk())
            style->setMarginRight(Length(m, Fixed));
    }

    if (style->height().isAuto()) {
        if (style->marginTop().quirk())
            style->setMarginTop(Length(m, Fixed));
        if (style->marginBottom().quirk())
            style->setMarginBottom(Length(m, Fixed));
    }
}


RenderThemeBal::RenderThemeBal()
    : m_balWindow(0)
    , m_balContainer(0)
    , m_balEntry(0)
    , m_balTreeView(0)
{
}

bool RenderThemeBal::supportsFocusRing(const RenderStyle* style) const
{
    return false;
}

bool RenderThemeBal::controlSupportsTints(const RenderObject* o) const
{
    return isEnabled(o);
}

int RenderThemeBal::baselinePosition(const RenderObject* o) const
{
    // FIXME: This strategy is possibly incorrect for the GTK+ port.
    if (o->style()->appearance() == CheckboxPart ||
        o->style()->appearance() == RadioPart)
        return toRenderBox(o)->marginTop() + toRenderBox(o)->height() - 2;
    return RenderTheme::baselinePosition(o);
}



void RenderThemeBal::setCheckboxSize(RenderStyle* style) const
{
    // If the width and height are both specified, then we have nothing to do.
    if (!style->width().isIntrinsicOrAuto() && !style->height().isAuto())
        return;

    // FIXME:  A hard-coded size of 13 is used.  This is wrong but necessary for now.  It matches Firefox.
    // At different DPI settings on Windows, querying the theme gives you a larger size that accounts for
    // the higher DPI.  Until our entire engine honors a DPI setting other than 96, we can't rely on the theme's
    // metrics.
    if (style->width().isIntrinsicOrAuto())
        style->setWidth(Length(13, Fixed));
    if (style->height().isAuto())
        style->setHeight(Length(13, Fixed));
}

bool RenderThemeBal::paintCheckbox(RenderObject* o, const RenderObject::PaintInfo& i, const IntRect& r)
{
    i.context->save();
    i.context->setStrokeStyle(SolidStroke);
    i.context->setStrokeColor(Color::black, DeviceColorSpace);
    PassRefPtr<RenderStyle> style = RenderStyle::create();
    addIntrinsicMargins(style.get());

    EBorderStyle v = INSET;
    style->setBorderTopStyle(v);
    style->setBorderLeftStyle(v);
    style->setBorderBottomStyle(v);
    style->setBorderRightStyle(v);
    int borderWidth = 1;
    style->setBorderTopWidth(borderWidth);
    style->setBorderLeftWidth(borderWidth);
    style->setBorderBottomWidth(borderWidth);
    style->setBorderRightWidth(borderWidth);
    toRenderBox(o)->paintFillLayerExtended(i,
        o->style()->backgroundColor(), o->style()->backgroundLayers(), r.x(), r.y(), toRenderBox(o)->width(), toRenderBox(o)->height(), 0, style->backgroundComposite());
    toRenderBox(o)->paintBorder(i.context,
        r.x(), r.y(), r.width(), r.height(),
        style.get(), true, true);

    if( o->node()->active() ) {
        IntRect r2(r);
        r2.inflate(-2);
        i.context->setFillColor(WebCore::Color(0xc0,0xc0,0xc0), DeviceColorSpace);
        i.context->drawRect(r2);
        v = GROOVE;
        style->setBorderTopStyle(v);
        style->setBorderLeftStyle(v);
        style->setBorderBottomStyle(v);
        style->setBorderRightStyle(v);
        int borderWidth = 1;
        style->setBorderTopWidth(borderWidth);
        style->setBorderLeftWidth(borderWidth);
        style->setBorderBottomWidth(borderWidth);
        style->setBorderRightWidth(borderWidth);
        toRenderBox(o)->paintFillLayerExtended(i,
        o->style()->backgroundColor(), o->style()->backgroundLayers(), r.x(), r.y(), toRenderBox(o)->width(), toRenderBox(o)->height(), 0, style->backgroundComposite());
        toRenderBox(o)->paintBorder(i.context,
            r.x(), r.y(), r.width(), r.height(),
            style.get(), true, true);
    }
    InputElement *input = toInputElement(static_cast<Element*>(o->node()));
    if(input && input->isChecked()) {
        i.context->setStrokeColor(Color::black, DeviceColorSpace);
        i.context->setStrokeStyle(SolidStroke);
        IntRect r2(r);
        r2.inflate(-borderWidth-2);
        i.context->drawLine(IntPoint(r2.x(),r2.y()), IntPoint(r2.x()+r2.width(),r2.y()+r2.height()));
        i.context->drawLine(IntPoint(r2.x()+r2.width(),r2.y()), IntPoint(r2.x(),r2.y()+r2.height()));
    }
    i.context->restore();
    return false;
}

void RenderThemeBal::setRadioSize(RenderStyle* style) const
{
    // This is the same as checkboxes.
    setCheckboxSize(style);
}

bool RenderThemeBal::paintRadio(RenderObject* o, const RenderObject::PaintInfo& i, const IntRect& r)
{
    i.context->save();
    i.context->setStrokeStyle(SolidStroke);
    PassRefPtr<RenderStyle> style = RenderStyle::create();
    EBorderStyle v = RIDGE;
    style->setBorderTopStyle(v);
    style->setBorderLeftStyle(v);
    style->setBorderBottomStyle(v);
    style->setBorderRightStyle(v);
#if OS(AMIGAOS4)
    int borderWidth = 2;
#else
    int borderWidth = 1;
#endif
    style->setBorderTopWidth(borderWidth);
    style->setBorderLeftWidth(borderWidth);
    style->setBorderBottomWidth(borderWidth);
    style->setBorderRightWidth(borderWidth);

    toRenderBox(o)->paintFillLayerExtended(i,
        o->style()->backgroundColor(), o->style()->backgroundLayers(), r.x(), r.y(), toRenderBox(o)->width(), toRenderBox(o)->height(), 0, style->backgroundComposite());
    toRenderBox(o)->paintBorder(i.context,
        r.x(), r.y(), r.width(), r.height(),
        style.get(), true, true);
    InputElement *input = toInputElement(static_cast<Element*>(o->node()));
    if(input && input->isChecked()) {
        IntRect r2(r);
#if OS(AMIGAOS4)
        r2.inflate(-borderWidth - 1);
        i.context->setFillColor(Color(0xFF618ECE));
#else
        r2.inflate(-borderWidth - 2);
#endif
        i.context->drawRect(r2);
    }
    i.context->restore();
    return false;
}

void RenderThemeBal::adjustButtonStyle(CSSStyleSelector* selector, RenderStyle* style, WebCore::Element* e) const
{
    addIntrinsicMargins(style);
}

bool RenderThemeBal::paintButton(RenderObject* o, const RenderObject::PaintInfo& i, const IntRect& r)
{
    toRenderBox(o)->paintFillLayerExtended(i,
        o->style()->backgroundColor(), o->style()->backgroundLayers(), r.x(), r.y(), toRenderBox(o)->width(), toRenderBox(o)->height(), 0, o->style()->backgroundComposite());
    toRenderBox(o)->paintBorder(i.context,
        r.x(), r.y(), r.width(), r.height(),
        o->style(), true, true);
    return false;
}

void RenderThemeBal::adjustMenuListStyle(CSSStyleSelector* selector, RenderStyle* style, WebCore::Element* e) const
{
    style->resetBorder();
    style->resetPadding();
    style->setHeight(Length(Auto));
    style->setWhiteSpace(PRE);
}

bool RenderThemeBal::paintMenuList(RenderObject* o, const RenderObject::PaintInfo& i, const IntRect& r)
{
    PassRefPtr<RenderStyle> style = RenderStyle::create();
    style->setMarginLeft(Length(10, Fixed));
    style->setMarginTop(Length(10, Fixed));
    EBorderStyle v = INSET;
    style->setBorderTopStyle(v);
    style->setBorderLeftStyle(v);
    style->setBorderBottomStyle(v);
    style->setBorderRightStyle(v);
    style->setBorderTopWidth(1);
    style->setBorderLeftWidth(1);
    style->setBorderBottomWidth(1);
    style->setBorderRightWidth(1);
    toRenderBox(o)->paintFillLayerExtended(i,
        o->style()->backgroundColor(), o->style()->backgroundLayers(), r.x(), r.y(), toRenderBox(o)->width(), toRenderBox(o)->height(), 0, style->backgroundComposite());
    toRenderBox(o)->paintBorder(i.context,
        r.x(), r.y(), r.width(), r.height(),
        style.get(), true, true);
    return false;
    
}

void RenderThemeBal::adjustTextFieldStyle(CSSStyleSelector* selector, RenderStyle* style, Element* e) const
{
    style->resetBorder();
    style->resetPadding();
    style->setHeight(Length(Auto));
    style->setWhiteSpace(PRE);
}

bool RenderThemeBal::paintTextField(RenderObject* o, const RenderObject::PaintInfo& i, const IntRect& r)
{
    i.context->save();
    i.context->setStrokeStyle(SolidStroke);
    i.context->setStrokeColor(Color::black, DeviceColorSpace);
    PassRefPtr<RenderStyle> style = RenderStyle::create();
    addIntrinsicMargins(style.get());

    EBorderStyle v = INSET;
    style->setBorderTopStyle(v);
    style->setBorderLeftStyle(v);
    style->setBorderBottomStyle(v);
    style->setBorderRightStyle(v);
    int borderWidth = 1;
    style->setBorderTopWidth(borderWidth);
    style->setBorderLeftWidth(borderWidth);
    style->setBorderBottomWidth(borderWidth);
    style->setBorderRightWidth(borderWidth);
    toRenderBox(o)->paintFillLayerExtended(i,
        o->style()->backgroundColor(), o->style()->backgroundLayers(), r.x(), r.y(), toRenderBox(o)->width(), toRenderBox(o)->height(), 0, style->backgroundComposite());
    toRenderBox(o)->paintBorder(i.context,
        r.x(), r.y(), r.width(), r.height(),
        style.get(), true, true);

    i.context->restore();
    return false;
}

void RenderThemeBal::adjustTextAreaStyle(CSSStyleSelector* selector, RenderStyle* style, Element* e) const
{
    adjustTextFieldStyle(selector, style, e);
}

bool RenderThemeBal::paintTextArea(RenderObject* o, const RenderObject::PaintInfo& i, const IntRect& r)
{
    return paintTextField(o, i, r);
}

void RenderThemeBal::adjustSearchFieldResultsButtonStyle(CSSStyleSelector* selector, RenderStyle* style, Element* e) const
{
    adjustSearchFieldCancelButtonStyle(selector, style, e);
}

bool RenderThemeBal::paintSearchFieldResultsButton(RenderObject* o, const RenderObject::PaintInfo& i, const IntRect& rect)
{
    return true;
}

void RenderThemeBal::adjustSearchFieldResultsDecorationStyle(CSSStyleSelector* selector, RenderStyle* style, Element* e) const
{
    style->resetBorder();
    style->resetPadding();

    // FIXME: This should not be hard-coded.
    IntSize size = IntSize(14, 14);
    style->setWidth(Length(size.width(), Fixed));
    style->setHeight(Length(size.height(), Fixed));
}

bool RenderThemeBal::paintSearchFieldResultsDecoration(RenderObject* o, const RenderObject::PaintInfo& i, const IntRect& rect)
{
    return true;
}

void RenderThemeBal::adjustSearchFieldCancelButtonStyle(CSSStyleSelector* selector, RenderStyle* style, Element* e) const
{
    style->resetBorder();
    style->resetPadding();

    // FIXME: This should not be hard-coded.
    IntSize size = IntSize(14, 14);
    style->setWidth(Length(size.width(), Fixed));
    style->setHeight(Length(size.height(), Fixed));
}

bool RenderThemeBal::paintSearchFieldCancelButton(RenderObject* o, const RenderObject::PaintInfo& i, const IntRect& rect)
{
    return true;
}

void RenderThemeBal::adjustSearchFieldStyle(CSSStyleSelector* selector, RenderStyle* style, Element* e) const
{
    adjustTextFieldStyle(selector, style, e);
}

bool RenderThemeBal::paintSearchField(RenderObject* o, const RenderObject::PaintInfo& i, const IntRect& rect)
{
    return paintTextField(o, i, rect);
}

Color RenderThemeBal::platformActiveSelectionBackgroundColor() const
{
#if OS(AMIGAOS4)
    Color c(0xFF618ECE);
#else
    Color c(0, 0, 255);
#endif
    return c;
}

Color RenderThemeBal::platformInactiveSelectionBackgroundColor() const
{
#if OS(AMIGAOS4)
    Color c(0xFFCFCFCF);
#else
    Color c(0, 0, 255);
#endif
    return c;
}

Color RenderThemeBal::platformActiveSelectionForegroundColor() const
{
#if OS(AMIGAOS4)
    Color c(0xFF000000);
#else
    Color c(255, 255, 255);
#endif
    return c;
}

Color RenderThemeBal::platformInactiveSelectionForegroundColor() const
{
#if OS(AMIGAOS4)
    Color c(0xFF3F3F3F);
#else
    Color c(255, 255, 255);
#endif
    return c;
}

Color RenderThemeBal::activeListBoxSelectionBackgroundColor() const
{
#if OS(AMIGAOS4)
    Color c(0xFF618ECE);
#else
    Color c(0, 0, 255);
#endif
    return c;
}

Color RenderThemeBal::inactiveListBoxSelectionBackgroundColor() const
{
#if OS(AMIGAOS4)
    Color c(0xFFCFCFCF);
#else
    Color c(0, 0, 255);
#endif
    return c;
}

Color RenderThemeBal::activeListBoxSelectionForegroundColor() const
{
#if OS(AMIGAOS4)
    Color c(0xFF000000);
#else
    Color c(255, 255, 255);
#endif
    return c;
}

Color RenderThemeBal::inactiveListBoxSelectionForegroundColor() const
{
#if OS(AMIGAOS4)
    Color c(0xFF3F3F3F);
#else
    Color c(255, 255, 255);
#endif
    return c;
}

double RenderThemeBal::caretBlinkInterval() const
{
    return 1.0;
}

void RenderThemeBal::systemFont(int, FontDescription&) const
{
    // If you remove this notImplemented(), replace it with an comment that explains why.
    //NotImplemented();
}


BalContainer* RenderThemeBal::balContainer() const
{
    if (m_balContainer)
        return m_balContainer;

    return m_balContainer;
}

BalWidget* RenderThemeBal::balEntry() const
{
    if (m_balEntry)
        return m_balEntry;

    return m_balEntry;
}

BalWidget* RenderThemeBal::balTreeView() const
{
    if (m_balTreeView)
        return m_balTreeView;

    return m_balTreeView;
}

}
