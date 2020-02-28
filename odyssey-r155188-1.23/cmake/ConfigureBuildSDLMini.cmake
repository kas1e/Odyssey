if(UNIX)
    execute_process(
        COMMAND uname -m
        OUTPUT_VARIABLE PROCESSOR
        ERROR_QUIET
    )
    set(ARCH ${PROCESSOR})
endif(UNIX)

set(ENABLE_DEBUG OFF CACHE BOOLEAN "Enable debug support" FORCE)

set(ENABLE_DATABASE OFF CACHE BOOLEAN "Enable HTML5 client-side database storage support" FORCE)
set(ENABLE_EVENTSOURCE OFF CACHE BOOLEAN "Enable HTML5 server-sent events support" FORCE)
set(ENABLE_GEOLOCATION OFF CACHE BOOLEAN "Enable geoposition support" FORCE)
set(ENABLE_INSPECTOR OFF CACHE BOOLEAN "Enable web inspector support" FORCE)

if(ARCH MATCHES "[ix][3-6]*86*")
    set(ENABLE_JIT_JSC ON CACHE BOOLEAN "Enable JavascriptCore JIT compilation (for x86 only)" FORCE)
endif(ARCH MATCHES "[ix][3-6]*86*")

if(ARCH MATCHES "[ix][3-6]*86*")
    set(ENABLE_YARR ON CACHE BOOLEAN "Enable RegExp JIT compilation (for x86 and x86_64 only)" FORCE)
endif(ARCH MATCHES "[ix][3-6]*86*")

set(ENABLE_MULTIPLE_THREADS ON CACHE BOOLEAN "Enable multiple threads" FORCE)
set(ENABLE_WORKERS ON CACHE BOOLEAN "Enable workers support" FORCE)
set(ENABLE_SHARED_WORKERS OFF CACHE BOOLEAN "Enable shared workers support" FORCE)

set(ENABLE_NPAPI OFF CACHE BOOLEAN "Enable Netscape Plugin API support" FORCE)

set(ENABLE_SVG OFF CACHE BOOLEAN "Enable SVG support" FORCE)

set(ENABLE_VIDEO OFF CACHE BOOLEAN "Enable HTML5 video support" FORCE)
set(ENABLE_WEB_SOCKETS OFF CACHE BOOLEAN "Enable Web Sockets support" FORCE)
set(ENABLE_WML OFF CACHE BOOLEAN "Enable WML support" FORCE)
set(ENABLE_XPATH OFF CACHE BOOLEAN "Enable XPath support"FORCE)
set(ENABLE_XSLT OFF CACHE BOOLEAN "Enable XSLT support"FORCE)

set(USE_FILESYSTEM_ACCESS "POSIX" CACHE STRING "Choose the filesystem access method, options are: GLIB POSIX" FORCE)
set(USE_FONTS "EMBEDDED" CACHE STRING "Choose the font engine, options are: GTK FREETYPE EMBEDDED" FORCE)
set(USE_GRAPHICS "SDL" CACHE STRING "Choose the graphic backend, options are: GTK SDL" FORCE)
set(USE_I18N "EMBEDDED" CACHE STRING "Choose the internationalization library, options are: ICU EMBEDDED GLIB QT" FORCE)
set(USE_THREADS "PTHREADS" CACHE STRING "Choose the thread backend, options are: GTHREADS PTHREADS NONE" FORCE)
set(USE_TIMER "LINUX" CACHE STRING "Choose the timer backend, options are: GLIB LINUX" FORCE)
