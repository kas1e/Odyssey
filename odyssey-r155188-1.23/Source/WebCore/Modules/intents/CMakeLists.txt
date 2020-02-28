IF (ENABLE_INTENTS)
   LIST(APPEND IDL_SRC
       Modules/intents/DeliveredIntent.idl
       Modules/intents/DOMWindowIntents.idl
       Modules/intents/Intent.idl
       Modules/intents/IntentResultCallback.idl
       Modules/intents/NavigatorIntents.idl
    )
    LIST(APPEND WEBCORE_SRC
        Modules/intents/DOMWindowIntents.cpp
	Modules/intents/DeliveredIntent.cpp
    	Modules/intents/Intent.cpp
    	Modules/intents/IntentRequest.cpp
    	Modules/intents/NavigatorIntents.cpp
    )
ENDIF (ENABLE_INTENTS)           
