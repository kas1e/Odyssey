##################################################
# Types support part.                            #
##################################################

set(TYPES_DIR ${BAL_DIR}/Types/WebCore)

create_include_link(${TYPES_DIR}/Common BAL)
create_include_link(${TYPES_DIR}/WK BAL)

aux_source_directory(${TYPES_DIR}/Common WEBCORE_SRC)
aux_source_directory(${TYPES_DIR}/WK WEBCORE_SRC)

if(USE_GRAPHICS_GTK)
    create_include_link(${TYPES_DIR}/Gtk BAL)
    aux_source_directory(${TYPES_DIR}/Gtk WEBCORE_SRC)
endif(USE_GRAPHICS_GTK)

if(USE_GRAPHICS_MORPHOS)
    create_include_link(${TYPES_DIR}/MorphOS BAL)
    list(APPEND WEBCORE_SRC
        ${TYPES_DIR}/MorphOS/BCIconMorphOS.cpp
        ${TYPES_DIR}/MorphOS/BCSharedBufferMorphOS.cpp
        ${TYPES_DIR}/MorphOS/BCKURLMorphOS.cpp
    )
endif(USE_GRAPHICS_MORPHOS)

if(USE_GRAPHICS_QT)
    aux_source_directory(${TYPES_DIR}/Qt WEBCORE_SRC)
endif(USE_GRAPHICS_QT)

if(USE_TYPES_GENERIC)
    create_include_link(${TYPES_DIR}/Generic BAL)
    aux_source_directory(${TYPES_DIR}/Generic WEBCORE_SRC)
endif(USE_TYPES_GENERIC)
