set(WIDGETS_DIR ${OWB_SOURCE_DIR}/BAL/Widgets/WebKit)

#include_directories(
#    ${WIDGETS_DIR}/Generic
#)
#aux_source_directory(${WIDGETS_DIR}/Generic WEBKIT_SRC)

if(USE_GRAPHICS_GTK)
    add_custom_command(OUTPUT ${OWB_BINARY_DIR}/generated_sources/WebKit/webkit-marshal.h ${OWB_BINARY_DIR}/generated_sources/WebKit/webkit-marshal.cpp
        WORKING_DIRECTORY ${OWB_BINARY_DIR}
        COMMAND mkdir -p generated_sources/WebKit
        COMMAND echo 'extern \"C\" {' > ${OWB_BINARY_DIR}/generated_sources/WebKit/webkit-marshal.h
        COMMAND glib-genmarshal --prefix=webkit_marshal ${OWB_SOURCE_DIR}/BAL/Widgets/WebKit/Gtk/webkit-marshal.list --header >> generated_sources/WebKit/webkit-marshal.h
        COMMAND echo '}' >> ${OWB_BINARY_DIR}/generated_sources/WebKit/webkit-marshal.h

        COMMAND echo 'extern \"C\" {' > ${OWB_BINARY_DIR}/generated_sources/WebKit/webkit-marshal.cpp
        COMMAND glib-genmarshal --prefix=webkit_marshal ${OWB_SOURCE_DIR}/BAL/Widgets/WebKit/Gtk/webkit-marshal.list --body >> generated_sources/WebKit/webkit-marshal.cpp
        COMMAND echo '}' >> ${OWB_BINARY_DIR}/generated_sources/WebKit/webkit-marshal.cpp
        DEPENDS ${OWB_SOURCE_DIR}/BAL/Widgets/WebKit/Gtk/webkit-marshal.list
    )

    aux_source_directory(${WIDGETS_DIR}/Gtk WEBKIT_SRC)
    list(APPEND WEBKIT_SRC
        ${CMAKE_BINARY_DIR}/generated_sources/WebKit/webkit-marshal.cpp
    )
    include_directories(
        ${WIDGETS_DIR}/Gtk
        ${OWB_BINARY_DIR}/generated_sources/WebKit
    )
    list(REMOVE_ITEM WEBKIT_SRC
        ${WIDGETS_DIR}/Generic/WebPopup.cpp
    )
endif(USE_GRAPHICS_GTK)

if(USE_GRAPHICS_QT)
    aux_source_directory(${WIDGETS_DIR}/Qt WEBKIT_SRC)
    include_directories(
        ${WIDGETS_DIR}/Qt
    )
    list(REMOVE_ITEM WEBKIT_SRC
        ${WIDGETS_DIR}/Generic/WebPopup.cpp
    )
endif(USE_GRAPHICS_QT)

if(USE_API_SDL)
    aux_source_directory(${WIDGETS_DIR}/SDL WEBKIT_SRC)
    include_directories(
        ${WIDGETS_DIR}/SDL
    )
endif(USE_API_SDL)
