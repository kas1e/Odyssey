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

#include <wtf/Forward.h>

namespace WebCore {

    class IntSize;
    
    String inputElementAltText();
    String resetButtonDefaultLabel();
    String searchableIndexIntroduction();
    String submitButtonDefaultLabel();
    String fileButtonChooseFileLabel();
    String fileButtonChooseMultipleFilesLabel(); 
    String fileButtonNoFileSelectedLabel();
    String fileButtonNoFilesSelectedLabel();
    String defaultDetailsSummaryText();
    String copyImageUnknownFileLabel();
    String contextMenuItemTagOpenLinkInNewWindow();
#if OS(MORPHOS)
    String contextMenuItemTagOpenLinkInNewTab();
	String contextMenuItemTagOpenLinkInNewBackgroundTab();
#endif  
    String contextMenuItemTagDownloadLinkToDisk();
    String contextMenuItemTagCopyLinkToClipboard();
    String contextMenuItemTagOpenImageInNewWindow();
#if OS(MORPHOS)
    String contextMenuItemTagOpenImageInNewTab();
	String contextMenuItemTagBlockImage();
#endif     
    String contextMenuItemTagDownloadImageToDisk();
    String contextMenuItemTagCopyImageToClipboard();
    String contextMenuItemTagCopyImageUrlToClipboard();
    String contextMenuItemTagOpenFrameInNewWindow();
#if OS(MORPHOS)
    String contextMenuItemTagOpenFrameInNewTab();
#endif   
    String contextMenuItemTagCopy();
    String contextMenuItemTagGoBack();
    String contextMenuItemTagGoForward();
    String contextMenuItemTagStop();
    String contextMenuItemTagReload();
    String contextMenuItemTagCut();
    String contextMenuItemTagPaste();
    String contextMenuItemTagDelete();
    String contextMenuItemTagSelectAll();
    String contextMenuItemTagInputMethods();
    String contextMenuItemTagUnicode();
    String contextMenuItemTagNoGuessesFound();
    String contextMenuItemTagIgnoreSpelling();
    String contextMenuItemTagLearnSpelling();
    String contextMenuItemTagSearchWeb();
    String contextMenuItemTagLookUpInDictionary();
    String contextMenuItemTagOpenLink();
    String contextMenuItemTagIgnoreGrammar();
    String contextMenuItemTagSpellingMenu();
    String contextMenuItemTagShowSpellingPanel(bool show);
    String contextMenuItemTagCheckSpelling();
    String contextMenuItemTagCheckSpellingWhileTyping();
    String contextMenuItemTagCheckGrammarWithSpelling();
    String contextMenuItemTagDictionaryMenu();
    String contextMenuItemTagFontMenu();
    String contextMenuItemTagBold();
    String contextMenuItemTagItalic();
    String contextMenuItemTagUnderline();
    String contextMenuItemTagOutline();
    String contextMenuItemTagWritingDirectionMenu();
    String contextMenuItemTagTextDirectionMenu();
    String contextMenuItemTagDefaultDirection();
    String contextMenuItemTagLeftToRight();
    String contextMenuItemTagRightToLeft();

    String contextMenuItemTagOpenVideoInNewWindow();
    String contextMenuItemTagOpenAudioInNewWindow();
    String contextMenuItemTagCopyVideoLinkToClipboard();
    String contextMenuItemTagCopyAudioLinkToClipboard();
    String contextMenuItemTagToggleMediaControls();
    String contextMenuItemTagToggleMediaLoop();
    String contextMenuItemTagEnterVideoFullscreen();
    String contextMenuItemTagMediaPlay();
    String contextMenuItemTagMediaPause();
    String contextMenuItemTagMediaMute();
    String contextMenuItemTagDownloadMedia();
    String contextMenuItemTagDownloadVideoToDisk();
    String contextMenuItemTagDownloadAudioToDisk();

    String contextMenuItemTagInspectElement();

    String searchMenuNoRecentSearchesText();
    String searchMenuRecentSearchesText();
    String searchMenuClearRecentSearchesText();

    String AXWebAreaText();
    String AXLinkText();
    String AXListMarkerText();
    String AXImageMapText();
    String AXHeadingText();
    String AXDescriptionListText(); 
    String AXDefinitionListTermText();
    String AXDefinitionListDefinitionText();
    String AXFileUploadButtonText();

    String AXButtonActionVerb();
    String AXRadioButtonActionVerb();
    String AXTextFieldActionVerb();
    String AXCheckedCheckBoxActionVerb();
    String AXUncheckedCheckBoxActionVerb();
    String AXMenuListActionVerb();
    String AXMenuListPopupActionVerb();
    String AXLinkActionVerb();
    String AXListItemActionVerb();
    String AXSearchFieldCancelButtonText();

    String multipleFileUploadText(unsigned numberOfFiles);
    String unknownFileSizeText();

    String imageTitle(const String& filename, const IntSize& size);

    String mediaElementLoadingStateText();
    String mediaElementLiveBroadcastStateText();
    String localizedMediaControlElementString(const String&);
    String localizedMediaControlElementHelpText(const String&);
    String localizedMediaTimeDescription(float);

    String validationMessageValueMissingText();
    String validationMessageValueMissingForCheckboxText();
    String validationMessageValueMissingForFileText();
    String validationMessageValueMissingForMultipleFileText();
    String validationMessageValueMissingForRadioText();
    String validationMessageValueMissingForSelectText();
    String validationMessageTypeMismatchText();
    String validationMessageTypeMismatchForEmailText();
    String validationMessageTypeMismatchForMultipleEmailText();
    String validationMessageTypeMismatchForURLText();
    String validationMessagePatternMismatchText();
    String validationMessageTooLongText(int valueLength, int maxLength);
    String validationMessageRangeUnderflowText(const String& minimum);
    String validationMessageRangeOverflowText(const String& maximum);
    String validationMessageStepMismatchText(const String& base, const String& step);
    String validationMessageBadInputForNumberText();

    String missingPluginText();
    String crashedPluginText();
    String blockedPluginByContentSecurityPolicyText();
    String insecurePluginVersionText(); 
    String inactivePluginText();

#if ENABLE(INPUT_TYPE_WEEK)
    // weekFormatInLDML() returns week and year format in LDML, Unicode 
    // technical standard 35, Locale Data Markup Language, e.g. "'Week' ww, yyyy" 
    String weekFormatInLDML();
#endif

    String clickToExitFullScreenText();

#if ENABLE(VIDEO_TRACK)
    String textTrackClosedCaptionsText();
    String textTrackSubtitlesText();
    String textTrackOffMenuItemText(); 
    String textTrackAutomaticMenuItemText(); 
    String textTrackNoLabelText();
#endif

    String snapshottedPlugInLabelTitle();
    String snapshottedPlugInLabelSubtitle();

}

#endif
