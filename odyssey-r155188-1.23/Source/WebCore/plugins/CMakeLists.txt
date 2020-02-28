list(APPEND WEBCORE_SRC
    plugins/DOMMimeType.cpp
    plugins/DOMMimeTypeArray.cpp
    plugins/DOMPlugin.cpp
    plugins/DOMPluginArray.cpp
    plugins/PluginData.cpp
    plugins/PluginDatabase.cpp	
    plugins/PluginDebug.cpp 
    plugins/PluginMainThreadScheduler.cpp
    plugins/PluginStream.cpp
    plugins/PluginView.cpp
    plugins/PluginDebug.cpp
)
list(APPEND IDL_SRC
    plugins/DOMMimeType.idl
    plugins/DOMMimeTypeArray.idl
    plugins/DOMPlugin.idl
    plugins/DOMPluginArray.idl)

if(ENABLE_NPAPI)
    list(APPEND WEBCORE_SRC
        plugins/PluginPackage.cpp
        plugins/npapi.cpp
    )
    if(USE_GRAPHICS_GTK)
        list(APPEND WEBCORE_SRC
            plugins/gtk/PluginPackageGtk.cpp
            plugins/gtk/PluginDataGtk.cpp
            plugins/gtk/PluginViewGtk.cpp
            plugins/gtk/gtk2xtbin.c
        )
    endif(USE_GRAPHICS_GTK)

    if(USE_GRAPHICS_QT)
        list(APPEND WEBCORE_SRC
            plugins/qt/PluginContainerQt.cpp
            plugins/qt/PluginPackageQt.cpp
            plugins/qt/PluginDataQt.cpp
            plugins/qt/PluginViewQt.cpp
        )
        owb_generate_moc(WEBCORE_SRC ${OWB_SOURCE_DIR}/WebCore/plugins/qt/PluginContainerQt.h moc_PluginContainerQt.cpp)
    endif(USE_GRAPHICS_QT)

    if(USE_NPAPI_SDL)
        list(APPEND WEBCORE_SRC
            plugins/Generic/PluginPackageGeneric.cpp
            plugins/Generic/PluginDataGeneric.cpp
            plugins/Generic/PluginViewGeneric.cpp
        )
    endif(USE_NPAPI_SDL)

    if(USE_GRAPHICS_MORPHOS)
        list(APPEND WEBCORE_SRC
           plugins/MorphOS/PluginPackageMorphOS.cpp
           plugins/MorphOS/PluginDataMorphOS.cpp
           plugins/MorphOS/PluginViewMorphOS.cpp
        )
    endif(USE_GRAPHICS_MORPHOS)

else(ENABLE_NPAPI)
     list(APPEND WEBCORE_SRC
         plugins/PluginDataNone.cpp
         plugins/PluginPackageNone.cpp
         plugins/PluginViewNone.cpp
     )
endif(ENABLE_NPAPI) 

if(NOT IGNORE_CUSTOMER)
    include(plugins/Customer/CMakeLists.txt OPTIONAL)
endif(NOT IGNORE_CUSTOMER)
