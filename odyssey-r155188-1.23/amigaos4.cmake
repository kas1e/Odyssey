# this one is important
SET(CMAKE_SYSTEM_NAME Generic)
#this one not so much
SET(CMAKE_SYSTEM_VERSION 1)

# specify the cross compiler
SET(CMAKE_C_COMPILER ppc-amigaos-gcc)
SET(CMAKE_CXX_COMPILER ppc-amigaos-g++)

SET(CMAKE_EXTRA_SDK_PATH $ENV{ODYSSEY_INC})
SET(CMAKE_AOS4_SDK_PATH $ENV{AOS4_SDK_INC})

# options
SET(CMAKE_CXX_FLAGS)
SET(CMAKE_CXX_FLAGS_DEBUG)

SET(CMAKE_C_FLAGS)
SET(CMAKE_C_FLAGS_DEBUG)

SET(CMAKE_MODULE_LINKER_FLAGS)

# where is the target environment
SET(CMAKE_FIND_ROOT_PATH  /opt/ppc-amigaos/)

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)


