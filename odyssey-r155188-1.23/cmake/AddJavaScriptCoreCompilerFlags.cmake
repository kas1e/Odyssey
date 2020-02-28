link_directories(${LIBRARY_OUTPUT_PATH})

if(HAVE_UCLIBC)
    add_definitions(-DHAVE_UCLIBC)
endif(HAVE_UCLIBC)

if(CMAKE_COMPILER_IS_GNUCXX)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fstrict-aliasing")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fstrict-aliasing")
    if(NOT ENABLE_DEBUG)
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
    endif(NOT ENABLE_DEBUG)

    set(KJS_LD_FLAGS -Wl,-whole-archive wtf -Wl,-no-whole-archive)
else(CMAKE_COMPILER_IS_GNUCXX)
    message(STATUS "Flag for Windows compiler is not implemented")
endif(CMAKE_COMPILER_IS_GNUCXX)

