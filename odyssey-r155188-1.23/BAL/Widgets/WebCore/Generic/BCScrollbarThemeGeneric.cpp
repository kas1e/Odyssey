/*
 * Copyright (C) 2008 Apple Inc. All Rights Reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY APPLE INC. ``AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL APPLE INC. OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "config.h"
#include "ScrollbarThemeGeneric.h"

#include "BALBase.h"
#include "ChromeClient.h"
#include "ColorSpace.h"
#include "Frame.h"
#include "FrameView.h"
#include "GraphicsContext.h"
#include "Logging.h"
#include "Page.h"
#include "PlatformMouseEvent.h"
#include "GraphicsContext.h"
#include "Scrollbar.h"
#include "ScrollbarClient.h"
#include "Settings.h"

namespace WebCore {

// Constants used to figure the drag rect outside which we should snap the
// scrollbar thumb back to its origin.  These calculations are based on
// observing the behavior of the MSVC8 main window scrollbar + some
// guessing/extrapolation.
static const int kOffEndMultiplier = 3;
static const int kOffSideMultiplier = 8;


ScrollbarTheme* ScrollbarTheme::nativeTheme()
{
    static ScrollbarThemeBal theme;
    return &theme;
}

ScrollbarThemeBal::~ScrollbarThemeBal()
{
}


int ScrollbarThemeBal::scrollbarThickness(ScrollbarControlSize controlSize)
{
    //BalNotImplemented();
    return 11;
}

bool ScrollbarThemeBal::hasThumb(Scrollbar* scrollbar)
{
    return thumbLength(scrollbar) > 0;
}

IntRect ScrollbarThemeBal::backButtonRect(Scrollbar* scrollbar, ScrollbarPart part, bool)
{
    if (part == BackButtonEndPart)
        return IntRect();

    // Our desired rect is essentially 17x17.

    // Our actual rect will shrink to half the available space when
    // we have < 34 pixels left.  This allows the scrollbar
    // to scale down and function even at tiny sizes.
    int thickness = scrollbarThickness();
    if (scrollbar->orientation() == HorizontalScrollbar)
        return IntRect(scrollbar->x(), scrollbar->y(),
                       scrollbar->width() < 2 * thickness ? scrollbar->width() / 2 : thickness, thickness);
    return IntRect(scrollbar->x(), scrollbar->y(),
                   thickness, scrollbar->height() < 2 * thickness ? scrollbar->height() / 2 : thickness);
}

IntRect ScrollbarThemeBal::forwardButtonRect(Scrollbar* scrollbar, ScrollbarPart part, bool)
{
    if (part == ForwardButtonStartPart)
        return IntRect();

    // Our desired rect is essentially 17x17.

    // Our actual rect will shrink to half the available space when
    // we have < 34 pixels left.  This allows the scrollbar
    // to scale down and function even at tiny sizes.
    int thickness = scrollbarThickness();
    if (scrollbar->orientation() == HorizontalScrollbar) {
        int w = scrollbar->width() < 2 * thickness ? scrollbar->width() / 2 : thickness;
        return IntRect(scrollbar->x() + scrollbar->width() - w, scrollbar->y(), w, thickness);
    }

    int h = scrollbar->height() < 2 * thickness ? scrollbar->height() / 2 : thickness;
    return IntRect(scrollbar->x(), scrollbar->y() + scrollbar->height() - h, thickness, h);
}

IntRect ScrollbarThemeBal::trackRect(Scrollbar* scrollbar, bool)
{
    int thickness = scrollbarThickness();
    if (scrollbar->orientation() == HorizontalScrollbar) {
        if (scrollbar->width() < 2 * thickness)
            return IntRect();
        return IntRect(scrollbar->x() + thickness, scrollbar->y(), scrollbar->width() - 2 * thickness, thickness);
    }
    if (scrollbar->height() < 2 * thickness)
        return IntRect();
    return IntRect(scrollbar->x(), scrollbar->y() + thickness, thickness, scrollbar->height() - 2 * thickness);
}

void ScrollbarThemeBal::paintButton(GraphicsContext* context, Scrollbar* scrollbar, const IntRect& rect, ScrollbarPart part)
{
    context->save();
    bool start = (part == BackButtonStartPart);
    static RefPtr<WebCore::Image> left = Image::loadPlatformResource("/ScrollbarTheme/left");
    if (!left->isNull()) {
        IntPoint startPos(rect.location());
        if (start) {
            if (scrollbar->orientation() == HorizontalScrollbar)
                context->drawImage(left.get(), DeviceColorSpace, startPos);
            else {
                static RefPtr<WebCore::Image> up = Image::loadPlatformResource("/ScrollbarTheme/up");
                context->drawImage(up.get(), DeviceColorSpace, startPos);
            }
        } else {
            if (scrollbar->orientation() == HorizontalScrollbar) {
                static RefPtr<WebCore::Image> right = Image::loadPlatformResource("/ScrollbarTheme/right");
                context->drawImage(right.get(), DeviceColorSpace, startPos);
            } else {
                static RefPtr<WebCore::Image> down = Image::loadPlatformResource("/ScrollbarTheme/down");
                context->drawImage(down.get(), DeviceColorSpace, startPos);
            }
        }
    } else {
        context->drawRect(rect);
        context->fillRect(IntRect(rect.x() + 1, rect.y() + 1, rect.width() - 2, rect.height() - 2), Color::gray, DeviceColorSpace);

        if (start) {
            if (scrollbar->orientation() == HorizontalScrollbar) {
                context->drawLine(IntPoint(rect.right(), rect.y()), IntPoint(rect.x() - 1, (rect.bottom() + rect.y())/2));
                context->drawLine(IntPoint(rect.right(), rect.bottom()), IntPoint(rect.x() - 1, (rect.bottom() + rect.y())/2));
            } else {
                context->drawLine(IntPoint(rect.x(), rect.bottom()), IntPoint((rect.x() + rect.right())/2, rect.y() + 1));
                context->drawLine(IntPoint(rect.right() - 1, rect.bottom()), IntPoint((rect.x() + rect.right())/2, rect.y() + 1));
            }
        } else {
            if (scrollbar->orientation() == HorizontalScrollbar) {
                context->drawLine(IntPoint(rect.x(), rect.y()), IntPoint(rect.right() - 1, (rect.bottom() + rect.y())/2));
                context->drawLine(IntPoint(rect.x(), rect.bottom()), IntPoint(rect.right() - 1, (rect.bottom() + rect.y())/2));
            } else {
                context->drawLine(IntPoint(rect.x(), rect.y()), IntPoint((rect.x() + rect.right())/2, rect.bottom() - 1));
                context->drawLine(IntPoint(rect.right(), rect.y()), IntPoint((rect.x() + rect.right())/2, rect.bottom() - 1));
            }
        }
    }
    context->restore();
}

void ScrollbarThemeBal::paintThumb(GraphicsContext* context, Scrollbar* scrollbar, const IntRect& rect)
{
    context->save();
    if (scrollbar->orientation() == HorizontalScrollbar) {
        static RefPtr<WebCore::Image> thumbH = Image::loadPlatformResource("/ScrollbarTheme/thumbH");
        if (!thumbH->isNull()) {
            static RefPtr<WebCore::Image> thumbHL = Image::loadPlatformResource("/ScrollbarTheme/thumbHL");
            static RefPtr<WebCore::Image> thumbHR = Image::loadPlatformResource("/ScrollbarTheme/thumbHR");
            IntPoint startPos(rect.location());
            IntPoint endPos(rect.right() - thumbHR->width(), rect.y());
            IntRect destRect(rect.x() + thumbHL->width() - 1, rect.y(), rect.width() - thumbHR->width() - thumbHL->width() + 1, rect.height());

            context->drawImage(thumbHL.get(), DeviceColorSpace, startPos);
            context->drawTiledImage(thumbH.get(), DeviceColorSpace, destRect, IntPoint(0, 0), IntSize(thumbH->width(), thumbH->height()));
            context->drawImage(thumbHR.get(), DeviceColorSpace, endPos);

        } else {
            context->drawRect(rect);
            context->fillRect(IntRect(rect.x() + 1, rect.y() + 1, rect.width() - 2, rect.height() - 2), Color::gray, DeviceColorSpace);
        }
    } else {
        static RefPtr<WebCore::Image> thumbV = Image::loadPlatformResource("/ScrollbarTheme/thumbV");
        if (!thumbV->isNull()) {
            static RefPtr<WebCore::Image> thumbVU = Image::loadPlatformResource("/ScrollbarTheme/thumbVU");
            static RefPtr<WebCore::Image> thumbVD = Image::loadPlatformResource("/ScrollbarTheme/thumbVD");
            IntPoint startPos(rect.location());
            IntPoint endPos(rect.x(), rect.bottom() - thumbVD->height());
            IntRect destRect(rect.x(), rect.y() + thumbVU->height(), rect.width(), rect.height() - thumbVU->height() - thumbVD->height());

            context->drawImage(thumbVU.get(), DeviceColorSpace, startPos);
            context->drawTiledImage(thumbV.get(), DeviceColorSpace, destRect, IntPoint(0, 0), IntSize(thumbV->width(), thumbV->height()));
            context->drawImage(thumbVD.get(), DeviceColorSpace, endPos);
        } else {
            context->drawRect(rect);
            context->fillRect(IntRect(rect.x() + 1, rect.y() + 1, rect.width() - 2, rect.height() - 2), Color::gray, DeviceColorSpace);
        }
    }
    context->restore();
}


void ScrollbarThemeBal::paintTrackBackground(GraphicsContext* context, Scrollbar* scrollbar, const IntRect& rect)
{
    // Just assume a forward track part.  We only paint the track as a single piece when there is no thumb.
    if (!hasThumb(scrollbar))
        paintTrackPiece(context, scrollbar, rect, ForwardTrackPart);
}

bool ScrollbarThemeBal::invalidateOnMouseEnterExit()
{
    return false;
}

void ScrollbarThemeBal::themeChanged()
{
}

bool ScrollbarThemeBal::shouldCenterOnThumb(Scrollbar*, const PlatformMouseEvent& evt)
{
    return evt.shiftKey() && evt.button() == LeftButton;
}


bool ScrollbarThemeBal::shouldSnapBackToDragOrigin(Scrollbar* scrollbar, const PlatformMouseEvent& evt)
{
    // Find the rect within which we shouldn't snap, by expanding the track rect
    // in both dimensions.
    IntRect rect = trackRect(scrollbar);
    const bool horz = scrollbar->orientation() == HorizontalScrollbar;
    const int thickness = scrollbarThickness(scrollbar->controlSize());
    rect.inflateX((horz ? kOffEndMultiplier : kOffSideMultiplier) * thickness);
    rect.inflateY((horz ? kOffSideMultiplier : kOffEndMultiplier) * thickness);

    // Convert the event to local coordinates.
    IntPoint mousePosition = scrollbar->convertFromContainingWindow(evt.pos());
    mousePosition.move(scrollbar->x(), scrollbar->y());
    // We should snap iff the event is outside our calculated rect.
    return !rect.contains(mousePosition);
}

void ScrollbarThemeBal::paintTrackPiece(GraphicsContext* context, Scrollbar* scrollbar, const IntRect& rect, ScrollbarPart partType)
{
    context->save();

    static RefPtr<WebCore::Image> bg = Image::loadPlatformResource("/ScrollbarTheme/bg");
    if (!bg->isNull()) {
        if (scrollbar->orientation() == HorizontalScrollbar) {
            static RefPtr<WebCore::Image> bgh = Image::loadPlatformResource("/ScrollbarTheme/bgh");
            IntRect destRect(rect.x() - 1, rect.y(), rect.width() + 2, rect.height());
            context->drawTiledImage(bgh.get(), DeviceColorSpace, destRect, IntPoint(0, 0), IntSize(bgh->width(), bgh->height()));
        } else {
            IntRect destRect(rect.x(), rect.y() - 1, rect.width(), rect.height() + 2 );
            context->drawTiledImage(bg.get(), DeviceColorSpace, destRect, IntPoint(0, 0), IntSize(bg->width(), bg->height()));
        }
    } else {
        context->fillRect(rect, Color::white, DeviceColorSpace);
        if (scrollbar->orientation() == HorizontalScrollbar)
            context->drawLine(IntPoint(rect.x(), (rect.bottom() + rect.y()) / 2), IntPoint(rect.right(), (rect.bottom() + rect.y()) / 2));
        else
            context->drawLine(IntPoint((rect.right() + rect.x()) / 2, rect.y()), IntPoint((rect.right() + rect.x()) / 2, rect.bottom()));
    }
    context->restore();
}


}
