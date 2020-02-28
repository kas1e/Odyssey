if(NOT HAS_CUSTOMER)
    IF(NOT WIN32)
#        pkg_check_modules(PNG12 REQUIRED libpng12)
#       find_package(JPEG QUIET REQUIRED)
    ELSE(NOT WIN32)
        ## We haven't got a good pkg-config under Windows so we let cmake search libs
        find_path(PNG12_INCLUDE png.h ${WINLIB_INC_PATH} ${WINLIB_INC_PATH}/png)
        find_path(ZLIB_INCLUDE zlib.h ${WINLIB_INC_PATH} ${WINLIB_INC_PATH}/zlib)
        SET(PNG12_INCLUDE_DIRS  ${PNG12_INCLUDE}  ${ZLIB_INCLUDE})
        find_path(JPEG_INCLUDE_DIR jpeglib.h ${WINLIB_INC_PATH} ${WINLIB_INC_PATH}/jpeg)    
        find_file(PNG12_LIB libpng.lib ${WINLIB_LIB_PATH} ${WINLIB_LIB_PATH}/png)
        find_file(ZLIB_LIB zlib.lib ${WINLIB_LIB_PATH} ${WINLIB_LIB_PATH}/png ${WINLIB_LIB_PATH}/zlib)
        find_file(JPEG_LIBRARY jpeg.lib ${WINLIB_LIB_PATH} ${WINLIB_LIB_PATH}/jpeg)
        SET(PNG12_LIBRARIES ${PNG12_LIB} ${ZLIB_LIB})
    ENDIF(NOT WIN32)
    
    set(IMAGE_INCLUDE_DIRS 
        ${PNG12_INCLUDE_DIRS}
        ${JPEG_INCLUDE_DIR}
    )
    set(IMAGE_LIBRARIES
        ${PNG12_LIBRARIES}
        ${JPEG_LIBRARY}
    )

    set(DEB_PACKAGE_DEPENDS "${DEB_PACKAGE_DEPENDS}, libjpeg62 (>= 6b-14build1), libpng12-0 (>= 1.2.37-1)")
endif(NOT HAS_CUSTOMER)

