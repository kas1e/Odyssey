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
#ifndef PopupMenuClient_h
#define PopupMenuClient_h
/**
 *  @file  PopupMenuClient.t
 *  PopupMenuClient description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:12 $
 */
#include "BALBase.h"

namespace WKAL {

class Color;
class Document;
class FontSelector;
class String;
class RenderStyle;

class PopupMenuClient : public WKALBase {
public:
    /**
     * PopupMenuClient destructor
     * @code
     * delete pc;
     * @endcode
     */
    virtual ~PopupMenuClient() ;

    /**
     * value changed 
     * @param[in] : list index
     * @param[in] : it's a fire events
     * @code
     * pm->valueChanged(l, ev);
     * @endcode
     */
    virtual void valueChanged(unsigned listIndex, bool fireEvents = true) = 0;

    /**
     * get item text
     * @param[in] : list index
     * @param[out] : item index
     * @code
     * String t = pm->itemText(i);
     * @endcode
     */
    virtual String itemText(unsigned listIndex) const = 0;

    /**
     * test if the item is enabled
     * @param[in] : index
     * @param[out] : true if the item is enabled
     * @code
     * bool i = pm->itemIsEnabled(i);
     * @endcode
     */
    virtual bool itemIsEnabled(unsigned listIndex) const = 0;

    /**
     * get item background color
     * @param[in] : index
     * @param[out] : color
     * @code
     * Color c = pm->itemBackgroundColor(i);
     * @endcode
     */
    virtual Color itemBackgroundColor(unsigned listIndex) const = 0;

    /**
     * get item style
     * @param[in] : index
     * @param[out] : render style
     * @code
     * RenderStyle *r = pm->itemStyle(i);
     * @endcode
     */
    virtual RenderStyle* itemStyle(unsigned listIndex) const = 0;

    /**
     * get client style
     * @param[out] : render style
     * @code
     * RenderStyle *r = pm->clientStyle();
     * @endcode
     */
    virtual RenderStyle* clientStyle() const = 0;

    /**
     * get client document
     * @param[out] : document
     * @code
     * Document *d = pm->clientDocument();
     * @endcode
     */
    virtual Document* clientDocument() const = 0;

    /**
     * get client inset left
     * @param[out] : client inset left
     * @code
     * int l = pm->clientInsetLeft();
     * @endcode
     */
    virtual int clientInsetLeft() const = 0;

    /**
     * get client inset right
     * @param[out] : client inset right
     * @code
     * int r = pm->clientInsetRight();
     * @endcode
     */
    virtual int clientInsetRight() const = 0;

    /**
     * get client padding left
     * @param[out] : client padding left
     * @code
     * int l = pm->clientPaddingLeft();
     * @endcode
     */
    virtual int clientPaddingLeft() const = 0;

    /**
     * get client padding right
     * @param[out] : client padding right
     * @code
     * int r = pm->clientPaddingRight();
     * @endcode
     */
    virtual int clientPaddingRight() const = 0;

    /**
     * get list size
     * @param[out] : list size
     * @code
     * int s = pm->listSize();
     * @endcode
     */
    virtual int listSize() const = 0;

    /**
     * get selected index 
     * @param[out] : selected index
     * @code
     * int s = pm->selectedIndex();
     * @endcode
     */
    virtual int selectedIndex() const = 0;

    /**
     * hide popup
     * @code
     * pm->hidePopup();
     * @endcode
     */
    virtual void hidePopup() = 0;

    /**
     * test if the item is a separator
     * @param[in] : index
     * @param[out] : true if the item is a separator
     * @code
     * bool s = pm->itemIsSeparator(i);
     * @endcode
     */
    virtual bool itemIsSeparator(unsigned listIndex) const = 0;

    /**
     * test if the item is a label
     * @param[in] : index
     * @param[out] : true if the item is a label
     * @code
     * bool l = pm->itemIsLabel(i);
     * @endcode
     */
    virtual bool itemIsLabel(unsigned listIndex) const = 0;

    /**
     * test if the item is selected
     * @param[in] : index
     * @param[out] : true if the item is selected
     * @code
     * bool s = pm->itemIsSelected(i);
     * @endcode
     */
    virtual bool itemIsSelected(unsigned listIndex) const = 0;

    /**
     * should pop over 
     * @param[out] : status
     * @code
     * bool s = pm->shouldPopOver();
     * @endcode
     */
    virtual bool shouldPopOver() const = 0;

    /**
     * get value should change on hot track 
     * @param[out] : value
     * @code
     * bool v = pm->valueShouldChangeOnHotTrack();
     * @endcode
     */
    virtual bool valueShouldChangeOnHotTrack() const = 0;

    /**
     * set text from item
     * @param[in] : index
     * @code
     * pm->setTextFromItem(i);
     * @endcode
     */
    virtual void setTextFromItem(unsigned listIndex) = 0;

    /**
     * get font selector
     * @param[out] : font selector
     * @code
     * FontSelector *f = pm->fontSelector();
     * @endcode
     */
    virtual FontSelector* fontSelector() const = 0;
};

}

#endif




