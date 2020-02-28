include(${OWB_SOURCE_DIR}/BAL/Graphics/WebKit/CMakeLists.txt)
include(${OWB_SOURCE_DIR}/BAL/Widgets/WebKit/CMakeLists.txt)

if(USE_GRAPHICS_MORPHOS)                                 
    list(APPEND WEBKIT_SRC                               
        Api/MorphOS/icufiles.cpp
        Api/MorphOS/locale.cpp                                
        Api/MorphOS/cattmp.cpp                                
        Api/MorphOS/methodstack.c                             
        Api/MorphOS/menuclass.cpp                        
        Api/MorphOS/menuitemclass.cpp                    
        Api/MorphOS/WebViewPrivate.cpp                   
        Api/MorphOS/DownloadDelegateMorphOS.cpp               
	Api/MorphOS/AutofillManager.cpp
	Api/MorphOS/AutofillBackingStore.cpp
	Api/MorphOS/ColorChooserController.cpp
        Api/MorphOS/DateTimeChooserController.cpp
	Api/MorphOS/TopSitesManager.cpp
        Api/MorphOS/asl.cpp                              
        Api/MorphOS/mui.cpp                              
        Api/MorphOS/classes.cpp                          
        Api/MorphOS/appclass.cpp                         
        Api/MorphOS/addressbargroupclass.cpp             
        Api/MorphOS/owbbrowserclass.cpp                  
        Api/MorphOS/owbgroupclass.cpp                    
        Api/MorphOS/owbwindowclass.cpp                   
        Api/MorphOS/downloadwindowclass.cpp              
        Api/MorphOS/downloadgroupclass.cpp                    
        Api/MorphOS/downloadlistclass.cpp                     
        Api/MorphOS/prefswindowclass.cpp                 
        Api/MorphOS/titleclass.cpp                       
        Api/MorphOS/titlelabelclass.cpp                  
        Api/MorphOS/popstringclass.cpp                   
	Api/MorphOS/historypopstringclass.cpp                 
	Api/MorphOS/historylistclass.cpp                      
	Api/MorphOS/historylisttreeclass.cpp                  
	Api/MorphOS/historypanelgroupclass.cpp                
        Api/MorphOS/navigationgroupclass.cpp             
        Api/MorphOS/searchbargroupclass.cpp              
        Api/MorphOS/toolbuttonclass.cpp                  
        Api/MorphOS/historybuttonclass.cpp               
        Api/MorphOS/transferanimclass.cpp                
	Api/MorphOS/tabtransferanimclass.cpp                  
        Api/MorphOS/findtextclass.cpp                    
        Api/MorphOS/bookmarkwindowclass.cpp              
        Api/MorphOS/bookmarkgroupclass.cpp               
        Api/MorphOS/bookmarklisttreeclass.cpp            
        Api/MorphOS/linklistclass.cpp                    
	Api/MorphOS/quicklinkbuttongroupclass.cpp             
	Api/MorphOS/quicklinkgroupclass.cpp                   
	Api/MorphOS/quicklinkparentgroupclass.cpp             
	Api/MorphOS/networkwindowclass.cpp  
	Api/MorphOS/networklistclass.cpp                  
        Api/MorphOS/networkledsgroupclass.cpp            
        Api/MorphOS/throbber.cpp                         
	Api/MorphOS/tabthrobber.cpp                           
        Api/MorphOS/utils.cpp                            
	Api/MorphOS/clipboard.cpp
	Api/MorphOS/loginwindowclass.cpp                      
	Api/MorphOS/splashwindowclass.cpp                     
	Api/MorphOS/consolewindowclass.cpp                    
	Api/MorphOS/consolelistclass.cpp                      
	Api/MorphOS/bookmarkpanelgroupclass.cpp               
	Api/MorphOS/contextmenugroupclass.cpp                 
	Api/MorphOS/contextmenulistclass.cpp                  
        Api/MorphOS/mimetypegroupclass.cpp               
        Api/MorphOS/mimetypelistclass.cpp                
	Api/MorphOS/choosetitlegroupclass.cpp                 
	Api/MorphOS/toolbutton_newtabclass.cpp                
	Api/MorphOS/toolbutton_addbookmarkclass.cpp           
        Api/MorphOS/toolbutton_bookmarksclass.cpp
	Api/MorphOS/urlstringclass.cpp                        
	Api/MorphOS/faviconclass.cpp                          
	Api/MorphOS/iconclass.cpp
	Api/MorphOS/passwordmanagerwindowclass.cpp            
	Api/MorphOS/passwordmanagergroupclass.cpp             
	Api/MorphOS/passwordmanagerlistclass.cpp              
        Api/MorphOS/cookiemanagerwindowclass.cpp         
        Api/MorphOS/cookiemanagergroupclass.cpp          
        Api/MorphOS/cookiemanagerlistclass.cpp           
        Api/MorphOS/blockmanagerwindowclass.cpp          
        Api/MorphOS/blockmanagergroupclass.cpp           
        Api/MorphOS/blockmanagerlistclass.cpp            
        Api/MorphOS/searchmanagerwindowclass.cpp
        Api/MorphOS/searchmanagergroupclass.cpp
        Api/MorphOS/searchmanagerlistclass.cpp
	Api/MorphOS/scriptmanagerwindowclass.cpp
	Api/MorphOS/scriptmanagergroupclass.cpp
	Api/MorphOS/scriptmanagerlistclass.cpp
	Api/MorphOS/scriptmanagerhostlistclass.cpp
        Api/MorphOS/urlprefswindowclass.cpp
        Api/MorphOS/urlprefsgroupclass.cpp
        Api/MorphOS/urlprefslistclass.cpp
	Api/MorphOS/mediacontrolsgroupclass.cpp
	Api/MorphOS/seeksliderclass.cpp
	Api/MorphOS/volumesliderclass.cpp
	Api/MorphOS/spacerclass.cpp
        Api/MorphOS/suggestlistclass.cpp
        Api/MorphOS/suggestpopstringclass.cpp
	Api/MorphOS/printerwindowclass.cpp
	Api/MorphOS/autofillpopupclass.cpp
	Api/MorphOS/autofillpopuplistclass.cpp
        Api/MorphOS/colorchooserpopupclass.cpp
        Api/MorphOS/datetimechooserpopupclass.cpp
    )                                                    
    include_directories(              
        Api/MorphOS                         
    )                                       
endif(USE_GRAPHICS_MORPHOS)                 

aux_source_directory(Api WEBKIT_SRC)
aux_source_directory(WebCoreSupport WEBKIT_SRC)

# Generate WebKitVersion.h
set(WEBKIT_GENERATED_DIR ${OWB_BINARY_DIR}/generated_sources/WebKit)
if(NOT EXISTS ${WEBKIT_GENERATED_DIR})
    execute_process(COMMAND mkdir ${WEBKIT_GENERATED_DIR})
endif(NOT EXISTS ${WEBKIT_GENERATED_DIR})

list(APPEND WEBKIT_SRC ${WEBKIT_GENERATED_DIR}/WebKitVersion.h)

set(WEBKIT_VERSION_SCRIPT ${OWB_SOURCE_DIR}/Source/WebKit/scripts/generate-webkitversion.pl)
set(WEBKIT_VERSION_CONFIG ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/Version.xcconfig)
add_custom_command(
    OUTPUT ${WEBKIT_GENERATED_DIR}/WebKitVersion.h
    COMMAND ${PERL_EXECUTABLE} ${WEBKIT_VERSION_SCRIPT} --config ${WEBKIT_VERSION_CONFIG} --outputDir ${WEBKIT_GENERATED_DIR}
    WORKING_DIRECTORY ${WEBKIT_GENERATED_DIR}
    DEPENDS ${WEBKIT_VERSION_SCRIPT} ${WEBKIT_VERSION_CONFIG}
)

if(NOT ENABLE_INSPECTOR)
    list(REMOVE_ITEM WEBKIT_SRC
        Api/WebInspector.cpp
        Api/WebScriptCallFrame.cpp
        Api/WebScriptDebugServer.cpp
        WebCoreSupport/WebInspectorClient.cpp
    )
endif(NOT ENABLE_INSPECTOR)

include_directories(
    ${BASE_INCLUDE_DIRS}
    ${WTF_INCLUDE_DIRS}
    ${BAL_INCLUDE_DIRS}
    ${JAVASCRIPTCORE_INCLUDE_DIRS}
    ${WEBCORE_INCLUDE_DIRS}
    ${WEBKIT_INCLUDE_DIRS}
    ${WEBKIT_GENERATED_DIR}
    ${OWB_BINARY_DIR}/generated_sources/WebCore
    ${OWB_BINARY_DIR}/generated_sources/WebKit
    ${OWB_BINARY_DIR}/generated_sources/WebCore/html
    ${EXTERNAL_DEPS_INCLUDE_DIRS}
)

include(AddWebKitCompilerFlags)

set_source_files_properties(${WEBKIT_SRC}
    PROPERTIES COMPILE_FLAGS "-fno-exceptions"
)
add_library(webkit-owb STATIC ${WEBKIT_SRC})
add_dependencies(webkit-owb webcore)

target_link_libraries(webkit-owb
    ${WEBKKIT_LD_FLAGS}
    ${EXTERNAL_DEPS_LIBRARIES}
)

target_link_libraries(webkit-owb LINK_INTERFACE_LIBRARIES)

##################################################
# webkit-owb installation.                       #
##################################################

set_target_properties(webkit-owb
    PROPERTIES SOVERSION ${WEBKIT_VERSION}
)
configure_file(
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/webkit-owb.pc.in
    ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/webkit-owb.pc
    @ONLY
)

#install(TARGETS webkit-owb
#    LIBRARY DESTINATION lib
#)
install(FILES ${API_HEADER}
    DESTINATION include/webkit-owb
    PERMISSIONS OWNER_READ GROUP_READ WORLD_READ
)
install(FILES ${OWB_SOURCE_DIR}/Source/WebKit/OrigynWebBrowser/webkit-owb.pc
    DESTINATION lib/pkgconfig
    PERMISSIONS OWNER_READ GROUP_READ WORLD_READ
)
install(DIRECTORY ${OWB_SOURCE_DIR}/Resources/
    DESTINATION share/webkit-owb/resources
    PATTERN ".svn" EXCLUDE
    PERMISSIONS OWNER_READ GROUP_READ WORLD_READ
)

