IF (ENABLE_MEDIA_SOURCE)
    LIST(APPEND IDL_SRC
        Modules/mediasource/MediaSource.idl
        Modules/mediasource/SourceBuffer.idl
        Modules/mediasource/SourceBufferList.idl
    )
    LIST(APPEND WEBCORE_SRC
        Modules/mediasource/MediaSource.cpp
	Modules/mediasource/MediaSourceRegistry.cpp 
    	Modules/mediasource/SourceBuffer.cpp
    	Modules/mediasource/SourceBufferList.cpp
	Modules/mediasource/MediaSourceRegistry.cpp
    )
ENDIF (ENABLE_MEDIA_SOURCE)           
