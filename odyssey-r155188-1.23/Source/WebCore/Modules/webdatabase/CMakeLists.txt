IF (ENABLE_SQL_DATABASE)
    LIST(APPEND WEBCORE_SRC
        Modules/webdatabase/ChangeVersionWrapper.cpp
        Modules/webdatabase/DOMWindowWebDatabase.cpp
        Modules/webdatabase/Database.cpp
        Modules/webdatabase/DatabaseAuthorizer.cpp
	Modules/webdatabase/DatabaseBackend.cpp
	Modules/webdatabase/DatabaseBackendBase.cpp
	Modules/webdatabase/DatabaseBackendContext.cpp
	Modules/webdatabase/DatabaseBackendSync.cpp
	Modules/webdatabase/DatabaseBase.cpp 
        Modules/webdatabase/DatabaseContext.cpp
	Modules/webdatabase/DatabaseManager.cpp
	Modules/webdatabase/DatabaseServer.cpp
        Modules/webdatabase/DatabaseSync.cpp
        Modules/webdatabase/DatabaseTask.cpp
        Modules/webdatabase/DatabaseThread.cpp
        Modules/webdatabase/DatabaseTracker.cpp
	Modules/webdatabase/OriginLock.cpp     
        Modules/webdatabase/SQLException.cpp
        Modules/webdatabase/SQLResultSet.cpp
        Modules/webdatabase/SQLResultSetRowList.cpp
        Modules/webdatabase/SQLStatement.cpp
	Modules/webdatabase/SQLStatementBackend.cpp 
        Modules/webdatabase/SQLStatementSync.cpp
        Modules/webdatabase/SQLTransaction.cpp
	Modules/webdatabase/SQLTransactionBackend.cpp
	Modules/webdatabase/SQLTransactionBackendSync.cpp
        Modules/webdatabase/SQLTransactionClient.cpp
        Modules/webdatabase/SQLTransactionCoordinator.cpp
	Modules/webdatabase/SQLTransactionStateMachine.cpp
        Modules/webdatabase/SQLTransactionSync.cpp
    )

    LIST(APPEND IDL_SRC
        Modules/webdatabase/DOMWindowWebDatabase.idl
        Modules/webdatabase/Database.idl
        Modules/webdatabase/DatabaseCallback.idl
        Modules/webdatabase/DatabaseSync.idl
        Modules/webdatabase/SQLError.idl
        Modules/webdatabase/SQLException.idl
        Modules/webdatabase/SQLResultSet.idl
        Modules/webdatabase/SQLResultSetRowList.idl
        Modules/webdatabase/SQLStatementCallback.idl
        Modules/webdatabase/SQLStatementErrorCallback.idl
        Modules/webdatabase/SQLTransaction.idl
        Modules/webdatabase/SQLTransactionCallback.idl
        Modules/webdatabase/SQLTransactionErrorCallback.idl
        Modules/webdatabase/SQLTransactionSync.idl
        Modules/webdatabase/SQLTransactionSyncCallback.idl
    )
ENDIF (ENABLE_SQL_DATABASE)

IF (ENABLE_SQL_DATABASE AND ENABLE_WORKERS)
    LIST(APPEND WEBCORE_SRC
        Modules/webdatabase/WorkerGlobalScopeWebDatabase.cpp
    )

    LIST(APPEND IDL_SRC
        Modules/webdatabase/WorkerGlobalScopeWebDatabase.idl
    )
ENDIF (ENABLE_SQL_DATABASE AND ENABLE_WORKERS)  
