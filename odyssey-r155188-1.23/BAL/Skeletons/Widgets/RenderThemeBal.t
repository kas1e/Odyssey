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
#ifndef RenderThemeGdk_h
#define RenderThemeGdk_h
/**
 *  @file  RenderThemeBal.t
 *  RenderThemeGtk description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:12 $
 */
#include "BALBase.h"

#include "RenderTheme.h"
#include "GraphicsContext.h"

#include <gtk/gtk.h>

namespace WKAL {

class RenderThemeBal : public WKALBase, public RenderTheme {
public:
    /**
     * RenderThemeBal default description
     * @code
     * RenderThemeBal r;
     * @endcode
     */
    RenderThemeBal();

    /**
     * A method asking if the theme's controls actually care about redrawing when hovered.
     * @param[in] : render style
     * @param[out] : status
     * @code
     * bool s = r.supportsHover(st);
     * @endcode
     */
    virtual bool supportsHover(const RenderStyle* style) const ;

    /**
     * A method asking if the theme is able to draw the focus ring.
     * @param[in] : render style
     * @param[out] : status
     * @code
     * bool s = r.supportsFocusRing(st);
     * @endcode
     */
    virtual bool supportsFocusRing(const RenderStyle*) const;

    /**
     * A method asking if the control changes its tint when the window has focus or not.
     * @param[in] : render object
     * @param[out] : status
     * @code
     * bool s = r.controlSupportsTints(ro);
     * @endcode
     */
    virtual bool controlSupportsTints(const RenderObject*) const;

    /**
     * A general method asking if any control tinting is supported at all.
     * @param[out] : status
     * @code
     * bool s = r.supportsControlTints();
     * @endcode
     */
    virtual bool supportsControlTints() const ;

    /**
     * A method to obtain the baseline position for a "leaf" control.  This will only be used if a baseline
     * position cannot be determined by examining child content. Checkboxes and radio buttons are examples of
     * controls that need to do this.
     * @param[in] : render object
     * @param[out] : position
     * @code
     * int p = r.baselinePosition(ro);
     * @endcode
     */
    virtual int baselinePosition(const RenderObject*) const;

    /**
     * get platform active selection background color.
     * @param[out] : color
     * @code
     * Color c = r.platformActiveSelectionBackgroundColor();
     * @endcode
     */
    virtual Color platformActiveSelectionBackgroundColor() const;

    /**
     * get platform inactive selection background color
     * @param[out] : color
     * @code
     * Color c = r.platformInactiveSelectionBackgroundColor();
     * @endcode
     */
    virtual Color platformInactiveSelectionBackgroundColor() const;

    /**
     * get platform active selection foreground color
     * @param[out] : color
     * @code
     * Color c = r.platformActiveSelectionForegroundColor();
     * @endcode
     */
    virtual Color platformActiveSelectionForegroundColor() const;

    /**
     * get platform inactive selection foreground color
     * @param[out] : color
     * @code
     * Color c = r.platformInactiveSelectionForegroundColor();
     * @endcode
     */
    virtual Color platformInactiveSelectionForegroundColor() const;

    /**
     * get active list box selection background color
     * @param[out] : Color
     * @code
     * Color c = r.activeListBoxSelectionBackgroundColor();
     * @endcode
     */
    virtual Color activeListBoxSelectionBackgroundColor() const;

    /**
     * get active list box selection foreground color
     * @param[out] : color
     * @code
     * Color c = r.activeListBoxSelectionForegroundColor();
     * @endcode
     */
    virtual Color activeListBoxSelectionForegroundColor() const;

    /**
     * get inactive list box selection background color
     * @param[out] : color
     * @code
     * Color c = r.inactiveListBoxSelectionBackgroundColor();
     * @endcode
     */
    virtual Color inactiveListBoxSelectionBackgroundColor() const;

    /**
     * get inactive list box selection foreground color
     * @param[out] : color
     * @code
     * Color c = r.inactiveListBoxSelectionForegroundColor();
     * @endcode
     */
    virtual Color inactiveListBoxSelectionForegroundColor() const;

    /**
     * get caret blink frequency
     * @param[out] : frequency
     * @code
     * double cf = r.caretBlinkFrequency();
     * @endcode
     */
    virtual double caretBlinkFrequency() const;

    /**
     * ser system font
     * @param[in] : prop ID
     * @param[in] : font description
     * @code
     * r.systemFont(id, fd);
     * @endcode
     */
    virtual void systemFont(int propId, FontDescription&) const;

protected:
    /**
     * paintCheckbox
     */
    virtual bool paintCheckbox(RenderObject* o, const RenderObject::PaintInfo& i, const IntRect& r);

    /**
     * setCheckboxSize
     */
    virtual void setCheckboxSize(RenderStyle* style) const;

    /**
     * paintRadio
     */
    virtual bool paintRadio(RenderObject* o, const RenderObject::PaintInfo& i, const IntRect& r);

    /**
     *  setRadioSize
     */
    virtual void setRadioSize(RenderStyle* style) const;

    /**
     *  adjustButtonStyle 
     */
    virtual void adjustButtonStyle(CSSStyleSelector*, RenderStyle*, Element*) const;

    /**
     *  paintButton
     */
    virtual bool paintButton(RenderObject*, const RenderObject::PaintInfo&, const IntRect&);

    /**
     *  adjustTextFieldStyle
     */
    virtual void adjustTextFieldStyle(CSSStyleSelector*, RenderStyle*, Element*) const;

    /**
     *  paintTextField
     */
    virtual bool paintTextField(RenderObject*, const RenderObject::PaintInfo&, const IntRect&);

    /**
     *  adjustTextAreaStyle 
     */
    virtual void adjustTextAreaStyle(CSSStyleSelector*, RenderStyle*, Element*) const;

    /**
     *  paintTextArea 
     */
    virtual bool paintTextArea(RenderObject*, const RenderObject::PaintInfo&, const IntRect&);

    /**
     *  adjustMenuListStyle 
     */
    virtual void adjustMenuListStyle(CSSStyleSelector*, RenderStyle*, Element*) const;

    /**
     * paintMenuList
     */
    virtual bool paintMenuList(RenderObject*, const RenderObject::PaintInfo&, const IntRect&);

    /**
     * adjustSearchFieldResultsDecorationStyle
     */
    virtual void adjustSearchFieldResultsDecorationStyle(CSSStyleSelector*, RenderStyle*, Element*) const;

    /**
     * paintSearchFieldResultsDecoration
     */
    virtual bool paintSearchFieldResultsDecoration(RenderObject*, const RenderObject::PaintInfo&, const IntRect&);

    /**
     * adjustSearchFieldStyle 
     */
    virtual void adjustSearchFieldStyle(CSSStyleSelector*, RenderStyle*, Element*) const;

    /**
     * paintSearchField 
     */
    virtual bool paintSearchField(RenderObject*, const RenderObject::PaintInfo&, const IntRect&);

    /**
     * adjustSearchFieldResultsButtonStyle
     */
    virtual void adjustSearchFieldResultsButtonStyle(CSSStyleSelector*, RenderStyle*, Element*) const;

    /**
     * paintSearchFieldResultsButton 
     */
    virtual bool paintSearchFieldResultsButton(RenderObject*, const RenderObject::PaintInfo&, const IntRect&);

    /**
     * adjustSearchFieldCancelButtonStyle
     */
    virtual void adjustSearchFieldCancelButtonStyle(CSSStyleSelector*, RenderStyle*, Element*) const;

    /**
     * paintSearchFieldCancelButton
     */
    virtual bool paintSearchFieldCancelButton(RenderObject*, const RenderObject::PaintInfo&, const IntRect&);


private:
    /*
     * hold the state
     */
    /**
     * balEntry 
     */
    BalWidget* balEntry() const;

    /**
     * balTreeView
     */
    BalWidget* balTreeView() const;

    /**
     * balContainer 
     */
    BalContainer* balContainer() const;

private:
    mutable BalWidget* m_balWindow;
    mutable BalContainer* m_balContainer;
    mutable BalWidget* m_balEntry;
    mutable BalWidget* m_balTreeView;
};

}

#endif




