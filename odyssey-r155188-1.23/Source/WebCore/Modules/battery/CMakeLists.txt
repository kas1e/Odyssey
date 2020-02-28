IF (ENABLE_BATTERY_STATUS)
   LIST(APPEND IDL_SRC
        Modules/battery/NavigatorBattery.idl
        Modules/battery/BatteryManager.idl
    )
    LIST(APPEND WEBCORE_SRC
        Modules/battery/NavigatorBattery.cpp
        Modules/battery/BatteryController.cpp
        Modules/battery/BatteryManager.cpp
        Modules/battery/BatteryStatus.cpp
    )
ENDIF (ENABLE_BATTERY_STATUS)           
