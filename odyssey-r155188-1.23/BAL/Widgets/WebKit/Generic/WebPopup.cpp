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
#include "WebPopup.h"
#include "PtrAndFlags.h"
#include "GraphicsContext.h"
#include "IntRect.h"
#include "Color.h"
#include "TextRun.h"
#include "Font.h"
#include "FontSelector.h"
#include "WebView.h"
#include "WebFrame.h"
#include "Frame.h"
#include "FrameView.h"
#include "Image.h"
#include "WindowsKeyboardCodes.h"
#include "RenderTheme.h"
#include "PlatformString.h"
#include "PlatformKeyboardEvent.h"
#include "PlatformMouseEvent.h"
#include "PlatformWheelEvent.h"
#include "PopupMenu.h"
#include "ColorSpace.h"

using namespace WebCore;

#define BORDERSIZE 20

static int scrollbarSize = 11;
const int separatorPadding = 4;
const int separatorHeight = 1;

WebPopup::WebPopup(WebCore::PopupMenu* popup, WebView* webView, bool modal)
    : WebWindow(modal, webView, webView->frameRect())
    , isPainted(false)
    , m_popup(popup)
    , m_scrollNeeded(false)
    , m_scrollIndex(m_popup->client()->selectedIndex())
    , m_isInitialized(false)
    , m_keyPos(-1)
{
    m_popup->setFocusedIndex(m_popup->client()->selectedIndex());
    m_popupRect = m_popup->windowRect();
}

WebPopup::~WebPopup()
{
}

void WebPopup::paint(BalRectangle rect)
{
    if (!m_surface || isPainted)
        return;

    isPainted = true;

    GraphicsContext* ctx = createContext();

    ctx->save();

    paintPopup(0);

    // Blit and update
    IntRect source(m_rect);
    source.setLocation(IntPoint(0, 0));
    IntRect destination(m_rect);
    updateRect(source, destination);
    ctx->restore();
    releaseContext(ctx);
}

void WebPopup::paintScrollbar()
{
    GraphicsContext* ctx = createContext();
    ctx->save();

    IntRect windowRect = m_popupRect;
    IntRect scrollBg = IntRect(windowRect.right(), windowRect.y(), scrollbarSize, windowRect.height());
    ctx->fillRect(scrollBg, Color::white, DeviceColorSpace);

    //Draw background
    static RefPtr<WebCore::Image> bg = Image::loadPlatformResource("/ScrollbarTheme/bg");
    if (bg->isNull()) {
        IntPoint p1 = IntPoint(windowRect.right() + (scrollbarSize / 2), windowRect.y());
        IntPoint p2 = IntPoint(windowRect.right() + (scrollbarSize / 2), windowRect.bottom());
        ctx->drawLine(p1, p2);
    } else {
        ctx->drawImage(bg.get(), DeviceColorSpace, scrollBg);
    }

    //Draw arrow
    static RefPtr<WebCore::Image> up = Image::loadPlatformResource("/ScrollbarTheme/up");
    static RefPtr<WebCore::Image> down = Image::loadPlatformResource("/ScrollbarTheme/down");
    //Set the default height of arrow to 10.
    const uint8_t arrowHeight = up->height() ? up->height() : 10;
    IntRect upArrowRect(windowRect.right(), windowRect.y(), scrollbarSize, arrowHeight);
    IntRect downArrowRect(windowRect.right(), windowRect.bottom() - arrowHeight, scrollbarSize, arrowHeight);
    if (up->isNull() || down->isNull()) { //did not found image resource
        ctx->fillRect(upArrowRect, Color::gray, DeviceColorSpace);
        ctx->fillRect(downArrowRect, Color::gray, DeviceColorSpace);
        ctx->drawLine(IntPoint(upArrowRect.x(), upArrowRect.bottom()), IntPoint(upArrowRect.x() + (scrollbarSize / 2), upArrowRect.y()));
        ctx->drawLine(IntPoint(upArrowRect.x() + (scrollbarSize / 2), upArrowRect.y()), IntPoint(upArrowRect.right(), upArrowRect.bottom()));
        ctx->drawLine(IntPoint(downArrowRect.x(), downArrowRect.y()), IntPoint(downArrowRect.x() + (scrollbarSize / 2), downArrowRect.bottom()));
        ctx->drawLine(IntPoint(downArrowRect.x() + (scrollbarSize / 2), downArrowRect.bottom()), IntPoint(downArrowRect.right(), downArrowRect.y()));
    } else {
        ctx->drawImage(up.get(), DeviceColorSpace, IntPoint(upArrowRect.location()));
        ctx->drawImage(down.get(), DeviceColorSpace, IntPoint(downArrowRect.location()));
    }

    // Draw Thumb
    int itemCount = m_popup->client()->listSize();
    float per = (float)m_itemNumber / (float)itemCount;
    float pixelsToScroll = (float) (m_scrollIndex * (downArrowRect.y() - upArrowRect.bottom()) / itemCount);
    m_thumb = IntRect(windowRect.right(), (int)(upArrowRect.bottom() + pixelsToScroll) , scrollbarSize, (int)((downArrowRect.y() - upArrowRect.bottom()) * per));
    static RefPtr<WebCore::Image> thumbV = Image::loadPlatformResource("/ScrollbarTheme/thumbV");
    static RefPtr<WebCore::Image> thumbVU = Image::loadPlatformResource("/ScrollbarTheme/thumbVU");
    static RefPtr<WebCore::Image> thumbVD = Image::loadPlatformResource("/ScrollbarTheme/thumbVD");
    if (thumbV->isNull() || thumbVU->isNull() || thumbVD->isNull()) { //did not found image resource
        ctx->fillRect(m_thumb, Color::gray, DeviceColorSpace);
    } else {
        ctx->drawImage(thumbVU.get(), DeviceColorSpace, IntPoint(m_thumb.location()));
        ctx->drawImage(thumbV.get(), DeviceColorSpace, IntRect(m_thumb.x(), m_thumb.y() + thumbVU->height(), m_thumb.width(), m_thumb.height() - thumbVD->height() - thumbVU->height()));
        ctx->drawImage(thumbVD.get(), DeviceColorSpace, IntPoint(m_thumb.x(), m_thumb.bottom() - thumbVD->height()));
    }

    ctx->restore();
    releaseContext(ctx);
}

void WebPopup::paintPopup(int highligth)
{
    GraphicsContext* ctx = createContext();
    ctx->save();
    int itemCount = m_popup->client()->listSize();
   
    IntRect mainSurfaceRect(mainWindowRect());

    IntRect windowRect = m_popupRect;
    if (!m_isInitialized) {
        int availableHeight = 0;
        bool directionUp = false; //Use to know wether to draw in the up or down direction.
        if ((mainSurfaceRect.height() - windowRect.y()) > (windowRect.y() - m_popup->itemHeight())) {
            availableHeight = mainSurfaceRect.height() - windowRect.y() - BORDERSIZE;
            directionUp = false;
        } else {
            availableHeight = windowRect.y() - m_popup->itemHeight() - BORDERSIZE;
            directionUp = true;
        }
        //Round availableHeight
        availableHeight = (availableHeight / m_popup->itemHeight()) * m_popup->itemHeight();
        if (availableHeight > windowRect.height()) {
            if (directionUp)
                windowRect.setY(m_popupRect.y - m_popupRect.h - m_popup->itemHeight());
            m_scrollNeeded = false;
            m_itemNumber = itemCount;
        } else {
            if (directionUp)
                windowRect.setY(m_popupRect.y -  availableHeight - m_popup->itemHeight());
            windowRect.setHeight(availableHeight);
            m_scrollNeeded = true;
            m_itemNumber = windowRect.height() / m_popup->itemHeight();
        }
        m_isInitialized = true;
    }
    m_popupRect = windowRect;

    ctx->fillRect(windowRect, Color::gray, DeviceColorSpace);

    if (m_scrollIndex + m_itemNumber > itemCount) {
        m_scrollIndex = itemCount - m_itemNumber;
        m_popup->setFocusedIndex(m_scrollIndex);
    }
    if (m_scrollIndex < 0)
        m_scrollIndex = 0;

    for (int i = m_scrollIndex; i < m_itemNumber + m_scrollIndex; ++i) {
        Color optionBackgroundColor, optionTextColor;
        PopupMenuStyle itemStyle = m_popup->client()->itemStyle(i);
        if ((i - m_scrollIndex) == highligth) {
            optionBackgroundColor = RenderTheme::defaultTheme()->activeListBoxSelectionBackgroundColor();
            optionTextColor = RenderTheme::defaultTheme()->activeListBoxSelectionForegroundColor();
        } else {
            optionBackgroundColor = itemStyle.backgroundColor();
            optionTextColor = itemStyle.foregroundColor();
        }
        
        // Draw the background for this menu item
        if (itemStyle.isVisible()) {
            //Keep a 1pixel border on left and right (if no scrollbar else will be overridden by scrollbar drawing)
            //Keep a 1pixel border on top
            if ((i - m_scrollIndex ) == 0)
                ctx->fillRect(IntRect(windowRect.x() + 1, windowRect.y() + 1, windowRect.width() - 2, m_popup->itemHeight() - 1), optionBackgroundColor, DeviceColorSpace);
            //Keep a 1pixel border on bottom
            else if (i - m_scrollIndex == m_itemNumber - 1)
                ctx->fillRect(IntRect(windowRect.x() + 1, windowRect.y() + (m_popup->itemHeight() * (m_itemNumber - 1)), windowRect.width() - 2, m_popup->itemHeight() - 1), optionBackgroundColor, DeviceColorSpace);
            else
                ctx->fillRect(IntRect(windowRect.x() + 1, windowRect.y() + (m_popup->itemHeight() * (i - m_scrollIndex)), windowRect.width() - 2, m_popup->itemHeight()), optionBackgroundColor, DeviceColorSpace);
        }

        if (m_popup->client()->itemIsSeparator(i)) {
            IntRect separatorRect(windowRect.x() + separatorPadding, windowRect.y() + (m_popup->itemHeight() - separatorHeight) / 2, windowRect.width() - 2 * separatorPadding, separatorHeight);
            ctx->fillRect(separatorRect, optionTextColor, DeviceColorSpace);
            continue;
        }

        String text = m_popup->client()->itemText(i);
        if (text.isEmpty())
            continue;

        unsigned length = text.length();
        const UChar* string = text.characters();
        TextRun textRun(string, length, false, 0, 0, text.defaultWritingDirection() == WTF::Unicode::RightToLeft);

        ctx->setFillColor(optionTextColor, DeviceColorSpace);

        Font itemFont = m_popup->client()->menuStyle().font();
        if (m_popup->client()->itemIsLabel(i)) {
            FontDescription d = itemFont.fontDescription();
            d.setWeight(d.bolderWeight());
            itemFont = Font(d, itemFont.letterSpacing(), itemFont.wordSpacing());
            itemFont.update(m_popup->client()->fontSelector());
        }

        // Draw the item text
        if (itemStyle.isVisible()) {
            int textX = max(windowRect.x(), windowRect.x() + m_popup->client()->clientPaddingLeft() - m_popup->client()->clientInsetLeft());
            int textY = windowRect.y() + (i - m_scrollIndex) * m_popup->itemHeight() + itemFont.ascent() + (m_popup->itemHeight() - itemFont.height()) / 2;
            ctx->drawBidiText(itemFont, textRun, IntPoint(textX, textY));
        }
    }

    if (m_scrollNeeded)
        paintScrollbar();

    ctx->restore();
    releaseContext(ctx);
}

void WebPopup::updatePopup()
{
    IntRect windowRect = m_popupRect;
    IntRect mainSurfaceRect(mainWindowRect());
    IntRect src(windowRect.x(), windowRect.y(), windowRect.width() + scrollbarSize, windowRect.height());
    IntRect dst(windowRect.x() + mainSurfaceRect.x(), windowRect.y() + mainSurfaceRect.y(), windowRect.width() + scrollbarSize, windowRect.height());
    updateRect(src, dst);
}

void WebPopup::valueChanged()
{
    IntRect windowRect = m_popupRect;
    IntRect mainSurfaceRect(mainWindowRect());
    GraphicsContext* ctx = createContext();
    ctx->save();
    ctx->fillRect(IntRect(windowRect.x(), windowRect.y() - m_popup->itemHeight(), windowRect.width(), m_popup->itemHeight()), Color(0xFF000000), DeviceColorSpace);

    IntRect src(windowRect.x(), windowRect.y() - m_popup->itemHeight(), windowRect.width(), m_popup->itemHeight());
    IntRect dst(windowRect.x() + mainSurfaceRect.x(), windowRect.y()  - m_popup->itemHeight() + mainSurfaceRect.y(), windowRect.width(), m_popup->itemHeight());
    updateRect(src, dst);
}

bool WebPopup::onKeyDown(BalEventKey event)
{
    if (!m_surface)
        return false;


    PlatformKeyboardEvent keyboardEvent(&event);
#if ENABLE(CEHTML)
    if (keyboardEvent.windowsVirtualKeyCode() == VK_ENTER) {
#else
    if (keyboardEvent.windowsVirtualKeyCode() == VK_RETURN) {
#endif
        m_popup->client()->valueChanged(m_popup->focusedIndex());
        m_popup->client()->setTextFromItem(m_popup->focusedIndex());
        hide();
        m_popup->client()->popupDidHide();
        return true;
    } else if (keyboardEvent.windowsVirtualKeyCode() == VK_ESCAPE) {
        hide();
        m_popup->client()->popupDidHide();
        return true;
    } else if (keyboardEvent.windowsVirtualKeyCode() == VK_DOWN) {
        int itemCount = m_popup->client()->listSize();
        if (m_popup->down() && (m_popup->focusedIndex() + m_itemNumber != itemCount + 1) ) {
            int i = 0;
            if (m_scrollIndex + m_itemNumber > itemCount - 1) {
                m_keyPos++;
                i = m_keyPos;
                m_popup->setFocusedIndex(m_scrollIndex + m_keyPos);
            } else {
                m_scrollIndex++;
                m_keyPos = -1;
            }
            paintPopup(i);
            updatePopup();
        }
        return true;
    } else if (keyboardEvent.windowsVirtualKeyCode() == VK_UP) {
        if (m_popup->up()) {
            int i = 0;
            if (m_keyPos >= 0) {
                m_keyPos--;
                i = m_keyPos;
                m_popup->setFocusedIndex(m_scrollIndex + m_keyPos);
            } else
                m_scrollIndex--;

            paintPopup(i);
            updatePopup();
        }
        return true;
    }
    return true;
}

bool WebPopup::onMouseMotion(BalEventMotion ev)
{
    if (!m_surface)
        return false;

    PlatformMouseEvent event(&ev);
    IntRect windowRect = m_popupRect;
    IntRect mainSurfaceRect(mainWindowRect());
    //move just in case when view is not at position (0,0)
    windowRect.move(mainSurfaceRect.x(), mainSurfaceRect.y());
    windowRect.setWidth(windowRect.width() - m_thumb.width());

    if (windowRect.contains(event.x(), event.y())) {
        int i = (event.y() - windowRect.y()) / m_popup->itemHeight();
        if (i != m_popup->focusedIndex()) {
            m_popup->setFocusedIndex(i);
            paintPopup(m_popup->focusedIndex());
            updatePopup();
        }
    }
    return true;
}

bool WebPopup::onMouseButtonDown(BalEventButton ev)
{
    if (!m_surface)
        return false;

    PlatformMouseEvent event(&ev, 1);
    IntRect windowRect = m_popupRect;
    IntRect mainSurfaceRect(mainWindowRect());
    IntRect scrollRect(m_thumb.x(), windowRect.y(), m_thumb.width(), windowRect.height());
    //move just in case when view is not at position (0,0)
    windowRect.move(mainSurfaceRect.x(), mainSurfaceRect.y());
    scrollRect.move(mainSurfaceRect.x(), mainSurfaceRect.y());

    if (windowRect.contains(event.x(), event.y())) {
        hide();
        int i = (event.y() - windowRect.y()) / m_popup->itemHeight();
        m_popup->client()->valueChanged(i + m_scrollIndex);
        m_popup->client()->popupDidHide();
        m_popup->client()->setTextFromItem(i + m_scrollIndex);
    } else if (scrollRect.contains(event.x(), event.y())) {
        if (event.y() < m_thumb.y()) {
            m_scrollIndex--;
            if (m_scrollIndex < 0 )
                m_scrollIndex = 0;
            else {
                paintPopup(m_popup->focusedIndex());
                updatePopup();
            }
        } else if (event.y() > m_thumb.bottom()) {
            m_scrollIndex++;
            if (m_scrollIndex + m_itemNumber > m_popup->client()->listSize())
                m_scrollIndex -= 1;
            else {
                paintPopup(m_popup->focusedIndex());
                updatePopup();
            }
        }
    } else {
        hide();
        m_popup->client()->popupDidHide();
        /*SDL_Event butev;
        butev.type = SDL_MOUSEBUTTONDOWN;
        butev.button = event;
        SDL_PushEvent(&butev);*/
    }
    return true;
}

bool WebPopup::onMouseButtonUp(BalEventButton event)
{
    if (!m_surface)
        return false;

    m_scrolled = false;
    return true;
}

bool WebPopup::onScroll(BalEventScroll ev)
{
    if (!m_surface)
        return false;

    int itemCount = m_popup->client()->listSize();
    PlatformWheelEvent event(&ev);
    if (event.deltaY() > 0) {
        m_scrollIndex--;
        if (m_scrollIndex < 0 ) 
            m_scrollIndex = 0;
        else {
            paintPopup(m_popup->focusedIndex());
            updatePopup();
        }
    } else {
        m_scrollIndex++;
        if (m_scrollIndex + m_itemNumber > itemCount ) 
            m_scrollIndex = m_scrollIndex--;
        else {
            paintPopup(m_popup->focusedIndex());
            updatePopup();
        }
    }
    return true;
}
