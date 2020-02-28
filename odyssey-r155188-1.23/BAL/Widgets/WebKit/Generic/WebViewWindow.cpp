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
#include "WebViewWindow.h"

#include "JSActionDelegate.h"
#include "WebFrame.h"
#include "WebFrameLoadDelegate.h"
#include "WebView.h"

#include "Color.h"
#include "Frame.h"
#include "FrameView.h"
#include "GraphicsContext.h"

#if ENABLE(DAE_APPLICATION)
#include "WebApplication.h"
#include "WebApplicationManager.h"
#endif
 
using namespace WebCore;

WebViewWindow::WebViewWindow(bool modal, WebView* webView, BalRectangle rect) 
    : WebWindow(modal, webView, rect)
    , m_isInitialized(false) 
{
#if ENABLE(DAE_APPLICATION)
    m_app = webAppMgr().createApplication(m_mainSurface,
                                                                    rect,
                                                                    "",
                                                                    0,
                                                                    0); 
    m_winWebView = m_app->webView();
#else
    m_winWebView = WebView::createInstance();
    m_winWebView->setViewWindow(m_mainSurface);
    m_winWebView->initWithFrame(rect, NULL, NULL);
#endif

}

WebViewWindow::~WebViewWindow() 
{
#if ENABLE(DAE_APPLICATION)
    webAppMgr().destroyApplication(m_app);
    m_app = 0;
#else
    delete m_winWebView;
#endif
}

void WebViewWindow::paint(BalRectangle rect)
{
    Frame* frame = core(m_winWebView->mainFrame());
    if (!frame)
        return;

    m_winWebView->addToDirtyRegion(rect);
    
    if(!m_isInitialized) {
        m_isInitialized = true;
        IntRect winRect(m_rect);
        frame->view()->resize(winRect.width(), winRect.height());
        frame->view()->forceLayout();
        frame->view()->adjustViewSize();
    }

    if (frame->contentRenderer() && frame->view()) {
        frame->view()->layoutIfNeededRecursive();
        IntRect d = m_winWebView->dirtyRegion();

        m_winWebView->clearDirtyRegion();
        if (d.isEmpty())
            return;

        GraphicsContext *ctx = createContext();

        ctx->fillRect(d, Color::darkGray, DeviceColorSpace);

        ctx->save();
        ctx->clip(d);

        if (m_winWebView->transparent())
            ctx->clearRect(d);

        frame->view()->paint(ctx, d);

        //SDL_UpdateRect(m_mainSurface, d.x(), d.y(), d.width(), d.height());
        ctx->restore();
        releaseContext(ctx);
    }
}

void WebViewWindow::loadUrl(const char* url)
{
    m_winWebView->mainFrame()->loadURL(url);
}

bool WebViewWindow::onQuit(BalQuitEvent)
{   
    delete this;
    return true;
}

bool WebViewWindow::onIdle()
{
    m_winWebView->fireWebKitThreadEvents();
    m_winWebView->fireWebKitTimerEvents();
    return true;
}
