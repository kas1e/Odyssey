IF (ENABLE_VIBRATION)
    LIST(APPEND IDL_SRC
        Modules/vibration/NavigatorVibration.idl
    )
    LIST(APPEND WEBCORE_SRC
        Modules/vibration/NavigatorVibration.cpp
    	Modules/vibration/Vibration.cpp
    )
ENDIF (ENABLE_VIBRATION)           
