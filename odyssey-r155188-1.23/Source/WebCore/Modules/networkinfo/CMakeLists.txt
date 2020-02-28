IF (ENABLE_NETWORK_INFO)
   LIST(APPEND WEBCORE_SRC
        Modules/networkinfo/NavigatorNetworkInfoConnection.cpp
        Modules/networkinfo/NetworkInfo.cpp
        Modules/networkinfo/NetworkInfoConnection.cpp
        Modules/networkinfo/NetworkInfoController.cpp
    )

    LIST(APPEND IDL_SRC
        Modules/networkinfo/NavigatorNetworkInfoConnection.idl
        Modules/networkinfo/NetworkInfoConnection.idl
    )
ENDIF (ENABLE_NETWORK_INFO)  
