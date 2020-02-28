set(BAL_DIR ../../../BAL)

include(${BAL_DIR}/Memory/WTF/CMakeLists.txt)
include(${BAL_DIR}/Internationalization/WTF/CMakeLists.txt)
include(${BAL_DIR}/Types/WTF/CMakeLists.txt)

include_directories(
    ${BASE_INCLUDE_DIRS}
    ${WTF_INCLUDE_DIRS}
    ${BAL_INCLUDE_DIRS}
    ${I18N_INCLUDE_DIRS}
    ${JAVASCRIPTCORE_INCLUDE_DIRS}
    ${THREADS_INCLUDE_DIRS}
    ${TIMER_INCLUDE_DIRS}
)

include(AddJavaScriptCoreCompilerFlags)

set_source_files_properties(${WTF_SRC}
    PROPERTIES COMPILE_FLAGS "-fno-exceptions"
)
add_library(wtf STATIC ${WTF_SRC})
