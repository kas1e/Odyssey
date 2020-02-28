# Find include and libraries for Hildon library
# HILDON_INCLUDE     Directories to include to use Hildon
# HILDON_INCLUDE-I   Directories to include to use Hildon (with -I)
# HILDON_DEFINITIONS Definitions to add to use Hildon
# HILDON_LIBRARIES   Libraries to link against to use Hildon
# HILDON_FOUND       Hildon was found

IF (UNIX)
    INCLUDE (UsePkgConfig)
    EXEC_PROGRAM (${PKGCONFIG_EXECUTABLE}
        ARGS hildon-1 --cflags-only-I 
        OUTPUT_VARIABLE HILDON_INCLUDE-I
    )
    EXEC_PROGRAM (${PKGCONFIG_EXECUTABLE}
        ARGS hildon-1 --cflags-only-other
        OUTPUT_VARIABLE HILDON_DEFINITIONS
    )
    EXEC_PROGRAM (${PKGCONFIG_EXECUTABLE}
        ARGS hildon-1 --libs
        OUTPUT_VARIABLE HILDON_LIBRARIES
    )
    IF (HILDON_INCLUDE-I AND HILDON_LIBRARIES)
        SET (HILDON_FOUND TRUE)
        EXEC_PROGRAM ("echo"
            ARGS "${HILDON_INCLUDE-I} | sed 's/[[:blank:]]*-I/;/g'"
            OUTPUT_VARIABLE HILDON_INCLUDE
        )
    ELSE (HILDON_INCLUDE-I AND HILDON_LIBRARIES)
        SET (HILDON_FOUND FALSE)
    ENDIF (HILDON_INCLUDE-I AND HILDON_LIBRARIES)
ENDIF (UNIX)
