list(APPEND WEBCORE_SRC
    storage/StorageThread.cpp
    storage/Storage.cpp
    storage/StorageAreaImpl.cpp
    storage/StorageAreaSync.cpp
    storage/StorageEvent.cpp
    storage/StorageEventDispatcher.cpp
    storage/StorageMap.cpp
    storage/StorageNamespace.cpp
    storage/StorageNamespaceImpl.cpp
    storage/StorageStrategy.cpp
    storage/StorageSyncManager.cpp
    storage/StorageTracker.cpp
)

list(APPEND IDL_SRC
    storage/Storage.idl
    storage/StorageEvent.idl
)
