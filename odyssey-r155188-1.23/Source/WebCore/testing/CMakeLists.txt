   LIST(APPEND IDL_SRC
        testing/Internals.idl
        testing/InternalSettings.idl
	testing/MallocStatistics.idl
	testing/MemoryInfo.idl
	testing/TypeConversions.idl
	testing/InternalSettingsGenerated.idl
    )
    LIST(APPEND WEBCORE_SRC
        testing/Internals.cpp
	testing/InternalSettings.cpp
    )
