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
#include "WebWindowAlert.h"

#include "Color.h"
#include "FontSelector.h"
#include "Frame.h"
#include "FrameView.h"
#include "GraphicsContext.h"
#include "Image.h"
#include "IntRect.h"
#include "WindowsKeyboardCodes.h"
#include "PlatformKeyboardEvent.h"
#include "PlatformMouseEvent.h"
#include "TextBreakIterator.h"
#include "WebView.h"
#include "WebFrame.h"

using namespace WebCore;

static int fontSize = 12;

WebWindowAlert* WebWindowAlert::createWebWindowAlert(bool modal, WebView* webView, const char* text)
{
    return new WebWindowAlert(modal, webView, text);
}

WebWindowAlert::WebWindowAlert(bool modal, WebView* webView, const char* text)
    : WebWindow(modal, webView, webView->frameRect())
    , m_text(text)
    , m_buttonText("OK")
    , m_state(false)
    , isPainted(false)
    , isThemable(false)
{
}

WebWindowAlert::~WebWindowAlert()
{
}

void WebWindowAlert::paint(BalRectangle rect)
{
    if (!m_surface || isPainted)
        return;

    isPainted = true;

    IntRect mainSurfaceRect(mainWindowRect());
    GraphicsContext* ctx = createContext();
    ctx->save();
    // Paint background
    ctx->fillRect(IntRect(0, 0, mainSurfaceRect.width(), mainSurfaceRect.height()), Color::transparent, DeviceColorSpace);

    static RefPtr<WebCore::Image> cornerhl = Image::loadPlatformResource("/Alert/cornerhl");
    if (cornerhl) {
        static RefPtr<WebCore::Image> cornerhr = Image::loadPlatformResource("/Alert/cornerhr");
        static RefPtr<WebCore::Image> cornerbl = Image::loadPlatformResource("/Alert/cornerbl");
        static RefPtr<WebCore::Image> cornerbr = Image::loadPlatformResource("/Alert/cornerbr");
        static RefPtr<WebCore::Image> borderh = Image::loadPlatformResource("/Alert/borderh");
        static RefPtr<WebCore::Image> borderb = Image::loadPlatformResource("/Alert/borderb");
        static RefPtr<WebCore::Image> borderl = Image::loadPlatformResource("/Alert/borderl");
        static RefPtr<WebCore::Image> borderr = Image::loadPlatformResource("/Alert/borderr");
        static RefPtr<WebCore::Image> bg = Image::loadPlatformResource("/Alert/background");
        static RefPtr<WebCore::Image> buttonOK = Image::loadPlatformResource("/Alert/buttonOK");
        if (!cornerhr->isNull() && !cornerbl->isNull() && !cornerbr->isNull() && !borderh->isNull() && !borderb->isNull() && !borderl->isNull() && !borderr->isNull() && !bg->isNull() && !buttonOK->isNull()) {
            isThemable = true;

            // Create font
            FontDescription fontDescription;
            // this is normally computed by CSS and fixes the minimum size
            fontDescription.setComputedSize(fontSize);
            Font font(fontDescription, 0, 0);
            // update m_fontList
            // needed or else Assertion `m_fontList' will failed.
            font.update(0);

            int textWidth = font.width(TextRun(m_text.c_str()));
            int lines = 2 * textWidth / mainSurfaceRect.width() + 1;
            int popupHeight = borderh->height() * 2 + buttonOK->height() + lines * font.height();
            int popupWidth = textWidth + 2 * borderl->width();

            int minWidth = buttonOK->width() + 2 * borderl->width(); // OK button width + width of right and left border.
            if (popupWidth < minWidth)
                popupWidth = minWidth;

            if (textWidth > mainSurfaceRect.width() / 2)
                popupWidth = mainSurfaceRect.width() / 2;

            // Compute popup top left corner to have a centered popup.
            IntPoint startPos((mainSurfaceRect.width() - popupWidth) / 2, (mainSurfaceRect.height() - popupHeight) / 2);

            // Fill popup with popup bg image.
            // Then draw borders.
            ctx->drawImage(bg.get(), DeviceColorSpace, IntRect(startPos, IntSize(popupWidth, popupHeight)));

            // Left side
            IntPoint topLeft(startPos);
            ctx->drawImage(cornerhl.get(), DeviceColorSpace, topLeft);
            IntRect leftBorder(IntPoint(topLeft.x(), topLeft.y() + cornerhl->height()), IntSize(borderl->width(), popupHeight - 2 * cornerhl->height()));
            ctx->drawImage(borderl.get(), DeviceColorSpace, leftBorder);
            IntPoint bottomLeft(topLeft.x(), topLeft.y() + popupHeight - cornerbl->height());
            ctx->drawImage(cornerbl.get(), DeviceColorSpace, bottomLeft);

            // Right side
            IntPoint topRight(startPos.x() + popupWidth - cornerhr->width(), startPos.y());
            ctx->drawImage(cornerhr.get(), DeviceColorSpace, topRight);
            IntRect rightBorder(IntPoint(topRight.x(), topRight.y() + cornerhr->height()), IntSize(borderr->width(), popupHeight - 2 * cornerhr->height()));
            ctx->drawImage(borderr.get(), DeviceColorSpace, rightBorder);
            IntPoint bottomRight(topRight.x(), topRight.y() + popupHeight - cornerbr->height());
            ctx->drawImage(cornerbr.get(), DeviceColorSpace, bottomRight);
            
            // Top border
            IntRect topBorder(startPos.x() + borderh->width(), startPos.y(), popupWidth - 2 * borderh->width(), borderh->height());
            ctx->drawImage(borderh.get(), DeviceColorSpace, topBorder);

            // Bottom border
            IntRect bottomBorder(startPos.x() + borderb->width(), startPos.y() + popupHeight - borderb->height(), popupWidth - 2 * borderb->width(), borderb->height());
            ctx->drawImage(borderb.get(), DeviceColorSpace, bottomBorder);

            // Draw OK button
            // Specific hack: a bit lower
            m_buttonRect = IntRect(startPos.x() + (popupWidth - buttonOK->width()) / 2, startPos.y() + popupHeight - borderb->height() / 2 - buttonOK->height(), buttonOK->width(), buttonOK->height());
            ctx->drawImage(buttonOK.get(), DeviceColorSpace, m_buttonRect);

            // Draw text line by line
            IntPoint startText(startPos.x() + borderl->width(), startPos.y() + borderh->height() + font.size());
            TextRun textrun(m_text.c_str());
            uint16_t lineLength = popupWidth - 2 * borderl->width(); // Keep a border for max line length
            uint8_t lineEnd = 0;
            uint16_t currentLineLength = 0;
            getLineBreak(font, textrun, lineLength, &lineEnd, &currentLineLength); // Get the computed index in text and the corresponding text length to perfectly display one line.
            int xCenterOffset = (lineLength - currentLineLength) / 2; // x offset to display a centered text.
            startText.move(xCenterOffset, 0);
            TextRun textLine(textrun.characters(), textrun.length());
            for (int line = 0; line < lines; line++) {
                font.drawText(ctx, textLine, startText, 0, lineEnd);
                // Undo the previous x move to correctly center next line.
                startText.move(-xCenterOffset, 0);
                textLine.setText(textLine.data(lineEnd), textLine.length() - lineEnd);
                getLineBreak(font, textLine, lineLength, &lineEnd, &currentLineLength);
                // Update xCenterOffset as currentLineLength has been updated for next line.
                xCenterOffset = (lineLength - currentLineLength) / 2;
                startText.move(xCenterOffset, font.lineSpacing());
            }


            IntRect source(m_rect);
            source.setLocation(IntPoint(0, 0));
            IntRect destination(m_rect);

            updateRect(source, destination);
            ctx->restore();
            releaseContext(ctx);
            return;
        }
    }

    // Paint Window background
    ctx->fillRect(IntRect(0, (mainSurfaceRect.height() / 2) - (fontSize * 2), mainSurfaceRect.width(), fontSize * 6), Color(0xFF0000CC), DeviceColorSpace);

    // Draw Text
    FontDescription fontDescription;
    // this is normally computed by CSS and fixes the minimum size
    fontDescription.setComputedSize(fontSize);
    Font font(fontDescription,0,0);
    // update m_fontList
    // needed or else Assertion `m_fontList' will failed.
    font.update(0);

    TextRun textrun(m_text.c_str());
    ctx->drawText(font, textrun, IntPoint(((mainSurfaceRect.width() / 2 ) - (textrun.length() * fontSize / 3)), mainSurfaceRect.height() / 2));

    // draw button
    m_state = false;
    drawButton();

    // Blit and update
    IntRect source(m_rect);
    source.setLocation(IntPoint(0, 0));
    IntRect destination(m_rect);
    updateRect(source, destination);
    ctx->restore();
    releaseContext(ctx);
}

void WebWindowAlert::drawButton()
{
    if (isThemable)
        return;

    IntRect mainSurfaceRect(mainWindowRect());
    GraphicsContext* ctx = createContext();
    ctx->save();
    if (!m_state) {
        ctx->setFillColor(Color::darkGray, DeviceColorSpace);
        ctx->drawRect(IntRect(mainSurfaceRect.width()/2 - 40, (mainSurfaceRect.height() / 2) + (fontSize * 2), 80, 40));
        ctx->setFillColor(Color::gray, DeviceColorSpace);
        ctx->drawRect(IntRect(mainSurfaceRect.width()/2 - 40, (mainSurfaceRect.height() / 2) + (fontSize * 2), 77, 37));
    } else {
        ctx->setFillColor(Color::gray, DeviceColorSpace);
        ctx->drawRect(IntRect(mainSurfaceRect.width()/2 - 40, (mainSurfaceRect.height() / 2) + (fontSize * 2), 80, 40));
        ctx->setFillColor(Color::darkGray, DeviceColorSpace);
        ctx->drawRect(IntRect(mainSurfaceRect.width()/2 - 40, (mainSurfaceRect.height() / 2) + (fontSize * 2), 77, 37));
    }
    ctx->drawLine(IntPoint(mainSurfaceRect.width()/2 + 37, (mainSurfaceRect.height() / 2) + (fontSize * 2) + 37), IntPoint(mainSurfaceRect.width()/2 + 39, (mainSurfaceRect.height() / 2) + (fontSize * 2) + 39));

    FontDescription fontDescription;
    // this is normally computed by CSS and fixes the minimum size
    fontDescription.setComputedSize(fontSize);
    Font font(fontDescription,0,0);
    // update m_fontList
    // needed or else Assertion `m_fontList' will failed.
    font.update(0);

    ctx->setFillColor(Color::black, DeviceColorSpace);
    TextRun textrun(m_buttonText.c_str());
    ctx->drawText(font, textrun, IntPoint((mainSurfaceRect.width() / 2 ) - 25, (mainSurfaceRect.height() / 2) + (fontSize * 2) + 25));
    //ctx.drawText(textrun, IntPoint(0, 0));

    ctx->restore();
    releaseContext(ctx);
}

void WebWindowAlert::updateButton()
{
    if (isThemable)
        return;
    
    IntRect mainSurfaceRect(mainWindowRect());
    IntRect src(mainSurfaceRect.width()/2 - 40,
                (mainSurfaceRect.height() / 2) + (fontSize * 2),
                80,
                40);
    IntRect dst(mainSurfaceRect.width()/2 - 40 + mainSurfaceRect.x(),
                (mainSurfaceRect.height() / 2) + (fontSize * 2) + mainSurfaceRect.y(),
                80,
                40);
    updateRect(src, dst);
}

bool WebWindowAlert::onKeyDown(BalEventKey event)
{
    if (!m_surface)
        return false;
    PlatformKeyboardEvent keyboardEvent(&event);
#if ENABLE(CEHTML)
    if (keyboardEvent.windowsVirtualKeyCode() == VK_ENTER)
#else
    if (keyboardEvent.windowsVirtualKeyCode() == VK_RETURN)
#endif
        hide();
    return true;
}

bool WebWindowAlert::onMouseMotion(BalEventMotion ev)
{
    if (!m_surface)
        return false;

#if PLATFORM(QT)
    PlatformMouseEvent event(&ev, 0);
#else
    PlatformMouseEvent event(&ev);
#endif
    IntRect mainSurfaceRect(mainWindowRect());
    if (isThemable) {
        IntRect buttonRect = m_buttonRect;
        if ((event.x() > buttonRect.x() + mainSurfaceRect.x() && event.x() < buttonRect.right() + mainSurfaceRect.x()) && (event.y() > buttonRect.y() + mainSurfaceRect.y() && event.y() < buttonRect.bottom() + mainSurfaceRect.y())) {
            if (!m_state) {
                m_state = true;
                drawButton();
                updateButton();
            }
        }
    } else if ((event.x() > (mainSurfaceRect.width()/2 - 40) + mainSurfaceRect.x() && event.x() < (mainSurfaceRect.width()/2 + 40) + mainSurfaceRect.x() ) && ( event.y() > (mainSurfaceRect.height() / 2) + mainSurfaceRect.y() + (fontSize * 2) && event.y() < (mainSurfaceRect.height() / 2) + (fontSize * 2) + 40 + mainSurfaceRect.y())) {
        if (!m_state) {
            m_state = true;
            drawButton();
            updateButton();
        }
    } else {
        if (m_state) {
            m_state = false;
            drawButton();
            updateButton();
        }
    }
    return true;
}

bool WebWindowAlert::onMouseButtonDown(BalEventButton ev)
{
    if (!m_surface)
        return false;

#if PLATFORM(GTK)
    PlatformMouseEvent event(&ev);
#else
    PlatformMouseEvent event(&ev, 1);
#endif

    IntRect mainSurfaceRect(mainWindowRect());
    if (isThemable) {
        IntRect buttonRect = m_buttonRect;
        if ((event.x() > buttonRect.x() + mainSurfaceRect.x() && event.x() < buttonRect.right() + mainSurfaceRect.x()) && (event.y() > buttonRect.y() + mainSurfaceRect.y() && event.y() < buttonRect.bottom() + mainSurfaceRect.y()))
            hide();
    } else if ((event.x() > (mainSurfaceRect.width()/2 - 40) + mainSurfaceRect.x() && event.x() < (mainSurfaceRect.width()/2 + 40) + mainSurfaceRect.x()) && ( event.y() > (mainSurfaceRect.height() / 2) + (fontSize * 2) + mainSurfaceRect.y() && event.y() < (mainSurfaceRect.height() / 2) + (fontSize * 2) + 40 + mainSurfaceRect.y()))
        hide();
    return true;
}

bool WebWindowAlert::onQuit(BalQuitEvent)
{
    if (!m_surface)
        return false;
    hide();
    return true;
}

void WebWindowAlert::getLineBreak(WebCore::Font& font, WebCore::TextRun& text, uint16_t maxLength, uint8_t* wordBreak, uint16_t* wordLength)
{
    // Ensure that wordBreak is set to 0 to avoid bugs in next calls.
    *wordBreak = 0;

    if (font.width(text) <= maxLength) {
        *wordBreak = text.length();
        *wordLength = font.width(text);
        return;
    }

    TextRun expandText(text.data(0), 1);
    while (font.width(expandText) < maxLength) {
        uint8_t nextWordBreak = textBreakFollowing(wordBreakIterator(text.characters(), text.length()), *wordBreak);
        expandText.setText(text.data(0), nextWordBreak);
        if (font.width(expandText) >= maxLength)
            break;
        *wordBreak = nextWordBreak;
        *wordLength = font.width(expandText);
    }
    return;
}
