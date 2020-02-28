
##################################################
# Events support part.                           #
##################################################

create_include_link(${BAL_DIR}/Events/WebCore/WK BAL)

if(USE_GRAPHICS_MORPHOS)                                                    
    create_include_link(${BAL_DIR}/Events/WebCore/MorphOS BAL)              
                                                                            
    aux_source_directory(${BAL_DIR}/Events/WebCore/MorphOS WEBCORE_SRC)     
endif(USE_GRAPHICS_MORPHOS)                                                 

if(USE_GRAPHICS_AMIGAOS4)
    create_include_link(${BAL_DIR}/Events/WebCore/AmigaOS4 BAL)

    aux_source_directory(${BAL_DIR}/Events/WebCore/AmigaOS4 WEBCORE_SRC)
endif(USE_GRAPHICS_AMIGAOS4)

if(USE_GRAPHICS_GTK)
    create_include_link(${BAL_DIR}/Events/WebCore/Gtk BAL)
    
    aux_source_directory(${BAL_DIR}/Events/WebCore/Gtk WEBCORE_SRC)
endif(USE_GRAPHICS_GTK)

if(USE_GRAPHICS_QT)
    create_include_link(${BAL_DIR}/Events/WebCore/Qt BAL)

    aux_source_directory(${BAL_DIR}/Events/WebCore/Qt WEBCORE_SRC)
endif(USE_GRAPHICS_QT)

if(USE_EVENTS_SDL)
    create_include_link(${BAL_DIR}/Events/WebCore/SDL BAL)

    aux_source_directory(${BAL_DIR}/Events/WebCore/SDL WEBCORE_SRC)
endif(USE_EVENTS_SDL)

if(USE_EVENTS_GENERIC)
    aux_source_directory(${BAL_DIR}/Events/WebCore/Generic WEBCORE_SRC)
endif(USE_EVENTS_GENERIC)
