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
#ifndef ClipboardGdk_h
#define ClipboardGdk_h
/**
 *  @file  ClipboardBal.t
 *  ClipboardGtk description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:12 $
 */
#include "BALBase.h"

#include "Clipboard.h"

namespace WKAL {
    class CachedImage;

    // State available during IE's events for drag and drop and copy/paste
    // Created from the EventHandlerGtk to be used by the dom
    class ClipboardBal : public WKALBase, public Clipboard {
    public:
    /**
     * create a clipboard
     * @param[in] : clipboard access policy
     * @param[in] : is for dragging
     * @param[out] : ClipboardBal
     * @code
     * RefPtr<ClipboardBal> c = ClipboardBal::create(p, true);
     * @endcode
     */
        static PassRefPtr<ClipboardBal> create(ClipboardAccessPolicy policy, bool isForDragging);

    /**
     * ClipboardBal destructor
     * @code
     * delete c;
     * @endcode
     */
        virtual ~ClipboardBal();

    /**
     * clearData
     * @param[in] : type
     * @code
     * c->clearData(s);
     * @endcode
     */
        void clearData(const String&);

    /**
     * clear all data
     * @code
     * c->clearAllData();
     * @endcode
     */
        void clearAllData();

    /**
     * get data 
     * @param[in] : type
     * @param[out] : success
     * @param[out] : data
     * @code
     * String d = c->getData(s, &su);
     * @endcode
     */
        String getData(const String&, bool&) const;

    /**
     * set data
     * @param[in] : type
     * @param[in] : data
     * @param[out] : status
     * @code
     * bool s = r->setData(t, d);
     * @endcode
     */
        bool setData(const String&, const String&);

    /**
     * get types
     * @param[out] : types
     * @code
     * HashSet<String> s = r->types();
     * @endcode
     */
        HashSet<String> types() const;

    /**
     * get drag location
     * @param[out] : location point
     * @code
     * IntPoint p = r->dragLocation();
     * @endcode
     */
        IntPoint dragLocation() const;

    /**
     * get drag image
     * @param[out] : cached image
     * @code
     * CachedImage *i = r->dragImage();
     * @endcode
     */
        CachedImage* dragImage() const;

    /**
     * set drag image 
     * @param[in] : cached image
     * @param[in] : start point
     * @code
     * r->setDragImage(i, p);
     * @endcode
     */
        void setDragImage(CachedImage*, const IntPoint&);

    /**
     * get drag image element
     * @param[out] : element
     * @code
     * Node *n = r->dragImageElement();
     * @endcode
     */
        Node* dragImageElement();

    /**
     * set drag image element
     * @param[in] : element
     * @param[in] : start point
     * @code
     * r->setDragImageElement(n, p);
     * @endcode
     */
        void setDragImageElement(Node*, const IntPoint&);

    /**
     * create drag image
     * @param[in] : start point
     * @param[out] : drag image 
     * @code
     * DragImageRef i = r->createDragImage(p);
     * @endcode
     */
        virtual DragImageRef createDragImage(IntPoint&) const;

    /**
     * declare and write drag image
     * @param[in] : element
     * @param[in] : url
     * @param[in] : frame
     * @code
     * r->declareAndWriteDragImage(e, u, f);
     * @endcode
     */
        virtual void declareAndWriteDragImage(Element*, const KURL&, const String&, Frame*);

    /**
     * write URL
     * @param[in] : url
     * @param[in] : frame
     * @code
     * r->writeURL(u, f);
     * @endcode
     */
        virtual void writeURL(const KURL&, const String&, Frame*);

    /**
     * write range 
     * @param[in] : range
     * @param[in] : frame
     * @code
     * r->writeRange(r, f);
     * @endcode
     */
        virtual void writeRange(Range*, Frame*);

    /**
     * test if ClipboardBal has data
     * @param[out] : true if ClipboardBal has data
     * @code
     * bool h = r->hasData();
     * @endcode
     */
        virtual bool hasData();

    private:
    /**
     *  ClipboardBal constructor
     */
        ClipboardBal(ClipboardAccessPolicy, bool);
    };
}

#endif




