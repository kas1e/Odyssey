##################################################
# Media support part.                            #
##################################################

create_include_link(${BAL_DIR}/Media/WebCore/WK BAL)
aux_source_directory(${BAL_DIR}/Media/WebCore/WK WEBCORE_SRC)

if(HAS_VIDEO)
    if(USE_VIDEO_AMIGAOS)
        create_include_link(${BAL_DIR}/Media/WebCore/AmigaOS4 BAL)
    endif(USE_VIDEO_AMIGAOS)

    if(USE_GRAPHICS_MORPHOS)
        create_include_link(${BAL_DIR}/Media/WebCore/MorphOS BAL)
    endif(USE_GRAPHICS_MORPHOS)                                                    

    if(USE_VIDEO_GSTREAMER)
        create_include_link(${BAL_DIR}/Media/WebCore/GStreamer BAL)
        aux_source_directory(${BAL_DIR}/Media/WebCore/GStreamer WEBCORE_SRC)
        if(NOT USE_GRAPHICS_GTK)
            list(REMOVE_ITEM WEBCORE_SRC
                ${BAL_DIR}/Media/WebCore/GStreamer/BCGOwnPtrGStreamer.cpp
            )
        endif(NOT USE_GRAPHICS_GTK)
    endif(USE_VIDEO_GSTREAMER)

#    if(USE_VIDEO_NONE)
#        create_include_link(${BAL_DIR}/Media/WebCore/None BAL)
#        aux_source_directory(${BAL_DIR}/Media/WebCore/None WEBCORE_SRC)
#    endif(USE_VIDEO_NONE)

    if(USE_VIDEO_PHONON)
        create_include_link(${BAL_DIR}/Media/WebCore/Phonon BAL)
        aux_source_directory(${BAL_DIR}/Media/WebCore/Phonon WEBCORE_SRC)
        owb_generate_moc(WEBCORE_SRC ${OWB_SOURCE_DIR}/BAL/Media/WebCore/Phonon/BCMediaPlayerPrivatePhonon.h MediaPlayerPrivatePhonon.moc)
    endif(USE_VIDEO_PHONON)

    # This one should be used instead of PHONON when Qt version >= 4.7
    if(USE_VIDEO_QT)
        create_include_link(${BAL_DIR}/Media/WebCore/Phonon BAL)
        aux_source_directory(${BAL_DIR}/Media/WebCore/Phonon WEBCORE_SRC)
        owb_generate_moc(WEBCORE_SRC ${OWB_SOURCE_DIR}/BAL/Media/WebCore/Phonon/BCMediaPlayerPrivateQt.h moc_MediaPlayerPrivateQt.cpp)
    endif(USE_VIDEO_QT)
endif(HAS_VIDEO)

if(USE_GRAPHICS_MORPHOS)
    aux_source_directory(${BAL_DIR}/Media/WebCore/MorphOS WEBCORE_SRC)
endif(USE_GRAPHICS_MORPHOS)

if(USE_GRAPHICS_AMIGAOS4)
    aux_source_directory(${BAL_DIR}/Media/WebCore/AmigaOS4 WEBCORE_SRC)
endif(USE_GRAPHICS_AMIGAOS4)

if(USE_GRAPHICS_GTK)
    aux_source_directory(${BAL_DIR}/Media/WebCore/Gtk WEBCORE_SRC)
endif(USE_GRAPHICS_GTK)

if(USE_GRAPHICS_QT)
    aux_source_directory(${BAL_DIR}/Media/WebCore/Qt WEBCORE_SRC)
endif(USE_GRAPHICS_QT)

if(USE_MEDIA_GENERIC)
    aux_source_directory(${BAL_DIR}/Media/WebCore/Generic WEBCORE_SRC)
endif(USE_MEDIA_GENERIC)
