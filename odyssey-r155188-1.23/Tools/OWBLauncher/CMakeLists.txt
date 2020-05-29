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
    include_directories(${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Api/MorphOS ${OWB_SOURCE_DIR}/Base ${OWB_SOURCE_DIR}/Source/JavaScriptCore ${OWB_SOURCE_DIR}/Source/WebCore/page ${OWB_SOURCE_DIR}/Source/WTF ${OWB_SOURCE_DIR}/Source/JavaScriptCore/runtime/ ${OWB_SOURCE_DIR}/Source/WebCore/platform)
    add_executable(Odyssey EXCLUDE_FROM_ALL MorphOS/main.cpp)                                                                                     
endif(USE_GRAPHICS_MORPHOS)                                                                                                                   

target_link_libraries(Odyssey
    webkit-owb
    -static -athread=single -L${CMAKE_EXTRA_SDK_PATH}/local/newlib/lib -L../../lib -Llib webkit-owb webcore jsc wtf -lcairo -lpixman-1 -lfontconfig -lfreetype -lcurl -lrtmp -ljpeg -lpng -lwebp -lsqlite3 -lxslt -lavdevice2 -lavformat -lavcodec2 -lavutil2 -lswscale2 -lswresample2 -lxml2 -lexpat -lbz2 -lssl -lcrypto -licui18n -licuuc -licudata -lpthread -lz
#    ${EXTERNAL_DEPS_LIBRARIES}
)

# 
# INSTALL (TARGETS Odyssey 
#     RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin
# )
