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

#include "LocalizedStrings.h"
#include "PlatformString.h"
#include "wtf/MathExtras.h"
#include <math.h>

#if ENABLE(CEHTML)
#include "KeyboardCodesCEHTML.h"
#endif

namespace WebCore {


String submitButtonDefaultLabel()
{
    return String::fromUTF8("Submit");
}

String inputElementAltText()
{
    return String::fromUTF8("Submit");
}

String resetButtonDefaultLabel()
{
    return String::fromUTF8("Reset");
}

String searchableIndexIntroduction()
{
	return String::fromUTF8("Searchable Index");
}

String fileButtonChooseFileLabel()
{
	return String::fromUTF8("Choose File...");
}

String fileButtonNoFileSelectedLabel()
{
    return String::fromUTF8("(None)");
}

String contextMenuItemTagOpenLinkInNewWindow()
{
	return String::fromUTF8("Open Link in New Window...");
}

#if OS(MORPHOS)
String contextMenuItemTagOpenLinkInNewTab()
{
  return String::fromUTF8("Open Link in New Tab...");
}

String contextMenuItemTagOpenLinkInNewBackgroundTab()
{
  return String::fromUTF8("Open Link in New Background Tab...");
}
#endif    


String contextMenuItemTagDownloadLinkToDisk()
{
	return String::fromUTF8("Download Linked File...");
}

String contextMenuItemTagCopyLinkToClipboard()
{
	return String::fromUTF8("Copy Link Location");
}

String contextMenuItemTagOpenImageInNewWindow()
{
	return String::fromUTF8("Open Image in New Window...");
}

String contextMenuItemTagDownloadImageToDisk()
{
	return String::fromUTF8("Save Image As...");
}

String contextMenuItemTagCopyImageToClipboard()
{
	return String::fromUTF8("Copy Image");
}

#if OS(MORPHOS)
String contextMenuItemTagOpenImageInNewTab()
{
  return String::fromUTF8("Open Image in New Tab...");
}
#endif       


String contextMenuItemTagOpenFrameInNewWindow()
{
	return String::fromUTF8("Open Frame in New Window...");
}

#if OS(MORPHOS)
String contextMenuItemTagOpenFrameInNewTab()
{
  return String::fromUTF8("Open Frame in New Tab...");
}
#endif    


String contextMenuItemTagCopy()
{
	static String stockLabel = String::fromUTF8("Copy");
    return stockLabel;
}

String contextMenuItemTagDelete()
{
	static String stockLabel = String::fromUTF8("Delete");
    return stockLabel;
}

String contextMenuItemTagSelectAll()
{
	static String stockLabel = String::fromUTF8("Select All");
    return stockLabel;
}

String contextMenuItemTagUnicode()
{
	return String::fromUTF8("Insert Unicode Control Character");
}

String contextMenuItemTagInputMethods()
{
	return String::fromUTF8("Input Methods");
}

String contextMenuItemTagGoBack()
{
	static String stockLabel = String::fromUTF8("Back");
    return stockLabel;
}

String contextMenuItemTagGoForward()
{
	static String stockLabel = String::fromUTF8("Forward");
    return stockLabel;
}

String contextMenuItemTagStop()
{
	static String stockLabel = String::fromUTF8("Stop");
    return stockLabel;
}

String contextMenuItemTagReload()
{
	return String::fromUTF8("Reload");
}

String contextMenuItemTagCut()
{
	static String stockLabel = String::fromUTF8("Cut");
    return stockLabel;
}

String contextMenuItemTagPaste()
{
	static String stockLabel = String::fromUTF8("Paste");
    return stockLabel;
}

String contextMenuItemTagNoGuessesFound()
{
    return String::fromUTF8("No Guesses Found");
}

String contextMenuItemTagIgnoreSpelling()
{
	return String::fromUTF8("Ignore Spelling");
}

String contextMenuItemTagLearnSpelling()
{
	return String::fromUTF8("Learn Spelling");
}

String contextMenuItemTagSearchWeb()
{
	return String::fromUTF8("Search the Web");
}

String contextMenuItemTagLookUpInDictionary()
{
	return String::fromUTF8("Look Up in Dictionary");
}

String contextMenuItemTagOpenLink()
{
	return String::fromUTF8("Open Link");
}

String contextMenuItemTagIgnoreGrammar()
{
	return String::fromUTF8("Ignore Grammar");
}

String contextMenuItemTagSpellingMenu()
{
	return String::fromUTF8("Spelling and Grammar");
}

String contextMenuItemTagShowSpellingPanel(bool show)
{
	return String::fromUTF8(show ? "Show Spelling and Grammar" : "Hide Spelling and Grammar");
}

String contextMenuItemTagCheckSpelling()
{
	return String::fromUTF8("Check Document Now");
}

String contextMenuItemTagCheckSpellingWhileTyping()
{
	return String::fromUTF8("Check Spelling While Typing");
}

String contextMenuItemTagCheckGrammarWithSpelling()
{
	return String::fromUTF8("Check Grammar With Spelling");
}

String contextMenuItemTagFontMenu()
{
	return String::fromUTF8("Font");
}

String contextMenuItemTagBold()
{
    static String stockLabel = String::fromUTF8("Bold");;
    return stockLabel;
}

String contextMenuItemTagItalic()
{
    static String stockLabel = String::fromUTF8("Italic");
    return stockLabel;
}

String contextMenuItemTagUnderline()
{
    static String stockLabel = String::fromUTF8("Underline");
    return stockLabel;
}

String contextMenuItemTagOutline()
{
	return String::fromUTF8("Outline");
}

String contextMenuItemTagInspectElement()
{
	return String::fromUTF8("Inspect Element");
}

String searchMenuNoRecentSearchesText()
{
    return String::fromUTF8("No recent searches");
}

String searchMenuRecentSearchesText()
{
    return String::fromUTF8("Recent searches");
}

String searchMenuClearRecentSearchesText()
{
	return String::fromUTF8("Clear recent searches");
}

String AXDefinitionListTermText()
{
    return String::fromUTF8("term");
}

String AXDefinitionListDefinitionText()
{
    return String::fromUTF8("definition");
}

String AXButtonActionVerb()
{
    return String();
}

String AXRadioButtonActionVerb()
{
    return String();
}

String AXTextFieldActionVerb()
{
    return String();
}

String AXCheckedCheckBoxActionVerb()
{
    return String();
}

String AXUncheckedCheckBoxActionVerb()
{
    return String();
}

String AXLinkActionVerb()
{
    return String();
}

String AXMenuListPopupActionVerb()
{
    return String();
}

String AXMenuListActionVerb()
{
    return String();
}

String unknownFileSizeText()
{
    return String::fromUTF8("Unknown");
}

String imageTitle(const String& filename, const IntSize& size)
{
    return String();
}

String contextMenuItemTagLeftToRight()
{
    return String::fromUTF8("Left to Right context menu item");
}

String contextMenuItemTagDefaultDirection()
{
    return String::fromUTF8("Default writing direction context menu item");
}

String contextMenuItemTagRightToLeft()
{
    return String::fromUTF8("Right to Left context menu item");
}

String contextMenuItemTagWritingDirectionMenu()
{
    return String::fromUTF8("Writing direction context sub-menu item");
}

String contextMenuItemTagTextDirectionMenu()
{
    return String::fromUTF8("Text direction context sub-menu item");
}

String multipleFileUploadText(unsigned numberOfFiles)
{
    return String();
}

#if ENABLE(VIDEO)

String mediaElementLoadingStateText()
{
    return String::fromUTF8("Loading ...");
}

String mediaElementLiveBroadcastStateText()
{
    return String::fromUTF8("Live broadcast");
}

String localizedMediaControlElementString(const String& name)
{
    if (name == "AudioElement")
        return String::fromUTF8("audio element controller");
    if (name == "VideoElement")
        return String::fromUTF8("video element controller");
    if (name == "MuteButton")
        return String::fromUTF8("mute");
    if (name == "UnMuteButton")
        return String::fromUTF8("unmute");
    if (name == "PlayButton")
        return String::fromUTF8("play");
    if (name == "PauseButton")
        return String::fromUTF8("pause");
    if (name == "Slider")
        return String::fromUTF8("movie time");
    if (name == "SliderThumb")
        return String::fromUTF8("timeline slider thumb");
    if (name == "RewindButton")
        return String::fromUTF8("back 30 seconds");
    if (name == "ReturnToRealtimeButton")
        return String::fromUTF8("return to realtime");
    if (name == "CurrentTimeDisplay")
        return String::fromUTF8("elapsed time");
    if (name == "TimeRemainingDisplay")
        return String::fromUTF8("remaining time");
    if (name == "StatusDisplay")
        return String::fromUTF8("status");
    if (name == "FullscreenButton")
        return String::fromUTF8("fullscreen");
    if (name == "SeekForwardButton")
        return String::fromUTF8("fast forward");
    if (name == "SeekBackButton")
        return String::fromUTF8("fast reverse");

    ASSERT_NOT_REACHED();
    return String();
}

String localizedMediaControlElementHelpText(const String& name)
{
    if (name == "AudioElement")
        return String::fromUTF8("audio element playback controls and status display");
    if (name == "VideoElement")
        return String::fromUTF8("video element playback controls and status display");
    if (name == "MuteButton")
        return String::fromUTF8("mute audio tracks");
    if (name == "UnMuteButton")
        return String::fromUTF8("unmute audio tracks");
    if (name == "PlayButton")
        return String::fromUTF8("begin playback");
    if (name == "PauseButton")
        return String::fromUTF8("pause playback");
    if (name == "Slider")
        return String::fromUTF8("movie time scrubber");
    if (name == "SliderThumb")
        return String::fromUTF8("movie time scrubber thumb");
    if (name == "RewindButton")
        return String::fromUTF8("seek movie back 30 seconds");
    if (name == "ReturnToRealtimeButton")
        return String::fromUTF8("return streaming movie to real time");
    if (name == "CurrentTimeDisplay")
        return String::fromUTF8("current movie time in seconds");
    if (name == "TimeRemainingDisplay")
        return String::fromUTF8("number of seconds of movie remaining");
    if (name == "StatusDisplay")
        return String::fromUTF8("current movie status");
    if (name == "SeekBackButton")
        return String::fromUTF8("seek quickly back");
    if (name == "SeekForwardButton")
        return String::fromUTF8("seek quickly forward");
    if (name == "FullscreenButton")
        return String::fromUTF8("Play movie in fullscreen mode");

    ASSERT_NOT_REACHED();
    return String();
}

String localizedMediaTimeDescription(float time)
{
    if (!isfinite(time))
        return String::fromUTF8("indefinite time");

    int seconds = (int)fabsf(time);
    int days = seconds / (60 * 60 * 24);
    int hours = seconds / (60 * 60);
    int minutes = (seconds / 60) % 60;
    seconds %= 60;

    String timeString;
    if (days) {
        timeString += String::number(days);
        timeString += " days ";
    }

    if (hours) {
        timeString += String::number(hours);
        timeString += " hours ";

    }

    if (minutes) {
        timeString += String::number(minutes);
        timeString += " minutes ";
    }

    timeString += String::number(seconds);
    timeString += " seconds";
    return timeString;
}

#endif // ENABLE(VIDEO)

String validationMessageValueMissingText()
{
    return String();
}

String validationMessageTypeMismatchText()
{
    return String();
}

String validationMessagePatternMismatchText()
{
    return String();
}

String validationMessageTooLongText()
{
    return String();
}

String validationMessageRangeUnderflowText()
{
    return String();
}

String validationMessageRangeOverflowText()
{
    return String();
}

String validationMessageStepMismatchText()
{
    return String();
}

String missingPluginText() 
{ 
    return String::fromUTF8("Label text to be used when a plugin is missing"); 
}

String crashedPluginText()
{
    return String::fromUTF8("Label text to be used if plugin host process has crashed");
}

#if ENABLE(CEHTML)

String opCodeElementReplacementText(int keyCode)
{
    // Default to translating key code to corresponding key literal
    return convertVKKeyToString(keyCode);
}

#endif // ENABLE(CEHTML)

} // namespace WebCore
