
##################################################
#                                                #
# Main CMakeLists for Origyn Web Project.        #
#                                                #
##################################################

project(OWB CXX C)

cmake_minimum_required(VERSION 2.6.2)

execute_process(COMMAND ./FindCMakeModulesPath.py
   WORKING_DIRECTORY ${OWB_SOURCE_DIR}
   OUTPUT_VARIABLE EXTRA_MODULE_PATH
)

set(CMAKE_MODULE_PATH ${EXTRA_MODULE_PATH})
set(EXECUTABLE_OUTPUT_PATH ${OWB_BINARY_DIR}/bin)
set(LIBRARY_OUTPUT_PATH ${OWB_BINARY_DIR}/lib)

set(WEBKIT_VERSION 2.0)

##################################################
# Set options for compiler below.                #
##################################################

include(CMakeDependentOption)

option(ENABLE_3D_CANVAS "Enable 3D canvas support")
option(ENABLE_3D_RENDERING "Enable 3d rendering support")
option(ENABLE_ACCESSIBILITY "Enable accessibility support" ON)
option(ENABLE_BLOB "Enable Blob support" ON)
option(ENABLE_CHANNEL_MESSAGING "Enable Channel messaging support" ON)
option(ENABLE_FILE_SYSTEM "Enable Filesystem support" ON)
option(ENABLE_SQL_DATABASE "Enable HTML5 client-side database storage support" ON)
cmake_dependent_option(ENABLE_DOM_STORAGE "Enable HTML5 client-side session and persistent storage support" ON ENABLE_SQL_DATABASE ON)
cmake_dependent_option(ENABLE_ICONDATABASE "Enable icon database support" ON ENABLE_SQL_DATABASE ON)
cmake_dependent_option(ENABLE_INDEXED_DATABASE "Enable indexed database support" OFF ENABLE_SQL_DATABASE ON)
cmake_dependent_option(ENABLE_OFFLINE_WEB_APPLICATIONS "Enable HTML5 offline web applications support" ON ENABLE_SQL_DATABASE ON)
cmake_dependent_option(ENABLE_OFFLINE_DYNAMIC_ENTRIES "Enable HTML5 offline dynamic entries support" ON ENABLE_OFFLINE_WEB_APPLICATIONS ON)
option(ENABLE_DATALIST "Enable datalist support" ON)
option(ENABLE_DATA_TRANSFER_ITEMS "Enable data transfer items support")
option(ENABLE_DEBUG "Enable debug support")
option(ENABLE_DEVICE_ORIENTATION "Enable device orientation support" ON)
option(ENABLE_EVENTSOURCE "Enable HTML5 server-sent events support" ON)
cmake_dependent_option(ENABLE_FAST_MALLOC "Enable optimized memory allocator" ON "NOT ENABLE_DEBUG" ON)
cmake_dependent_option(ENABLE_FILE_READER "Enable support for async read file operations" ON ENABLE_WORKERS OFF)
cmake_dependent_option(ENABLE_FILE_WRITER "Enable support for async write file operations" ON ENABLE_WORKERS OFF)
option(ENABLE_FILTERS "Enable support for filters" ON)
option(ENABLE_FULLSCREEN_API "Enable fullscreen api support" ON)
option(ENABLE_FTPDIR "Enable ftp directory support" ON)
option(ENABLE_GEOLOCATION "Enable geoposition support" ON)
option(ENABLE_INSPECTOR "Enable web inspector support" ON)
option(ENABLE_JAVASCRIPT_DEBUGGER "Enable javascript debugger support")
option(ENABLE_JIT_JSC "Enable JavascriptCore JIT compilation (for x86 only)")
option(ENABLE_OWB_TRACES "Enable OWB-specific traces" OFF)
option(ENABLE_DETAILS "Enable Details support" ON)
option(ENABLE_INPUT_TYPE_COLOR "Enable Input Color support" ON)
option(ENABLE_MATHML "Enable MathML support" ON)
option(ENABLE_METER_TAG "Enable Meter tag support" ON)
option(ENABLE_MICRODATA "Enable MicroData support" ON)
option(ENABLE_PROGRESS_TAG "Enable Progress tag support" ON)
option(ENABLE_MULTIPLE_THREADS "Enable multiple threads")
cmake_dependent_option(ENABLE_WORKERS "Enable workers support" OFF ENABLE_MULTIPLE_THREADS OFF)
cmake_dependent_option(ENABLE_SHARED_WORKERS "Enable shared workers support" OFF ENABLE_WORKERS OFF)
option(ENABLE_NOTIFICATIONS "Enable notification support" ON)
option(ENABLE_NPAPI "Enable Netscape Plugin API support" ON)
option(ENABLE_REGISTER_PROTOCOL_HANDLER "Enable Register Protocol Handler support" ON)
option(ENABLE_RUBY "Enable HTML5 ruby support" ON)
option(ENABLE_SANDBOX "Enable HTML5 sandbox attribute for iframes" ON)
option(ENABLE_SVG "Enable SVG support" ON)
cmake_dependent_option(ENABLE_SVG_ANIMATION "Enable support for SVG animation (EXPERIMENTAL)" ON ENABLE_SVG ON)
cmake_dependent_option(ENABLE_SVG_AS_IMAGE "Enable SVG as Image support (EXPERIMENTAL)" ON ENABLE_SVG ON)
cmake_dependent_option(ENABLE_SVG_FONTS "Enable support for SVG fonts (EXPERIMENTAL)" ON ENABLE_SVG ON)
cmake_dependent_option(ENABLE_SVG_FOREIGN_OBJECT "Enable support for SVG foreign objects (EXPERIMENTAL)" ON ENABLE_SVG ON)
cmake_dependent_option(ENABLE_SVG_USE_ELEMENT "Enable support for SVG use element (EXPERIMENTAL)" ON ENABLE_SVG ON)
option(ENABLE_TESTS "Enable tests" OFF)
cmake_dependent_option(ENABLE_TESTS_CPPUNIT "Enable unit tests based on cppunit framework" OFF ENABLE_TESTS OFF)
option(ENABLE_TILED_BACKING_STORE "Enable tiled backing store support" OFF)
option(ENABLE_TOUCH_EVENTS "Enable touch events support" OFF)
option(ENABLE_VIDEO "Enable HTML5 video support" ON)
option(ENABLE_VIDEO_TRACK "Enable HTML5 video track support" ON) 
option(ENABLE_MEDIA_STATISTICS "Enable media statistics support" ON)
option(ENABLE_WEB_AUDIO "Enable Web Audio support")
option(ENABLE_WEB_TIMING "Enable Web Timing support" ON) 
option(ENABLE_WEB_SOCKETS "Enable Web Sockets support" ON)
option(ENABLE_WCSS "Enable WCSS support")
option(ENABLE_XHTMLMP "Enable XHTML Mobile profile.")
option(ENABLE_XPATH "Enable XPath support" ON)
option(ENABLE_XSLT "Enable XSLT support" ON)
option(ENABLE_YARR "Enable RegExp compilation (for x86 and x86_64 only)")

set(USE_FILESYSTEM_ACCESS "POSIX" CACHE STRING "Choose the filesystem access method, options are: GLIB POSIX QT")
set(USE_FONTS "FREETYPE" CACHE STRING "Choose the font engine, options are: GTK CAIRO FREETYPE EMBEDDED QT")
set(USE_GRAPHICS "MORPHOS" CACHE STRING "Choose the graphic backend, options are: GTK SDL SDLCAIRO QT")
set(USE_I18N "ICU" CACHE STRING "Choose the internationalization library, options are: ICU EMBEDDED GLIB QT")
set(USE_NETWORK "CURL" CACHE STRING "Choose the network backend, options are: CURL QT SOUP")
set(USE_THREADS "MORPHOS" CACHE STRING "Choose the thread backend, options are: PTHREADS NONE QT")
set(USE_TIMER "MORPHOS" CACHE STRING "Choose the timer backend, options are: GLIB LINUX QT")

set(WITH_OWB_CONFIG_DIR "PROGDIR:conf/owb.conf" CACHE STRING "Set configuration directory for owb")

#
set(ENABLE_LLINT ON)
set(ENABLE_ANIMATION_API ON)
set(ENABLE_CHANNEL_MESSAGING ON)
set(ENABLE_CSS_BOX_DECORATION_BREAK ON)
set(ENABLE_CSS_IMAGE_SET ON)
set(ENABLE_DATALIST_ELEMENT ON)
#set(ENABLE_DATA_TRANSFER_ITEMS ON)
set(ENABLE_DETAILS_ELEMENT ON)
set(ENABLE_IFRAME_SEAMLESS ON)
#set(ENABLE_INDEXED_DATABASE ON)
set(ENABLE_INPUT_TYPE_COLOR ON)

set(ENABLE_INPUT_TYPE_DATE ON)
set(ENABLE_INPUT_TYPE_DATETIME_INCOMPLETE ON)
set(ENABLE_INPUT_TYPE_DATETIMELOCAL ON)
set(ENABLE_INPUT_TYPE_MONTH ON)
set(ENABLE_INPUT_TYPE_TIME ON)
set(ENABLE_INPUT_TYPE_WEEK ON)
set(ENABLE_DATE_AND_TIME_INPUT_TYPES ON)

set(ENABLE_LEGACY_NOTIFICATIONS ON)
set(ENABLE_MEDIA_SOURCE OFF)
set(ENABLE_MEDIA_STATISTICS ON)
set(ENABLE_METER_ELEMENT ON)
set(ENABLE_PROGRESS_ELEMENT ON)
set(ENABLE_SHADOW_DOM OFF)
set(ENABLE_STYLE_SCOPED ON)
set(ENABLE_UNDO_MANAGER ON)
set(ENABLE_VIDEO_TRACK ON)
set(ENABLE_VIEW_MODE_CSS_MEDIA ON)

set(ENABLE_POINTER_LOCK ON)
set(ENABLE_PAGE_VISIBILITY_API ON)
#set(ENABLE_REQUEST_ANIMATION_FRAME ON)
#

configure_file(
    ${OWB_SOURCE_DIR}/Base/owb-config.h.in
    ${OWB_SOURCE_DIR}/Base/owb-config.h
)

##################################################
# Check required dependencies for compilation.   #
##################################################

include(CheckBaseDependencies)
include(CheckCppUnit)
include(CheckPlatformSystem)
include(CheckPlatformAccessibility)
include(CheckPlatformEvents)
include(CheckPlatformFacilities)
include(CheckPlatformFileSystem)
include(CheckPlatformFonts)
include(CheckPlatformGeolocation)
include(CheckPlatformGraphics)
include(CheckPlatformImageDecoder)
include(CheckPlatformInternationalization)
include(CheckPlatformNetwork)
include(CheckPlatformThreads)
include(CheckPlatformTimer)
include(CheckPlatformTypes)
include(CheckPlatformVideoSupport)
include(CheckPlatformWidgets)
include(CheckNPAPI)
include(CheckSqlite3)
include(CheckSVG)
include(CheckXSLT)

##################################################
# Set options for compiler below.                #
##################################################

include(AddGlobalCompilerFlags)


##################################################
# Add subdirectories for project                 #
# and set some useful vars.                      #
##################################################

include(DefineOwbMacros)
include(SetCMakeVars)

include(Base/CMakeLists.txt)
add_subdirectory(Source/WTF/wtf)
add_subdirectory(Source/JavaScriptCore)
add_subdirectory(Source/WebCore)
add_subdirectory(Source/WebKit/OrigynWebBrowser)
add_subdirectory(Tools/OWBLauncher)

include(Package)

