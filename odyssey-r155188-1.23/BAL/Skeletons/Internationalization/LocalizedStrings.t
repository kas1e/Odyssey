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
#ifndef LocalizedStrings_h
#define LocalizedStrings_h
/**
 *  @file  LocalizedStrings.t
 *  LocalizedStrings 
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:09 $
 */
#include "BALBase.h"

namespace WebCore {

    class String;
    class IntSize;
    
    /**
     * get input element alt text
     * @param[out] : string
     * @code
     * String s = inputElementAltText();
     * @endcode
     */
    String inputElementAltText();

    /**
     * get reset button default label
     * @param[out] : label
     */
    String resetButtonDefaultLabel();
    /**
     *  searchableIndexIntroduction 
     * @param[out] : label
     */
    String searchableIndexIntroduction();
    /**
     *  submitButtonDefaultLabel 
     * @param[out] : label
     */
    String submitButtonDefaultLabel();
    /**
     *  fileButtonChooseFileLabel 
     * @param[out] : label
     */
    String fileButtonChooseFileLabel();
    /**
     *  fileButtonNoFileSelectedLabel 
     * @param[out] : label
     */
    String fileButtonNoFileSelectedLabel();
    /**
     *  copyImageUnknownFileLabel 
     * @param[out] : label
     */
    String copyImageUnknownFileLabel();
    /**
     *  contextMenuItemTagOpenLinkInNewWindow 
     * @param[out] : label
     */
    String contextMenuItemTagOpenLinkInNewWindow();
    /**
     *  contextMenuItemTagDownloadLinkToDisk 
     * @param[out] : label
     */
    String contextMenuItemTagDownloadLinkToDisk();
    /**
     *  contextMenuItemTagCopyLinkToClipboard 
     * @param[out] : label
     */
    String contextMenuItemTagCopyLinkToClipboard();
    /**
     *  contextMenuItemTagOpenImageInNewWindow 
     * @param[out] : label
     */
    String contextMenuItemTagOpenImageInNewWindow();
    /**
     *  contextMenuItemTagDownloadImageToDisk 
     * @param[out] : label
     */
    String contextMenuItemTagDownloadImageToDisk();
    /**
     *  contextMenuItemTagCopyImageToClipboard 
     * @param[out] : label
     */
    String contextMenuItemTagCopyImageToClipboard();
    /**
     *  contextMenuItemTagOpenFrameInNewWindow 
     * @param[out] : label
     */
    String contextMenuItemTagOpenFrameInNewWindow();
    /**
     *  contextMenuItemTagCopy 
     * @param[out] : label
     */
    String contextMenuItemTagCopy();
    /**
     *  contextMenuItemTagGoBack 
     * @param[out] : label
     */
    String contextMenuItemTagGoBack();
    /**
     *  contextMenuItemTagGoForward 
     * @param[out] : label
     */
    String contextMenuItemTagGoForward();
    /**
     *  contextMenuItemTagStop 
     * @param[out] : label
     */
    String contextMenuItemTagStop();
    /**
     *  contextMenuItemTagReload 
     * @param[out] : label
     */
    String contextMenuItemTagReload();
    /**
     *  contextMenuItemTagCut 
     * @param[out] : label
     */
    String contextMenuItemTagCut();
    /**
     *  contextMenuItemTagPaste 
     * @param[out] : label
     */
    String contextMenuItemTagPaste();
    /**
     *  contextMenuItemTagNoGuessesFound 
     * @param[out] : label
     */
    String contextMenuItemTagNoGuessesFound();
    /**
     *  contextMenuItemTagIgnoreSpelling 
     * @param[out] : label
     */
    String contextMenuItemTagIgnoreSpelling();
    /**
     *  contextMenuItemTagLearnSpelling 
     * @param[out] : label
     */
    String contextMenuItemTagLearnSpelling();
    /**
     *  contextMenuItemTagSearchWeb 
     * @param[out] : label
     */
    String contextMenuItemTagSearchWeb();
    /**
     *  contextMenuItemTagLookUpInDictionary 
     * @param[out] : label
     */
    String contextMenuItemTagLookUpInDictionary();
    /**
     *  contextMenuItemTagOpenLink 
     * @param[out] : label
     */
    String contextMenuItemTagOpenLink();
    /**
     *  contextMenuItemTagIgnoreGrammar 
     * @param[out] : label
     */
    String contextMenuItemTagIgnoreGrammar();
    /**
     *  contextMenuItemTagSpellingMenu 
     * @param[out] : label
     */
    String contextMenuItemTagSpellingMenu();
    /**
     *  contextMenuItemTagShowSpellingPanel 
     * @param[out] : label
     */
    String contextMenuItemTagShowSpellingPanel(bool show);
    /**
     *  contextMenuItemTagCheckSpelling 
     * @param[out] : label
     */
    String contextMenuItemTagCheckSpelling();
    /**
     *  contextMenuItemTagCheckSpellingWhileTyping 
     * @param[out] : label
     */
    String contextMenuItemTagCheckSpellingWhileTyping();
    /**
     *  contextMenuItemTagCheckGrammarWithSpelling 
     * @param[out] : label
     */
    String contextMenuItemTagCheckGrammarWithSpelling();
    /**
     *  contextMenuItemTagFontMenu 
     * @param[out] : label
     */
    String contextMenuItemTagFontMenu();
    /**
     *  contextMenuItemTagBold 
     * @param[out] : label
     */
    String contextMenuItemTagBold();
    /**
     *  contextMenuItemTagItalic 
     * @param[out] : label
     */
    String contextMenuItemTagItalic();
    /**
     *  contextMenuItemTagUnderline 
     * @param[out] : label
     */
    String contextMenuItemTagUnderline();
    /**
     *  contextMenuItemTagOutline 
     * @param[out] : label
     */
    String contextMenuItemTagOutline();
    /**
     *  contextMenuItemTagWritingDirectionMenu 
     * @param[out] : label
     */
    String contextMenuItemTagWritingDirectionMenu();
    /**
     *  contextMenuItemTagDefaultDirection 
     * @param[out] : label
     */
    String contextMenuItemTagDefaultDirection();
    /**
     *  contextMenuItemTagLeftToRight 
     * @param[out] : label
     */
    String contextMenuItemTagLeftToRight();
    /**
     *  contextMenuItemTagRightToLeft 
     * @param[out] : label
     */
    String contextMenuItemTagRightToLeft();
    /**
     *  contextMenuItemTagInspectElement 
     * @param[out] : label
     */
    String contextMenuItemTagInspectElement();

    /**
     *  searchMenuNoRecentSearchesText 
     * @param[out] : label
     */
    String searchMenuNoRecentSearchesText();
    /**
     *  searchMenuRecentSearchesText 
     * @param[out] : label
     */
    String searchMenuRecentSearchesText();
    /**
     *  searchMenuClearRecentSearchesText 
     * @param[out] : label
     */
    String searchMenuClearRecentSearchesText();

    /**
     *  AXWebAreaText 
     * @param[out] : label
     */
    String AXWebAreaText();
    /**
     *  AXLinkText 
     * @param[out] : label
     */
    String AXLinkText();
    /**
     *  AXListMarkerText 
     * @param[out] : label
     */
    String AXListMarkerText();
    /**
     *  AXImageMapText 
     * @param[out] : label
     */
    String AXImageMapText();
    /**
     *  AXHeadingText 
     * @param[out] : label
     */
    String AXHeadingText();

    /**
     *  AXButtonActionVerb 
     * @param[out] : label
     */
    String AXButtonActionVerb();
    /**
     *  AXRadioButtonActionVerb 
     * @param[out] : label
     */
    String AXRadioButtonActionVerb();
    /**
     *  AXTextFieldActionVerb 
     * @param[out] : label
     */
    String AXTextFieldActionVerb();
    /**
     *  AXCheckedCheckBoxActionVerb 
     * @param[out] : label
     */
    String AXCheckedCheckBoxActionVerb();
    /**
     *  AXUncheckedCheckBoxActionVerb 
     * @param[out] : label
     */
    String AXUncheckedCheckBoxActionVerb();
    /**
     *  AXLinkActionVerb 
     * @param[out] : label
     */
    String AXLinkActionVerb();

    /**
     *  unknownFileSizeText 
     * @param[out] : label
     */
    String unknownFileSizeText();


    /**
     * get imageTitle
     * @param[out] : label
     */
    String imageTitle(const String& filename, const IntSize& size);
}

#endif




