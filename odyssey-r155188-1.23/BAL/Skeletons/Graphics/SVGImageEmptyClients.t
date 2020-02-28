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
#ifndef SVGImageEmptyClients_h
#define SVGImageEmptyClients_h
/**
 *  @file  SVGImageEmptyClients.t
 *  SVGImageEmptyClients 
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:08 $
 */
#include "BALBase.h"

#if ENABLE(SVG)

#include "ChromeClient.h"
#include "ContextMenuClient.h"
#include "DragClient.h"
#include "EditCommand.h"
#include "EditorClient.h"
#include "FocusDirection.h"
#include "FrameLoaderClient.h"
#include "InspectorClient.h"
#include "SharedBuffer.h"

/*
 This file holds empty Client stubs for use by SVGImage.
 SVGImage needs to create a dummy Page->Frame->FrameView tree for use in parsing an SVGDocument.
 This tree depends heavily on Clients (usually provided by WebKit classes).
 
 SVGImage has no way to access the current Page (nor should it, since Images are not tied to a page).
 See http://bugs.webkit.org/show_bug.cgi?id=5971 for more discussion on this issue.
 
 Ideally, whenever you change a Client class, you should add a stub here.
 Brittle, yes.  Unfortunate, yes.  Hopefully temporary.
*/

namespace WKAL {

class SVGEmptyChromeClient : public WKALBase, public ChromeClient {
public:
    /**
     * SVGEmptyChromeClient destructor
     */
    virtual ~SVGEmptyChromeClient() ;
    /**
     * chromeDestroyed
     */
    virtual void chromeDestroyed() ;
    
    /**
     *  setWindowRect 
     */
    virtual void setWindowRect(const FloatRect&) ;
    /**
     *  windowRect 
     */
    virtual FloatRect windowRect() { return FloatRect(); }
    
    /**
     *  pageRect 
     */
    virtual FloatRect pageRect() { return FloatRect(); }
    
    /**
     *  scaleFactor 
     */
    virtual float scaleFactor() ;
    
    /**
     *  focus 
     */
    virtual void focus() ;
    /**
     *  unfocus 
     */
    virtual void unfocus() ;
    
    /**
     *  canTakeFocus 
     */
    virtual bool canTakeFocus(FocusDirection) ;
    /**
     *  takeFocus 
     */
    virtual void takeFocus(FocusDirection) ;
    
    /**
     *  createWindow 
     */
    virtual Page* createWindow(Frame*, const FrameLoadRequest&, const WindowFeatures&) ;
    /**
     *  show 
     */
    virtual void show() ;
    
    /**
     *  canRunModal 
     */
    virtual bool canRunModal() ;
    /**
     *  runModal 
     */
    virtual void runModal() ;
    
    /**
     *  setToolbarsVisible 
     */
    virtual void setToolbarsVisible(bool) ;
    /**
     *  toolbarsVisible 
     */
    virtual bool toolbarsVisible() ;
    
    /**
     *  setStatusbarVisible 
     */
    virtual void setStatusbarVisible(bool) ;
    /**
     *  statusbarVisible 
     */
    virtual bool statusbarVisible() ;
    
    /**
     *  setScrollbarsVisible 
     */
    virtual void setScrollbarsVisible(bool) ;
    /**
     *  scrollbarsVisible 
     */
    virtual bool scrollbarsVisible() ;
    
    /**
     *  setMenubarVisible 
     */
    virtual void setMenubarVisible(bool) ;
    /**
     *  menubarVisible 
     */
    virtual bool menubarVisible() ;
    
    /**
     *  setResizable 
     */
    virtual void setResizable(bool) ;
    
    /**
     *  addMessageToConsole 
     */
    virtual void addMessageToConsole(const String& message, unsigned int lineNumber, const String& sourceID) ;
    
    /**
     *  canRunBeforeUnloadConfirmPanel 
     */
    virtual bool canRunBeforeUnloadConfirmPanel() ;
    /**
     *  runBeforeUnloadConfirmPanel 
     */
    virtual bool runBeforeUnloadConfirmPanel(const String& message, Frame* frame) ;
    
    /**
     *  closeWindowSoon 
     */
    virtual void closeWindowSoon() ;
    
    /**
     *  runJavaScriptAlert 
     */
    virtual void runJavaScriptAlert(Frame*, const String&) ;
    /**
     *  runJavaScriptConfirm 
     */
    virtual bool runJavaScriptConfirm(Frame*, const String&) ;
    /**
     *  runJavaScriptPrompt 
     */
    virtual bool runJavaScriptPrompt(Frame*, const String& message, const String& defaultValue, String& result) ;
    /**
     *  shouldInterruptJavaScript 
     */
    virtual bool shouldInterruptJavaScript() ;
    
    /**
     *  setStatusbarText 
     */
    virtual void setStatusbarText(const String&) ;
    
    /**
     *  tabsToLinks 
     */
    virtual bool tabsToLinks() const ;
    
    /**
     *  windowResizerRect 
     */
    virtual IntRect windowResizerRect() const ;
    /**
     *  addToDirtyRegion 
     */
    virtual void addToDirtyRegion(const IntRect&) ;
    /**
     *  scrollBackingStore 
     */
    virtual void scrollBackingStore(int dx, int dy, const IntRect& scrollViewRect, const IntRect& clipRect) ;
    /**
     *  updateBackingStore 
     */
    virtual void updateBackingStore() ;

    /**
     *  mouseDidMoveOverElement 
     */
    virtual void mouseDidMoveOverElement(const HitTestResult&, unsigned modifierFlags) ;
    
    /**
     *  setToolTip 
     */
    virtual void setToolTip(const String&) ;

    /**
     *  print 
     */
    virtual void print(Frame*) ;

    /**
     *  exceededDatabaseQuota 
     */
    virtual void exceededDatabaseQuota(Frame*, const String&) ;
};

class SVGEmptyFrameLoaderClient : public WKALBase, public FrameLoaderClient {
public:
    /**
     *  ~SVGEmptyFrameLoaderClient 
     */
    virtual ~SVGEmptyFrameLoaderClient() ;
    /**
     *  frameLoaderDestroyed 
     */
    virtual void frameLoaderDestroyed() ;
    
    /**
     *  hasWebView 
     */
    virtual bool hasWebView() const ;
    /**
     *  hasFrameView 
     */
    virtual bool hasFrameView() const ;
    
    /**
     *  makeRepresentation 
     */
    virtual void makeRepresentation(DocumentLoader*) ;
    /**
     *  forceLayout 
     */
    virtual void forceLayout() ;
    /**
     *  forceLayoutForNonHTML 
     */
    virtual void forceLayoutForNonHTML() ;
    
    /**
     *  updateHistoryForCommit 
     */
    virtual void updateHistoryForCommit() ;
    
    /**
     *  updateHistoryForBackForwardNavigation 
     */
    virtual void updateHistoryForBackForwardNavigation() ;
    /**
     *  updateHistoryForReload 
     */
    virtual void updateHistoryForReload() ;
    /**
     *  updateHistoryForStandardLoad 
     */
    virtual void updateHistoryForStandardLoad() ;
    /**
     *  updateHistoryForInternalLoad 
     */
    virtual void updateHistoryForInternalLoad() ;
    
    /**
     *  updateHistoryAfterClientRedirect 
     */
    virtual void updateHistoryAfterClientRedirect() ;
    
    /**
     *  setCopiesOnScroll 
     */
    virtual void setCopiesOnScroll() ;
        
    /**
     *  detachedFromParent2 
     */
    virtual void detachedFromParent2() ;
    /**
     *  detachedFromParent3 
     */
    virtual void detachedFromParent3() ;
    /**
     *  detachedFromParent4 
     */
    virtual void detachedFromParent4() ;
    
    /**
     *  download 
     */
    virtual void download(ResourceHandle*, const ResourceRequest&, const ResourceRequest&, const ResourceResponse&) ;
    
    /**
     *  assignIdentifierToInitialRequest 
     */
    virtual void assignIdentifierToInitialRequest(unsigned long identifier, DocumentLoader*, const ResourceRequest&) ;
    /**
     *  dispatchWillSendRequest 
     */
    virtual void dispatchWillSendRequest(DocumentLoader*, unsigned long identifier, ResourceRequest&, const ResourceResponse& redirectResponse) ;
    /**
     *  dispatchDidReceiveAuthenticationChallenge 
     */
    virtual void dispatchDidReceiveAuthenticationChallenge(DocumentLoader*, unsigned long identifier, const AuthenticationChallenge&) ;
    /**
     *  dispatchDidCancelAuthenticationChallenge 
     */
    virtual void dispatchDidCancelAuthenticationChallenge(DocumentLoader*, unsigned long identifier, const AuthenticationChallenge&) ;
    /**
     *  dispatchDidReceiveResponse 
     */
    virtual void dispatchDidReceiveResponse(DocumentLoader*, unsigned long identifier, const ResourceResponse&) ;
    /**
     *  dispatchDidReceiveContentLength 
     */
    virtual void dispatchDidReceiveContentLength(DocumentLoader*, unsigned long identifier, int lengthReceived) ;
    /**
     *  dispatchDidFinishLoading 
     */
    virtual void dispatchDidFinishLoading(DocumentLoader*, unsigned long identifier) ;
    /**
     *  dispatchDidFailLoading 
     */
    virtual void dispatchDidFailLoading(DocumentLoader*, unsigned long identifier, const ResourceError&) ;
    /**
     *  dispatchDidLoadResourceFromMemoryCache 
     */
    virtual bool dispatchDidLoadResourceFromMemoryCache(DocumentLoader*, const ResourceRequest&, const ResourceResponse&, int length) ;
    
    /**
     *  dispatchDidHandleOnloadEvents 
     */
    virtual void dispatchDidHandleOnloadEvents() ;
    /**
     *  dispatchDidReceiveServerRedirectForProvisionalLoad 
     */
    virtual void dispatchDidReceiveServerRedirectForProvisionalLoad() ;
    /**
     *  dispatchDidCancelClientRedirect 
     */
    virtual void dispatchDidCancelClientRedirect() ;
    /**
     *  dispatchWillPerformClientRedirect 
     */
    virtual void dispatchWillPerformClientRedirect(const KURL&, double interval, double fireDate) ;
    /**
     *  dispatchDidChangeLocationWithinPage 
     */
    virtual void dispatchDidChangeLocationWithinPage() ;
    /**
     *  dispatchWillClose 
     */
    virtual void dispatchWillClose() ;
    /**
     *  dispatchDidReceiveIcon 
     */
    virtual void dispatchDidReceiveIcon() ;
    /**
     *  dispatchDidStartProvisionalLoad 
     */
    virtual void dispatchDidStartProvisionalLoad() ;
    /**
     *  dispatchDidReceiveTitle 
     */
    virtual void dispatchDidReceiveTitle(const String& title) ;
    /**
     *  dispatchDidCommitLoad 
     */
    virtual void dispatchDidCommitLoad() ;
    /**
     *  dispatchDidFailProvisionalLoad 
     */
    virtual void dispatchDidFailProvisionalLoad(const ResourceError&) ;
    /**
     *  dispatchDidFailLoad 
     */
    virtual void dispatchDidFailLoad(const ResourceError&) ;
    /**
     *  dispatchDidFinishDocumentLoad 
     */
    virtual void dispatchDidFinishDocumentLoad() ;
    /**
     *  dispatchDidFinishLoad 
     */
    virtual void dispatchDidFinishLoad() ;
    /**
     *  dispatchDidFirstLayout 
     */
    virtual void dispatchDidFirstLayout() ;
    
    /**
     *  dispatchCreatePage 
     */
    virtual Frame* dispatchCreatePage() ;
    /**
     *  dispatchShow 
     */
    virtual void dispatchShow() ;
    
    /**
     *  dispatchDecidePolicyForMIMEType 
     */
    virtual void dispatchDecidePolicyForMIMEType(FramePolicyFunction, const String& MIMEType, const ResourceRequest&) ;
    /**
     *  dispatchDecidePolicyForNewWindowAction 
     */
    virtual void dispatchDecidePolicyForNewWindowAction(FramePolicyFunction, const NavigationAction&, const ResourceRequest&, PassRefPtr<FormState>, const String& frameName) ;
    /**
     *  dispatchDecidePolicyForNavigationAction 
     */
    virtual void dispatchDecidePolicyForNavigationAction(FramePolicyFunction, const NavigationAction&, const ResourceRequest&, PassRefPtr<FormState>) ;
    /**
     *  cancelPolicyCheck 
     */
    virtual void cancelPolicyCheck() ;
    
    /**
     *  dispatchUnableToImplementPolicy 
     */
    virtual void dispatchUnableToImplementPolicy(const ResourceError&) ;

    /**
     *  dispatchWillSubmitForm 
     */
    virtual void dispatchWillSubmitForm(FramePolicyFunction, PassRefPtr<FormState>) ;
    
    /**
     *  dispatchDidLoadMainResource 
     */
    virtual void dispatchDidLoadMainResource(DocumentLoader*) ;
    /**
     *  revertToProvisionalState 
     */
    virtual void revertToProvisionalState(DocumentLoader*) ;
    /**
     *  setMainDocumentError 
     */
    virtual void setMainDocumentError(DocumentLoader*, const ResourceError&) ;
    
    /**
     *  willChangeEstimatedProgress 
     */
    virtual void willChangeEstimatedProgress() ;
    /**
     *  didChangeEstimatedProgress 
     */
    virtual void didChangeEstimatedProgress() ;
    /**
     *  postProgressStartedNotification 
     */
    virtual void postProgressStartedNotification() ;
    /**
     *  postProgressEstimateChangedNotification 
     */
    virtual void postProgressEstimateChangedNotification() ;
    /**
     *  postProgressFinishedNotification 
     */
    virtual void postProgressFinishedNotification() ;
    
    /**
     *  setMainFrameDocumentReady 
     */
    virtual void setMainFrameDocumentReady(bool) ;
    
    /**
     *  startDownload 
     */
    virtual void startDownload(const ResourceRequest&) ;
    
    /**
     *  willChangeTitle 
     */
    virtual void willChangeTitle(DocumentLoader*) ;
    /**
     *  didChangeTitle 
     */
    virtual void didChangeTitle(DocumentLoader*) ;
    
    /**
     *  committedLoad 
     */
    virtual void committedLoad(DocumentLoader*, const char*, int) ;
    /**
     *  finishedLoading 
     */
    virtual void finishedLoading(DocumentLoader*) ;
    
    /**
     *  cancelledError 
     */
    virtual ResourceError cancelledError(const ResourceRequest&) ;
    /**
     *  blockedError 
     */
    virtual ResourceError blockedError(const ResourceRequest&) ;
    /**
     *  cannotShowURLError 
     */
    virtual ResourceError cannotShowURLError(const ResourceRequest&) ;
    /**
     *  interruptForPolicyChangeError 
     */
    virtual ResourceError interruptForPolicyChangeError(const ResourceRequest&) ;
    
    /**
     *  cannotShowMIMETypeError 
     */
    virtual ResourceError cannotShowMIMETypeError(const ResourceResponse&) ;
    /**
     *  fileDoesNotExistError 
     */
    virtual ResourceError fileDoesNotExistError(const ResourceResponse&) ;
    
    /**
     *  shouldFallBack 
     */
    virtual bool shouldFallBack(const ResourceError&) ;
        
    /**
     *  canHandleRequest 
     */
    virtual bool canHandleRequest(const ResourceRequest&) const ;
    /**
     *  canShowMIMEType 
     */
    virtual bool canShowMIMEType(const String& MIMEType) const ;
    /**
     *  representationExistsForURLScheme 
     */
    virtual bool representationExistsForURLScheme(const String& URLScheme) const ;
    /**
     *  generatedMIMETypeForURLScheme 
     */
    virtual String generatedMIMETypeForURLScheme(const String& URLScheme) const ;
    
    /**
     *  frameLoadCompleted 
     */
    virtual void frameLoadCompleted() ;
    /**
     *  restoreViewState 
     */
    virtual void restoreViewState() ;
    /**
     *  provisionalLoadStarted 
     */
    virtual void provisionalLoadStarted() ;
    /**
     *  shouldTreatURLAsSameAsCurrent 
     */
    virtual bool shouldTreatURLAsSameAsCurrent(const KURL&) const ;
    /**
     *  addHistoryItemForFragmentScroll 
     */
    virtual void addHistoryItemForFragmentScroll() ;
    /**
     *  didFinishLoad 
     */
    virtual void didFinishLoad() ;
    /**
     *  prepareForDataSourceReplacement 
     */
    virtual void prepareForDataSourceReplacement() ;
    
    /**
     *  createDocumentLoader 
     */
    virtual PassRefPtr<DocumentLoader> createDocumentLoader(const ResourceRequest& request, const SubstituteData& substituteData) ;
    /**
     *  setTitle 
     */
    virtual void setTitle(const String& title, const KURL&) ;
    
    /**
     *  userAgent 
     */
    virtual String userAgent(const KURL&) ;

    /**
     *  savePlatformDataToCachedPage 
     */
    virtual void savePlatformDataToCachedPage(CachedPage*) ;
    /**
     *  transitionToCommittedFromCachedPage 
     */
    virtual void transitionToCommittedFromCachedPage(CachedPage*) ;
    /**
     *  transitionToCommittedForNewPage 
     */
    virtual void transitionToCommittedForNewPage() ;

    /**
     *  updateGlobalHistory 
     */
    virtual void updateGlobalHistory(const KURL&) ;
    /**
     *  shouldGoToHistoryItem 
     */
    virtual bool shouldGoToHistoryItem(HistoryItem*) const ;
    /**
     *  saveViewStateToItem 
     */
    virtual void saveViewStateToItem(HistoryItem*) ;
    /**
     *  canCachePage 
     */
    virtual bool canCachePage() const ;

    /**
     *  createFrame 
     */
    virtual PassRefPtr<Frame> createFrame(const KURL& url, const String& name, HTMLFrameOwnerElement* ownerElement,
                               const String& referrer, bool allowsScrolling, int marginWidth, int marginHeight) ;
    /**
     *  createPlugin 
     */
    virtual Widget* createPlugin(const IntSize&,Element*, const KURL&, const Vector<String>&, const Vector<String>&, const String&, bool) ;
    /**
     *  createJavaAppletWidget 
     */
    virtual Widget* createJavaAppletWidget(const IntSize&, Element*, const KURL&, const Vector<String>&, const Vector<String>&) ;
    
    /**
     *  objectContentType 
     */
    virtual ObjectContentType objectContentType(const KURL& url, const String& mimeType) ;
    /**
     *  overrideMediaType 
     */
    virtual String overrideMediaType() const ;

    /**
     *  redirectDataToPlugin 
     */
    virtual void redirectDataToPlugin(Widget*) ;
    /**
     *  windowObjectCleared 
     */
    virtual void windowObjectCleared() ;
    /**
     *  didPerformFirstNavigation 
     */
    virtual void didPerformFirstNavigation() const ;

    /**
     *  registerForIconNotification 
     */
    virtual void registerForIconNotification(bool listen) ;


};

class SVGEmptyEditorClient : public WKALBase, public EditorClient {
public:
    /**
     *  ~SVGEmptyEditorClient 
     */
    virtual ~SVGEmptyEditorClient() ;
    /**
     *  pageDestroyed 
     */
    virtual void pageDestroyed() ;
    
    /**
     *  shouldDeleteRange 
     */
    virtual bool shouldDeleteRange(Range*) ;
    /**
     *  shouldShowDeleteInterface 
     */
    virtual bool shouldShowDeleteInterface(HTMLElement*) ;
    /**
     *  smartInsertDeleteEnabled 
     */
    virtual bool smartInsertDeleteEnabled() ;
    /**
     *  isContinuousSpellCheckingEnabled 
     */
    virtual bool isContinuousSpellCheckingEnabled() ;
    /**
     *  toggleContinuousSpellChecking 
     */
    virtual void toggleContinuousSpellChecking() ;
    /**
     *  isGrammarCheckingEnabled 
     */
    virtual bool isGrammarCheckingEnabled() ;
    /**
     *  toggleGrammarChecking 
     */
    virtual void toggleGrammarChecking() ;
    /**
     *  spellCheckerDocumentTag 
     */
    virtual int spellCheckerDocumentTag() ;
    
    /**
     *  selectWordBeforeMenuEvent 
     */
    virtual bool selectWordBeforeMenuEvent() ;
    /**
     *  isEditable 
     */
    virtual bool isEditable() ;
    
    /**
     *  shouldBeginEditing 
     */
    virtual bool shouldBeginEditing(Range*) ;
    /**
     *  shouldEndEditing 
     */
    virtual bool shouldEndEditing(Range*) ;
    /**
     *  shouldInsertNode 
     */
    virtual bool shouldInsertNode(Node*, Range*, EditorInsertAction) ;
    /**
     *  shouldInsertText 
     */
    virtual bool shouldInsertText(const String&, Range*, EditorInsertAction) ;
    /**
     *  shouldChangeSelectedRange 
     */
    virtual bool shouldChangeSelectedRange(Range* fromRange, Range* toRange, EAffinity, bool stillSelecting) ;

    /**
     *  shouldApplyStyle 
     */
    virtual bool shouldApplyStyle(CSSStyleDeclaration*, Range*) ;
    /**
     *  shouldMoveRangeAfterDelete 
     */
    virtual bool shouldMoveRangeAfterDelete(Range*, Range*) ;
    //  virtual bool shouldChangeTypingStyle(CSSStyleDeclaration* fromStyle, CSSStyleDeclaration* toStyle) { return false; }
    //  virtual bool doCommandBySelector(SEL selector) { return false; }
    //
    /**
     *  didBeginEditing 
     */
    virtual void didBeginEditing() ;
    /**
     *  respondToChangedContents 
     */
    virtual void respondToChangedContents() ;
    /**
     *  respondToChangedSelection 
     */
    virtual void respondToChangedSelection() ;
    /**
     *  didEndEditing 
     */
    virtual void didEndEditing() ;
    /**
     *  didWriteSelectionToPasteboard 
     */
    virtual void didWriteSelectionToPasteboard() ;
    /**
     *  didSetSelectionTypesForPasteboard 
     */
    virtual void didSetSelectionTypesForPasteboard() ;
    
    /**
     *  registerCommandForUndo 
     */
    virtual void registerCommandForUndo(PassRefPtr<EditCommand>) ;
    /**
     *  registerCommandForRedo 
     */
    virtual void registerCommandForRedo(PassRefPtr<EditCommand>) ;
    /**
     *  clearUndoRedoOperations 
     */
    virtual void clearUndoRedoOperations() ;
    
    /**
     *  canUndo 
     */
    virtual bool canUndo() const ;
    /**
     *  canRedo 
     */
    virtual bool canRedo() const ;
    
    /**
     *  undo 
     */
    virtual void undo() ;
    /**
     *  redo 
     */
    virtual void redo() ;

    /**
     *  handleKeyboardEvent 
     */
    virtual void handleKeyboardEvent(KeyboardEvent*) ;
    /**
     *  handleInputMethodKeydown 
     */
    virtual void handleInputMethodKeydown(KeyboardEvent*) ;

    /**
     *  textFieldDidBeginEditing 
     */
    virtual void textFieldDidBeginEditing(Element*) ;
    /**
     *  textFieldDidEndEditing 
     */
    virtual void textFieldDidEndEditing(Element*) ;
    /**
     *  textDidChangeInTextField 
     */
    virtual void textDidChangeInTextField(Element*) ;
    /**
     *  doTextFieldCommandFromEvent 
     */
    virtual bool doTextFieldCommandFromEvent(Element*, KeyboardEvent*) ;
    /**
     *  textWillBeDeletedInTextField 
     */
    virtual void textWillBeDeletedInTextField(Element*) ;
    /**
     *  textDidChangeInTextArea 
     */
    virtual void textDidChangeInTextArea(Element*) ;
    
    /**
     *  ignoreWordInSpellDocument 
     */
    virtual void ignoreWordInSpellDocument(const String&) ;
    /**
     *  learnWord 
     */
    virtual void learnWord(const String&) ;
    /**
     *  checkSpellingOfString 
     */
    virtual void checkSpellingOfString(const UChar*, int length, int* misspellingLocation, int* misspellingLength) ;
    /**
     *  checkGrammarOfString 
     */
    virtual void checkGrammarOfString(const UChar*, int length, Vector<GrammarDetail>&, int* badGrammarLocation, int* badGrammarLength) ;
    /**
     *  updateSpellingUIWithGrammarString 
     */
    virtual void updateSpellingUIWithGrammarString(const String&, const GrammarDetail&) ;
    /**
     *  updateSpellingUIWithMisspelledWord 
     */
    virtual void updateSpellingUIWithMisspelledWord(const String&) ;
    /**
     *  showSpellingUI 
     */
    virtual void showSpellingUI(bool show) ;
    /**
     *  spellingUIIsShowing 
     */
    virtual bool spellingUIIsShowing() ;
    /**
     *  getGuessesForWord 
     */
    virtual void getGuessesForWord(const String&, Vector<String>& guesses) ;
    /**
     *  setInputMethodState 
     */
    virtual void setInputMethodState(bool enabled) ;
  
    
};

class SVGEmptyContextMenuClient : public WKALBase, public ContextMenuClient {
public:
    /**
     *  ~SVGEmptyContextMenuClient 
     */
    virtual ~SVGEmptyContextMenuClient() ;
    /**
     *  contextMenuDestroyed 
     */
    virtual void contextMenuDestroyed() ;
    
    /**
     *  getCustomMenuFromDefaultItems 
     */
    virtual PlatformMenuDescription getCustomMenuFromDefaultItems(ContextMenu*) ;
    /**
     *  contextMenuItemSelected 
     */
    virtual void contextMenuItemSelected(ContextMenuItem*, const ContextMenu*) ;
    
    /**
     *  downloadURL 
     */
    virtual void downloadURL(const KURL& url) ;
    /**
     *  copyImageToClipboard 
     */
    virtual void copyImageToClipboard(const HitTestResult&) ;
    /**
     *  searchWithGoogle 
     */
    virtual void searchWithGoogle(const Frame*) ;
    /**
     *  lookUpInDictionary 
     */
    virtual void lookUpInDictionary(Frame*) ;
    /**
     *  speak 
     */
    virtual void speak(const String&) ;
    /**
     *  stopSpeaking 
     */
    virtual void stopSpeaking() ;

};

class SVGEmptyDragClient : public WKALBase, public DragClient {
public:
    /**
     *  ~SVGEmptyDragClient 
     */
    virtual ~SVGEmptyDragClient() ;
    /**
     *  willPerformDragDestinationAction 
     */
    virtual void willPerformDragDestinationAction(DragDestinationAction, DragData*) ;
    /**
     *  willPerformDragSourceAction 
     */
    virtual void willPerformDragSourceAction(DragSourceAction, const IntPoint&, Clipboard*) ;
    /**
     *  actionMaskForDrag 
     */
    virtual DragDestinationAction actionMaskForDrag(DragData*) ;
    /**
     *  dragSourceActionMaskForPoint 
     */
    virtual DragSourceAction dragSourceActionMaskForPoint(const IntPoint&) ;
    /**
     *  startDrag 
     */
    virtual void startDrag(DragImageRef, const IntPoint&, const IntPoint&, Clipboard*, Frame*, bool) ;
    /**
     *  createDragImageForLink 
     */
    virtual DragImageRef createDragImageForLink(KURL&, const String& label, Frame*) ;
    /**
     *  dragControllerDestroyed 
     */
    virtual void dragControllerDestroyed() ;
};

class SVGEmptyInspectorClient : public WKALBase, public InspectorClient {
public:
    /**
     *  ~SVGEmptyInspectorClient 
     */
    virtual ~SVGEmptyInspectorClient() ;

    /**
     *  inspectorDestroyed 
     */
    virtual void inspectorDestroyed() ;

    /**
     *  createPage 
     */
    virtual Page* createPage() ;

    /**
     *  localizedStringsURL 
     */
    virtual String localizedStringsURL() ;

    /**
     *  showWindow 
     */
    virtual void showWindow() ;
    /**
     *  closeWindow 
     */
    virtual void closeWindow() ;

    /**
     *  attachWindow 
     */
    virtual void attachWindow() ;
    /**
     *  detachWindow 
     */
    virtual void detachWindow() ;

    /**
     *  highlight 
     */
    virtual void highlight(Node*) ;
    /**
     *  hideHighlight 
     */
    virtual void hideHighlight() ;
    /**
     *  inspectedURLChanged 
     */
    virtual void inspectedURLChanged(const String& newURL) ;
};
    
}

#endif // ENABLE(SVG)

#endif // SVGImageEmptyClients_h





