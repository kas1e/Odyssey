set(GRAPHICS_DIR ${OWB_SOURCE_DIR}/BAL/Graphics/WebKit)

if(USE_GRAPHICS_GTK)
    aux_source_directory(${GRAPHICS_DIR}/Gtk WEBKIT_SRC)
endif(USE_GRAPHICS_GTK)

if(USE_GRAPHICS_QT)
    aux_source_directory(${GRAPHICS_DIR}/Qt WEBKIT_SRC)
endif(USE_GRAPHICS_QT)

if(USE_API_SDL)
    aux_source_directory(${GRAPHICS_DIR}/Generic WEBKIT_SRC)
endif(USE_API_SDL)

if(USE_GRAPHICS_MORPHOS)
    aux_source_directory(${GRAPHICS_DIR}/MorphOS WEBKIT_SRC)
endif(USE_GRAPHICS_MORPHOS)