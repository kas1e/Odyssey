if(USE_GRAPHICS STREQUAL "AMIGAOS4")
    set(USE_GRAPHICS_AMIGAOS4 TRUE)
    mark_as_advanced(USE_GRAPHICS_AMIGAOS4)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -I${CMAKE_EXTRA_SDK_PATH}/local/common/include/cairo")
endif(USE_GRAPHICS STREQUAL "AMIGAOS4")
                                          
if(USE_GRAPHICS STREQUAL "MORPHOS")       
    set(USE_GRAPHICS_MORPHOS TRUE)        
    mark_as_advanced(USE_GRAPHICS_MORPHOS)	
endif(USE_GRAPHICS STREQUAL "MORPHOS")       

if(USE_GRAPHICS STREQUAL "GTK")
    pkg_check_modules(CAIRO REQUIRED cairo>=1.4)
    pkg_check_modules(GTK REQUIRED gtk+-2.0>=2.8)
    pkg_check_modules(GAIL REQUIRED gail)
    set(GRAPHICS_INCLUDE_DIRS ${GTK_INCLUDE_DIRS} ${GAIL_INCLUDE_DIRS})
    set(GRAPHICS_LIBRARIES ${GTK_LDFLAGS} ${GAIL_LDFLAGS})

    set(USE_GRAPHICS_GTK TRUE)
    mark_as_advanced(USE_GRAPHICS_GTK)

    set(REQUIREMENT "gtk+-2.0 >= 2.8")
    set(DEB_PACKAGE_DEPENDS "${DEB_PACKAGE_DEPENDS}, libcairo2 (>= 1.8.8-2ubuntu1), libgtk2.0-0 (>= 2.18.3-1ubuntu2.1), libgail18 (>= 2.18.3-1ubuntu2.1)")
endif(USE_GRAPHICS STREQUAL "GTK")

if(USE_GRAPHICS STREQUAL "QT")
    FIND_PACKAGE(Qt4)
    pkg_check_modules(QTGRAPHIC REQUIRED QtGui)
    set(GRAPHICS_INCLUDE_DIRS ${QTGRAPHIC_INCLUDE_DIRS})
    set(GRAPHICS_LIBRARIES ${QTGRAPHIC_LDFLAGS})

    set(USE_GRAPHICS_QT TRUE)
    mark_as_advanced(USE_GRAPHICS_QT)
    set(DEB_PACKAGE_DEPENDS "${DEB_PACKAGE_DEPENDS}, libqtgui4 (>= 4.5.3really4.5.2-0ubuntu1)")
endif(USE_GRAPHICS STREQUAL "QT")

if(USE_GRAPHICS MATCHES "^SDL*")
    IF(NOT WIN32)
        pkg_check_modules(SDL REQUIRED sdl>=1.2.10)
    ELSE(NOT WIN32)
        ## We haven't got a good pkg-config under Windows so we let cmake search libs
        find_path(SDL_INCLUDE_DIRS SDL.h ${WINLIB_INC_PATH} ${WINLIB_INC_PATH}/SDL)
        find_file(SDL_LIB SDL.lib ${WINLIB_LIB_PATH} ${WINLIB_LIB_PATH}/SDL)
        find_file(SDL_MAIN_LIB SDLmain.lib ${WINLIB_LIB_PATH} ${WINLIB_LIB_PATH}/SDL)
    ENDIF(NOT WIN32)
    if(USE_GRAPHICS STREQUAL "SDLCAIRO")
        pkg_check_modules(CAIRO REQUIRED cairo>=1.4)
        set(GRAPHICS_INCLUDE_DIRS ${SDL_INCLUDE_DIRS} ${CAIRO_INCLUDE_DIR} )
        set(GRAPHICS_LIBRARIES ${SDL_LDFLAGS} ${CAIRO_LIBRARY})
        set(REQUIREMENT "cairo >= 1.4")

        set(USE_GRAPHICS_SDLCAIRO TRUE)
        mark_as_advanced(USE_GRAPHICS_SDLCAIRO)
        set(USE_GRAPHICS_CAIRO TRUE)
        mark_as_advanced(USE_GRAPHICS_CAIRO)
        set(DEB_PACKAGE_DEPENDS "${DEB_PACKAGE_DEPENDS}, libcairo2 (>= 1.8.8-2ubuntu1)")
    endif(USE_GRAPHICS STREQUAL "SDLCAIRO")

    if(USE_GRAPHICS STREQUAL "SDL")
        include(FindSDL_gfx)
        set(GRAPHICS_INCLUDE_DIRS ${SDL_INCLUDE_DIRS} ${SDLGFX_INCLUDE_DIR})
        set(GRAPHICS_LIBRARIES ${SDL_LDFLAGS} ${SDLGFX_LIBRARY})

        set(USE_GRAPHICS_SDL TRUE)
        mark_as_advanced(USE_GRAPHICS_SDL)
    endif(USE_GRAPHICS STREQUAL "SDL")

    set(USE_API_SDL TRUE)
    mark_as_advanced(USE_API_SDL)

    set(USE_MEDIA_GENERIC TRUE)
    mark_as_advanced(USE_MEDIA_GENERIC)

    set(USE_GRAPHICS_GENERIC TRUE)
    mark_as_advanced(USE_GRAPHICS_GENERIC)

    set(REQUIREMENT "sdl >= 1.2.10")
    set(DEB_PACKAGE_DEPENDS "${DEB_PACKAGE_DEPENDS}, libsdl1.2debian (>= 1.2.13-4ubuntu4), libsdl-gfx1.2-4 (>= 2.0.19-2)")
endif(USE_GRAPHICS MATCHES "^SDL*")
