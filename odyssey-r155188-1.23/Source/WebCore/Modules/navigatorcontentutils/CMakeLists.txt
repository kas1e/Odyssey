IF (ENABLE_NAVIGATOR_CONTENT_UTILS)
    LIST(APPEND IDL_SRC
    	Modules/navigatorcontentutils/NavigatorContentUtils.idl
    )
    LIST(APPEND WEBCORE_SRC
        Modules/navigatorcontentutils/NavigatorContentUtils.cpp
    )
ENDIF (ENABLE_NAVIGATOR_CONTENT_UTILS)           
