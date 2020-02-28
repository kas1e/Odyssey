IF (ENABLE_GEOLOCATION)
list(APPEND WEBCORE_SRC
    Modules/geolocation/Coordinates.cpp
    Modules/geolocation/Geolocation.cpp
    Modules/geolocation/GeolocationController.cpp
    Modules/geolocation/NavigatorGeolocation.cpp
) 

list(APPEND IDL_SRC
    Modules/geolocation/Coordinates.idl  
    Modules/geolocation/Geolocation.idl
    Modules/geolocation/Geoposition.idl
    Modules/geolocation/NavigatorGeolocation.idl
    Modules/geolocation/PositionCallback.idl
    Modules/geolocation/PositionError.idl 
    Modules/geolocation/PositionErrorCallback.idl
)
ENDIF (ENABLE_GEOLOCATION)
