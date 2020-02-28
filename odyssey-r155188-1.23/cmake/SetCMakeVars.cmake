list(APPEND API_HEADER
    ${OWB_SOURCE_DIR}/BAL/Widgets/WebKit/Generic/WebWindow.h
    ${OWB_SOURCE_DIR}/BAL/Widgets/WebKit/Generic/WebWindowAlert.h
    ${OWB_SOURCE_DIR}/BAL/Widgets/WebKit/Generic/WebWindowConfirm.h
    ${OWB_SOURCE_DIR}/BAL/Widgets/WebKit/Generic/WebWindowPrompt.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/DOMCoreClasses.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/DOMHTMLClasses.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/DOMRange.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/JSActionDelegate.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/SharedObject.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/SharedPtr.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/TransferSharedPtr.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebBackForwardList.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebDownloadDelegate.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebDownload.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebDragData.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebEditingDelegate.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebError.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebFrame.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebFrameLoadDelegate.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebFramePolicyListener.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebHistoryDelegate.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebHistoryItem.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebHitTestResults.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebInspector.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebKit.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebMutableURLRequest.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebNavigationAction.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebNavigationData.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebNotificationDelegate.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebObject.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebPolicyDelegate.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebPreferences.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebResourceLoadDelegate.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebScriptObject.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebScriptWorld.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebSecurityOrigin.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebURLAuthenticationChallenge.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebURLAuthenticationChallengeSender.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebURLCredential.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebURLResponse.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebValue.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebView.h
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebWorkersPrivate.h
    ${OWB_SOURCE_DIR}/Base/WebKitDefines.h
    ${OWB_SOURCE_DIR}/Base/WebKitTypes.h
)

if(ENABLE_SQL_DATABASE)
    list(APPEND API_HEADER
        ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebDatabaseManager.h
    )
endif(ENABLE_SQL_DATABASE)

if(ENABLE_ICONDATABASE)
    list(APPEND API_HEADER
        ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/WebIconDatabase.h
    )
endif(ENABLE_ICONDATABASE)

list(APPEND BASE_INCLUDE_DIRS
    ${OWB_SOURCE_DIR}
    ${OWB_SOURCE_DIR}/Source
    ${OWB_SOURCE_DIR}/Base
    ${OWB_SOURCE_DIR}/Base/wtf
    ${OWB_SOURCE_DIR}/thirdparty/instdir/include
    ${OWB_SOURCE_DIR}/thirdparty/instdir/include/libxml2
    ${OWB_SOURCE_DIR}/thirdparty/magicaction/include
    ${OWB_SOURCE_DIR}/../../libs/cairo/cairo-src/MorphOS/include/cairo
    ${OWB_SOURCE_DIR}/../../libs/cairo/cairo-src/MorphOS/include
    ${OWB_SOURCE_DIR}/../../libs/freetype/include
    ${OWB_SOURCE_DIR}/../../classes/mui/calltips
)
list(APPEND WTF_INCLUDE_DIRS
    ${OWB_BINARY_DIR}/generated_link/BAL/wtf
    ${OWB_BINARY_DIR}/generated_link/BAL/wtf/text
    ${OWB_BINARY_DIR}/generated_link/BAL/wtf/unicode
    ${OWB_BINARY_DIR}/generated_link/BAL/wtf/dtoa
    ${OWB_BINARY_DIR}/generated_link/BAL/wtf/url
    ${OWB_BINARY_DIR}/generated_link/BAL/wtf/threads
)
list(APPEND BAL_INCLUDE_DIRS
    ${OWB_BINARY_DIR}/generated_link/BAL
)
list(APPEND JAVASCRIPTCORE_INCLUDE_DIRS
    ${OWB_SOURCE_DIR}/Source/
    ${OWB_SOURCE_DIR}/Source/JavaScriptCore
    ${OWB_SOURCE_DIR}/Source/JavaScriptCore/assembler
    ${OWB_SOURCE_DIR}/Source/JavaScriptCore/API
    ${OWB_SOURCE_DIR}/Source/JavaScriptCore/bytecode
    ${OWB_SOURCE_DIR}/Source/JavaScriptCore/bytecompiler
    ${OWB_SOURCE_DIR}/Source/JavaScriptCore/dfg
    ${OWB_SOURCE_DIR}/Source/JavaScriptCore/disassembler
    ${OWB_SOURCE_DIR}/Source/JavaScriptCore/ftl
    ${OWB_SOURCE_DIR}/Source/JavaScriptCore/heap
    ${OWB_SOURCE_DIR}/Source/JavaScriptCore/debugger
    ${OWB_SOURCE_DIR}/Source/JavaScriptCore/ForwardingHeaders
    ${OWB_SOURCE_DIR}/Source/JavaScriptCore/interpreter
    ${OWB_SOURCE_DIR}/Source/JavaScriptCore/jit
    ${OWB_SOURCE_DIR}/Source/JavaScriptCore/llint
    ${OWB_SOURCE_DIR}/Source/JavaScriptCore/parser
    ${OWB_SOURCE_DIR}/Source/JavaScriptCore/pcre
    ${OWB_SOURCE_DIR}/Source/JavaScriptCore/profiler
    ${OWB_SOURCE_DIR}/Source/JavaScriptCore/runtime
    ${OWB_SOURCE_DIR}/Source/JavaScriptCore/tools
    ${OWB_SOURCE_DIR}/Source/JavaScriptCore/wrec
    ${OWB_SOURCE_DIR}/Source/JavaScriptCore/yarr
)

list(APPEND WEBCORE_INCLUDE_DIRS
    ${OWB_SOURCE_DIR}/Source/WebCore/Modules/battery
    ${OWB_SOURCE_DIR}/Source/WebCore/Modules/filesystem
    ${OWB_SOURCE_DIR}/Source/WebCore/Modules/gamepad
    ${OWB_SOURCE_DIR}/Source/WebCore/Modules/geolocation
    ${OWB_SOURCE_DIR}/Source/WebCore/Modules/indexeddb
    ${OWB_SOURCE_DIR}/Source/WebCore/Modules/indieui
    ${OWB_SOURCE_DIR}/Source/WebCore/Modules/intents
    ${OWB_SOURCE_DIR}/Source/WebCore/Modules/mediasource
    ${OWB_SOURCE_DIR}/Source/WebCore/Modules/mediastream
    ${OWB_SOURCE_DIR}/Source/WebCore/Modules/navigatorcontentutils
    ${OWB_SOURCE_DIR}/Source/WebCore/Modules/networkinfo
    ${OWB_SOURCE_DIR}/Source/WebCore/Modules/notifications
    ${OWB_SOURCE_DIR}/Source/WebCore/Modules/proximity
    ${OWB_SOURCE_DIR}/Source/WebCore/Modules/quota
    ${OWB_SOURCE_DIR}/Source/WebCore/Modules/vibration
    ${OWB_SOURCE_DIR}/Source/WebCore/Modules/webaudio
    ${OWB_SOURCE_DIR}/Source/WebCore/Modules/webdatabase
    ${OWB_SOURCE_DIR}/Source/WebCore/Modules/websockets
    ${OWB_SOURCE_DIR}/Source/WebCore/bindings
    ${OWB_SOURCE_DIR}/Source/WebCore/bindings/generic
    ${OWB_SOURCE_DIR}/Source/WebCore/bindings/js
    ${OWB_SOURCE_DIR}/Source/WebCore/bindings/js/specialization
    ${OWB_SOURCE_DIR}/Source/WebCore/bridge
    ${OWB_SOURCE_DIR}/Source/WebCore/bridge/bal
    ${OWB_SOURCE_DIR}/Source/WebCore/bridge/c
    ${OWB_SOURCE_DIR}/Source/WebCore/bridge/jsc
    ${OWB_SOURCE_DIR}/Source/WebCore/css
    ${OWB_SOURCE_DIR}/Source/WebCore/dom
    ${OWB_SOURCE_DIR}/Source/WebCore/dom/default
    ${OWB_SOURCE_DIR}/Source/WebCore/editing
    ${OWB_SOURCE_DIR}/Source/WebCore/fileapi
    ${OWB_SOURCE_DIR}/Source/WebCore/history
    ${OWB_SOURCE_DIR}/Source/WebCore/html
    ${OWB_SOURCE_DIR}/Source/WebCore/html/canvas
    ${OWB_SOURCE_DIR}/Source/WebCore/html/parser
    ${OWB_SOURCE_DIR}/Source/WebCore/html/forms
    ${OWB_SOURCE_DIR}/Source/WebCore/html/shadow
    ${OWB_SOURCE_DIR}/Source/WebCore/html/track
    ${OWB_SOURCE_DIR}/Source/WebCore/loader
    ${OWB_SOURCE_DIR}/Source/WebCore/loader/appcache
    ${OWB_SOURCE_DIR}/Source/WebCore/loader/archive
    ${OWB_SOURCE_DIR}/Source/WebCore/loader/archive/mhtml
    ${OWB_SOURCE_DIR}/Source/WebCore/loader/cache
    ${OWB_SOURCE_DIR}/Source/WebCore/loader/icon
    ${OWB_SOURCE_DIR}/Source/WebCore/mediastream
    ${OWB_SOURCE_DIR}/Source/WebCore/page
    ${OWB_SOURCE_DIR}/Source/WebCore/page/animation
    ${OWB_SOURCE_DIR}/Source/WebCore/page/scrolling
    ${OWB_SOURCE_DIR}/Source/WebCore/page/scrolling/coordinatedgraphics
    ${OWB_SOURCE_DIR}/Source/WebCore/platform
    ${OWB_SOURCE_DIR}/Source/WebCore/plugins
    ${OWB_SOURCE_DIR}/Source/WebCore/rendering
    ${OWB_SOURCE_DIR}/Source/WebCore/rendering/mathml
    ${OWB_SOURCE_DIR}/Source/WebCore/rendering/shapes
    ${OWB_SOURCE_DIR}/Source/WebCore/rendering/style
    ${OWB_SOURCE_DIR}/Source/WebCore/rendering/svg
    ${OWB_SOURCE_DIR}/Source/WebCore/style
    ${OWB_SOURCE_DIR}/Source/WebCore/testing
    ${OWB_SOURCE_DIR}/Source/WebCore/webaudio
    ${OWB_SOURCE_DIR}/Source/WebCore/xml
    ${OWB_SOURCE_DIR}/Source/WebCore/xml/parser
)

if(ENABLE_ACCESSIBILITY)
    list(APPEND WEBCORE_INCLUDE_DIRS
        ${OWB_SOURCE_DIR}/Source/WebCore/accessibility
    )
endif(ENABLE_ACCESSIBILITY)
        

list(APPEND WEBKIT_INCLUDE_DIRS
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/WebCoreSupport
    ${OWB_SOURCE_DIR}/BAL/Widgets/WebKit/Generic/
)
if(USE_GRAPHICS_SDL)
    list(APPEND WEBKIT_INCLUDE_DIRS
        ${OWB_SOURCE_DIR}/BAL/Widgets/WebKit/SDL
    )
endif(USE_GRAPHICS_SDL)

list(APPEND EXTERNAL_DEPS_INCLUDE_DIRS
    ${OWB_BASE_DEPS_INCLUDE_DIRS}
    ${FILESYSTEM_INCLUDE_DIRS}
    ${FONTS_INCLUDE_DIRS}
    ${GEOLOCATION_INCLUDE_DIRS}
    ${GRAPHICS_INCLUDE_DIRS}
    ${IMAGE_INCLUDE_DIRS}
    ${I18N_INCLUDE_DIRS}
    ${NETWORK_INCLUDE_DIRS}
    ${THREADS_INCLUDE_DIRS}
    ${TIMER_INCLUDE_DIRS}
)
list(APPEND EXTERNAL_DEPS_LIBRARIES
    ${OWB_BASE_DEPS_LIBRARIES}
    ${FILESYSTEM_LIBRARIES}
    ${FONTS_LIBRARIES}
    ${GEOLOCATION_LIBRARIES}
    ${GRAPHICS_LIBRARIES}
    ${IMAGE_LIBRARIES}
    ${I18N_LIBRARIES}
    ${NETWORK_LIBRARIES}
    ${THREADS_LIBRARIES}
    ${TIMER_LIBRARIES}
)

if(ENABLE_SQL_DATABASE)
    list(APPEND WEBCORE_INCLUDE_DIRS
        ${OWB_SOURCE_DIR}/Source/WebCore/storage
    )
    list(APPEND EXTERNAL_DEPS_INCLUDE_DIRS
        ${DATABASE_INCLUDE_DIRS}
    )
    list(APPEND EXTERNAL_DEPS_LIBRARIES
        ${DATABASE_LIBRARIES}
    )
endif(ENABLE_SQL_DATABASE)

if(ENABLE_INSPECTOR)
    list(APPEND WEBCORE_INCLUDE_DIRS
        ${OWB_SOURCE_DIR}/Source/WebCore/inspector
    )
endif(ENABLE_INSPECTOR)

if(ENABLE_JIT_JSC OR ENABLE_JIT_REGEXP)
    list(APPEND JAVASCRIPTCORE_INCLUDE_DIRS
        ${OWB_SOURCE_DIR}/Source/JavaScriptCore/assembler
    )
endif(ENABLE_JIT_JSC OR ENABLE_JIT_REGEXP)
    
if(ENABLE_NPAPI)
    list(APPEND EXTERNAL_DEPS_INCLUDE_DIRS
        ${NPAPI_INCLUDE_DIRS}
    )
    list(APPEND EXTERNAL_DEPS_LIBRARIES
        ${NPAPI_LIBRARIES}
    )
endif(ENABLE_NPAPI)

if(ENABLE_SVG OR ENABLE_FILTERS)
    list(APPEND WEBCORE_INCLUDE_DIRS
        ${OWB_SOURCE_DIR}/Source/WebCore/svg
        ${OWB_SOURCE_DIR}/Source/WebCore/svg/animation
        ${OWB_SOURCE_DIR}/Source/WebCore/svg/graphics
        ${OWB_SOURCE_DIR}/Source/WebCore/svg/graphics/filters
	${OWB_SOURCE_DIR}/Source/WebCore/svg/properties
    )
endif(ENABLE_SVG OR ENABLE_FILTERS)

if(HAS_VIDEO)
    list(APPEND EXTERNAL_DEPS_INCLUDE_DIRS
        ${VIDEO_INCLUDE_DIRS}
    )
    list(APPEND EXTERNAL_DEPS_LIBRARIES
        ${VIDEO_LIBRARIES}
    )
endif(HAS_VIDEO)

if(ENABLE_WEB_SOCKETS)
    list(APPEND WEBCORE_INCLUDE_DIRS
        ${OWB_SOURCE_DIR}/Source/WebCore/websockets
    )
endif(ENABLE_WEB_SOCKETS)

if(ENABLE_WML)
    list(APPEND WEBCORE_INCLUDE_DIRS
        ${OWB_SOURCE_DIR}/Source/WebCore/wml
        ${OWB_BINARY_DIR}/generated_sources/WebCore/wml
    )
endif(ENABLE_WML)

if(ENABLE_WORKERS)
    list(APPEND WEBCORE_INCLUDE_DIRS
        ${OWB_BINARY_DIR}/generated_sources/WebCore/workers
        ${OWB_SOURCE_DIR}/Source/WebCore/workers
    )
endif(ENABLE_WORKERS)

if(ENABLE_XSLT)
    list(APPEND EXTERNAL_DEPS_INCLUDE_DIRS
        ${LIBXSLT_INCLUDE_DIRS}
    )
    list(APPEND EXTERNAL_DEPS_LIBRARIES
        ${LIBXSLT_LIBRARIES}
    )
endif(ENABLE_XSLT)




