IF (ENABLE_FILE_SYSTEM)
list(APPEND WEBCORE_SRC
    fileapi/AsyncFileStream.cpp
    fileapi/Blob.cpp
    fileapi/BlobURL.cpp
    fileapi/File.cpp
    fileapi/FileException.cpp
    fileapi/FileList.cpp
    fileapi/FileReader.cpp
    fileapi/FileReaderLoader.cpp
    fileapi/FileReaderSync.cpp
    fileapi/FileThread.cpp
    fileapi/ThreadableBlobRegistry.cpp
    fileapi/WebKitBlobBuilder.cpp
) 

list(APPEND IDL_SRC
    fileapi/Blob.idl
    fileapi/File.idl
    fileapi/FileError.idl
    fileapi/FileException.idl
    fileapi/FileList.idl
    fileapi/FileReader.idl
    fileapi/FileReaderSync.idl
)

ENDIF (ENABLE_FILE_SYSTEM)
