if(UNIX)
    find_path(ICU_INCLUDE unicode/ucnv.h
        /usr/include
        /usr/local/include
        /opt/local/include
        /sw/include
    )
    find_library(ICU_I18N_LIBRARY
        NAME icui18n
        PATHS /usr/lib
            /usr/local/lib
            /opt/local/lib
            /sw/lib
    )
    find_library(ICU_UC_LIBRARY
        NAME icuuc
        PATHS /usr/lib
            /usr/local/lib
            /opt/local/lib
            /sw/lib
    )
    find_library(ICU_DATA_LIBRARY
        NAME icudata
        PATHS /usr/lib
            /usr/local/lib
            /opt/local/lib
            /sw/lib
    )
    set(ICU_LIBRARY ${ICU_I18N_LIBRARY} ${ICU_UC_LIBRARY} ${ICU_DATA_LIBRARY})
    if(ICU_INCLUDE)
        set(ICU_FOUND TRUE)
    else(ICU_INCLUDE)
        set(ICU_FOUND FALSE)
    endif(ICU_INCLUDE)
endif(UNIX)
