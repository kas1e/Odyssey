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
#ifndef Widget_h
#define Widget_h
/**
 *  @file  Widget.t
 *  Widget description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:12 $
 */
#include "BALBase.h"

#include <wtf/Platform.h>






namespace WKAL {

    class Cursor;
    class Event;
    class Font;
    class GraphicsContext;
    class IntPoint;
    class IntRect;
    class IntSize;
    class PlatformMouseEvent;
    class ScrollView;
    class WidgetClient;
    class WidgetPrivate;

    class Widget : public WKALBase {
    public:
    /**
     * Widget default contructor
     * @code
     * Widget w;
     * @endcode
     */
        Widget();

    /**
     * Widget destructor
     * @code
     * delete w;
     * @endcode
     */
        virtual ~Widget();

    /**
     * set enabled status
     * @param[in] : status
     * @code
     * w->setEnabled(true);
     * @endcode
     */
        virtual void setEnabled(bool);

    /**
     * get enabled status
     * @param[out] : status
     * @code
     * bool e = w->isEnabled();
     * @endcode
     */
        virtual bool isEnabled() const;

    /**
     * get x value
     * @param[out] : x value
     * @code
     * int x = w->x();
     * @endcode
     */
        int x() const;

    /**
     * get y value
     * @param[out] : y value
     * @code
     * int y = w->y();
     * @endcode
     */
        int y() const;

    /**
     * get width value
     * @param[out] : width value
     * @code
     * int wi = w->width();
     * @endcode
     */
        int width() const;

    /**
     * get height value
     * @param[out] : height value
     * @code
     * int h = w->height();
     * @endcode
     */
        int height() const;

    /**
     * get size 
     * @param[out] : size
     * @code
     * IntSize s = w->size();
     * @endcode
     */
        IntSize size() const;

    /**
     * resize
     * @param[in] : width size
     * @param[in] : height size
     * @code
     * w->resize(w, h);
     * @endcode
     */
        void resize(int, int);

    /**
     * resize
     * @param[in] : size
     * @code
     * w->resize(s);
     * @endcode
     */
        void resize(const IntSize&);

    /**
     * get position
     * @param[out] : position
     * @code
     * IntPoint p = w->pos();
     * @endcode
     */
        IntPoint pos() const;

    /**
     * move
     * @param[in] : x value
     * @param[in] : y value
     * @code
     * w->move(x, y);
     * @endcode
     */
        void move(int, int);

    /**
     * move
     * @param[in] : point
     * @code
     * w->move(p);
     * @endcode
     */
        void move(const IntPoint&);

    /**
     * paint
     * @param[in] : graphics context
     * @param[in] : rect
     * @code
     * w->paint(gc, r);
     * @endcode
     */
        virtual void paint(GraphicsContext*, const IntRect&);

    /**
     * invalidate
     * @code
     * w->invalidate();
     * @endcode
     */
        virtual void invalidate();

    /**
     * invalidate rect
     * @param[in] : rect
     * @code
     * w->invalidateRect(r);
     * @endcode
     */
        virtual void invalidateRect(const IntRect&);

    /**
     * set frame geometry
     * @param[in] : rect
     * @code
     * w->setFrameGeometry(r);
     * @endcode
     */
        virtual void setFrameGeometry(const IntRect&);

    /**
     * frame geometry
     * @param[out] : rect
     * @code
     * IntRect r = w->frameGeometry();
     * @endcode
     */
        virtual IntRect frameGeometry() const;

    /**
     * set focus
     * @code
     * w->setFocus();
     * @endcode
     */
        virtual void setFocus();

    /**
     * set cursor
     * @param[in] : cursor
     * @code
     * w->setCursor(c);
     * @endcode
     */
        void setCursor(const Cursor&);

    /**
     * get cursor
     * @param[out] : cursor
     * @code
     * Cursor c = w->cursor();
     * @endcode
     */
        Cursor cursor();

    /**
     * show
     * @code
     * w->show();
     * @endcode
     */
        virtual void show();

    /**
     * hide
     * @code
     * w->hide();
     * @endcode
     */
        virtual void hide();

    /**
     * set is selected
     * @param[in] : status
     * @code
     * w->setIsSelected(true);
     * @endcode
     */
        void setIsSelected(bool);

    /**
     * set client
     * @param[in] : widget client
     * @code
     * w->setClient(wc);
     * @endcode
     */
        void setClient(WidgetClient*);

    /**
     * get client
     * @param[out] : Widget client
     * @code
     * WidgetClient *wc = w->client();
     * @endcode
     */
        WidgetClient* client() const;

    /**
     * test if the widget is a frameView
     * @param[out] : true if the widget is a frameView
     * @code
     * bool fv = w->isFrameView();
     * @endcode
     */
        virtual bool isFrameView() const;

    /**
     * test if the widget is a pluginView
     * @param[out] : true if the widget is a pluginView
     * @code
     * bool pv = w->isPluginView();
     * @endcode
     */
        virtual bool isPluginView() const ;

    /**
     * remove from parent
     * @code
     * w->removeFromParent();
     * @endcode
     */
        virtual void removeFromParent();

    /**
     * This method is used by plugins on all platforms to obtain a clip rect that includes clips set by WebCore,
     * e.g., in overflow:auto sections.  The clip rects coordinates are in the containing window's coordinate space.
     * This clip includes any clips that the widget itself sets up for its children.
     * @param[out] : rect
     * @code
     * IntRect r = w->windowClipRect();
     * @endcode
     */
        virtual IntRect windowClipRect() const;

    /**
     * handle event
     * @param[in] : event
     * @code
     * w->handleEvent(e);
     * @endcode
     */
        virtual void handleEvent(Event*) ;

    /**
     * set containing window
     * @param[in] : platform widget
     * @code
     * w->setContainingWindow(pw);
     * @endcode
     */
        void setContainingWindow(PlatformWidget);

    /**
     * get containing window 
     * @param[out] : platform widget
     * @code
     * PlatformWidget pw = w->containingWindow();
     * @endcode
     */
        PlatformWidget containingWindow() const;

    /**
     * set parent
     * @param[in] : scrollView
     * @code
     * w->setParent(s);
     * @endcode
     */
        virtual void setParent(ScrollView*);

    /**
     * get parent
     * @param[out] : scroll view
     * @code
     * ScrollView *s = w->parent();
     * @endcode
     */
        ScrollView* parent() const;

    /**
     * geometry changed
     * @code
     * w->geometryChanged();
     * @endcode
     */
        virtual void geometryChanged() const;

    /**
     * convert to containing window
     * @param[in] : rect
     * @param[out] : rect
     * @code
     * IntRect r = w->convertToContainingWindow(r1);
     * @endcode
     */
        IntRect convertToContainingWindow(const IntRect&) const;

    /**
     * convert to containing window
     * @param[in] : point
     * @param[out] : point
     * @code
     * IntPoint p =  w->convertToContainingWindow(p1);
     * @endcode
     */
        IntPoint convertToContainingWindow(const IntPoint&) const;

    /**
     * convert from containing window
     * @param[in] : point
     * @param[out] : point
     * @code
     * IntPoint p = w->convertFromContainingWindow(p1);
     * @endcode
     */
        IntPoint convertFromContainingWindow(const IntPoint&) const;

    /**
     * convert child to self
     * @param[in] : widget
     * @param[in] : point
     * @param[out] : point
     * @code
     * IntPoint p = w->convertChildToSelf(wi, p1);
     * @endcode
     */
        virtual IntPoint convertChildToSelf(const Widget*, const IntPoint&) const;

    /**
     * convert self to child
     * @param[in] : widget
     * @param[in] : point
     * @param[out] : point
     * @code
     * IntPoint p = w->convertSelfToChild(wi, p1);
     * @endcode
     */
        virtual IntPoint convertSelfToChild(const Widget*, const IntPoint&) const;

    /**
     * get suppress invalidation status
     * @param[out] : status
     * @code
     * bool s = w->suppressInvalidation();
     * @endcode
     */
        bool suppressInvalidation() const;

    /**
     * set suppress invalidation status
     * @param[in] : status
     * @code
     * w->setSuppressInvalidation(s);
     * @endcode
     */
        void setSuppressInvalidation(bool);

    /**
     * get BalWidget
     * @param[out] : BalWidget
     * @code
     * BalWidget *bw = w->balWidget();
     * @endcode
     */
        BalWidget* balWidget() const;
protected:
    /**
     * set BalWidget 
     * @param[in] : BalWidget
     * @code
     * w->setBalWidget(bw);
     * @endcode
     */
        void setBalWidget(BalWidget*);


    private:
        WidgetPrivate* data;
    };

} // namespace WKAL

#endif // Widget_h




