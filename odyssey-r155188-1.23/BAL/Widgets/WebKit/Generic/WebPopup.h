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

#ifndef WebPopup_H
#define WebPopup_H

#include "BALBase.h"
#include "WebWindow.h"
#include "PlatformString.h"
#include "GraphicsContext.h"
#include "IntRect.h"
#include "PopupMenu.h"

class WebView;

class WebPopup : public WebWindow
{
public:
    WebPopup(WebCore::PopupMenu*, WebView *, bool modal = true);
    virtual ~WebPopup();

    virtual bool onKeyDown(BalEventKey event);
    virtual bool onMouseMotion(BalEventMotion event);
    virtual bool onMouseButtonDown(BalEventButton event);
    virtual bool onMouseButtonUp(BalEventButton event);
    virtual bool onScroll(BalEventScroll event);

protected:
    virtual void paint(BalRectangle rect);
private:
    void paintScrollbar();
    void paintPopup(int i);
    void updatePopup();
    void valueChanged();

    bool m_state;
    bool isPainted;
    bool isThemable;
    WebCore::PopupMenu* m_popup;
    int m_lastPosition;
    bool m_scrollNeeded;
    int m_scrollIndex;
    int m_itemNumber;
    bool m_isInitialized;
    WebCore::IntRect m_thumb;
    bool m_scrolled;
    int m_position;
    int m_keyPos;
    BalRectangle m_popupRect;
};

#endif

