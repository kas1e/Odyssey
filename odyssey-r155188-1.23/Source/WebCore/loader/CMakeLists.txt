list(APPEND WEBCORE_SRC
    loader/AdBlock.cpp
    loader/CookieJar.cpp
    loader/CrossOriginAccessControl.cpp
    loader/CrossOriginPreflightResultCache.cpp
    loader/DocumentLoadTiming.cpp
    loader/DocumentLoader.cpp
    loader/DocumentThreadableLoader.cpp
    loader/DocumentWriter.cpp
    loader/EmptyClients.cpp
    loader/FTPDirectoryParser.cpp
    loader/FormState.cpp
    loader/FormSubmission.cpp
    loader/FrameLoadRequest.cpp
    loader/FrameLoader.cpp
    loader/FrameLoaderStateMachine.cpp
    loader/HistoryController.cpp
    loader/ImageLoader.cpp
    loader/LinkLoader.cpp
    loader/LoaderStrategy.cpp 
    loader/MixedContentChecker.cpp
    loader/NavigationAction.cpp
    loader/NetscapePlugInStreamLoader.cpp
    loader/PingLoader.cpp
    loader/PlaceholderDocument.cpp
    loader/PolicyCallback.cpp
    loader/PolicyChecker.cpp
    loader/ProgressTracker.cpp
    loader/NavigationScheduler.cpp
    loader/ResourceBuffer.cpp
    loader/ResourceLoadNotifier.cpp
    loader/ResourceLoadScheduler.cpp
    loader/ResourceLoader.cpp
    loader/SinkDocument.cpp
    loader/SubframeLoader.cpp
    loader/SubresourceLoader.cpp
    loader/TextResourceDecoder.cpp
    loader/TextTrackLoader.cpp
    loader/ThreadableLoader.cpp
    loader/WorkerThreadableLoader.cpp
    loader/archive/Archive.cpp
    loader/archive/ArchiveFactory.cpp
    loader/archive/ArchiveResource.cpp
    loader/archive/ArchiveResourceCollection.cpp
)

if(ENABLE_OFFLINE_WEB_APPLICATIONS)
    list(APPEND WEBCORE_SRC
        loader/appcache/ApplicationCache.cpp
        loader/appcache/ApplicationCacheGroup.cpp
        loader/appcache/ApplicationCacheHost.cpp
        loader/appcache/ApplicationCacheResource.cpp
        loader/appcache/ApplicationCacheStorage.cpp
        loader/appcache/DOMApplicationCache.cpp
        loader/appcache/ManifestParser.cpp
    )
    list(APPEND IDL_SRC
        loader/appcache/DOMApplicationCache.idl
    )
endif(ENABLE_OFFLINE_WEB_APPLICATIONS)

if(ENABLE_MHTML)
    list(APPEND WEBCORE_SRC
      loader/archive/mhtml/MHTMLArchive.cpp
      loader/archive/mhtml/MHTMLParser.cpp
    )
endif()    
