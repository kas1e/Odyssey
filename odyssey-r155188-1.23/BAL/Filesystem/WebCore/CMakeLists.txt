##################################################
# Filesystem support part.                       #
##################################################
create_include_link(${BAL_DIR}/Filesystem/WebCore/WK BAL)
aux_source_directory(${BAL_DIR}/Filesystem/WebCore/WK WEBCORE_SRC)

if(USE_FILESYSTEM_ACCESS_GLIB)
    aux_source_directory(${BAL_DIR}/Filesystem/WebCore/Gtk WEBCORE_SRC)
endif(USE_FILESYSTEM_ACCESS_GLIB)

if(USE_FILESYSTEM_ACCESS_POSIX)
    aux_source_directory(${BAL_DIR}/Filesystem/WebCore/Posix WEBCORE_SRC)
endif(USE_FILESYSTEM_ACCESS_POSIX)

if(USE_FILESYSTEM_ACCESS_QT)
    aux_source_directory(${BAL_DIR}/Filesystem/WebCore/Qt WEBCORE_SRC)
endif(USE_FILESYSTEM_ACCESS_QT)
