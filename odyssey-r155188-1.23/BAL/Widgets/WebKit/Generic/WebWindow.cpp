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

#include "WebWindow.h"
//#include "SDL/SDL.h"
//#include "GraphicsContext.h"
#include "Frame.h"
#include "FrameView.h"
#include "IntRect.h"
#include "MainThread.h"
#include "SharedTimer.h"
#include "WebFrame.h"
#include "WebView.h"
 
/*#include <signal.h>
#include <unistd.h>*/

using namespace WebCore;

WebWindow::WebWindow(bool modal, WebView* webView, BalRectangle rect) 
: m_rect(rect),
  m_modal(modal), 
  m_visible(false), 
  m_webView(webView)
{
    m_webView->addChildren(this);
    setMainWindow();
}

WebWindow::~WebWindow()
{
    m_webView->removeChildren(this);
    hide();
}

bool WebWindow::onExpose(BalEventExpose event, BalRectangle& r)
{
    if (!m_visible)
        return false;
    IntRect windowRect(m_rect);
    IntRect rect(r);
    if (windowRect.intersects(rect)) {
        windowRect.intersect(rect);
        paint(windowRect);
        return true;
    }

    return false;

}

bool WebWindow::onKeyDown(BalEventKey event)
{
    if (m_modal)
        return true;
    return false;
}

bool WebWindow::onKeyUp(BalEventKey event)
{
    if (m_modal)
        return true;
    return false;
}

bool WebWindow::onMouseMotion(BalEventMotion event)
{
    if (m_modal)
        return true;
    return false;
}

bool WebWindow::onMouseButtonDown(BalEventButton event)
{
    if (m_modal)
        return true;
    return false;
}

bool WebWindow::onMouseButtonUp(BalEventButton event)
{
    if (m_modal)
        return true;
    return false;
}

bool WebWindow::onScroll(BalEventScroll event)
{
    if (m_modal)
        return true;
    return false;
}

bool WebWindow::onResize(BalResizeEvent event)
{
    if (m_modal)
        return true;
    return false;
}

bool WebWindow::onQuit(BalQuitEvent)
{
    if (m_modal)
        return true;
    return false;
}

bool WebWindow::onUserEvent(BalUserEvent)
{
    if (m_modal)
        return true;
    return false;
}

bool WebWindow::onIdle() 
{
    return false;
}

void WebWindow::show()
{
    m_visible = true;
    m_webView->sendExposeEvent(m_rect);
    if (m_modal)
        runMainLoop();
}

void WebWindow::hide()
{
    if (m_modal)
        stopMainLoop();
    m_visible = false;
    m_webView->sendExposeEvent(m_rect);
}

void WebWindow::setMainWindow()
{
    m_mainSurface = m_webView->viewWindow();
    createPlatformWindow();
}

void WebWindow::paintDecoration(BalRectangle)
{
}

BalRectangle WebWindow::mainWindowRect()
{
    return m_webView->frameRect();
}
