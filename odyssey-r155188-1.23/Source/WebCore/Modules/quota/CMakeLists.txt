IF (ENABLE_QUOTA)
    LIST(APPEND IDL_SRC
    	Modules/quota/DOMWindowQuota.idl
	Modules/quota/NavigatorStorageQuota.idl 
    	Modules/quota/StorageErrorCallback.idl
	Modules/quota/StorageInfo.idl	
	Modules/quota/StorageQuota.idl    
	Modules/quota/StorageQuotaCallback.idl
	Modules/quota/StorageUsageCallback.idl
	Modules/quota/WorkerNavigatorStorageQuota.idl

    )
    LIST(APPEND WEBCORE_SRC
        Modules/quota/DOMWindowQuota.cpp
	Modules/quota/NavigatorStorageQuota.cpp
	Modules/quota/StorageErrorCallback.cpp
	Modules/quota/StorageInfo.cpp
	Modules/quota/StorageQuota.cpp
	Modules/quota/WorkerNavigatorStorageQuota.cpp
	Modules/quota/WorkerNavigatorStorageQuota.cpp 
    )
ENDIF (ENABLE_QUOTA)           
