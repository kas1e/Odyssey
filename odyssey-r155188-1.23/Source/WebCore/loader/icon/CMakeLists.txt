list(APPEND WEBCORE_SRC
    loader/icon/IconLoader.cpp
)

if(ENABLE_ICONDATABASE)
    list(APPEND WEBCORE_SRC
        loader/icon/IconController.cpp
        loader/icon/IconDatabase.cpp
	loader/icon/IconDatabaseBase.cpp 
        loader/icon/IconRecord.cpp
        loader/icon/PageURLRecord.cpp
    )
else(ENABLE_ICONDATABASE)
    list(APPEND WEBCORE_SRC
        loader/icon/IconDatabaseNone.cpp
    )
endif(ENABLE_ICONDATABASE)

