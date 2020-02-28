IF (ENABLE_PROXIMITY_EVENTS)
    LIST(APPEND IDL_SRC
        Modules/proximity/DeviceProximityEvent.idl
    )
    LIST(APPEND WEBCORE_SRC
        Modules/proximity/DeviceProximityController.cpp
    	Modules/proximity/DeviceProximityEvent.cpp
    )
ENDIF (ENABLE_PROXIMITY_EVENTS)           
