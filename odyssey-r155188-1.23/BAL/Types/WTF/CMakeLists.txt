if(USE_THREADS_GTHREADS)
    create_include_link(${BAL_DIR}/Types/WTF/Gtk BAL/wtf)
    aux_source_directory(${BAL_DIR}/Types/WTF/Gtk WTF_SRC)
endif(USE_THREADS_GTHREADS)

if(USE_THREADS_NONE)
    create_include_link(${BAL_DIR}/Types/WTF/None BAL/wtf)
    aux_source_directory(${BAL_DIR}/Types/WTF/None WTF_SRC)
endif(USE_THREADS_NONE)

if(USE_THREADS_PTHREADS)
    create_include_link(${BAL_DIR}/Types/WTF/Pthreads BAL/wtf)
    aux_source_directory(${BAL_DIR}/Types/WTF/Pthreads WTF_SRC)

    if(USE_GRAPHICS_GTK)
        create_include_link(${BAL_DIR}/Types/WTF/Gtk BAL/wtf)
        aux_source_directory(${BAL_DIR}/Types/WTF/Gtk WTF_SRC)
        create_include_link(${BAL_DIR}/Types/WTF/GLib BAL/wtf)
        aux_source_directory(${BAL_DIR}/Types/WTF/GLib WTF_SRC)
        list(REMOVE_ITEM WTF_SRC
            ${BAL_DIR}/Types/WTF/Gtk/BCThreadingGtk.cpp
            ${BAL_DIR}/Types/WTF/Pthreads/BCMainThreadPthreads.cpp
        )
    endif(USE_GRAPHICS_GTK)
endif(USE_THREADS_PTHREADS)

if(USE_THREADS_QT)
    create_include_link(${BAL_DIR}/Types/WTF/Qt BAL/wtf)
    owb_generate_moc(WTF_SRC ${OWB_SOURCE_DIR}/BAL/Types/WTF/Qt/BCMainThreadQt.cpp MainThreadQt.moc)
    owb_generate_moc(WTF_SRC ${OWB_SOURCE_DIR}/BAL/Types/WTF/Qt/BCThreadingQt.cpp ThreadingQt.moc)
    aux_source_directory(${BAL_DIR}/Types/WTF/Qt WTF_SRC)
endif(USE_THREADS_QT)

if(USE_THREADS_MORPHOS)
    create_include_link(${BAL_DIR}/Types/WTF/MorphOS BAL/wtf)
    aux_source_directory(${BAL_DIR}/Types/WTF/MorphOS WTF_SRC)
endif(USE_THREADS_MORPHOS)

create_include_link(${BAL_DIR}/Types/WTF/dtoa BAL/wtf/dtoa)
aux_source_directory(${BAL_DIR}/Types/WTF/dtoa WTF_SRC)

create_include_link(${BAL_DIR}/Types/WTF/url BAL/wtf/url)
aux_source_directory(${BAL_DIR}/Types/WTF/url WTF_SRC)

create_include_link(${BAL_DIR}/Types/WTF/threads BAL/wtf/threads)
aux_source_directory(${BAL_DIR}/Types/WTF/threads WTF_SRC)

create_include_link(${BAL_DIR}/Types/WTF BAL/wtf)
aux_source_directory(${BAL_DIR}/Types/WTF WTF_SRC)
