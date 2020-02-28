##################################################
# Internationalization support part.             #
##################################################

create_include_link(${BAL_DIR}/Internationalization/WebCore/WK BAL)

if(USE_I18N_ICU OR USE_I18N_GLIB)
    create_include_link(${BAL_DIR}/Internationalization/WebCore/ICU BAL)
    
    aux_source_directory(${BAL_DIR}/Internationalization/WebCore/ICU WEBCORE_SRC)

    if(USE_GRAPHICS_MORPHOS)                                                                     
        create_include_link(${BAL_DIR}/Internationalization/WebCore/MorphOS BAL)                 
                                                                                             
        aux_source_directory(${BAL_DIR}/Internationalization/WebCore/MorphOS WEBCORE_SRC)        
    endif(USE_GRAPHICS_MORPHOS)                                                                  


    if(USE_GRAPHICS_AMIGAOS4)
        create_include_link(${BAL_DIR}/Internationalization/WebCore/AmigaOS4 BAL)

        aux_source_directory(${BAL_DIR}/Internationalization/WebCore/AmigaOS4 WEBCORE_SRC)
    endif(USE_GRAPHICS_AMIGAOS4)
   
    if(USE_GRAPHICS_GTK)
        create_include_link(${BAL_DIR}/Internationalization/WebCore/Gtk BAL)

        aux_source_directory(${BAL_DIR}/Internationalization/WebCore/Gtk WEBCORE_SRC)
    endif(USE_GRAPHICS_GTK)

    if(USE_I18N_GENERIC)
        create_include_link(${BAL_DIR}/Internationalization/WebCore/Generic BAL)

        aux_source_directory(${BAL_DIR}/Internationalization/WebCore/Generic WEBCORE_SRC)
    endif(USE_I18N_GENERIC)
else(USE_I18N_ICU OR USE_I18N_GLIB)
    aux_source_directory(${BAL_DIR}/Internationalization/WebCore/None WEBCORE_SRC)
endif(USE_I18N_ICU OR USE_I18N_GLIB)

if(USE_I18N_EMBEDDED)
    create_include_link(${BAL_DIR}/Internationalization/WebCore/Embedded BAL)

    aux_source_directory(${BAL_DIR}/Internationalization/WebCore/Embedded WEBCORE_SRC)
endif(USE_I18N_EMBEDDED)

if(USE_I18N_QT)
    create_include_link(${BAL_DIR}/Internationalization/WebCore/Qt BAL)
    create_include_link(${BAL_DIR}/Internationalization/WebCore/Qt BAL/qt)

    aux_source_directory(${BAL_DIR}/Internationalization/WebCore/Qt WEBCORE_SRC)
endif(USE_I18N_QT)

aux_source_directory(${BAL_DIR}/Internationalization/WebCore/WK WEBCORE_SRC)
