##################################################
# Widgets support part.                          #
##################################################

set(WIDGETS_DIR ${BAL_DIR}/Widgets/WebCore)

create_include_link(${WIDGETS_DIR}/WK BAL)

if(USE_WIDGETS_GENERIC)
    create_include_link(${WIDGETS_DIR}/Generic BAL)

    aux_source_directory(${WIDGETS_DIR}/Generic WEBCORE_SRC)
endif(USE_WIDGETS_GENERIC)

if(USE_GRAPHICS_AMIGAOS4)
    create_include_link(${WIDGETS_DIR}/AmigaOS4 BAL)

    aux_source_directory(${WIDGETS_DIR}/AmigaOS4 WEBCORE_SRC)
endif(USE_GRAPHICS_AMIGAOS4)

if(USE_GRAPHICS_GTK)
    create_include_link(${WIDGETS_DIR}/Gtk BAL)

    aux_source_directory(${WIDGETS_DIR}/Gtk WEBCORE_SRC)
endif(USE_GRAPHICS_GTK)

if(USE_GRAPHICS_QT)
    create_include_link(${WIDGETS_DIR}/Qt BAL)

    aux_source_directory(${WIDGETS_DIR}/Qt WEBCORE_SRC)
    owb_generate_moc(WEBCORE_SRC ${OWB_SOURCE_DIR}/BAL/Widgets/WebCore/Qt/QWebPopup.h moc_QWebPopup.cpp)
    owb_generate_moc(WEBCORE_SRC ${OWB_SOURCE_DIR}/BAL/Widgets/WebCore/Qt/BCQtFallbackWebPopupQt.h moc_QtFallbackWebPopup.cpp)
endif(USE_GRAPHICS_QT)

if(USE_WIDGETS_SDL)
    create_include_link(${WIDGETS_DIR}/SDL BAL)

    aux_source_directory(${WIDGETS_DIR}/SDL WEBCORE_SRC)
endif(USE_WIDGETS_SDL)

if(USE_GRAPHICS_MORPHOS)
    create_include_link(${WIDGETS_DIR}/MorphOS BAL)

    aux_source_directory(${WIDGETS_DIR}/MorphOS WEBCORE_SRC)
endif(USE_GRAPHICS_MORPHOS)

aux_source_directory(${WIDGETS_DIR}/WK WEBCORE_SRC)
