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
#ifndef ContextMenuItem_h
#define ContextMenuItem_h
/**
 *  @file  ContextMenuItem.t
 *  ContextMenuItem description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:12 $
 */
#include "BALBase.h"

#include "PlatformMenuDescription.h"
#include "PlatformString.h"
#include <wtf/OwnPtr.h>


namespace WKAL {

    class ContextMenu;

    // This enum needs to be in sync with the WebMenuItemTag enum in WebUIDelegate.h and the
    // extra values in WebUIDelegatePrivate.h
    enum ContextMenuAction {
        ContextMenuItemTagNoAction=0, // This item is not actually in WebUIDelegate.h
        ContextMenuItemTagOpenLinkInNewWindow=1,
        ContextMenuItemTagDownloadLinkToDisk,
        ContextMenuItemTagCopyLinkToClipboard,
        ContextMenuItemTagOpenImageInNewWindow,
        ContextMenuItemTagDownloadImageToDisk,
        ContextMenuItemTagCopyImageToClipboard,
        ContextMenuItemTagOpenFrameInNewWindow,
        ContextMenuItemTagCopy,
        ContextMenuItemTagGoBack,
        ContextMenuItemTagGoForward,
        ContextMenuItemTagStop,
        ContextMenuItemTagReload,
        ContextMenuItemTagCut,
        ContextMenuItemTagPaste,
        ContextMenuItemTagSpellingGuess,
        ContextMenuItemTagNoGuessesFound,
        ContextMenuItemTagIgnoreSpelling,
        ContextMenuItemTagLearnSpelling,
        ContextMenuItemTagOther,
        ContextMenuItemTagSearchInSpotlight,
        ContextMenuItemTagSearchWeb,
        ContextMenuItemTagLookUpInDictionary,
        ContextMenuItemTagOpenWithDefaultApplication,
        ContextMenuItemPDFActualSize,
        ContextMenuItemPDFZoomIn,
        ContextMenuItemPDFZoomOut,
        ContextMenuItemPDFAutoSize,
        ContextMenuItemPDFSinglePage,
        ContextMenuItemPDFFacingPages,
        ContextMenuItemPDFContinuous,
        ContextMenuItemPDFNextPage,
        ContextMenuItemPDFPreviousPage,
        // These are new tags! Not a part of API!!!!
        ContextMenuItemTagOpenLink = 2000,
        ContextMenuItemTagIgnoreGrammar,
        ContextMenuItemTagSpellingMenu, // Spelling or Spelling/Grammar sub-menu
        ContextMenuItemTagShowSpellingPanel,
        ContextMenuItemTagCheckSpelling,
        ContextMenuItemTagCheckSpellingWhileTyping,
        ContextMenuItemTagCheckGrammarWithSpelling,
        ContextMenuItemTagFontMenu, // Font sub-menu
        ContextMenuItemTagShowFonts,
        ContextMenuItemTagBold,
        ContextMenuItemTagItalic,
        ContextMenuItemTagUnderline,
        ContextMenuItemTagOutline,
        ContextMenuItemTagStyles,
        ContextMenuItemTagShowColors,
        ContextMenuItemTagSpeechMenu, // Speech sub-menu
        ContextMenuItemTagStartSpeaking,
        ContextMenuItemTagStopSpeaking,
        ContextMenuItemTagWritingDirectionMenu, // Writing Direction sub-menu
        ContextMenuItemTagDefaultDirection,
        ContextMenuItemTagLeftToRight,
        ContextMenuItemTagRightToLeft,
        ContextMenuItemTagPDFSinglePageScrolling,
        ContextMenuItemTagPDFFacingPagesScrolling,
        ContextMenuItemTagInspectElement,
        ContextMenuItemBaseApplicationTag = 10000
    };

    enum ContextMenuItemType {
        ActionType,
        CheckableActionType,
        SeparatorType,
        SubmenuType
    };


    class ContextMenuItem : public WKALBase {
    public:
    /**
     * ContextMenuItem constructor
     * @param[in] : platform menu item description
     * @code
     * ContextMenuItem *c = new ContextMenuItem(p);
     * @endcode
     */
        ContextMenuItem(PlatformMenuItemDescription);

    /**
     * ContextMenuItem constructor
     * @param[in] : context menu
     * @code
     * ContextMenuItem *c = new ContextMenuItem(m);
     * @endcode
     */
        ContextMenuItem(ContextMenu* subMenu = 0);

    /**
     * ContextMenuItem constructor
     * @param[in] : context menu item type
     * @param[in] : context menu action
     * @param[in] : title
     * @param[in] : context menu
     * @code
     * ContextMenuItem *c = new ContextMenuItem(type, a, t, s);
     * @endcode
     */
        ContextMenuItem(ContextMenuItemType type, ContextMenuAction action, const String& title, ContextMenu* subMenu = 0);

    /**
     * ContextMenuItem constructor
     * @param[in] : platform menu item
     * @code
     * ContextMenuItem *c = new ContextMenuItem(balMenuItem);
     * @endcode
     */
        ContextMenuItem(BalMenuItem*);

    /**
     * ContextMenuItem destructor
     * @code
     * delete c;
     * @endcode
     */
        ~ContextMenuItem();

    /**
     * release platform description 
     * @param[out] : platform menu item description
     * @code
     * PlatformMenuItemDescription m = c->releasePlatformDescription(); 
     * @endcode
     */
        PlatformMenuItemDescription releasePlatformDescription();

    /**
     * get context menu item type
     * @param[out] : context menu item type
     * @code
     * ContextMenuItemType t = c->type();
     * @endcode
     */
        ContextMenuItemType type() const;

    /**
     * set type
     * @param[in] : context menu item type
     * @code
     * c->setType(t);
     * @endcode
     */
        void setType(ContextMenuItemType);

    /**
     * get context menu action
     * @param[out] : context menu action
     * @code
     * ContextMenuAction a = c->action();
     * @endcode
     */
        ContextMenuAction action() const;

    /**
     * set context menu action
     * @param[in] : context menu action
     * @code
     * c->setAction(a);
     * @endcode
     */
        void setAction(ContextMenuAction);

    /**
     * get title 
     * @param[out] : title
     * @code
     * String t = c->title();
     * @endcode
     */
        String title() const;

    /**
     * set title
     * @param[in] : title
     * @code
     * c->setTitle(t);
     * @endcode
     */
        void setTitle(const String&);

    /**
     * get platform sub menu
     * @param[out] : platform menu description
     * @code
     * PlatformMenuDescription p = c->platformSubMenu();
     * @endcode
     */
        PlatformMenuDescription platformSubMenu() const;

    /**
     * set sub menu
     * @param[in] : context menu
     * @code
     * c->setSubMenu(cm);
     * @endcode
     */
        void setSubMenu(ContextMenu*);

    /**
     * set checked
     * @param[in] : status
     * @code
     * c->setChecked(false);
     * @endcode
     */
        void setChecked(bool = true);
        
    /**
     * set enabled
     * @param[in] : status
     * @code
     * c->setEnabled(false);
     * @endcode
     */
        void setEnabled(bool = true);

    /**
     * get enabled status
     * @param[out] : status
     * @code
     * bool s = c->enabled();
     * @endcode
     */
        bool enabled() const;

        // FIXME: Do we need a keyboard accelerator here?
    /**
     * create native menu item
     * @param[in] : platform menu item description
     * @param[out] : BalMenuItem
     * @code
     * BalMenuItem *i = ContextMenuItem::createNativeMenuItem(p);
     * @endcode
     */
        static BalMenuItem* createNativeMenuItem(const PlatformMenuItemDescription&);

    private:
        PlatformMenuItemDescription m_platformDescription;
    };

}

#endif // ContextMenuItem_h




