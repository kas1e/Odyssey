#include "Platform.h"
#if ENABLE(SVG)
#ifndef SVGImageEmptyClientsTest_h_CPPUNIT
#define SVGImageEmptyClientsTest_h_CPPUNIT

#include "config.h"
#include <cppunit/extensions/HelperMacros.h>
#include "BCFloatRect.h"
#include "BCIntRect.h"
#include "BCResourceError.h"
#include "DocumentLoader.h"
#include "Frame.h"
#include "BCSVGImageEmptyClients.h"
class SVGImageEmptyClientsTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SVGImageEmptyClientsTestTest );
//register each method:
    CPPUNIT_TEST(destruct_SVGEmptyChromeClient);
    CPPUNIT_TEST(chromeDestroyed);
    
    CPPUNIT_TEST(setWindowRect);
    CPPUNIT_TEST(windowRect);
    
    CPPUNIT_TEST(pageRect);
    
    CPPUNIT_TEST(scaleFactor);
    
    CPPUNIT_TEST(focus);
    CPPUNIT_TEST(unfocus);
    
    CPPUNIT_TEST(canTakeFocus);
    CPPUNIT_TEST(takeFocus);
    
    CPPUNIT_TEST(createWindow);
    CPPUNIT_TEST(show);
    
    CPPUNIT_TEST(canRunModal);
    CPPUNIT_TEST(runModal);
    
    CPPUNIT_TEST(setToolbarsVisible);
    CPPUNIT_TEST(toolbarsVisible);
    
    CPPUNIT_TEST(setStatusbarVisible);
    CPPUNIT_TEST(statusbarVisible);
    
    CPPUNIT_TEST(setScrollbarsVisible);
    CPPUNIT_TEST(scrollbarsVisible);
    
    CPPUNIT_TEST(setMenubarVisible);
    CPPUNIT_TEST(menubarVisible);
    
    CPPUNIT_TEST(setResizable);
    
    CPPUNIT_TEST(addMessageToConsole);
    
    CPPUNIT_TEST(canRunBeforeUnloadConfirmPanel);
    CPPUNIT_TEST(runBeforeUnloadConfirmPanel);
    
    CPPUNIT_TEST(closeWindowSoon);
    
    CPPUNIT_TEST(runJavaScriptAlert);
    CPPUNIT_TEST(runJavaScriptConfirm);
    CPPUNIT_TEST(runJavaScriptPrompt);
    CPPUNIT_TEST(shouldInterruptJavaScript);
    
    CPPUNIT_TEST(setStatusbarText);
    
    CPPUNIT_TEST(tabsToLinks);
    
    CPPUNIT_TEST(windowResizerRect);
    CPPUNIT_TEST(addToDirtyRegion);
    CPPUNIT_TEST(scrollBackingStore);
    CPPUNIT_TEST(updateBackingStore);

    CPPUNIT_TEST(mouseDidMoveOverElement);
    
    CPPUNIT_TEST(setToolTip);

    CPPUNIT_TEST(print);

    CPPUNIT_TEST(exceededDatabaseQuota);
    CPPUNIT_TEST_SUITE_END();


public:
    void destruct_SVGEmptyChromeClient() CPPU_NOT_IMPLEMENTED
    void chromeDestroyed() CPPU_NOT_IMPLEMENTED
    
    void setWindowRect() CPPU_NOT_IMPLEMENTED
    void windowRect() CPPU_NOT_IMPLEMENTED
    
    void pageRect() CPPU_NOT_IMPLEMENTED
    
    void scaleFactor() CPPU_NOT_IMPLEMENTED
    
    void focus() CPPU_NOT_IMPLEMENTED
    void unfocus() CPPU_NOT_IMPLEMENTED
    
    void canTakeFocus() CPPU_NOT_IMPLEMENTED
    void takeFocus() CPPU_NOT_IMPLEMENTED
    
    void createWindow() CPPU_NOT_IMPLEMENTED
    void show() CPPU_NOT_IMPLEMENTED
    
    void canRunModal() CPPU_NOT_IMPLEMENTED
    void runModal() CPPU_NOT_IMPLEMENTED
    
    void setToolbarsVisible() CPPU_NOT_IMPLEMENTED
    void toolbarsVisible() CPPU_NOT_IMPLEMENTED
    
    void setStatusbarVisible() CPPU_NOT_IMPLEMENTED
    void statusbarVisible() CPPU_NOT_IMPLEMENTED
    
    void setScrollbarsVisible() CPPU_NOT_IMPLEMENTED
    void scrollbarsVisible() CPPU_NOT_IMPLEMENTED
    
    void setMenubarVisible() CPPU_NOT_IMPLEMENTED
    void menubarVisible() CPPU_NOT_IMPLEMENTED
    
    void setResizable() CPPU_NOT_IMPLEMENTED
    
    void addMessageToConsole() CPPU_NOT_IMPLEMENTED
    
    void canRunBeforeUnloadConfirmPanel() CPPU_NOT_IMPLEMENTED
    void runBeforeUnloadConfirmPanel() CPPU_NOT_IMPLEMENTED
    
    void closeWindowSoon() CPPU_NOT_IMPLEMENTED
    
    void runJavaScriptAlert() CPPU_NOT_IMPLEMENTED
    void runJavaScriptConfirm() CPPU_NOT_IMPLEMENTED
    void runJavaScriptPrompt() CPPU_NOT_IMPLEMENTED
    void shouldInterruptJavaScript() CPPU_NOT_IMPLEMENTED
    
    void setStatusbarText() CPPU_NOT_IMPLEMENTED
    
    void tabsToLinks() CPPU_NOT_IMPLEMENTED
    
    void windowResizerRect() CPPU_NOT_IMPLEMENTED
    void addToDirtyRegion() CPPU_NOT_IMPLEMENTED
    void scrollBackingStore() CPPU_NOT_IMPLEMENTED
    void updateBackingStore() CPPU_NOT_IMPLEMENTED

    void mouseDidMoveOverElement() CPPU_NOT_IMPLEMENTED
    
    void setToolTip() CPPU_NOT_IMPLEMENTED

    void print() CPPU_NOT_IMPLEMENTED

    void exceededDatabaseQuota() CPPU_NOT_IMPLEMENTED
};

class SVGEmptyFrameLoaderClientTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( SVGEmptyFrameLoaderClientTest );
    CPPUNIT_TEST(destruct_SVGEmptyFrameLoaderClient);
    CPPUNIT_TEST(frameLoaderDestroyed);
    
    CPPUNIT_TEST(hasWebView);
    CPPUNIT_TEST(hasFrameView);
    
    CPPUNIT_TEST(makeRepresentation);
    CPPUNIT_TEST(forceLayout);
    CPPUNIT_TEST(forceLayoutForNonHTML);
    
    CPPUNIT_TEST(updateHistoryForCommit);
    
    CPPUNIT_TEST(updateHistoryForBackForwardNavigation);
    CPPUNIT_TEST(updateHistoryForReload);
    CPPUNIT_TEST(updateHistoryForStandardLoad);
    CPPUNIT_TEST(updateHistoryForInternalLoad);
    
    CPPUNIT_TEST(updateHistoryAfterClientRedirect);
    
    CPPUNIT_TEST(setCopiesOnScroll);
        
    CPPUNIT_TEST(detachedFromParent2);
    CPPUNIT_TEST(detachedFromParent3);
    CPPUNIT_TEST(detachedFromParent4);
    
    CPPUNIT_TEST(download);
    
    CPPUNIT_TEST(assignIdentifierToInitialRequest);
    CPPUNIT_TEST(dispatchWillSendRequest);
    CPPUNIT_TEST(dispatchDidReceiveAuthenticationChallenge);
    CPPUNIT_TEST(dispatchDidCancelAuthenticationChallenge);
    CPPUNIT_TEST(dispatchDidReceiveResponse);
    CPPUNIT_TEST(dispatchDidReceiveContentLength);
    CPPUNIT_TEST(dispatchDidFinishLoading);
    CPPUNIT_TEST(dispatchDidFailLoading);
    CPPUNIT_TEST(dispatchDidLoadResourceFromMemoryCache);
    
    CPPUNIT_TEST(dispatchDidHandleOnloadEvents);
    CPPUNIT_TEST(dispatchDidReceiveServerRedirectForProvisionalLoad);
    CPPUNIT_TEST(dispatchDidCancelClientRedirect);
    CPPUNIT_TEST(dispatchWillPerformClientRedirect);
    CPPUNIT_TEST(dispatchDidChangeLocationWithinPage);
    CPPUNIT_TEST(dispatchWillClose);
    CPPUNIT_TEST(dispatchDidReceiveIcon);
    CPPUNIT_TEST(dispatchDidStartProvisionalLoad);
    CPPUNIT_TEST(dispatchDidReceiveTitle);
    CPPUNIT_TEST(dispatchDidCommitLoad);
    CPPUNIT_TEST(dispatchDidFailProvisionalLoad);
    CPPUNIT_TEST(dispatchDidFailLoad);
    CPPUNIT_TEST(dispatchDidFinishDocumentLoad);
    CPPUNIT_TEST(dispatchDidFinishLoad);
    CPPUNIT_TEST(dispatchDidFirstLayout);
    
    CPPUNIT_TEST(dispatchCreatePage);
    CPPUNIT_TEST(dispatchShow);
    
    CPPUNIT_TEST(dispatchDecidePolicyForMIMEType);
    CPPUNIT_TEST(dispatchDecidePolicyForNewWindowAction);
    CPPUNIT_TEST(dispatchDecidePolicyForNavigationAction);
    CPPUNIT_TEST(cancelPolicyCheck);
    
    CPPUNIT_TEST(dispatchUnableToImplementPolicy);

    CPPUNIT_TEST(dispatchWillSubmitForm);
    
    CPPUNIT_TEST(dispatchDidLoadMainResource);
    CPPUNIT_TEST(revertToProvisionalState);
    CPPUNIT_TEST(setMainDocumentError);
    
    CPPUNIT_TEST(willChangeEstimatedProgress);
    CPPUNIT_TEST(didChangeEstimatedProgress);
    CPPUNIT_TEST(postProgressStartedNotification);
    CPPUNIT_TEST(postProgressEstimateChangedNotification);
    CPPUNIT_TEST(postProgressFinishedNotification);
    
    CPPUNIT_TEST(setMainFrameDocumentReady);
    
    CPPUNIT_TEST(startDownload);
    
    CPPUNIT_TEST(willChangeTitle);
    CPPUNIT_TEST(didChangeTitle);
    
    CPPUNIT_TEST(committedLoad);
    CPPUNIT_TEST(finishedLoading);
    
    CPPUNIT_TEST(cancelledError);
    CPPUNIT_TEST(blockedError);
    CPPUNIT_TEST(cannotShowURLError);
    CPPUNIT_TEST(interruptForPolicyChangeError);
    
    CPPUNIT_TEST(cannotShowMIMETypeError);
    CPPUNIT_TEST(fileDoesNotExistError);
    
    CPPUNIT_TEST(shouldFallBack);
        
    CPPUNIT_TEST(canHandleRequest);
    CPPUNIT_TEST(canShowMIMEType);
    CPPUNIT_TEST(representationExistsForURLScheme);
    CPPUNIT_TEST(generatedMIMETypeForURLScheme);
    
    CPPUNIT_TEST(frameLoadCompleted);
    CPPUNIT_TEST(restoreViewState);
    CPPUNIT_TEST(provisionalLoadStarted);
    CPPUNIT_TEST(shouldTreatURLAsSameAsCurrent);
    CPPUNIT_TEST(addHistoryItemForFragmentScroll);
    CPPUNIT_TEST(didFinishLoad);
    CPPUNIT_TEST(prepareForDataSourceReplacement);
    
    CPPUNIT_TEST(createDocumentLoader);
    CPPUNIT_TEST(setTitle);
    
    CPPUNIT_TEST(userAgent);

    CPPUNIT_TEST(savePlatformDataToCachedPage);
    CPPUNIT_TEST(transitionToCommittedFromCachedPage);
    CPPUNIT_TEST(transitionToCommittedForNewPage);

    CPPUNIT_TEST(updateGlobalHistory);
    CPPUNIT_TEST(shouldGoToHistoryItem);
    CPPUNIT_TEST(saveViewStateToItem);
    CPPUNIT_TEST(canCachePage);

    CPPUNIT_TEST(createFrame);
    CPPUNIT_TEST(createPlugin);
    CPPUNIT_TEST(createJavaAppletWidget);
    
    CPPUNIT_TEST(objectContentType);
    CPPUNIT_TEST(overrideMediaType);

    CPPUNIT_TEST(redirectDataToPlugin);
    CPPUNIT_TEST(windowObjectCleared);
    CPPUNIT_TEST(didPerformFirstNavigation);

    CPPUNIT_TEST(registerForIconNotification);
    CPPUNIT_TEST_SUITE_END();
    public:
    void destruct_SVGEmptyFrameLoaderClient() CPPU_NOT_IMPLEMENTED
    void frameLoaderDestroyed() CPPU_NOT_IMPLEMENTED
    
    void hasWebView() CPPU_NOT_IMPLEMENTED
    void hasFrameView() CPPU_NOT_IMPLEMENTED
    
    void makeRepresentation() CPPU_NOT_IMPLEMENTED
    void forceLayout() CPPU_NOT_IMPLEMENTED
    void forceLayoutForNonHTML() CPPU_NOT_IMPLEMENTED
    
    void updateHistoryForCommit() CPPU_NOT_IMPLEMENTED
    
    void updateHistoryForBackForwardNavigation() CPPU_NOT_IMPLEMENTED
    void updateHistoryForReload() CPPU_NOT_IMPLEMENTED
    void updateHistoryForStandardLoad() CPPU_NOT_IMPLEMENTED
    void updateHistoryForInternalLoad() CPPU_NOT_IMPLEMENTED
    
    void updateHistoryAfterClientRedirect() CPPU_NOT_IMPLEMENTED
    
    void setCopiesOnScroll() CPPU_NOT_IMPLEMENTED
        
    void detachedFromParent2() CPPU_NOT_IMPLEMENTED
    void detachedFromParent3() CPPU_NOT_IMPLEMENTED
    void detachedFromParent4() CPPU_NOT_IMPLEMENTED
    
    void download() CPPU_NOT_IMPLEMENTED
    
    void assignIdentifierToInitialRequest() CPPU_NOT_IMPLEMENTED
    void dispatchWillSendRequest() CPPU_NOT_IMPLEMENTED
    void dispatchDidReceiveAuthenticationChallenge() CPPU_NOT_IMPLEMENTED
    void dispatchDidCancelAuthenticationChallenge() CPPU_NOT_IMPLEMENTED
    void dispatchDidReceiveResponse() CPPU_NOT_IMPLEMENTED
    void dispatchDidReceiveContentLength() CPPU_NOT_IMPLEMENTED
    void dispatchDidFinishLoading() CPPU_NOT_IMPLEMENTED
    void dispatchDidFailLoading() CPPU_NOT_IMPLEMENTED
    void dispatchDidLoadResourceFromMemoryCache() CPPU_NOT_IMPLEMENTED
    
    void dispatchDidHandleOnloadEvents() CPPU_NOT_IMPLEMENTED
    void dispatchDidReceiveServerRedirectForProvisionalLoad() CPPU_NOT_IMPLEMENTED
    void dispatchDidCancelClientRedirect() CPPU_NOT_IMPLEMENTED
    void dispatchWillPerformClientRedirect() CPPU_NOT_IMPLEMENTED
    void dispatchDidChangeLocationWithinPage() CPPU_NOT_IMPLEMENTED
    void dispatchWillClose() CPPU_NOT_IMPLEMENTED
    void dispatchDidReceiveIcon() CPPU_NOT_IMPLEMENTED
    void dispatchDidStartProvisionalLoad() CPPU_NOT_IMPLEMENTED
    void dispatchDidReceiveTitle() CPPU_NOT_IMPLEMENTED
    void dispatchDidCommitLoad() CPPU_NOT_IMPLEMENTED
    void dispatchDidFailProvisionalLoad() CPPU_NOT_IMPLEMENTED
    void dispatchDidFailLoad() CPPU_NOT_IMPLEMENTED
    void dispatchDidFinishDocumentLoad() CPPU_NOT_IMPLEMENTED
    void dispatchDidFinishLoad() CPPU_NOT_IMPLEMENTED
    void dispatchDidFirstLayout() CPPU_NOT_IMPLEMENTED
    
    void dispatchCreatePage() CPPU_NOT_IMPLEMENTED
    void dispatchShow() CPPU_NOT_IMPLEMENTED
    
    void dispatchDecidePolicyForMIMEType() CPPU_NOT_IMPLEMENTED
    void dispatchDecidePolicyForNewWindowAction() CPPU_NOT_IMPLEMENTED
    void dispatchDecidePolicyForNavigationAction() CPPU_NOT_IMPLEMENTED
    void cancelPolicyCheck() CPPU_NOT_IMPLEMENTED
    
    void dispatchUnableToImplementPolicy() CPPU_NOT_IMPLEMENTED

    void dispatchWillSubmitForm() CPPU_NOT_IMPLEMENTED
    
    void dispatchDidLoadMainResource() CPPU_NOT_IMPLEMENTED
    void revertToProvisionalState() CPPU_NOT_IMPLEMENTED
    void setMainDocumentError() CPPU_NOT_IMPLEMENTED
    
    void willChangeEstimatedProgress() CPPU_NOT_IMPLEMENTED
    void didChangeEstimatedProgress() CPPU_NOT_IMPLEMENTED
    void postProgressStartedNotification() CPPU_NOT_IMPLEMENTED
    void postProgressEstimateChangedNotification() CPPU_NOT_IMPLEMENTED
    void postProgressFinishedNotification() CPPU_NOT_IMPLEMENTED
    
    void setMainFrameDocumentReady() CPPU_NOT_IMPLEMENTED
    
    void startDownload() CPPU_NOT_IMPLEMENTED
    
    void willChangeTitle() CPPU_NOT_IMPLEMENTED
    void didChangeTitle() CPPU_NOT_IMPLEMENTED
    
    void committedLoad() CPPU_NOT_IMPLEMENTED
    void finishedLoading() CPPU_NOT_IMPLEMENTED
    
    void cancelledError() CPPU_NOT_IMPLEMENTED
    void blockedError() CPPU_NOT_IMPLEMENTED
    void cannotShowURLError() CPPU_NOT_IMPLEMENTED
    void interruptForPolicyChangeError() CPPU_NOT_IMPLEMENTED
    
    void cannotShowMIMETypeError() CPPU_NOT_IMPLEMENTED
    void fileDoesNotExistError() CPPU_NOT_IMPLEMENTED
    
    void shouldFallBack() CPPU_NOT_IMPLEMENTED
        
    void canHandleRequest() CPPU_NOT_IMPLEMENTED
    void canShowMIMEType() CPPU_NOT_IMPLEMENTED
    void representationExistsForURLScheme() CPPU_NOT_IMPLEMENTED
    void generatedMIMETypeForURLScheme() CPPU_NOT_IMPLEMENTED
    
    void frameLoadCompleted() CPPU_NOT_IMPLEMENTED
    void restoreViewState() CPPU_NOT_IMPLEMENTED
    void provisionalLoadStarted() CPPU_NOT_IMPLEMENTED
    void shouldTreatURLAsSameAsCurrent() CPPU_NOT_IMPLEMENTED
    void addHistoryItemForFragmentScroll() CPPU_NOT_IMPLEMENTED
    void didFinishLoad() CPPU_NOT_IMPLEMENTED
    void prepareForDataSourceReplacement() CPPU_NOT_IMPLEMENTED
    
    void createDocumentLoader() CPPU_NOT_IMPLEMENTED
    void setTitle() CPPU_NOT_IMPLEMENTED
    
    void userAgent() CPPU_NOT_IMPLEMENTED

    void savePlatformDataToCachedPage() CPPU_NOT_IMPLEMENTED
    void transitionToCommittedFromCachedPage() CPPU_NOT_IMPLEMENTED
    void transitionToCommittedForNewPage() CPPU_NOT_IMPLEMENTED

    void updateGlobalHistory() CPPU_NOT_IMPLEMENTED
    void shouldGoToHistoryItem() CPPU_NOT_IMPLEMENTED
    void saveViewStateToItem() CPPU_NOT_IMPLEMENTED
    void canCachePage() CPPU_NOT_IMPLEMENTED

    void createFrame() CPPU_NOT_IMPLEMENTED
    void createPlugin() CPPU_NOT_IMPLEMENTED
    void createJavaAppletWidget() CPPU_NOT_IMPLEMENTED
    
    void objectContentType() CPPU_NOT_IMPLEMENTED
    void overrideMediaType() CPPU_NOT_IMPLEMENTED

    void redirectDataToPlugin() CPPU_NOT_IMPLEMENTED
    void windowObjectCleared() CPPU_NOT_IMPLEMENTED
    void didPerformFirstNavigation() CPPU_NOT_IMPLEMENTED

    void registerForIconNotification() CPPU_NOT_IMPLEMENTED
};

class SVGEmptyEditorClientTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SVGEmptyEditorClientTest );
    CPPUNIT_TEST(destruct_SVGEmptyEditorClient);
    CPPUNIT_TEST(pageDestroyed);
    
    CPPUNIT_TEST(shouldDeleteRange);
    CPPUNIT_TEST(shouldShowDeleteInterface);
    CPPUNIT_TEST(smartInsertDeleteEnabled);
    CPPUNIT_TEST(isContinuousSpellCheckingEnabled);
    CPPUNIT_TEST(toggleContinuousSpellChecking);
    CPPUNIT_TEST(isGrammarCheckingEnabled);
    CPPUNIT_TEST(toggleGrammarChecking);
    CPPUNIT_TEST(spellCheckerDocumentTag);
    
    CPPUNIT_TEST(selectWordBeforeMenuEvent);
    CPPUNIT_TEST(isEditable);
    
    CPPUNIT_TEST(shouldBeginEditing);
    CPPUNIT_TEST(shouldEndEditing);
    CPPUNIT_TEST(shouldInsertNode);
    CPPUNIT_TEST(shouldInsertText);
    CPPUNIT_TEST(shouldChangeSelectedRange);

    CPPUNIT_TEST(shouldApplyStyle);
    CPPUNIT_TEST(shouldMoveRangeAfterDelete);
    CPPUNIT_TEST(didBeginEditing);
    CPPUNIT_TEST(respondToChangedContents);
    CPPUNIT_TEST(respondToChangedSelection);
    CPPUNIT_TEST(didEndEditing);
    CPPUNIT_TEST(didWriteSelectionToPasteboard);
    CPPUNIT_TEST(didSetSelectionTypesForPasteboard);
    
    CPPUNIT_TEST(registerCommandForUndo);
    CPPUNIT_TEST(registerCommandForRedo);
    CPPUNIT_TEST(clearUndoRedoOperations);
    
    CPPUNIT_TEST(canUndo);
    CPPUNIT_TEST(canRedo);
    
    CPPUNIT_TEST(undo);
    CPPUNIT_TEST(redo);

    CPPUNIT_TEST(handleKeyboardEvent);
    CPPUNIT_TEST(handleInputMethodKeydown);

    CPPUNIT_TEST(textFieldDidBeginEditing);
    CPPUNIT_TEST(textFieldDidEndEditing);
    CPPUNIT_TEST(textDidChangeInTextField);
    CPPUNIT_TEST(doTextFieldCommandFromEvent);
    CPPUNIT_TEST(textWillBeDeletedInTextField);
    CPPUNIT_TEST(textDidChangeInTextArea);
    
    CPPUNIT_TEST(ignoreWordInSpellDocument);
    CPPUNIT_TEST(learnWord);
    CPPUNIT_TEST(checkSpellingOfString);
    CPPUNIT_TEST(checkGrammarOfString);
    CPPUNIT_TEST(updateSpellingUIWithGrammarString);
    CPPUNIT_TEST(updateSpellingUIWithMisspelledWord);
    CPPUNIT_TEST(showSpellingUI);
    CPPUNIT_TEST(spellingUIIsShowing);
    CPPUNIT_TEST(getGuessesForWord);
    CPPUNIT_TEST(setInputMethodState);
 
    CPPUNIT_TEST_SUITE_END();
    public:
    void destruct_SVGEmptyEditorClient() CPPU_NOT_IMPLEMENTED
    void pageDestroyed() CPPU_NOT_IMPLEMENTED
    
    void shouldDeleteRange() CPPU_NOT_IMPLEMENTED
    void shouldShowDeleteInterface() CPPU_NOT_IMPLEMENTED
    void smartInsertDeleteEnabled() CPPU_NOT_IMPLEMENTED
    void isContinuousSpellCheckingEnabled() CPPU_NOT_IMPLEMENTED
    void toggleContinuousSpellChecking() CPPU_NOT_IMPLEMENTED
    void isGrammarCheckingEnabled() CPPU_NOT_IMPLEMENTED
    void toggleGrammarChecking() CPPU_NOT_IMPLEMENTED
    void spellCheckerDocumentTag() CPPU_NOT_IMPLEMENTED
    
    void selectWordBeforeMenuEvent() CPPU_NOT_IMPLEMENTED
    void isEditable() CPPU_NOT_IMPLEMENTED
    
    void shouldBeginEditing() CPPU_NOT_IMPLEMENTED
    void shouldEndEditing() CPPU_NOT_IMPLEMENTED
    void shouldInsertNode() CPPU_NOT_IMPLEMENTED
    void shouldInsertText() CPPU_NOT_IMPLEMENTED
    void shouldChangeSelectedRange() CPPU_NOT_IMPLEMENTED

    void shouldApplyStyle() CPPU_NOT_IMPLEMENTED
    void shouldMoveRangeAfterDelete() CPPU_NOT_IMPLEMENTED
    void didBeginEditing() CPPU_NOT_IMPLEMENTED
    void respondToChangedContents() CPPU_NOT_IMPLEMENTED
    void respondToChangedSelection() CPPU_NOT_IMPLEMENTED
    void didEndEditing() CPPU_NOT_IMPLEMENTED
    void didWriteSelectionToPasteboard() CPPU_NOT_IMPLEMENTED
    void didSetSelectionTypesForPasteboard() CPPU_NOT_IMPLEMENTED
    
    void registerCommandForUndo() CPPU_NOT_IMPLEMENTED
    void registerCommandForRedo() CPPU_NOT_IMPLEMENTED
    void clearUndoRedoOperations() CPPU_NOT_IMPLEMENTED
    
    void canUndo() CPPU_NOT_IMPLEMENTED
    void canRedo() CPPU_NOT_IMPLEMENTED
    
    void undo() CPPU_NOT_IMPLEMENTED
    void redo() CPPU_NOT_IMPLEMENTED

    void handleKeyboardEvent() CPPU_NOT_IMPLEMENTED
    void handleInputMethodKeydown() CPPU_NOT_IMPLEMENTED

    void textFieldDidBeginEditing() CPPU_NOT_IMPLEMENTED
    void textFieldDidEndEditing() CPPU_NOT_IMPLEMENTED
    void textDidChangeInTextField() CPPU_NOT_IMPLEMENTED
    void doTextFieldCommandFromEvent() CPPU_NOT_IMPLEMENTED
    void textWillBeDeletedInTextField() CPPU_NOT_IMPLEMENTED
    void textDidChangeInTextArea() CPPU_NOT_IMPLEMENTED
    
    void ignoreWordInSpellDocument() CPPU_NOT_IMPLEMENTED
    void learnWord() CPPU_NOT_IMPLEMENTED
    void checkSpellingOfString() CPPU_NOT_IMPLEMENTED
    void checkGrammarOfString() CPPU_NOT_IMPLEMENTED
    void updateSpellingUIWithGrammarString() CPPU_NOT_IMPLEMENTED
    void updateSpellingUIWithMisspelledWord() CPPU_NOT_IMPLEMENTED
    void showSpellingUI() CPPU_NOT_IMPLEMENTED
    void spellingUIIsShowing() CPPU_NOT_IMPLEMENTED
    void getGuessesForWord() CPPU_NOT_IMPLEMENTED
    void setInputMethodState() CPPU_NOT_IMPLEMENTED
  
    
};


class SVGEmptyContextMenuClientTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( SVGEmptyContextMenuClientTest );
    CPPUNIT_TEST(destruct_SVGEmptyContextMenuClient);
    CPPUNIT_TEST(contextMenuDestroyed);
    
    CPPUNIT_TEST(getCustomMenuFromDefaultItems);
    CPPUNIT_TEST(contextMenuItemSelected);
    
    CPPUNIT_TEST(downloadURL);
    CPPUNIT_TEST(copyImageToClipboard);
    CPPUNIT_TEST(searchWithGoogle);
    CPPUNIT_TEST(lookUpInDictionary);
    CPPUNIT_TEST(speak);
    CPPUNIT_TEST(stopSpeaking);

            CPPUNIT_TEST_SUITE_END();
public:
    void destruct_SVGEmptyContextMenuClient() CPPU_NOT_IMPLEMENTED
    void contextMenuDestroyed() CPPU_NOT_IMPLEMENTED
    
    void getCustomMenuFromDefaultItems() CPPU_NOT_IMPLEMENTED
    void contextMenuItemSelected() CPPU_NOT_IMPLEMENTED
    
    void downloadURL() CPPU_NOT_IMPLEMENTED
    void copyImageToClipboard() CPPU_NOT_IMPLEMENTED
    void searchWithGoogle() CPPU_NOT_IMPLEMENTED
    void lookUpInDictionary() CPPU_NOT_IMPLEMENTED
    void speak() CPPU_NOT_IMPLEMENTED
    void stopSpeaking() CPPU_NOT_IMPLEMENTED

};

class SVGEmptyDragClientTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( SVGEmptyDragClientTest );
    CPPUNIT_TEST(destruct_SVGEmptyDragClient);
    CPPUNIT_TEST(willPerformDragDestinationAction);
    CPPUNIT_TEST(willPerformDragSourceAction);
    CPPUNIT_TEST(actionMaskForDrag);
    CPPUNIT_TEST(dragSourceActionMaskForPoint);
    CPPUNIT_TEST(startDrag);
    CPPUNIT_TEST(createDragImageForLink);
    CPPUNIT_TEST(dragControllerDestroyed);

            CPPUNIT_TEST_SUITE_END();
public:
    void destruct_SVGEmptyDragClient() CPPU_NOT_IMPLEMENTED
    void willPerformDragDestinationAction() CPPU_NOT_IMPLEMENTED
    void willPerformDragSourceAction() CPPU_NOT_IMPLEMENTED
    void actionMaskForDrag() CPPU_NOT_IMPLEMENTED
    void dragSourceActionMaskForPoint() CPPU_NOT_IMPLEMENTED
    void startDrag() CPPU_NOT_IMPLEMENTED
    void createDragImageForLink() CPPU_NOT_IMPLEMENTED
    void dragControllerDestroyed() CPPU_NOT_IMPLEMENTED

};


class SVGEmptyInspectorClientTest : public CppUnit::TestFixture
{
        CPPUNIT_TEST_SUITE( SVGEmptyInspectorClientTest );
    CPPUNIT_TEST(destruct_SVGEmptyInspectorClient);

    CPPUNIT_TEST(inspectorDestroyed);

    CPPUNIT_TEST(createPage);

    CPPUNIT_TEST(localizedStringsURL);

    CPPUNIT_TEST(showWindow);
    CPPUNIT_TEST(closeWindow);

    CPPUNIT_TEST(attachWindow);
    CPPUNIT_TEST(detachWindow);

    CPPUNIT_TEST(highlight);
    CPPUNIT_TEST(hideHighlight);
    CPPUNIT_TEST(inspectedURLChanged);

            CPPUNIT_TEST_SUITE_END();
public:
    void destruct_SVGEmptyInspectorClient() CPPU_NOT_IMPLEMENTED

    void inspectorDestroyed() CPPU_NOT_IMPLEMENTED

    void createPage() CPPU_NOT_IMPLEMENTED

    void localizedStringsURL() CPPU_NOT_IMPLEMENTED

    void showWindow() CPPU_NOT_IMPLEMENTED
    void closeWindow() CPPU_NOT_IMPLEMENTED

    void attachWindow() CPPU_NOT_IMPLEMENTED
    void detachWindow() CPPU_NOT_IMPLEMENTED

    void highlight() CPPU_NOT_IMPLEMENTED
    void hideHighlight() CPPU_NOT_IMPLEMENTED
    void inspectedURLChanged() CPPU_NOT_IMPLEMENTED

};

#endif // SVGImageEmptyClients_h

#endif // ENABLE(SVG)

