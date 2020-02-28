# IF (WEBKIT_USE_HTML_EXTENSION)
#     TARGET_LINK_LIBRARIES (jsc
#         htmlext
#     )
# ENDIF (WEBKIT_USE_HTML_EXTENSION)

##################################################
# Generate sources for JavaScriptCore library.   #
##################################################

if(NOT EXISTS ${OWB_BINARY_DIR}/generated_sources/JavaScriptCore/RegExpJitTables.h)
    exec_program(mkdir
        ARGS -p ${OWB_BINARY_DIR}/generated_sources/JavaScriptCore
    )
    execute_process(
        COMMAND python ${CMAKE_CURRENT_SOURCE_DIR}/create_regex_tables
        OUTPUT_FILE ${OWB_BINARY_DIR}/generated_sources/JavaScriptCore/RegExpJitTables.h
    )
endif(NOT EXISTS ${OWB_BINARY_DIR}/generated_sources/JavaScriptCore/RegExpJitTables.h)

set(JAVASCRIPTCORE_GENERATED_DIR ${OWB_BINARY_DIR}/generated_sources/JavaScriptCore)

##################################################
# Add sources for JavaScriptore library.         #
##################################################)

include(API/CMakeLists.txt)
include(assembler/CMakeLists.txt)
include(bytecode/CMakeLists.txt)
include(bytecompiler/CMakeLists.txt)
include(dfg/CMakeLists.txt)
include(heap/CMakeLists.txt)
include(debugger/CMakeLists.txt)
include(interpreter/CMakeLists.txt)
include(jit/CMakeLists.txt)
include(llint/CMakeLists.txt)
include(parser/CMakeLists.txt)
include(profiler/CMakeLists.txt)
include(runtime/CMakeLists.txt)
include(tools/CMakeLists.txt)
include(yarr/CMakeLists.txt)


##################################################
# Compilation settings.                          #
##################################################

include_directories(
    ${BASE_INCLUDE_DIRS}
    ${WTF_INCLUDE_DIRS}
    ${BAL_INCLUDE_DIRS}
    ${JAVASCRIPTCORE_INCLUDE_DIRS}
    ${OWB_BINARY_DIR}/generated_sources/JavaScriptCore
    ${I18N_INCLUDE_DIRS}
    ${THREADS_INCLUDE_DIRS}
)

include(AddJavaScriptCoreCompilerFlags)

set_source_files_properties(${JSC_SRC}
    PROPERTIES COMPILE_FLAGS "-fno-exceptions"
)
add_library(jsc STATIC ${JSC_SRC})
add_dependencies(jsc wtf wtfurl)

#GENERATOR: "KeywordLookup.h": keyword decision tree used by the lexer
ADD_CUSTOM_COMMAND(
    OUTPUT ${JAVASCRIPTCORE_GENERATED_DIR}/KeywordLookup.h
    MAIN_DEPENDENCY ${OWB_SOURCE_DIR}/Source/JavaScriptCore/KeywordLookupGenerator.py
    COMMAND python ${OWB_SOURCE_DIR}/Source/JavaScriptCore/KeywordLookupGenerator.py ${OWB_SOURCE_DIR}/Source/JavaScriptCore/parser/Keywords.table > ${JAVASCRIPTCORE_GENERATED_DIR}/KeywordLookup.h
    VERBATIM)
ADD_SOURCE_DEPENDENCIES(${OWB_SOURCE_DIR}/Source/JavaScriptCore/parser/Lexer.cpp ${JAVASCRIPTCORE_GENERATED_DIR}/KeywordLookup.h)

##################################################
# Tests compilation.                             #
##################################################

link_directories(${THREADS_LIBRARY_DIRS})
add_executable(jshell EXCLUDE_FROM_ALL jsc.cpp)
set_target_properties(jshell
    PROPERTIES COMPILE_FLAGS "-fno-rtti -fno-exceptions"
)
add_definitions(-DBUILDING_JavaScriptCore -DSTATICALLY_LINKED_WITH_WTF) 
target_link_libraries(jshell
    ${KJS_LD_FLAGS}
    ${I18N_LIBRARIES}
    ${THREADS_LIBRARIES}
    jsc
)
add_custom_target(jsctests
    COMMAND ${PERL_EXECUTABLE} mklistpage.pl > menubody.html
    COMMAND cat menuhead.html menubody.html menufoot.html > menu.html
    COMMAND ${PERL_EXECUTABLE} jsDriver.pl -e squirrelfish -s ${OWB_BINARY_DIR}/bin/jshell -f results.html
    COMMAND ${PERL_EXECUTABLE} report.pl
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/tests/mozilla
)
add_dependencies(jsctests jshell)
