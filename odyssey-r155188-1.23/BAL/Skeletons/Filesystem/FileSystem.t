/*
 * Copyright (C) 2008 Pleyo.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1.  Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 * 2.  Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 * 3.  Neither the name of Pleyo nor the names of
 *     its contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY PLEYO AND ITS CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL PLEYO OR ITS CONTRIBUTORS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#ifndef FileSystem_h
#define FileSystem_h
/**
 *  @file  FileSystem.t
 *  FileSystem description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:05 $
 */
#include "BALBase.h"


#include <time.h>

#include <wtf/Platform.h>

typedef const struct __CFData* CFDataRef;

namespace WebCore {

class CString;
class String;


    /**
     * Check wether a files exists.
     * @param[in] : a filename.
     * @param[out] : true if file exists, false otherwise.
     * @code
     * @endcode
     */
    bool fileExists(const String&);

    /**
     * Delete a file.
     * @param[in] : a filename.
     * @param[out] : true for a successful deletion, false otherwise.
     * @code
     * @endcode
     */
    bool deleteFile(const String&);

    /**
     * Remove an empty directory.
     * @param[in] : a directory name.
     * @param[out] : true for a successful deletion, false otherwise.
     * @code
     * @endcode
     */
    bool deleteEmptyDirectory(const String&);

    /**
     * Retrieve the size of a file.
     * @param[in] : a filename.
     * @param[in] : a reference to store the length.
     * @param[out] : true if everything is ok.
     * @code
     * @endcode
     */
    bool getFileSize(const String&, long long& result);

    /**
     * Retrieve the last modification time for a file.
     * @param[in] : a filename.
     * @param[in] : a reference to store the last modification time.
     * @param[out] : true if everything is ok.
     * @code
     * @endcode
     */
    bool getFileModificationTime(const String&, time_t& result);

    /**
     * Concatenate a path with a component.
     * @param[in] : a reference to a path.
     * @param[in] : a reference to a component to concatenate.
     * @param[out] : the concatenation of the two previous arguments.
     * @code
     * @endcode
     */
    String pathByAppendingComponent(const String& path, const String& component);

    /**
     * Create a/some directory/ies.
     * @param[in] : the path to create.
     * @param[out] : true if operation is successful.
     * @code
     * @endcode
     */
    bool makeAllDirectories(const String& path);

    /**
     * Retrieve the user home directory.
     * @param[out] : a string representing the user home directory.
     * @code
     * @endcode
     */
    String homeDirectoryPath();

    /**
     * Get the basename.
     * @param[in] : a reference to a String
     * @param[out] : a string representing the basename 
     * @code
     * @endcode
     */
    String pathGetFileName(const String&);

    /**
     * Get the dirname.
     * @param[in] : a reference to a String.
     * @param[out] : a string representing the dirname.
     * @code
     * @endcode
     */
    String directoryName(const String&);
   
    /**
     * List directories matching a filter.
     * @param[in] : a path.
     * @param[in] : a filter.
     * @param[out] : a vector containing matching directories.
     * @code
     * @endcode
     */
    Vector<String> listDirectory(const String& path, const String& filter = String());

    /**
     * Get the filesystem representation.
     * @param[in] : a string.
     * @param[out] : a string describing the filesystem representation.
     * @code
     * @endcode
     */
    CString fileSystemRepresentation(const String&);

    /**
     * test if the handle is valid description
     * @param[in] : a reference to a handle.
     * @param[out] : status
     * @code
     * @endcode
     */
     inline bool isHandleValid(const PlatformFileHandle& handle) ;

    // Prefix is what the filename should be prefixed with, not the full path.
    /**
     * Create a temporary file.
     * @param[in] : a path where to create the file.
     * @param[in] : a reference to a handle.
     * @param[out] : the name of the newly created file.
     * @code
     * @endcode
     */
    CString openTemporaryFile(const char* prefix, PlatformFileHandle&);

    /**
     * close file 
     * @param[in] : a reference to a handle.
     * @code
     * @endcode
     */
     void closeFile(PlatformFileHandle&);

    /**
     * Write some data to a file.
     * @param[in] : a handle to the file.
     * @param[in] : a pointer to data to write.
     * @param[in] : length of data to write.
     * @param[out] : length of data really written into the file.
     * @code
     * @endcode
     */
    int writeToFile(PlatformFileHandle, const char* data, int length);

    // Methods for dealing with loadable modules
    /**
     * Unload a module. 
     * @param[in] : a module to unload.
     * @param[out] : true if evrything is ok.
     * @code
     * @endcode
     */
    bool unloadModule(PlatformModule);


} // namespace WebCore

#endif // 
