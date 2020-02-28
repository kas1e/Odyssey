if(ENABLE_INDEXED_DATABASE)
    list(APPEND WEBCORE_SRC
    Modules/indexeddb/DOMWindowIndexedDatabase.cpp
    Modules/indexeddb/IDBAny.cpp
    Modules/indexeddb/IDBCursor.cpp
    Modules/indexeddb/IDBCursorBackendImpl.cpp
    Modules/indexeddb/IDBCursorWithValue.cpp
    Modules/indexeddb/IDBDatabase.cpp
    Modules/indexeddb/IDBDatabaseBackendImpl.cpp
    Modules/indexeddb/IDBDatabaseCallbacksImpl.cpp
    Modules/indexeddb/IDBDatabaseException.cpp
    Modules/indexeddb/IDBEventDispatcher.cpp
    Modules/indexeddb/IDBFactory.cpp
    Modules/indexeddb/IDBFactoryBackendImpl.cpp
    Modules/indexeddb/IDBFactoryBackendInterface.cpp
    Modules/indexeddb/IDBIndex.cpp
    Modules/indexeddb/IDBKey.cpp
    Modules/indexeddb/IDBKeyRange.cpp
    Modules/indexeddb/IDBKeyPath.cpp
    Modules/indexeddb/IDBBackingStore.cpp 
    Modules/indexeddb/IDBLevelDBCoding.cpp
    Modules/indexeddb/IDBObjectStore.cpp
    Modules/indexeddb/IDBObjectStoreBackendImpl.cpp
    Modules/indexeddb/IDBOpenDBRequest.cpp
    Modules/indexeddb/IDBPendingTransactionMonitor.cpp
    Modules/indexeddb/IDBRequest.cpp
    Modules/indexeddb/IDBTransaction.cpp
    Modules/indexeddb/IDBTransactionBackendImpl.cpp
    Modules/indexeddb/IDBTransactionCoordinator.cpp
    Modules/indexeddb/IDBVersionChangeEvent.cpp
    Modules/indexeddb/PageGroupIndexedDatabase.cpp
    )

    list(APPEND IDL_SRC
    Modules/indexeddb/DOMWindowIndexedDatabase.idl
    Modules/indexeddb/IDBAny.idl
    Modules/indexeddb/IDBCursor.idl
    Modules/indexeddb/IDBCursorWithValue.idl
    Modules/indexeddb/IDBDatabase.idl
    Modules/indexeddb/IDBFactory.idl
    Modules/indexeddb/IDBIndex.idl
    Modules/indexeddb/IDBKeyRange.idl
    Modules/indexeddb/IDBObjectStore.idl
    Modules/indexeddb/IDBOpenDBRequest.idl
    Modules/indexeddb/IDBRequest.idl
    Modules/indexeddb/IDBTransaction.idl
    Modules/indexeddb/IDBVersionChangeEvent.idl
    )

if(ENABLE_WORKERS)
    list(APPEND WEBCORE_SRC
        Modules/indexeddb/WorkerGlobalScopeIndexedDatabase.cpp
    )

    list(APPEND IDL_SRC
        Modules/indexeddb/WorkerGlobalScopeIndexedDatabase.idl 
    )
endif(ENABLE_WORKERS)  

endif(ENABLE_INDEXED_DATABASE)  
