if(ENABLE_NPAPI)
    if(USE_GRAPHICS_GTK OR USE_GRAPHICS_QT)
        pkg_check_modules(XT REQUIRED xt)
        set(NPAPI_INCLUDE_DIRS ${XT_INCLUDE_DIRS})
        set(NPAPI_LIBRARIES ${XT_LDFLAGS})
        set(DEB_PACKAGE_DEPENDS "${DEB_PACKAGE_DEPENDS}, libxt6 (>= 1:1.0.5-3ubuntu1)")
    endif(USE_GRAPHICS_GTK OR USE_GRAPHICS_QT)

    if(USE_GRAPHICS MATCHES "^SDL*")
        set(USE_NPAPI_SDL TRUE)
        mark_as_advanced(USE_NPAPI_SDL)
    endif(USE_GRAPHICS MATCHES "^SDL*")

endif(ENABLE_NPAPI)
