create_lut_webcore(WEBCORE_SRC Source/WebCore/bindings/js/JSDOMBinding.cpp generated_sources/WebCore/JSDOMBinding.lut.h Source/WebCore/bindings/js/JSDOMBinding.cpp)
create_lut_webcore(WEBCORE_SRC Source/WebCore/bindings/js/JSDOMWindowBase.cpp generated_sources/WebCore/JSDOMWindowBase.lut.h Source/WebCore/bindings/js/JSDOMWindowBase.cpp)
create_lut_webcore(WEBCORE_SRC Source/WebCore/bindings/js/JSEventListener.cpp generated_sources/WebCore/JSEventListener.lut.h Source/WebCore/bindings/js/JSEventListener.cpp)
create_lut_webcore(WEBCORE_SRC Source/WebCore/bindings/js/JSImageConstructor.cpp generated_sources/WebCore/JSImageConstructor.lut.h Source/WebCore/bindings/js/JSImageConstructor.cpp)
create_lut_webcore(WEBCORE_SRC Source/WebCore/bindings/js/JSPluginElementFunctions.cpp generated_sources/WebCore/JSPluginElementFunctions.lut.h Source/WebCore/bindings/js/JSPluginElementFunctions.cpp)

if(ENABLE_WORKERS)
    create_lut_webcore(WEBCORE_SRC Source/WebCore/bindings/js/JSWorkerContextBase.cpp generated_sources/WebCore/JSWorkerContextBase.lut.h Source/WebCore/bindings/js/JSWorkerContextBase.cpp)
endif(ENABLE_WORKERS)

list(APPEND WEBCORE_SRC
    bindings/ScriptControllerBase.cpp
    bindings/js/ArrayValue.cpp
    bindings/js/BindingState.cpp
    bindings/js/CallbackFunction.cpp
    bindings/js/DOMWrapperWorld.cpp
    bindings/js/DOMObjectHashTableMap.cpp
    bindings/js/Dictionary.cpp
    bindings/js/GCController.cpp     
    bindings/js/JSAudioBufferCustom.cpp 
    bindings/js/JSAttrCustom.cpp
    bindings/js/JSBlobCustom.cpp
    bindings/js/JSCDATASectionCustom.cpp
    bindings/js/JSCSSFontFaceRuleCustom.cpp
    bindings/js/JSCSSImportRuleCustom.cpp
    bindings/js/JSCSSMediaRuleCustom.cpp
    bindings/js/JSCSSPageRuleCustom.cpp
    bindings/js/JSCSSRuleCustom.cpp
    bindings/js/JSCSSRuleListCustom.cpp
    bindings/js/JSCSSStyleDeclarationCustom.cpp
    bindings/js/JSCSSStyleRuleCustom.cpp
    bindings/js/JSCSSValueCustom.cpp         
    bindings/js/JSCryptoCustom.cpp
    bindings/js/JSCallbackData.cpp
    bindings/js/JSCanvasRenderingContextCustom.cpp
    bindings/js/JSCanvasRenderingContext2DCustom.cpp
    bindings/js/JSClipboardCustom.cpp
    bindings/js/JSCustomXPathNSResolver.cpp
    bindings/js/JSDictionary.cpp
    bindings/js/JSDOMBinding.cpp
    bindings/js/JSDOMFormDataCustom.cpp
    bindings/js/JSDOMGlobalObject.cpp
    bindings/js/JSDOMGlobalObjectTask.cpp
    bindings/js/JSDOMImplementationCustom.cpp   
    bindings/js/JSDOMMimeTypeArrayCustom.cpp
    bindings/js/JSDOMPluginArrayCustom.cpp
    bindings/js/JSDOMPluginCustom.cpp
    bindings/js/JSDOMStringListCustom.cpp
    bindings/js/JSDOMStringMapCustom.cpp
    bindings/js/JSDOMWindowBase.cpp
    bindings/js/JSDOMWindowCustom.cpp
    bindings/js/JSDOMWindowShell.cpp
    bindings/js/JSDOMWrapper.cpp
    bindings/js/JSDedicatedWorkerGlobalScopeCustom.cpp
    bindings/js/JSDeviceMotionEventCustom.cpp
    bindings/js/JSDeviceOrientationEventCustom.cpp
    bindings/js/JSDocumentCustom.cpp          
    bindings/js/JSElementCustom.cpp
    bindings/js/JSErrorHandler.cpp
    bindings/js/JSEventCustom.cpp
    bindings/js/JSEventListener.cpp
    bindings/js/JSEventTargetCustom.cpp 
    bindings/js/JSExceptionBase.cpp
    bindings/js/JSHTMLAllCollectionCustom.cpp
    bindings/js/JSHTMLAppletElementCustom.cpp
    bindings/js/JSHTMLCanvasElementCustom.cpp
    bindings/js/JSHTMLCollectionCustom.cpp
    bindings/js/JSHTMLDocumentCustom.cpp
    bindings/js/JSHTMLElementCustom.cpp
    bindings/js/JSHTMLEmbedElementCustom.cpp
    bindings/js/JSHTMLFormControlsCollectionCustom.cpp
    bindings/js/JSHTMLFormElementCustom.cpp
    bindings/js/JSHTMLFrameElementCustom.cpp
    bindings/js/JSHTMLFrameSetElementCustom.cpp
    bindings/js/JSHTMLInputElementCustom.cpp
    bindings/js/JSHTMLLinkElementCustom.cpp 
    bindings/js/JSHTMLMediaElementCustom.cpp
    bindings/js/JSHTMLObjectElementCustom.cpp
    bindings/js/JSHTMLOptionsCollectionCustom.cpp
    bindings/js/JSHTMLSelectElementCustom.cpp
    bindings/js/JSHTMLStyleElementCustom.cpp  
    bindings/js/JSHTMLTemplateElementCustom.cpp
    bindings/js/JSHistoryCustom.cpp       
    bindings/js/JSImageConstructor.cpp
    bindings/js/JSImageDataCustom.cpp
    bindings/js/JSInjectedScriptHostCustom.cpp
    bindings/js/JSInjectedScriptManager.cpp
    bindings/js/JSInspectorFrontendHostCustom.cpp
    bindings/js/JSLazyEventListener.cpp
    bindings/js/JSLocationCustom.cpp
    bindings/js/JSMainThreadExecState.cpp
    bindings/js/JSMediaListCustom.cpp
    bindings/js/JSMessageChannelCustom.cpp
    bindings/js/JSMessageEventCustom.cpp
    bindings/js/JSMessagePortCustom.cpp
    bindings/js/JSMutationCallback.cpp
    bindings/js/JSMutationObserverCustom.cpp
    bindings/js/JSNamedNodeMapCustom.cpp
    bindings/js/JSNodeCustom.cpp
    bindings/js/JSNodeFilterCondition.cpp
    bindings/js/JSNodeFilterCustom.cpp
    bindings/js/JSNodeIteratorCustom.cpp
    bindings/js/JSNodeListCustom.cpp
    bindings/js/JSPluginElementFunctions.cpp
    bindings/js/JSPopStateEventCustom.cpp
    bindings/js/JSProcessingInstructionCustom.cpp      
    bindings/js/JSStyleSheetCustom.cpp
    bindings/js/JSStyleSheetListCustom.cpp
    bindings/js/JSTextCustom.cpp
    bindings/js/JSTreeWalkerCustom.cpp
    bindings/js/JSWebKitCSSKeyframeRuleCustom.cpp      
    bindings/js/JSWebKitCSSKeyframesRuleCustom.cpp           
    bindings/js/JSStorageCustom.cpp
    bindings/js/JSWebKitPointCustom.cpp       
    bindings/js/JSXMLHttpRequestCustom.cpp
    bindings/js/JSXMLHttpRequestUploadCustom.cpp
    bindings/js/JSXPathResultCustom.cpp
    bindings/js/PageScriptDebugServer.cpp
    bindings/js/JavaScriptCallFrame.cpp      
    bindings/js/ScheduledAction.cpp
    bindings/js/ScriptCachedFrameData.cpp
    bindings/js/ScriptCallStackFactory.cpp 
    bindings/js/ScriptController.cpp
    bindings/js/ScriptDebugServer.cpp
    bindings/js/ScriptEventListener.cpp
    bindings/js/ScriptFunctionCall.cpp
    bindings/js/ScriptGCEvent.cpp
    bindings/js/ScriptObject.cpp
    bindings/js/ScriptProfile.cpp
    bindings/js/ScriptProfiler.cpp
    bindings/js/ScriptState.cpp
    bindings/js/ScriptValue.cpp
    bindings/js/SerializedScriptValue.cpp
    bindings/js/WebCoreTypedArrayController.cpp
)

if(ENABLE_SQL_DATABASE)
    list(APPEND WEBCORE_SRC
        bindings/js/JSCustomSQLStatementErrorCallback.cpp
        bindings/js/JSSQLResultSetRowListCustom.cpp
        bindings/js/JSSQLTransactionCustom.cpp
        bindings/js/JSSQLTransactionSyncCustom.cpp
    )
endif(ENABLE_SQL_DATABASE)

if(ENABLE_INDEXED_DATABASE)
    list(APPEND WEBCORE_SRC
        bindings/js/JSIDBAnyCustom.cpp    
	bindings/js/JSIDBDatabaseCustom.cpp
        bindings/js/IDBBindingUtilities.cpp
	bindings/js/JSIDBObjectStoreCustom.cpp
    )
endif(ENABLE_INDEXED_DATABASE)

if(ENABLE_GEOLOCATION)
    list(APPEND WEBCORE_SRC
        bindings/js/JSGeolocationCustom.cpp
    )
endif(ENABLE_GEOLOCATION)

if(ENABLE_INSPECTOR)
    list(APPEND WEBCORE_SRC
        bindings/js/JSConsoleCustom.cpp
        bindings/js/JSJavaScriptCallFrameCustom.cpp
    )
endif(ENABLE_INSPECTOR)

if(ENABLE_WEB_SOCKETS)
    list(APPEND WEBCORE_SRC
    )
endif(ENABLE_WEB_SOCKETS)

if(ENABLE_WORKERS)
    list(APPEND WEBCORE_SRC
        bindings/js/JSWorkerGlobalScopeBase.cpp
        bindings/js/JSWorkerGlobalScopeCustom.cpp
        bindings/js/JSWorkerCustom.cpp
        bindings/js/WorkerScriptController.cpp
	bindings/js/WorkerScriptDebugServer.cpp
    )
    if(ENABLE_SHARED_WORKERS)
        list(APPEND WEBCORE_SRC
	  bindings/js/JSSharedWorkerCustom.cpp     
        )
    endif(ENABLE_SHARED_WORKERS)
endif(ENABLE_WORKERS)

if(ENABLE_XSLT)
    list(APPEND WEBCORE_SRC
        bindings/js/JSXSLTProcessorCustom.cpp
    )
endif(ENABLE_XSLT)

if(USE_GRAPHICS_SDL)
    list(APPEND WEBCORE_SRC
        bindings/js/ScriptControllerBAL.cpp
    )
endif(USE_GRAPHICS_SDL)

if(USE_GRAPHICS_SDLCAIRO)
    list(APPEND WEBCORE_SRC
        bindings/js/ScriptControllerBAL.cpp
    )
endif(USE_GRAPHICS_SDLCAIRO)

if(USE_GRAPHICS_MORPHOS)
    list(APPEND WEBCORE_SRC
        bindings/js/ScriptControllerMorphOS.cpp
    )
endif(USE_GRAPHICS_MORPHOS)

if(ENABLE_3D_CANVAS)
    list(APPEND WEBCORE_SRC
        bindings/js/JSWebGLRenderingContextCustom.cpp
    )
endif(ENABLE_3D_CANVAS)

if(NOT IGNORE_CUSTOMER)
    include(bindings/js/Customer/CMakeLists.txt OPTIONAL)
endif(NOT IGNORE_CUSTOMER)

if(ENABLE_FILE_SYSTEM)
    list(APPEND WEBCORE_SRC
	bindings/js/JSFileReaderCustom.cpp  
	bindings/js/JSEntryCustom.cpp
	bindings/js/JSEntrySyncCustom.cpp 
    )
endif(ENABLE_FILE_SYSTEM)

if(ENABLE_SVG)
    list(APPEND WEBCORE_SRC
        bindings/js/JSSVGElementInstanceCustom.cpp
	bindings/js/JSSVGLengthCustom.cpp     
	bindings/js/JSSVGPathSegCustom.cpp
    )
endif(ENABLE_SVG)

if(ENABLE_REQUEST_ANIMATION_FRAME)
    list(APPEND WEBCORE_SRC
        bindings/js/JSRequestAnimationFrameCallbackCustom.cpp
    )
endif(ENABLE_REQUEST_ANIMATION_FRAME)  

if(ENABLE_TOUCH_EVENTS)
    list(APPEND WEBCORE_SRC
        bindings/js/JSTouchCustom.cpp
	bindings/js/JSTouchListCustom.cpp
    )
endif(ENABLE_TOUCH_EVENTS)

if(ENABLE_VIDEO_TRACK)
    list(APPEND WEBCORE_SRC
        bindings/js/JSAudioTrackCustom.cpp
	bindings/js/JSAudioTrackListCustom.cpp
        bindings/js/JSTrackCustom.cpp
    	bindings/js/JSTrackEventCustom.cpp
        bindings/js/JSTextTrackCustom.cpp
        bindings/js/JSTextTrackCueCustom.cpp
        bindings/js/JSTextTrackListCustom.cpp
	bindings/js/JSVideoTrackCustom.cpp 
	bindings/js/JSVideoTrackListCustom.cpp 
    )
endif(ENABLE_VIDEO_TRACK)

if (ENABLE_MEDIA_STREAM)
   list(APPEND WEBCORE_SRC
       bindings/js/JSRTCStatsResponseCustom.cpp
   )
endif ()
