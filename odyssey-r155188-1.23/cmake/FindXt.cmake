# Find include and libraries for Xt library
# XT_INCLUDE     Directories to include to use Xt
# XT_INCLUDE-I   Directories to include to use Xt (with -I)
# XT_LIBRARIES   Libraries to link against to use Xt
# XT_FOUND       Xt was found

IF (UNIX)
    INCLUDE (UsePkgConfig)
    PKGCONFIG (xt xt_include_dir xt_link_dir xt_libraries xt_include)
    IF (xt_libraries)
        SET (XT_FOUND TRUE)
        SET (XT_LIBRARIES ${xt_libraries})
    ELSE (xt_libraries)
        SET (XT_FOUND FALSE)
    ENDIF (xt_libraries)
ENDIF (UNIX)
