##################################################
# Fonts support part.                            #
##################################################

create_include_link(${BAL_DIR}/Fonts/WebCore/WK BAL)
aux_source_directory(${BAL_DIR}/Fonts/WebCore/WK WEBCORE_SRC)

if(USE_FONTS_CAIRO)
    create_include_link(${BAL_DIR}/Fonts/WebCore/Cairo BAL)
    create_include_link(${BAL_DIR}/Fonts/WebCore/Gtk BAL)
    aux_source_directory(${BAL_DIR}/Fonts/WebCore/Cairo WEBCORE_SRC)
    aux_source_directory(${BAL_DIR}/Fonts/WebCore/SDLCairo WEBCORE_SRC)
endif(USE_FONTS_CAIRO)

if(USE_FONTS_EMBEDDED)
    create_include_link(${BAL_DIR}/Fonts/WebCore/Embedded BAL)
    aux_source_directory(${BAL_DIR}/Fonts/WebCore/Embedded WEBCORE_SRC)
endif(USE_FONTS_EMBEDDED)

if(USE_FONTS_FREETYPE)
    create_include_link(${BAL_DIR}/Fonts/WebCore/Cairo BAL)
    create_include_link(${BAL_DIR}/Fonts/WebCore/Freetype BAL)
    aux_source_directory(${BAL_DIR}/Fonts/WebCore/Cairo WEBCORE_SRC)
    aux_source_directory(${BAL_DIR}/Fonts/WebCore/Freetype WEBCORE_SRC)
endif(USE_FONTS_FREETYPE)

if(USE_FONTS_GTK)
    create_include_link(${BAL_DIR}/Fonts/WebCore/Cairo BAL)
    create_include_link(${BAL_DIR}/Fonts/WebCore/Gtk BAL)
    aux_source_directory(${BAL_DIR}/Fonts/WebCore/Gtk WEBCORE_SRC)
    aux_source_directory(${BAL_DIR}/Fonts/WebCore/Cairo WEBCORE_SRC)
endif(USE_FONTS_GTK)

#if(USE_FONTS_MORPHOS)
#    create_include_link(${BAL_DIR}/Fonts/WebCore/Freetype BAL)
#    aux_source_directory(${BAL_DIR}/Fonts/WebCore/Freetype WEBCORE_SRC)
#endif(USE_FONTS_MORPHOS)

if(USE_FONTS_QT)
    create_include_link(${BAL_DIR}/Fonts/WebCore/Qt BAL)
    list(REMOVE_ITEM WEBCORE_SRC
        ${BAL_DIR}/Fonts/WebCore/WK/BCWidthIteratorWK.cpp
    	${BAL_DIR}/Fonts/WebCore/WK/BCFontFastPathWK.cpp
	    ${BAL_DIR}/Fonts/WebCore/WK/BCGlyphPageTreeNodeWK.cpp
    )
    aux_source_directory(${BAL_DIR}/Fonts/WebCore/Qt WEBCORE_SRC)
endif(USE_FONTS_QT)

