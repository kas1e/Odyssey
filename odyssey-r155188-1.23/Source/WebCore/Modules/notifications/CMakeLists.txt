IF (ENABLE_NOTIFICATIONS)
    LIST(APPEND IDL_SRC
        Modules/notifications/DOMWindowNotifications.idl
       	Modules/notifications/Notification.idl
    	Modules/notifications/NotificationCenter.idl
    	Modules/notifications/NotificationPermissionCallback.idl
    	#Modules/notifications/WorkerGlobalScopeNotifications.idl
    )
    LIST(APPEND WEBCORE_SRC
        Modules/notifications/DOMWindowNotifications.cpp
    	Modules/notifications/NotificationCenter.cpp
    	Modules/notifications/NotificationController.cpp
    	Modules/notifications/Notification.cpp
    	#Modules/notifications/WorkerGlobalScopeNotifications.cpp
    )
ENDIF (ENABLE_NOTIFICATIONS)           
