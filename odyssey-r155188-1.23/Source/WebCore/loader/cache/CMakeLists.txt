list(APPEND WEBCORE_SRC
    loader/cache/CachedCSSStyleSheet.cpp
    loader/cache/CachedFont.cpp
    loader/cache/CachedImage.cpp
    loader/cache/CachedRawResource.cpp
    loader/cache/CachedResource.cpp
    loader/cache/CachedResourceHandle.cpp
    loader/cache/CachedResourceLoader.cpp
    loader/cache/CachedResourceRequest.cpp
    loader/cache/CachedResourceRequestInitiators.cpp 
    loader/cache/CachedScript.cpp
    loader/cache/CachedShader.cpp
    loader/cache/CachedSVGDocument.cpp
    loader/cache/CachedSVGDocumentReference.cpp
    loader/cache/CachedXSLStyleSheet.cpp
    loader/cache/MemoryCache.cpp
)

if (ENABLE_VIDEO_TRACK)
list(APPEND WEBCORE_SRC
     loader/cache/CachedTextTrack.cpp 
)
endif ()
