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
#include "PopupMenu.h"

#include "Document.h"
#include "FloatRect.h"
#include "FontSelector.h"
#include "FrameView.h"
#include "GraphicsContext.h"
#include "HTMLNames.h"
#include "Page.h"
#include "PlatformMouseEvent.h"
#include "PlatformScreen.h"
#include "RenderTheme.h"
#include "RenderView.h"
#include "Scrollbar.h"
#include "ScrollbarTheme.h"
#include "SimpleFontData.h"
#include "ObserverServiceData.h"

using std::min;

namespace WebCore {

using namespace HTMLNames;

// Default Window animation duration in milliseconds
static const int defaultAnimationDuration = 200;
// Maximum height of a popup window
static const int maxPopupHeight = 320;

static const int popupWindowAlphaPercent = 95;

const int optionSpacingMiddle = 1;
const int popupWindowBorderWidth = 1;

// FIXME: Remove this as soon as practical.
static inline bool isASCIIPrintable(unsigned c)
{
    return c >= 0x20 && c <= 0x7E;
}

PopupMenu::PopupMenu(PopupMenuClient* client)
    : m_popupClient(client)
    , m_scrollbar(0)
    , m_popup(0)
    , m_wasClicked(false)
    , m_itemHeight(0)
    , m_scrollOffset(0)
    , m_wheelDelta(0)
    , m_focusedIndex(0)
    , m_scrollbarCapturingMouse(false)
{
}

PopupMenu::~PopupMenu()
{
}

void PopupMenu::show(const IntRect& r, FrameView* v, int index)
{
    ASSERT(client());
    
    calculatePositionAndSize(r, v);
    if (clientRect().isEmpty())
        return;

    if (!m_scrollbar) {
        if (visibleItems() < client()->listSize()) {
            // We need a scroll bar
            m_scrollbar = client()->createScrollbar(this, VerticalScrollbar, RegularScrollbar);
        }
    }

    WebCore::ObserverServiceData::createObserverService()->notifyObserver("PopupMenuShow", "", this);
}

void PopupMenu::hide()
{
    WebCore::ObserverServiceData::createObserverService()->notifyObserver("PopupMenuHide", "", this);
}

const int endOfLinePadding = 2;
void PopupMenu::calculatePositionAndSize(const IntRect& r, FrameView* v)
{
    IntRect rScreenCoords(v->contentsToWindow(r.location()), r.size());
    rScreenCoords.setY(rScreenCoords.y() + rScreenCoords.height());
    
    m_itemHeight = rScreenCoords.height();

    int itemCount = client()->listSize();
    int naturalHeight = m_itemHeight * itemCount;

    int popupWidth = 0;
    for (int i = 0; i < itemCount; ++i) {
        String text = client()->itemText(i);
        if (text.isEmpty())
            continue;

        Font itemFont = client()->menuStyle().font();
        if (client()->itemIsLabel(i)) {
            FontDescription d = itemFont.fontDescription();
            d.setWeight(d.bolderWeight());
            itemFont = Font(d, itemFont.letterSpacing(), itemFont.wordSpacing());
            itemFont.update(m_popupClient->fontSelector());
        }

        popupWidth = max(popupWidth, itemFont.width(TextRun(text.characters(), text.length())));
    }
    
    rScreenCoords.setHeight(naturalHeight);
    rScreenCoords.setWidth(popupWidth + 10);

    m_windowRect = rScreenCoords;
}

bool PopupMenu::setFocusedIndex(int i, bool hotTracking)
{
    if (i < 0 || i >= client()->listSize() || i == focusedIndex())
        return false;

    if (!client()->itemIsEnabled(i))
        return false;

    m_focusedIndex = i;
    return true;
}

int PopupMenu::visibleItems() const
{
    return clientRect().height() / m_itemHeight;
}

int PopupMenu::listIndexAtPoint(const IntPoint& point) const
{
    return m_scrollOffset + point.y() / m_itemHeight;
}

int PopupMenu::focusedIndex() const
{
    return m_focusedIndex;
}

void PopupMenu::focusFirst()
{
    if (!client())
        return;

    int size = client()->listSize();

    for (int i = 0; i < size; ++i)
        if (client()->itemIsEnabled(i)) {
            setFocusedIndex(i);
            break;
        }
}

void PopupMenu::focusLast()
{
    if (!client())
        return;

    int size = client()->listSize();

    for (int i = size - 1; i > 0; --i)
        if (client()->itemIsEnabled(i)) {
            setFocusedIndex(i);
            break;
        }
}

bool PopupMenu::down(unsigned lines)
{
    if (!client())
        return false;

    int size = client()->listSize();

    int lastSelectableIndex, selectedListIndex;
    lastSelectableIndex = selectedListIndex = focusedIndex();
    for (int i = selectedListIndex + 1; i >= 0 && i < size; ++i)
        if (client()->itemIsEnabled(i)) {
            lastSelectableIndex = i;
            if (i >= selectedListIndex + (int)lines)
                break;
        }

    return setFocusedIndex(lastSelectableIndex);
}

bool PopupMenu::up(unsigned lines)
{
    if (!client())
        return false;

    int size = client()->listSize();

    int lastSelectableIndex, selectedListIndex;
    lastSelectableIndex = selectedListIndex = focusedIndex();
    for (int i = selectedListIndex - 1; i >= 0 && i < size; --i)
        if (client()->itemIsEnabled(i)) {
            lastSelectableIndex = i;
            if (i <= selectedListIndex - (int)lines)
                break;
        }

    return setFocusedIndex(lastSelectableIndex);
}

void PopupMenu::invalidateItem(int index)
{
    if (!m_popup)
        return;

    IntRect damageRect(clientRect());
    damageRect.setY(m_itemHeight * (index - m_scrollOffset));
    damageRect.setHeight(m_itemHeight);
    if (m_scrollbar)
        damageRect.setWidth(damageRect.width() - m_scrollbar->frameRect().width());

    IntRect r = damageRect;
    //::InvalidateRect(m_popup, &r, TRUE);
}

IntRect PopupMenu::clientRect() const
{
    IntRect clientRect = m_windowRect;
    clientRect.inflate(-popupWindowBorderWidth);
    clientRect.setLocation(IntPoint(0, 0));
    return clientRect;
}

void PopupMenu::incrementWheelDelta(int delta)
{
    m_wheelDelta += delta;
}

void PopupMenu::reduceWheelDelta(int delta)
{
    ASSERT(delta >= 0);
    ASSERT(delta <= abs(m_wheelDelta));

    if (m_wheelDelta > 0)
        m_wheelDelta -= delta;
    else if (m_wheelDelta < 0)
        m_wheelDelta += delta;
    else
        return;
}

bool PopupMenu::scrollToRevealSelection()
{
    if (!m_scrollbar)
        return false;

    int index = focusedIndex();

    if (index < m_scrollOffset) {
        m_scrollbar->setValue(index);
        return true;
    }

    if (index >= m_scrollOffset + visibleItems()) {
        m_scrollbar->setValue(index - visibleItems() + 1);
        return true;
    }

    return false;
}


void PopupMenu::updateFromElement()
{
}

bool PopupMenu::itemWritingDirectionIsNatural()
{
    return false;
}

const int separatorPadding = 4;
const int separatorHeight = 1;
void PopupMenu::paint(const IntRect& damageRect)
{
    //printf("paint popup menu with rect %d,%d,%d,%d\n", damageRect.x(), damageRect.y(), damageRect.width(), damageRect.height());
}

void PopupMenu::valueChanged(Scrollbar* scrollBar)
{
}

void PopupMenu::invalidateScrollbarRect(Scrollbar* scrollbar, const IntRect& rect)
{
    IntRect scrollRect = rect;
    scrollRect.move(scrollbar->x(), scrollbar->y());
    //RECT r = scrollRect;
//    ::InvalidateRect(m_popup, &r, false);
}

}
