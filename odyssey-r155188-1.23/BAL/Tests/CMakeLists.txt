IF (NOT WEBKIT_USE_CC_EXCEPTIONS)
    REMOVE_DEFINITIONS (-fno-exceptions)
ENDIF (NOT WEBKIT_USE_CC_EXCEPTIONS)

IF (NOT WEBKIT_USE_CC_RTTI)
    REMOVE_DEFINITIONS (-fno-rtti)
ENDIF (NOT WEBKIT_USE_CC_RTTI)

ADD_DEFINITIONS("-D'CPPU_GATHER2(File,Line)=File\":\"\\#Line'")
ADD_DEFINITIONS("-D'CPPU_GATHER(File,Line)=CPPU_GATHER2(File,Line)'")
ADD_DEFINITIONS("-D'CPPU_NOT_IMPLEMENTED={CPPUNIT_ASSERT_MESSAGE(\"Test not implemented at: \\n\"CPPU_GATHER(__FILE__,__LINE__), false );}'")

INCLUDE_DIRECTORIES (
    ${CMAKE_SOURCE_DIR}/BAL/Base
    ${CMAKE_SOURCE_DIR}/BAL/Base/wtf
    ${CMAKE_BINARY_DIR}/generated_link/OWBAL
    ${CMAKE_BINARY_DIR}/generated_link/WKAL
    ${CMAKE_SOURCE_DIR}
    ${CMAKE_SOURCE_DIR}/JavaScriptCore
    ${CMAKE_SOURCE_DIR}/WebCore
    ${CMAKE_SOURCE_DIR}/WebCore/bridge
    ${CMAKE_SOURCE_DIR}/WebCore/css
    ${CMAKE_SOURCE_DIR}/WebCore/dom
    ${CMAKE_SOURCE_DIR}/WebCore/editing
    ${CMAKE_SOURCE_DIR}/WebCore/history
    ${CMAKE_SOURCE_DIR}/WebCore/html
    ${CMAKE_SOURCE_DIR}/WebCore/loader
    ${CMAKE_SOURCE_DIR}/WebCore/page
    ${CMAKE_SOURCE_DIR}/WebCore/svg
    ${CMAKE_SOURCE_DIR}/WebCore/loader/icon
    ${CMAKE_SOURCE_DIR}/WebCore/bindings/js
    ${CMAKE_SOURCE_DIR}/WebCore/rendering
    ${CMAKE_SOURCE_DIR}/WebCore/storage
    ${CMAKE_SOURCE_DIR}/WebKit/OrigynWebBrowser
    ${CMAKE_SOURCE_DIR}/WebKit/OrigynWebBrowser/Api
    ${CMAKE_SOURCE_DIR}/WebKit/OrigynWebBrowser/WebCoreSupport
    ${CMAKE_SOURCE_DIR}/Tools/OrigynWebBrowser
    ${CMAKE_SOURCE_DIR}/JavaScriptCore/ForwardingHeaders
    ${CMAKE_SOURCE_DIR}/JavaScriptCore/VM
    ${CMAKE_SOURCE_DIR}/JavaScriptCore/kjs
    ${CMAKE_SOURCE_DIR}
    ${CMAKE_BINARY_DIR}/generated_sources/WebKit
    ${GTK2_INCLUDE_DIRS}
)


IF (WEBKIT_USE_I18N STREQUAL "GENERIC")
    INCLUDE_DIRECTORIES (
        ${CMAKE_SOURCE_DIR}/JavaScriptCore/icu
    )
ENDIF (WEBKIT_USE_I18N STREQUAL "GENERIC")


IF (WEBKIT_USE_DATABASE)
    AUX_SOURCE_DIRECTORY (Database OWBALTESTS_SRC)
ENDIF (WEBKIT_USE_DATABASE)
AUX_SOURCE_DIRECTORY (Facilities OWBALTESTS_SRC)
AUX_SOURCE_DIRECTORY (ImageDecoder OWBALTESTS_SRC)
AUX_SOURCE_DIRECTORY (Internationalization OWBALTESTS_SRC)
IF (WEBKIT_USE_HTML5_VIDEO)
	AUX_SOURCE_DIRECTORY (Media OWBALTESTS_SRC)
ENDIF (WEBKIT_USE_HTML5_VIDEO)
AUX_SOURCE_DIRECTORY (Memory OWBALTESTS_SRC)
AUX_SOURCE_DIRECTORY (Types OWBALTESTS_SRC)

IF (OWBAL_PLATFORM_GRAPHICS STREQUAL "GTK")
    LIST ( REMOVE_ITEM OWBALTESTS_SRC 
           Types/ThreadSpecificTest.cpp
    )
ENDIF (OWBAL_PLATFORM_GRAPHICS STREQUAL "GTK")


IF (BUILD_SHARED_LIBS)
    ADD_LIBRARY (owbaltests ${OWBALTESTS_SRC})
ELSE (BUILD_SHARED_LIBS)
    ADD_LIBRARY (owbaltests STATIC ${OWBALTESTS_SRC})
ENDIF (BUILD_SHARED_LIBS)

ADD_EXECUTABLE (runOwbalTests runOwbalTests.cpp)

TARGET_LINK_LIBRARIES (runOwbalTests
    owbaltests
    generated-sources
    webcore-owb
    jscore
    bal-events
    bal-facilities
    bal-fonts
    bal-graphics
    bal-imagedecoder
    bal-internationalization
    bal-media
    bal-memory
    bal-network
    bal-types
    bal-widgets
    ${DEEPSEE_LINK}
    ${EXTRA_LDFLAGS}
)

IF (WEBKIT_USE_DATABASE)
    TARGET_LINK_LIBRARIES (runOwbalTests
        bal-database
    )
ENDIF (WEBKIT_USE_DATABASE)

TARGET_LINK_LIBRARIES (runOwbalTests
    -lxslt -lz -lm -lxml2
    ${PNG12_LIBRARIES}
    -ljpeg
    ${GTHREAD_LIBRARIES}
    ${CPPUNIT_LIBRARIES}
    ${XT_LIBRARIES}
)

IF (${OWBAL_PLATFORM_GRAPHICS} STREQUAL "GTK")
    TARGET_LINK_LIBRARIES (runOwbalTests ${GTK2_LIBRARIES})
ELSEIF (${OWBAL_PLATFORM_GRAPHICS} STREQUAL "SDL")
    TARGET_LINK_LIBRARIES (runOwbalTests ${SDL_LIBRARIES})
ENDIF (${OWBAL_PLATFORM_GRAPHICS} STREQUAL "GTK")

IF (WEBKIT_USE_HTML_EXTENSION)
    TARGET_LINK_LIBRARIES (runOwbalTests
        htmlext
    )
ENDIF (WEBKIT_USE_HTML_EXTENSION)

ADD_TEST (owbal ${EXECUTABLE_OUTPUT_PATH}/runOwbalTests)
IF (NOT WEBKIT_USE_CC_EXCEPTIONS)
    REMOVE_DEFINITIONS (-fno-exceptions)
ENDIF (NOT WEBKIT_USE_CC_EXCEPTIONS)

IF (NOT WEBKIT_USE_CC_RTTI)
    REMOVE_DEFINITIONS (-fno-rtti)
ENDIF (NOT WEBKIT_USE_CC_RTTI)

ADD_DEFINITIONS("-D'CPPU_GATHER2(File,Line)=File\":\"\\#Line'")
ADD_DEFINITIONS("-D'CPPU_GATHER(File,Line)=CPPU_GATHER2(File,Line)'")
ADD_DEFINITIONS("-D'CPPU_NOT_IMPLEMENTED={CPPUNIT_ASSERT_MESSAGE(\"Test not implemented at: \\n\"CPPU_GATHER(__FILE__,__LINE__), false );}'")

INCLUDE_DIRECTORIES (
    ${CMAKE_SOURCE_DIR}/BAL/Base
    ${CMAKE_SOURCE_DIR}/BAL/Base/wtf
    ${CMAKE_BINARY_DIR}/generated_link/OWBAL
    ${CMAKE_BINARY_DIR}/generated_link/WKAL
    ${CMAKE_SOURCE_DIR}
    ${CMAKE_SOURCE_DIR}/JavaScriptCore
    ${CMAKE_SOURCE_DIR}/WebCore
    ${CMAKE_SOURCE_DIR}/WebCore/bridge
    ${CMAKE_SOURCE_DIR}/WebCore/css
    ${CMAKE_SOURCE_DIR}/WebCore/dom
    ${CMAKE_SOURCE_DIR}/WebCore/editing
    ${CMAKE_SOURCE_DIR}/WebCore/history
    ${CMAKE_SOURCE_DIR}/WebCore/html
    ${CMAKE_SOURCE_DIR}/WebCore/loader
    ${CMAKE_SOURCE_DIR}/WebCore/page
    ${CMAKE_SOURCE_DIR}/WebCore/svg
    ${CMAKE_SOURCE_DIR}/WebCore/loader/icon
    ${CMAKE_SOURCE_DIR}/WebCore/bindings/js
    ${CMAKE_SOURCE_DIR}/WebCore/rendering
    ${CMAKE_SOURCE_DIR}/WebCore/storage
    ${CMAKE_SOURCE_DIR}/WebCore/rendering/style
    ${CMAKE_SOURCE_DIR}/WebCore/svg/graphics/filters
    ${CMAKE_SOURCE_DIR}/WebKit/OrigynWebBrowser
    ${CMAKE_SOURCE_DIR}/WebKit/OrigynWebBrowser/Api
    ${CMAKE_SOURCE_DIR}/WebKit/OrigynWebBrowser/WebCoreSupport
    ${CMAKE_SOURCE_DIR}/Tools/OrigynWebBrowser
    ${CMAKE_SOURCE_DIR}/JavaScriptCore/ForwardingHeaders
    ${CMAKE_SOURCE_DIR}/JavaScriptCore/kjs
    ${CMAKE_SOURCE_DIR}/JavaScriptCore/VM
    ${CMAKE_SOURCE_DIR}
    ${CMAKE_BINARY_DIR}/generated_sources/WebKit
)


IF (WEBKIT_USE_I18N STREQUAL "GENERIC")
    INCLUDE_DIRECTORIES (
        ${CMAKE_SOURCE_DIR}/JavaScriptCore/icu
    )
ENDIF (WEBKIT_USE_I18N STREQUAL "GENERIC")


IF (OWBAL_PLATFORM_GRAPHICS STREQUAL "GTK")
    INCLUDE_DIRECTORIES (${GTK2_INCLUDE_DIRS})
ELSEIF (OWBAL_PLATFORM_GRAPHICS STREQUAL "SDL")
    INCLUDE_DIRECTORIES (${SDL_INCLUDE_DIRS})
ENDIF (OWBAL_PLATFORM_GRAPHICS STREQUAL "GTK")

AUX_SOURCE_DIRECTORY (Events WKALTESTS_SRC)
AUX_SOURCE_DIRECTORY (Fonts WKALTESTS_SRC)
AUX_SOURCE_DIRECTORY (Graphics WKALTESTS_SRC)
AUX_SOURCE_DIRECTORY (Network WKALTESTS_SRC)
AUX_SOURCE_DIRECTORY (Widgets WKALTESTS_SRC)

IF (BUILD_SHARED_LIBS)
    ADD_LIBRARY (wkaltests ${WKALTESTS_SRC})
ELSE (BUILD_SHARED_LIBS)
    ADD_LIBRARY (wkaltests STATIC ${WKALTESTS_SRC})
ENDIF (BUILD_SHARED_LIBS)

ADD_EXECUTABLE (runWkalTests runWkalTests.cpp)

TARGET_LINK_LIBRARIES (runWkalTests
    wkaltests
    generated-sources
    webcore-owb
    jscore
    bal-events
    bal-facilities
    bal-fonts
    bal-graphics
    bal-imagedecoder
    bal-internationalization
    bal-media
    bal-memory
    bal-network
    bal-types
    bal-widgets
    ${DEEPSEE_LINK}
    ${EXTRA_LDFLAGS}
)

IF (WEBKIT_USE_DATABASE)
    TARGET_LINK_LIBRARIES (runWkalTests
        bal-database
    )
ENDIF (WEBKIT_USE_DATABASE)

TARGET_LINK_LIBRARIES (runWkalTests
    -lxslt -lz -lm -lxml2
    ${PNG12_LIBRARIES}
    -ljpeg
    ${GTHREAD_LIBRARIES}
    ${CPPUNIT_LIBRARIES}
    ${XT_LIBRARIES}
)

IF (OWBAL_PLATFORM_GRAPHICS STREQUAL "GTK")
    TARGET_LINK_LIBRARIES (runWkalTests ${GTK2_LIBRARIES})
ELSEIF (OWBAL_PLATFORM_GRAPHICS STREQUAL "SDL")
    TARGET_LINK_LIBRARIES (runWkalTests ${SDL_LIBRARIES})
ENDIF (OWBAL_PLATFORM_GRAPHICS STREQUAL "GTK")

IF (WEBKIT_USE_HTML_EXTENSION)
    TARGET_LINK_LIBRARIES (runWkalTests
        htmlext
    )
ENDIF (WEBKIT_USE_HTML_EXTENSION)

ADD_TEST (wkal ${EXECUTABLE_OUTPUT_PATH}/runWkalTests)
