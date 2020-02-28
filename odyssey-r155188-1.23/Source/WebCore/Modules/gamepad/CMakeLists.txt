IF (ENABLE_GAMEPAD)
   LIST(APPEND IDL_SRC
        Modules/gamepad/Gamepad.idl
        Modules/gamepad/GamepadList.idl
	Modules/gamepad/NavigatorGamepad.idl 
    )
    LIST(APPEND WEBCORE_SRC
    	Modules/gamepad/Gamepad.cpp
	Modules/gamepad/GamepadList.cpp
        Modules/gamepad/NavigatorGamepad.cpp
    )
ENDIF (ENABLE_GAMEPAD)           
