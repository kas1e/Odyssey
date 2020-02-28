##################################################
#                                                #
# WebCore build instructions.                    #
#                                                #
##################################################


##################################################
# Generate sources.                              #
##################################################

SET(CODE_GENERATOR_PREPROCESSOR "ppc-amigaos-cpp -P")

add_javascript_features()

list(APPEND WEBCORE_CSS_PROPERTY_NAMES 
    ${OWB_SOURCE_DIR}/Source/WebCore/css/CSSPropertyNames.in
)
list(APPEND WEBCORE_CSS_VALUE_KEYWORDS
    ${OWB_SOURCE_DIR}/Source/WebCore/css/CSSValueKeywords.in
)
list(APPEND WEBCORE_USER_AGENT_STYLE_SHEETS
    ${OWB_SOURCE_DIR}/Source/WebCore/css/html.css
    ${OWB_SOURCE_DIR}/Source/WebCore/css/fullscreen.css
    ${OWB_SOURCE_DIR}/Source/WebCore/css/plugIns.css
    ${OWB_SOURCE_DIR}/Source/WebCore/css/quirks.css
    ${OWB_SOURCE_DIR}/Source/WebCore/css/view-source.css
)

list(APPEND WEBCORE_PLUG_INS_RESOURCES
    ${OWB_SOURCE_DIR}/Source/WebCore/Resources/plugIns.js
)

if(ENABLE_MATHML)
    list(APPEND WEBCORE_USER_AGENT_STYLE_SHEETS
        ${OWB_SOURCE_DIR}/Source/WebCore/css/mathml.css
    )
endif(ENABLE_MATHML)

if(USE_GRAPHICS_GTK)
    list(APPEND WEBCORE_USER_AGENT_STYLE_SHEETS
        ${OWB_SOURCE_DIR}/Source/WebCore/css/mediaControlsEfl.css
    )
endif(USE_GRAPHICS_GTK)

if(ENABLE_SVG)
    add_svg_features()
    list(APPEND WEBCORE_CSS_PROPERTY_NAMES
        ${OWB_SOURCE_DIR}/Source/WebCore/css/SVGCSSPropertyNames.in
    )
    list(APPEND WEBCORE_CSS_VALUE_KEYWORDS
        ${OWB_SOURCE_DIR}/Source/WebCore/css/SVGCSSValueKeywords.in
    )
    list(APPEND WEBCORE_USER_AGENT_STYLE_SHEETS
        ${OWB_SOURCE_DIR}/Source/WebCore/css/svg.css
    )
endif(ENABLE_SVG)

if(ENABLE_WCSS)
    list(APPEND WEBCORE_CSS_PROPERTY_NAMES
        ${OWB_SOURCE_DIR}/Source/WebCore/css/WCSSPropertyNames.in
    )
    list(APPEND WEBCORE_CSS_VALUE_KEYWORDS
        ${OWB_SOURCE_DIR}/Source/WebCore/css/WCSSValueKeywords.in
    )
endif(ENABLE_WCSS)

if(ENABLE_VIDEO)
    list(APPEND WEBCORE_USER_AGENT_STYLE_SHEETS
        ${OWB_SOURCE_DIR}/Source/WebCore/css/mediaControls.css
    )
    if(USE_GRAPHICS_QT)
        list(APPEND WEBCORE_USER_AGENT_STYLE_SHEETS
            ${OWB_SOURCE_DIR}/Source/WebCore/css/mediaControlsQt.css
        )
    endif(USE_GRAPHICS_QT)
endif(ENABLE_VIDEO)

set(WEBCORE_GENERATED_DIR ${OWB_BINARY_DIR}/generated_sources/WebCore)
if(NOT EXISTS ${WEBCORE_GENERATED_DIR})
	execute_process(
		COMMAND mkdir -p ${WEBCORE_GENERATED_DIR}/html
		COMMAND mkdir -p ${WEBCORE_GENERATED_DIR}/mathml
		COMMAND mkdir -p ${WEBCORE_GENERATED_DIR}/wml
		COMMAND mkdir -p ${WEBCORE_GENERATED_DIR}/xml
	)
endif(NOT EXISTS ${WEBCORE_GENERATED_DIR})

##################################################
# Add sources for JavaScriptCore library.        #
##################################################

include(${OWB_SOURCE_DIR}/BAL/CMakeLists.txt)
if(NOT IGNORE_CUSTOMER)
    include(${OWB_SOURCE_DIR}/BAL/Customer/CMakeLists.txt OPTIONAL)
endif(NOT IGNORE_CUSTOMER)
include(Modules/battery/CMakeLists.txt)
include(Modules/filesystem/CMakeLists.txt)
include(Modules/gamepad/CMakeLists.txt)
include(Modules/geolocation/CMakeLists.txt)
include(Modules/indexeddb/CMakeLists.txt)
include(Modules/mediasource/CMakeLists.txt)
include(Modules/mediastream/CMakeLists.txt)
include(Modules/navigatorcontentutils/CMakeLists.txt)
include(Modules/networkinfo/CMakeLists.txt)
include(Modules/notifications/CMakeLists.txt)
include(Modules/proximity/CMakeLists.txt)
include(Modules/quota/CMakeLists.txt)
include(Modules/vibration/CMakeLists.txt)
include(Modules/webaudio/CMakeLists.txt)
include(Modules/webdatabase/CMakeLists.txt)
include(Modules/websockets/CMakeLists.txt)
include(accessibility/CMakeLists.txt)
include(bindings/generic/CMakeLists.txt)
include(bindings/js/CMakeLists.txt)
include(bridge/CMakeLists.txt)
include(css/CMakeLists.txt)
include(dom/CMakeLists.txt)
include(editing/CMakeLists.txt)
include(fileapi/CMakeLists.txt)
include(history/CMakeLists.txt)
include(html/CMakeLists.txt)
include(html/canvas/CMakeLists.txt)
include(html/forms/CMakeLists.txt)
include(html/parser/CMakeLists.txt)
include(html/shadow/CMakeLists.txt)
include(html/track/CMakeLists.txt)
include(inspector/CMakeLists.txt)
include(loader/CMakeLists.txt)
include(loader/icon/CMakeLists.txt)
include(loader/cache/CMakeLists.txt)
include(mathml/CMakeLists.txt)
include(page/CMakeLists.txt)
include(platform/CMakeLists.txt)
include(plugins/CMakeLists.txt)
include(rendering/CMakeLists.txt)
include(rendering/mathml/CMakeLists.txt)
include(rendering/shapes/CMakeLists.txt)
include(rendering/style/CMakeLists.txt)
include(storage/CMakeLists.txt)
include(style/CMakeLists.txt)
include(svg/CMakeLists.txt)
include(testing/CMakeLists.txt)
include(workers/CMakeLists.txt)
include(xml/CMakeLists.txt)

SET(WEBCORE_IDL_INCLUDES
    bindings/generic
    Modules/battery
    Modules/filesystem
    Modules/gamepad
    Modules/geolocation
    Modules/indexeddb
    Modules/indieui
    Modules/mediastream
    Modules/mediasource
    Modules/networkinfo
    Modules/notifications
    Modules/proximity
    Modules/quota
    Modules/speech
    Modules/vibration
    Modules/webaudio
    Modules/webdatabase
    Modules/websockets
    css
    dom
    fileapi
    html
    html/canvas
    html/shadow
    html/track
    inspector
    loader/appcache
    page
    plugins
    storage
    svg
    testing
    webaudio
    workers
    xml
)  

SET(IDL_INCLUDES "")
FOREACH (_include ${WEBCORE_IDL_INCLUDES})
    LIST(APPEND IDL_INCLUDES --include=${OWB_SOURCE_DIR}/Source/WebCore/${_include})
ENDFOREACH ()   

SET(SCRIPTS_FOR_PREPROCESS_IDLS
     ${OWB_SOURCE_DIR}/Source/WebCore/bindings/scripts/IDLParser.pm
     ${OWB_SOURCE_DIR}/Source/WebCore/bindings/scripts/preprocess-idls.pl
)

LIST(APPEND SCRIPTS_BINDINGS
    ${OWB_SOURCE_DIR}/Source/WebCore/bindings/scripts/CodeGenerator.pm
    ${OWB_SOURCE_DIR}/Source/WebCore/bindings/scripts/CodeGeneratorJS.pm
    ${OWB_SOURCE_DIR}/Source/WebCore/bindings/scripts/IDLParser.pm
    ${OWB_SOURCE_DIR}/Source/WebCore/bindings/scripts/InFilesParser.pm
    ${OWB_SOURCE_DIR}/Source/WebCore/bindings/scripts/generate-bindings.pl)    

SET(IDL_FILES_TMP ${WEBCORE_GENERATED_DIR}/idl_files.tmp)
SET(SUPPLEMENTAL_DEPENDENCY_FILE ${WEBCORE_GENERATED_DIR}/supplemental_dependency.tmp)
SET(WINDOW_CONSTRUCTORS_FILE ${WEBCORE_GENERATED_DIR}/DOMWindowConstructors.idl) 
SET(WORKERGLOBALSCOPE_CONSTRUCTORS_FILE ${WEBCORE_GENERATED_DIR}/WorkerGlobalScopeConstructors.idl)                   
SET(SHAREDWORKERGLOBALSCOPE_CONSTRUCTORS_FILE ${WEBCORE_GENERATED_DIR}/SharedWorkerGlobalScopeConstructors.idl)
SET(DEDICATEDWORKERGLOBALSCOPE_CONSTRUCTORS_FILE ${WEBCORE_GENERATED_DIR}/DedicatedWorkerGlobalScopeConstructors.idl)
SET(IDL_ATTRIBUTES_FILE ${OWB_SOURCE_DIR}/Source/WebCore/bindings/scripts/IDLAttributes.txt)

# The WebCore compiler flags need to be included before generating the list of compiler defines below
include(AddWebCoreCompilerFlags)

# Generate a list of compiler defines to pass as argument to the make_names.pl script
# so the preprocessor-dependent HTML tag names definitions get generated appropriately
get_directory_property(PREPROCESSOR_DEFINITIONS COMPILE_DEFINITIONS)
foreach(define ${PREPROCESSOR_DEFINITIONS})
    set(EXTRA_DEFINES "${EXTRA_DEFINES} ${define}")
endforeach(define)

set(FEATURE_DEFINES "LANGUAGE_JAVASCRIPT=1 ENABLE_3D_RENDERING=1 ENABLE_BLOB=1 ENABLE_SQL_DATABASE=1 ENABLE_DOM_STORAGE=1 ENABLE_DATALIST=1 ENABLE_EVENTSOURCE=1 ENABLE_INSPECTOR=1 ENABLE_JAVASCRIPT_DEBUGGER=1 ENABLE_MATHML=1 ENABLE_NOTIFICATIONS=1 ENABLE_OFFLINE_WEB_APPLICATIONS=1 ENABLE_VIDEO=1 ENABLE_XPATH=1 ENABLE_XSLT=1 ENABLE_FILE_SYSTEM=1 ENABLE_WEB_SOCKETS=1 ENABLE_ANIMATION_API=1 ENABLE_CHANNEL_MESSAGING=1 ENABLE_DATALIST_ELEMENT=1 ENABLE_DATA_TRANSFER_ITEMS=0 ENABLE_CSS_BOX_DECORATION_BREAK=1 ENABLE_CSS_IMAGE_SET=1 ENABLE_DETAILS_ELEMENT=1 ENABLE_IFRAME_SEAMLESS=1 ENABLE_INDEXED_DATABASE=0 ENABLE_INPUT_TYPE_COLOR=1 ENABLE_INPUT_TYPE_DATE=1 ENABLE_INPUT_TYPE_DATETIME_INCOMPLETE=1 ENABLE_INPUT_TYPE_TIME=1 ENABLE_INPUT_TYPE_DATETIMELOCAL=1 ENABLE_INPUT_TYPE_MONTH=1 ENABLE_INPUT_TYPE_WEEK=1 ENABLE_DATE_AND_TIME_INPUT_TYPES=1 ENABLE_LEGACY_NOTIFICATIONS=1 ENABLE_MEDIA_SOURCE=0 ENABLE_MEDIA_STATISTICS=1 ENABLE_METER_ELEMENT=1 ENABLE_PROGRESS_ELEMENT=1 ENABLE_STYLE_SCOPED=1 ENABLE_VIDEO_TRACK=1 ENABLE_VIEW_MODE_CSS_MEDIA=1 ENABLE_WEB_TIMING=1 ENABLE_WORKERS=0 ENABLE_SHARED_WORKERS=0 ENABLE_SVG=1 ENABLE_SVG_ANIMATION=1 ENABLE_SVG_AS_IMAGE=1 ENABLE_SVG_FONTS=1 ENABLE_SVG_FOREIGN_OBJECT=1 ENABLE_SVG_USE_ELEMENT=1 ENABLE_POINTER_LOCK=1 ENABLE_PAGE_VISIBILITY_API=1 ENABLE_REQUEST_ANIMATION_FRAME=0 ENABLE_FULLSCREEN_API=1 ENABLE_GEOLOCATION=1 ENABLE_DEVICE_ORIENTATION=1")


# Replace ";" with "space" in order to recognize feature definition in css files.
SET(FEATURE_DEFINES_WITH_SPACE_SEPARATOR "")
FOREACH(_feature ${FEATURE_DEFINES})
    SET(FEATURE_DEFINES_WITH_SPACE_SEPARATOR "${FEATURE_DEFINES_WITH_SPACE_SEPARATOR} ${_feature}")
ENDFOREACH()     


##################################################
# Generators                                     #
##################################################

# Create JavaScript C++ code given an IDL input
FOREACH (_idl ${IDL_SRC})
    SET(IDL_FILES_LIST "${IDL_FILES_LIST}${OWB_SOURCE_DIR}/Source/WebCore/${_idl}\n")
ENDFOREACH ()
FILE(WRITE ${IDL_FILES_TMP} ${IDL_FILES_LIST})

ADD_CUSTOM_COMMAND(
    OUTPUT ${SUPPLEMENTAL_DEPENDENCY_FILE} ${WINDOW_CONSTRUCTORS_FILE} ${WORKERGLOBALSCOPE_CONSTRUCTORS_FILE} ${SHAREDWORKERGLOBALSCOPE_CONSTRUCTORS_FILE} ${DEDICATEDWORKERGLOBALSCOPE_CONSTRUCTORS_FILE}  
    DEPENDS ${OWB_SOURCE_DIR}/Source/WebCore/bindings/scripts/preprocess-idls.pl ${SCRIPTS_PREPROCESS_IDLS} ${IDL_SRC}
    COMMAND ${PERL_EXECUTABLE} -I${OWB_SOURCE_DIR}/Source/WebCore/bindings/scripts ${OWB_SOURCE_DIR}/Source/WebCore/bindings/scripts/preprocess-idls.pl --defines "${FEATURE_DEFINES}" --idlFilesList ${IDL_FILES_TMP} --supplementalDependencyFile ${SUPPLEMENTAL_DEPENDENCY_FILE} --windowConstructorsFile ${WINDOW_CONSTRUCTORS_FILE} --workerGlobalScopeConstructorsFile ${WORKERGLOBALSCOPE_CONSTRUCTORS_FILE} --sharedWorkerGlobalScopeConstructorsFile ${SHAREDWORKERGLOBALSCOPE_CONSTRUCTORS_FILE} --dedicatedWorkerGlobalScopeConstructorsFile ${DEDICATEDWORKERGLOBALSCOPE_CONSTRUCTORS_FILE} 
    VERBATIM) 

FOREACH (_file ${IDL_SRC})
    GET_FILENAME_COMPONENT (_name ${_file} NAME_WE)
    ADD_CUSTOM_COMMAND(
        OUTPUT  ${WEBCORE_GENERATED_DIR}/JS${_name}.cpp ${WEBCORE_GENERATED_DIR}/JS${_name}.h
        MAIN_DEPENDENCY ${_file}
        DEPENDS ${OWB_SOURCE_DIR}/Source/WebCore/bindings/scripts/generate-bindings.pl ${SCRIPTS_BINDINGS} ${OWB_SOURCE_DIR}/Source/WebCore/bindings/scripts/CodeGeneratorJS.pm ${SUPPLEMENTAL_DEPENDENCY_FILE} ${IDL_ATTRIBUTES_FILE}
        COMMAND ${PERL_EXECUTABLE} -I${OWB_SOURCE_DIR}/Source/WebCore/bindings/scripts ${OWB_SOURCE_DIR}/Source/WebCore/bindings/scripts/generate-bindings.pl --define "${FEATURE_DEFINES}" --generator JS ${IDL_INCLUDES} --outputDir "${WEBCORE_GENERATED_DIR}" --preprocessor "${CODE_GENERATOR_PREPROCESSOR}" --supplementalDependencyFile ${SUPPLEMENTAL_DEPENDENCY_FILE} --idlAttributesFile ${IDL_ATTRIBUTES_FILE} ${OWB_SOURCE_DIR}/Source/WebCore/${_file}
        VERBATIM)
    LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/JS${_name}.cpp)
ENDFOREACH ()

# All Web Inspector generated files are created with this one call to CodeGeneratorInspector.pm
ADD_CUSTOM_COMMAND(
    OUTPUT ${WEBCORE_GENERATED_DIR}/InspectorProtocolVersion.h
    MAIN_DEPENDENCY inspector/Inspector.json
    DEPENDS ${OWB_SOURCE_DIR}/Source/WebCore/inspector/generate-inspector-protocol-version ${OWB_SOURCE_DIR}/Source/WebCore/inspector/Inspector.json
    COMMAND python ${OWB_SOURCE_DIR}/Source/WebCore/inspector/generate-inspector-protocol-version -o ${WEBCORE_GENERATED_DIR}/InspectorProtocolVersion.h ${OWB_SOURCE_DIR}/Source/WebCore/inspector/Inspector.json
    VERBATIM)

LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/InspectorProtocolVersion.h)           

ADD_CUSTOM_COMMAND(
    OUTPUT ${WEBCORE_GENERATED_DIR}/InspectorBackendDispatcher.cpp ${WEBCORE_GENERATED_DIR}/InspectorBackendDispatcher.h ${WEBCORE_GENERATED_DIR}/InspectorFrontend.cpp ${WEBCORE_GENERATED_DIR}/InspectorFrontend.h ${WEBCORE_GENERATED_DIR}/InspectorTypeBuilder.cpp ${WEBCORE_GENERATED_DIR}/InspectorTypeBuilder.h
    MAIN_DEPENDENCY inspector/Inspector.json
    DEPENDS ${OWB_SOURCE_DIR}/Source/WebCore/inspector/CodeGeneratorInspector.py
    COMMAND python ${OWB_SOURCE_DIR}/Source/WebCore/inspector/CodeGeneratorInspector.py ${OWB_SOURCE_DIR}/Source/WebCore/inspector/Inspector.json --output_h_dir "${WEBCORE_GENERATED_DIR}" --output_cpp_dir "${WEBCORE_GENERATED_DIR}" --output_js_dir "${WEBCORE_GENERATED_DIR}" --write_always  
    VERBATIM)      
LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/InspectorBackendDispatcher.cpp ${WEBCORE_GENERATED_DIR}/InspectorFrontend.cpp ${WEBCORE_GENERATED_DIR}/InspectorTypeBuilder.cpp)

# Generate InspectorOverlayPage.h
ADD_CUSTOM_COMMAND(
    OUTPUT ${WEBCORE_GENERATED_DIR}/InspectorOverlayPage.h
    MAIN_DEPENDENCY inspector/InspectorOverlayPage.html
    COMMAND ${PERL_EXECUTABLE} ${OWB_SOURCE_DIR}/Source/WebCore/inspector/xxd.pl InspectorOverlayPage_html ${OWB_SOURCE_DIR}/Source/WebCore/inspector/InspectorOverlayPage.html ${WEBCORE_GENERATED_DIR}/InspectorOverlayPage.h
    VERBATIM)
LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/InspectorOverlayPage.h)


# Generate InjectedScriptSource.h
ADD_CUSTOM_COMMAND(
    OUTPUT ${WEBCORE_GENERATED_DIR}/InjectedScriptSource.h
    MAIN_DEPENDENCY inspector/InjectedScriptSource.js
    COMMAND ${PERL_EXECUTABLE} ${OWB_SOURCE_DIR}/Source/WebCore/inspector/xxd.pl InjectedScriptSource_js ${OWB_SOURCE_DIR}/Source/WebCore/inspector/InjectedScriptSource.js ${WEBCORE_GENERATED_DIR}/InjectedScriptSource.h
    VERBATIM)
LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/InjectedScriptSource.h)    

# Generate InjectedScriptCanvasModuleSource.h 
ADD_CUSTOM_COMMAND(
    OUTPUT ${WEBCORE_GENERATED_DIR}/InjectedScriptCanvasModuleSource.h
    MAIN_DEPENDENCY inspector/InjectedScriptCanvasModuleSource.js
    COMMAND ${PERL_EXECUTABLE} ${OWB_SOURCE_DIR}/Source/WebCore/inspector/xxd.pl InjectedScriptCanvasModuleSource_js ${OWB_SOURCE_DIR}/Source/WebCore/inspector/InjectedScriptCanvasModuleSource.js ${WEBCORE_GENERATED_DIR}/InjectedScriptCanvasModuleSource.h
    VERBATIM)
    LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/InjectedScriptCanvasModuleSource.h)

MAKE_HASH_TOOLS(${OWB_SOURCE_DIR}/Source/WebCore/platform/ColorData)         
LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/ColorData.cpp)

# Generate XMLViewerCSS.h
ADD_CUSTOM_COMMAND(
    OUTPUT ${WEBCORE_GENERATED_DIR}/XMLViewerCSS.h
    MAIN_DEPENDENCY xml/XMLViewer.css
    COMMAND ${PERL_EXECUTABLE} ${OWB_SOURCE_DIR}/Source/WebCore/inspector/xxd.pl XMLViewer_css ${OWB_SOURCE_DIR}/Source/WebCore/xml/XMLViewer.css ${WEBCORE_GENERATED_DIR}/XMLViewerCSS.h
    VERBATIM)
LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/XMLViewerCSS.h)

# Generate XMLViewerJS.h
ADD_CUSTOM_COMMAND(
    OUTPUT ${WEBCORE_GENERATED_DIR}/XMLViewerJS.h
    MAIN_DEPENDENCY xml/XMLViewer.js
    COMMAND ${PERL_EXECUTABLE} ${OWB_SOURCE_DIR}/Source/WebCore/inspector/xxd.pl XMLViewer_js ${OWB_SOURCE_DIR}/Source/WebCore/xml/XMLViewer.js ${WEBCORE_GENERATED_DIR}/XMLViewerJS.h
    VERBATIM)
LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/XMLViewerJS.h)

# Generate HTML entity table
ADD_CUSTOM_COMMAND(
    OUTPUT ${WEBCORE_GENERATED_DIR}/HTMLEntityTable.cpp
	MAIN_DEPENDENCY ${OWB_SOURCE_DIR}/Source/WebCore/html/parser/HTMLEntityNames.in
	DEPENDS ${OWB_SOURCE_DIR}/Source/WebCore/html/parser/create-html-entity-table
	COMMAND python ${OWB_SOURCE_DIR}/Source/WebCore/html/parser/create-html-entity-table -o ${WEBCORE_GENERATED_DIR}/HTMLEntityTable.cpp ${OWB_SOURCE_DIR}/Source/WebCore/html/parser/HTMLEntityNames.in
    VERBATIM)
LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/HTMLEntityTable.cpp)

# Replace ";" with "space" in order to recognize feature definition in css files.
SET(FEATURE_DEFINES_WITH_SPACE_SEPARATOR "")
FOREACH(_feature ${FEATURE_DEFINES})
    # filter out color input since we have our own solution
    IF (NOT CMAKE_SYSTEM_NAME MATCHES "QNX" OR NOT _feature MATCHES "ENABLE_INPUT_TYPE_COLOR")
        SET(FEATURE_DEFINES_WITH_SPACE_SEPARATOR "${FEATURE_DEFINES_WITH_SPACE_SEPARATOR} ${_feature}")
    ENDIF()
ENDFOREACH()


# Generate CSS property names
ADD_CUSTOM_COMMAND (
    OUTPUT ${WEBCORE_GENERATED_DIR}/CSSPropertyNames.in ${WEBCORE_GENERATED_DIR}/CSSPropertyNames.h ${WEBCORE_GENERATED_DIR}/CSSPropertyNames.cpp ${WEBCORE_GENERATED_DIR}/CSSPropertyNames.gperf
    MAIN_DEPENDENCY ${OWB_SOURCE_DIR}/Source/WebCore/css/makeprop.pl
    DEPENDS ${WEBCORE_CSS_PROPERTY_NAMES}
    WORKING_DIRECTORY ${WEBCORE_GENERATED_DIR}
    COMMAND ${PERL_EXECUTABLE} -ne "print" ${WEBCORE_CSS_PROPERTY_NAMES} > ${WEBCORE_GENERATED_DIR}/CSSPropertyNames.in
    COMMAND ${PERL_EXECUTABLE} -I${OWB_SOURCE_DIR}/Source/WebCore/bindings/scripts ${OWB_SOURCE_DIR}/Source/WebCore/css/makeprop.pl --defines "${FEATURE_DEFINES}"  --preprocessor "${CODE_GENERATOR_PREPROCESSOR}"
    VERBATIM)
LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/CSSPropertyNames.cpp)
ADD_SOURCE_DERIVED_DEPENDENCIES(${OWB_SOURCE_DIR}/Source/WebCore/css/CSSParser.cpp CSSValueKeywords.h)
ADD_SOURCE_DERIVED_DEPENDENCIES(${WEBCORE_GENERATED_DIR}/CSSGrammar.cpp CSSPropertyNames.h)

# Generate CSS value keywords
ADD_CUSTOM_COMMAND (
    OUTPUT ${WEBCORE_GENERATED_DIR}/CSSValueKeywords.in ${WEBCORE_GENERATED_DIR}/CSSValueKeywords.h ${WEBCORE_GENERATED_DIR}/CSSValueKeywords.cpp ${WEBCORE_GENERATED_DIR}/CSSValueKeywords.gperf
    MAIN_DEPENDENCY ${OWB_SOURCE_DIR}/Source/WebCore/css/makevalues.pl
    DEPENDS ${WEBCORE_CSS_VALUE_KEYWORDS}
    WORKING_DIRECTORY ${WEBCORE_GENERATED_DIR}
    COMMAND ${PERL_EXECUTABLE} -ne "print" ${WEBCORE_CSS_VALUE_KEYWORDS} > ${WEBCORE_GENERATED_DIR}/CSSValueKeywords.in      
    COMMAND ${PERL_EXECUTABLE} -I${OWB_SOURCE_DIR}/Source/WebCore/bindings/scripts ${OWB_SOURCE_DIR}/Source/WebCore/css/makevalues.pl --defines "${FEATURE_DEFINES}" --preprocessor "${CODE_GENERATOR_PREPROCESSOR}"
    VERBATIM)
LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/CSSValueKeywords.cpp)
ADD_SOURCE_DERIVED_DEPENDENCIES(${OWB_SOURCE_DIR}/Source/WebCore/css/CSSParser.cpp CSSValueKeywords.h)
ADD_SOURCE_DERIVED_DEPENDENCIES(${OWB_SOURCE_DIR}/Source/WebCore/css/CSSPrimitiveValueMappings.h CSSValueKeywords.h)
ADD_SOURCE_DERIVED_DEPENDENCIES(${WEBCORE_GENERATED_DIR}/CSSGrammar.cpp CSSValueKeywords.h)


# Generate user agent styles
ADD_CUSTOM_COMMAND(
    OUTPUT ${WEBCORE_GENERATED_DIR}/UserAgentStyleSheetsData.cpp ${WEBCORE_GENERATED_DIR}/UserAgentStyleSheets.h
    MAIN_DEPENDENCY ${OWB_SOURCE_DIR}/Source/WebCore/css/make-css-file-arrays.pl
    DEPENDS ${WEBCORE_USER_AGENT_STYLE_SHEETS} ${OWB_SOURCE_DIR}/Source/WebCore/bindings/scripts/preprocessor.pm
    COMMAND ${PERL_EXECUTABLE} -I${OWB_SOURCE_DIR}/Source/WebCore/bindings/scripts ${OWB_SOURCE_DIR}/Source/WebCore/css/make-css-file-arrays.pl --defines "${FEATURE_DEFINES}" --preprocessor "${CODE_GENERATOR_PREPROCESSOR}" ${WEBCORE_GENERATED_DIR}/UserAgentStyleSheets.h ${WEBCORE_GENERATED_DIR}/UserAgentStyleSheetsData.cpp ${WEBCORE_USER_AGENT_STYLE_SHEETS}

    VERBATIM)
LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/UserAgentStyleSheetsData.cpp)
ADD_SOURCE_DERIVED_DEPENDENCIES(${OWB_SOURCE_DIR}/Source/WebCore/css/StyleResolver.cpp UserAgentStyleSheetsData.cpp UserAgentStyleSheets.h)


GENERATE_GRAMMAR(cssyy ${OWB_SOURCE_DIR}/Source/WebCore/css/CSSGrammar.y.in ${WEBCORE_GENERATED_DIR}/CSSGrammar.h ${WEBCORE_GENERATED_DIR}/CSSGrammar.cpp "${FEATURE_DEFINES}")
LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/CSSGrammar.cpp)

IF(ENABLE_XPATH)
GENERATE_GRAMMAR(xpathyy ${OWB_SOURCE_DIR}/Source/WebCore/xml/XPathGrammar.y ${WEBCORE_GENERATED_DIR}/XPathGrammar.h ${WEBCORE_GENERATED_DIR}/XPathGrammar.cpp "")
LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/XPathGrammar.cpp)
ENDIF(ENABLE_XPATH)


ADD_SOURCE_DERIVED_DEPENDENCIES(${OWB_SOURCE_DIR}/Source/WebCore/html/HTMLTreeBuilder.cpp MathMLNames.cpp)


GENERATE_DOM_NAMES(HTML ${OWB_SOURCE_DIR}/Source/WebCore/html/HTMLAttributeNames.in ${OWB_SOURCE_DIR}/Source/WebCore/html/HTMLTagNames.in "${HTML_FEATURES}")
LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/HTMLNames.cpp ${WEBCORE_GENERATED_DIR}/HTMLElementFactory.cpp ${WEBCORE_GENERATED_DIR}/JSHTMLElementWrapperFactory.cpp)

GENERATE_EVENT_FACTORY(${OWB_SOURCE_DIR}/Source/WebCore/dom/EventNames.in EventFactory.cpp)
LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/EventFactory.cpp)

GENERATE_EVENT_FACTORY(${OWB_SOURCE_DIR}/Source/WebCore/dom/EventTargetFactory.in EventTargetInterfaces.h)
ADD_SOURCE_DERIVED_DEPENDENCIES(${OWB_SOURCE_DIR}/Source/WebCore/dom/EventNames.cpp EventTargetInterfaces.h)

GENERATE_EXCEPTION_CODE_DESCRIPTION(${OWB_SOURCE_DIR}/Source/WebCore/dom/DOMExceptions.in ExceptionCodeDescription.cpp)
LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/ExceptionCodeDescription.cpp)

GENERATE_SETTINGS_MACROS(${OWB_SOURCE_DIR}/Source/WebCore/page/Settings.in SettingsMacros.h)
set(IDL_FILES_LIST "${IDL_FILES_LIST}${WEBCORE_GENERATED_DIR}/InternalSettingsGenerated.idl\n") 
list(APPEND IDL_INCLUDES --include=${WEBCORE_GENERATED_DIR}) 
#LIST(APPEND IDL_SRC ${WEBCORE_GENERATED_DIR}/InternalSettingsGenerated.idl)
LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/InternalSettingsGenerated.cpp)

GENERATE_FONT_NAMES(${OWB_SOURCE_DIR}/Source/WebCore/css/WebKitFontFamilyNames.in)
LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/WebKitFontFamilyNames.cpp) 

GENERATE_DOM_NAMES(MathML ${OWB_SOURCE_DIR}/Source/WebCore/mathml/mathattrs.in ${OWB_SOURCE_DIR}/Source/WebCore/mathml/mathtags.in "${MATHML_FEATURES}")
LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/MathMLNames.cpp)
IF (ENABLE_MATHML)
    LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/MathMLElementFactory.cpp)
ENDIF ()


IF(SVG_FLAGS)
	GENERATE_DOM_NAMES(SVG ${OWB_SOURCE_DIR}/Source/WebCore/svg/svgattrs.in ${OWB_SOURCE_DIR}/Source/WebCore/svg/svgtags.in "${SVG_FEATURES}")
ELSE(SVG_FLAGS)
	GENERATE_DOM_NAMES(SVG ${OWB_SOURCE_DIR}/Source/WebCore/svg/svgattrs.in ${OWB_SOURCE_DIR}/Source/WebCore/svg/svgtags.in "")
ENDIF(SVG_FLAGS)
LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/SVGNames.cpp)
IF (ENABLE_SVG)
    LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/SVGElementFactory.cpp ${WEBCORE_GENERATED_DIR}/JSSVGElementWrapperFactory.cpp)
ENDIF ()


GENERATE_DOM_NAMES(XLink ${OWB_SOURCE_DIR}/Source/WebCore/svg/xlinkattrs.in)
LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/XLinkNames.cpp)


GENERATE_DOM_NAMES(XMLNS ${OWB_SOURCE_DIR}/Source/WebCore/xml/xmlnsattrs.in)
LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/XMLNSNames.cpp)

# Generate plug-in resources
add_custom_command(
    OUTPUT ${WEBCORE_GENERATED_DIR}/PlugInsResourcesData.cpp ${WEBCORE_GENERATED_DIR}/PlugInsResources.h
    MAIN_DEPENDENCY ${OWB_SOURCE_DIR}/Source/WebCore/css/make-css-file-arrays.pl
    DEPENDS ${WEBCORE_PLUG_INS_RESOURCES} ${OWB_SOURCE_DIR}/Source/WebCore/bindings/scripts/preprocessor.pm
    COMMAND ${PERL_EXECUTABLE} -I${OWB_SOURCE_DIR}/Source/WebCore/bindings/scripts ${OWB_SOURCE_DIR}/Source/WebCore/css/make-css-file-arrays.pl --defines "${FEATURE_DEFINES_WITH_SPACE_SEPARATOR}" --preprocessor "${CODE_GENERATOR_PREPROCESSOR}" ${WEBCORE_GENERATED_DIR}/PlugInsResources.h ${WEBCORE_GENERATED_DIR}/PlugInsResourcesData.cpp ${WEBCORE_PLUG_INS_RESOURCES}
    VERBATIM)
list(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/PlugInsResourcesData.cpp)

GENERATE_DOM_NAMES(XML ${OWB_SOURCE_DIR}/Source/WebCore/xml/xmlattrs.in)
LIST(APPEND WEBCORE_SRC ${WEBCORE_GENERATED_DIR}/XMLNames.cpp)

#list(APPEND WEBCORE_SRC_NO_BUILD
#	 ${WEBCORE_GENERATED_DIR}/HashTools.h
#	 ${WEBCORE_GENERATED_DIR}/tokenizer.cpp
#)

if(ENABLE_SVG)
    list(APPEND WEBCORE_SRC_NO_BUILD
        ${WEBCORE_GENERATED_DIR}/JSElementTimeControl.cpp
        ${WEBCORE_GENERATED_DIR}/JSSVGAnimatedPathData.cpp
        ${WEBCORE_GENERATED_DIR}/JSSVGAnimatedPoints.cpp
        ${WEBCORE_GENERATED_DIR}/JSSVGExternalResourcesRequired.cpp
        ${WEBCORE_GENERATED_DIR}/JSSVGFilterPrimitiveStandardAttributes.cpp
        ${WEBCORE_GENERATED_DIR}/JSSVGFitToViewBox.cpp
        ${WEBCORE_GENERATED_DIR}/JSSVGLangSpace.cpp
        ${WEBCORE_GENERATED_DIR}/JSSVGLocatable.cpp
        ${WEBCORE_GENERATED_DIR}/JSSVGStylable.cpp
        ${WEBCORE_GENERATED_DIR}/JSSVGTests.cpp
        ${WEBCORE_GENERATED_DIR}/JSSVGTransformable.cpp
        ${WEBCORE_GENERATED_DIR}/JSSVGURIReference.cpp
#        ${WEBCORE_GENERATED_DIR}/JSSVGViewSpec.cpp
#        ${WEBCORE_GENERATED_DIR}/JSSVGZoomAndPan.cpp
    )
endif(ENABLE_SVG)
set_source_files_properties(${WEBCORE_SRC_NO_BUILD}
    PROPERTIES HEADER_FILE_ONLY TRUE)

##################################################
# Compilation settings.                          #
##################################################

if(ENABLE_SQL_DATABASE)
    list(APPEND WEBCORE_INCLUDE_DIRS
        ${OWB_SOURCE_DIR}/Source/WebCore/storage)
endif(ENABLE_SQL_DATABASE)

if(ENABLE_MATHML)
    list(APPEND WEBCORE_INCLUDE_DIRS
        ${OWB_SOURCE_DIR}/Source/WebCore/mathml
    )
endif(ENABLE_MATHML)

include_directories(
    ${BASE_INCLUDE_DIRS}
    ${WTF_INCLUDE_DIRS}
    ${BAL_INCLUDE_DIRS}
    ${WEBCORE_INCLUDE_DIRS}
    ${JAVASCRIPTCORE_INCLUDE_DIRS}
    ${WEBCORE_GENERATED_DIR}
    ${WEBCORE_GENERATED_DIR}/html
    ${WEBCORE_GENERATED_DIR}/mathml
    ${WEBCORE_GENERATED_DIR}/wml
    ${WEBCORE_GENERATED_DIR}/xml
    ${WEBKIT_INCLUDE_DIRS}
    ${EXTERNAL_DEPS_INCLUDE_DIRS})

set_source_files_properties(${WEBCORE_SRC}
    PROPERTIES COMPILE_FLAGS "-fno-exceptions"
)

#string(FIND ${${_CXXFLAGS_VARNAME}} "-O3" _CXXFLAGS_O3_INDEX)                                                                                             
#if (_CXXFLAGS_O3_INDEX GREATER -1)
#   string(REPLACE "-O3" "-O2" _CXXFLAGS ${${_CXXFLAGS_VARNAME}})
#   set_source_files_properties(Modules/websockets/WebSocketDeflater.cpp PROPERTIES COMPILE_FLAGS "${_CXXFLAGS}")
#endif ()

add_library(webcore STATIC ${WEBCORE_SRC})
add_dependencies(webcore jsc)
