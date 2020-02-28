##################################################
# ImageDecoder support part.                     #
##################################################

create_include_link(${BAL_DIR}/ImageDecoder/WebCore/WK BAL)
create_include_link(${BAL_DIR}/ImageDecoder/WebCore/BMP/WK BAL)
create_include_link(${BAL_DIR}/ImageDecoder/WebCore/GIF/WK BAL)
create_include_link(${BAL_DIR}/ImageDecoder/WebCore/ICO/WK BAL)
create_include_link(${BAL_DIR}/ImageDecoder/WebCore/JPEG/WK BAL)
create_include_link(${BAL_DIR}/ImageDecoder/WebCore/PNG/WK BAL)
create_include_link(${BAL_DIR}/ImageDecoder/WebCore/XBM/WK BAL)
create_include_link(${BAL_DIR}/ImageDecoder/WebCore/WEBP/WK BAL)

aux_source_directory(${BAL_DIR}/ImageDecoder/WebCore/BMP/WK WEBCORE_SRC)
aux_source_directory(${BAL_DIR}/ImageDecoder/WebCore/GIF/WK WEBCORE_SRC)
aux_source_directory(${BAL_DIR}/ImageDecoder/WebCore/ICO/WK WEBCORE_SRC)
aux_source_directory(${BAL_DIR}/ImageDecoder/WebCore/JPEG/WK WEBCORE_SRC)
aux_source_directory(${BAL_DIR}/ImageDecoder/WebCore/PNG/WK WEBCORE_SRC)
aux_source_directory(${BAL_DIR}/ImageDecoder/WebCore/WEBP/WK WEBCORE_SRC)

if(USE_GRAPHICS_AMIGAOS4)
    aux_source_directory(${BAL_DIR}/ImageDecoder/WebCore/WK WEBCORE_SRC)
    aux_source_directory(${BAL_DIR}/ImageDecoder/WebCore/Cairo WEBCORE_SRC)
endif(USE_GRAPHICS_AMIGAOS4)

if(USE_GRAPHICS_GTK)
    aux_source_directory(${BAL_DIR}/ImageDecoder/WebCore/WK WEBCORE_SRC)
    aux_source_directory(${BAL_DIR}/ImageDecoder/WebCore/Cairo WEBCORE_SRC)
endif(USE_GRAPHICS_GTK)

if(USE_GRAPHICS_MORPHOS)
    aux_source_directory(${BAL_DIR}/ImageDecoder/WebCore/WK WEBCORE_SRC)
    aux_source_directory(${BAL_DIR}/ImageDecoder/WebCore/Cairo WEBCORE_SRC)
endif(USE_GRAPHICS_MORPHOS)

if(USE_GRAPHICS_QT)
    aux_source_directory(${BAL_DIR}/ImageDecoder/WebCore/Qt WEBCORE_SRC)
endif(USE_GRAPHICS_QT)

if(USE_GRAPHICS_SDL)
    aux_source_directory(${BAL_DIR}/ImageDecoder/WebCore/WK WEBCORE_SRC)
    aux_source_directory(${BAL_DIR}/ImageDecoder/WebCore/SDL WEBCORE_SRC)
endif(USE_GRAPHICS_SDL)

if(USE_GRAPHICS_CAIRO)
    aux_source_directory(${BAL_DIR}/ImageDecoder/WebCore/WK WEBCORE_SRC)
    aux_source_directory(${BAL_DIR}/ImageDecoder/WebCore/Cairo WEBCORE_SRC)
endif(USE_GRAPHICS_CAIRO)
