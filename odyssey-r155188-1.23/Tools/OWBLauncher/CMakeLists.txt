execute_process(
    COMMAND mkdir -p include
    WORKING_DIRECTORY ${OWB_BINARY_DIR}
    ERROR_QUIET
)
set(API_INCLUDE_DIRS ${OWB_BINARY_DIR}/include)
foreach(files ${API_HEADER})
    get_filename_component(filename ${files} NAME)
    configure_file(
        ${files}
        ${API_INCLUDE_DIRS}/${filename}
        COPYONLY
    )
endforeach(files)

include_directories(
    ${API_INCLUDE_DIRS}
    ${BASE_INCLUDE_DIRS}
    ${EXTERNAL_DEPS_INCLUDE_DIRS}
)

link_directories(
    ${LIBRARY_OUTPUT_PATH}
    ${GRAPHICS_LIBRARY_DIRS}
)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2")

if(USE_GRAPHICS_MORPHOS)                                                                                                                      
    include_directories(${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/MorphOS ${OWB_SOURCE_DIR}/Base ${OWB_SOURCE_DIR}/Source/JavaScriptCore ${OWB_SOURCE_DIR}/Source/WebCore/page ${OWB_SOURCE_DIR}/cross-build/generated_link/BAL)   
    add_executable(owb EXCLUDE_FROM_ALL MorphOS/main.cpp)                                                                                     
endif(USE_GRAPHICS_MORPHOS)                                                                                                                   

target_link_libraries(owb
    webkit-owb
    -L../../lib -L/gg/usr/lib -L/gg/usr/local/lib -lcairo -lpixman-1 -lfontconfig -lfreetype -lxml2 -lexpat -lz -lcurl -ljpeg_shared -lpng_shared -lssl -lcrypto -licui18n -licuuc -licudata -lsqlite3 -lxslt -lavdevice -lavformat -lavcodec -lavutil -lswscale -lbz2 -lz -lc -lc -lm -lstdc++ -ldebug
#    ${EXTERNAL_DEPS_LIBRARIES}
)

# 
# INSTALL (TARGETS owb 
#     RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin
# )
