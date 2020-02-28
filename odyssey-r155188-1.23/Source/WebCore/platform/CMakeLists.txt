if(USE_GRAPHICS_GTK)
    list(APPEND WEBCORE_SRC
        platform/gtk/TemporaryLinkStubs.cpp
    )
endif(USE_GRAPHICS_GTK)

if(USE_GRAPHICS_MORPHOS)
    list(APPEND WEBCORE_SRC
        platform/morphos/TemporaryLinkStubs.cpp
    )
endif(USE_GRAPHICS_MORPHOS)

if(USE_GRAPHICS_QT)
    list(APPEND WEBCORE_SRC
        platform/qt/TemporaryLinkStubs.cpp
    )
endif(USE_GRAPHICS_QT)
