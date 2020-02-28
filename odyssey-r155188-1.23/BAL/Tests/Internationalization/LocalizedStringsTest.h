#ifndef LocalizedStringsTest_h_CPPUNIT
#define LocalizedStringsTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include <Platform.h>
#include "BCLocalizedStrings.h"
class LocalizedStringsTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( LocalizedStringsTestTest );
//register each method:

    CPPUNIT_TEST(inputElementAltText);
    CPPUNIT_TEST(resetButtonDefaultLabel);
    CPPUNIT_TEST(searchableIndexIntroduction);
    CPPUNIT_TEST(submitButtonDefaultLabel);
    CPPUNIT_TEST(fileButtonChooseFileLabel);
    CPPUNIT_TEST(fileButtonNoFileSelectedLabel);
    CPPUNIT_TEST(copyImageUnknownFileLabel);
    CPPUNIT_TEST(contextMenuItemTagOpenLinkInNewWindow);
    CPPUNIT_TEST(contextMenuItemTagDownloadLinkToDisk);
    CPPUNIT_TEST(contextMenuItemTagCopyLinkToClipboard);
    CPPUNIT_TEST(contextMenuItemTagOpenImageInNewWindow);
    CPPUNIT_TEST(contextMenuItemTagDownloadImageToDisk);
    CPPUNIT_TEST(contextMenuItemTagCopyImageToClipboard);
    CPPUNIT_TEST(contextMenuItemTagOpenFrameInNewWindow);
    CPPUNIT_TEST(contextMenuItemTagCopy);
    CPPUNIT_TEST(contextMenuItemTagGoBack);
    CPPUNIT_TEST(contextMenuItemTagGoForward);
    CPPUNIT_TEST(contextMenuItemTagStop);
    CPPUNIT_TEST(contextMenuItemTagReload);
    CPPUNIT_TEST(contextMenuItemTagCut);
    CPPUNIT_TEST(contextMenuItemTagPaste);
#if PLATFORM(GTK)
    CPPUNIT_TEST(contextMenuItemTagDelete);
    CPPUNIT_TEST(contextMenuItemTagSelectAll);
    CPPUNIT_TEST(contextMenuItemTagInputMethods);
    CPPUNIT_TEST(contextMenuItemTagUnicode);
#endif
    CPPUNIT_TEST(contextMenuItemTagNoGuessesFound);
    CPPUNIT_TEST(contextMenuItemTagIgnoreSpelling);
    CPPUNIT_TEST(contextMenuItemTagLearnSpelling);
    CPPUNIT_TEST(contextMenuItemTagSearchWeb);
    CPPUNIT_TEST(contextMenuItemTagLookUpInDictionary);
    CPPUNIT_TEST(contextMenuItemTagOpenLink);
    CPPUNIT_TEST(contextMenuItemTagIgnoreGrammar);
    CPPUNIT_TEST(contextMenuItemTagSpellingMenu);
    CPPUNIT_TEST(contextMenuItemTagShowSpellingPanel);
    CPPUNIT_TEST(contextMenuItemTagCheckSpelling);
    CPPUNIT_TEST(contextMenuItemTagCheckSpellingWhileTyping);
    CPPUNIT_TEST(contextMenuItemTagCheckGrammarWithSpelling);
    CPPUNIT_TEST(contextMenuItemTagFontMenu);
    CPPUNIT_TEST(contextMenuItemTagBold);
    CPPUNIT_TEST(contextMenuItemTagItalic);
    CPPUNIT_TEST(contextMenuItemTagUnderline);
    CPPUNIT_TEST(contextMenuItemTagOutline);
    CPPUNIT_TEST(contextMenuItemTagWritingDirectionMenu);
    CPPUNIT_TEST(contextMenuItemTagDefaultDirection);
    CPPUNIT_TEST(contextMenuItemTagLeftToRight);
    CPPUNIT_TEST(contextMenuItemTagRightToLeft);
    CPPUNIT_TEST(contextMenuItemTagInspectElement);

    CPPUNIT_TEST(searchMenuNoRecentSearchesText);
    CPPUNIT_TEST(searchMenuRecentSearchesText);
    CPPUNIT_TEST(searchMenuClearRecentSearchesText);

    CPPUNIT_TEST(AXWebAreaText);
    CPPUNIT_TEST(AXLinkText);
    CPPUNIT_TEST(AXListMarkerText);
    CPPUNIT_TEST(AXImageMapText);
    CPPUNIT_TEST(AXHeadingText);

    CPPUNIT_TEST(AXButtonActionVerb);
    CPPUNIT_TEST(AXRadioButtonActionVerb);
    CPPUNIT_TEST(AXTextFieldActionVerb);
    CPPUNIT_TEST(AXCheckedCheckBoxActionVerb);
    CPPUNIT_TEST(AXUncheckedCheckBoxActionVerb);
    CPPUNIT_TEST(AXMenuListActionVerb);
    CPPUNIT_TEST(AXMenuListPopupActionVerb);
    CPPUNIT_TEST(AXLinkActionVerb);

    CPPUNIT_TEST(unknownFileSizeText);
    CPPUNIT_TEST(imageTitle);

    CPPUNIT_TEST_SUITE_END();


    void inputElementAltText() CPPU_NOT_IMPLEMENTED
    void resetButtonDefaultLabel() CPPU_NOT_IMPLEMENTED
    void searchableIndexIntroduction() CPPU_NOT_IMPLEMENTED
    void submitButtonDefaultLabel() CPPU_NOT_IMPLEMENTED
    void fileButtonChooseFileLabel() CPPU_NOT_IMPLEMENTED
    void fileButtonNoFileSelectedLabel() CPPU_NOT_IMPLEMENTED
    void copyImageUnknownFileLabel() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagOpenLinkInNewWindow() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagDownloadLinkToDisk() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagCopyLinkToClipboard() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagOpenImageInNewWindow() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagDownloadImageToDisk() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagCopyImageToClipboard() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagOpenFrameInNewWindow() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagCopy() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagGoBack() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagGoForward() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagStop() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagReload() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagCut() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagPaste() CPPU_NOT_IMPLEMENTED
#if PLATFORM(GTK) 
    void contextMenuItemTagDelete() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagSelectAll() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagInputMethods() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagUnicode() CPPU_NOT_IMPLEMENTED
#endif
    void contextMenuItemTagNoGuessesFound() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagIgnoreSpelling() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagLearnSpelling() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagSearchWeb() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagLookUpInDictionary() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagOpenLink() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagIgnoreGrammar() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagSpellingMenu() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagShowSpellingPanel() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagCheckSpelling() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagCheckSpellingWhileTyping() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagCheckGrammarWithSpelling() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagFontMenu() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagBold() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagItalic() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagUnderline() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagOutline() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagWritingDirectionMenu() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagDefaultDirection() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagLeftToRight() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagRightToLeft() CPPU_NOT_IMPLEMENTED
    void contextMenuItemTagInspectElement() CPPU_NOT_IMPLEMENTED

    void searchMenuNoRecentSearchesText() CPPU_NOT_IMPLEMENTED
    void searchMenuRecentSearchesText() CPPU_NOT_IMPLEMENTED
    void searchMenuClearRecentSearchesText() CPPU_NOT_IMPLEMENTED

    void AXWebAreaText() CPPU_NOT_IMPLEMENTED
    void AXLinkText() CPPU_NOT_IMPLEMENTED
    void AXListMarkerText() CPPU_NOT_IMPLEMENTED
    void AXImageMapText() CPPU_NOT_IMPLEMENTED
    void AXHeadingText() CPPU_NOT_IMPLEMENTED

    void AXButtonActionVerb() CPPU_NOT_IMPLEMENTED
    void AXRadioButtonActionVerb() CPPU_NOT_IMPLEMENTED
    void AXTextFieldActionVerb() CPPU_NOT_IMPLEMENTED
    void AXCheckedCheckBoxActionVerb() CPPU_NOT_IMPLEMENTED
    void AXUncheckedCheckBoxActionVerb() CPPU_NOT_IMPLEMENTED
    void AXLinkActionVerb() CPPU_NOT_IMPLEMENTED

    void unknownFileSizeText() CPPU_NOT_IMPLEMENTED
    void imageTitle() CPPU_NOT_IMPLEMENTED
};

#endif

