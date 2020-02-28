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
#ifndef MIMETypeRegistry_h
#define MIMETypeRegistry_h
/**
 *  @file  MIMETypeRegistry.t
 *  MIMETypeRegistry description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:05 $
 */
#include "BALBase.h"

#include "PlatformString.h"
#include "StringHash.h"
#include <wtf/HashSet.h>
#include <wtf/Vector.h>

namespace WebCore {

class MIMETypeRegistry : public WebCoreBase {
public:
    /**
     * get MIMEType for extension
     * @param[in] : extension
     * @param[out] : mimetype
     * @code
     * String m = MIMETypeRegistry::getMIMETypeForExtension(e);
     * @endcode
     */
    static String getMIMETypeForExtension(const String& ext);

    /**
     * get extensions for MIMEType 
     * @param[in] : mime type
     * @param[out] : extensions
     * @code
     * Vector<String> v = MIMETypeRegistry::getExtensionsForMIMEType(t);
     * @endcode
     */
    static Vector<String> getExtensionsForMIMEType(const String& type);

    /**
     * get preferred extension for MIMEType
     * @param[in] : mime type
     * @param[out] : preferred extension
     * @code
     * String e = MIMETypeRegistry::getPreferredExtensionForMIMEType(t);
     * @endcode
     */
    static String getPreferredExtensionForMIMEType(const String& type);

    /**
     * get MIMEType for path
     * @param[in] : path
     * @param[out] : mime type
     * @code
     * String t = MIMETypeRegistry::getMIMETypeForPath(p);
     * @endcode
     */
    static String getMIMETypeForPath(const String& path);

    /**
     * Check to see if a mime type is suitable for being loaded inline as an
     * image (e.g., <img> tags).
     * @param[in] : mime type
     * @param[out] : status
     * @code
     * bool s = MIMETypeRegistry::isSupportedImageMIMEType(m);
     * @endcode
     */
    static bool isSupportedImageMIMEType(const String& mimeType);

    /**
     * Check to see if a mime type is suitable for being loaded as an image
     * document in a frame.
     * @param[in] : mime type
     * @param[out] : status
     * @code
     * bool s = MIMETypeRegistry::isSupportedImageResourceMIMEType(m);
     * @endcode
     */
    static bool isSupportedImageResourceMIMEType(const String& mimeType);

    /**
     * Check to see if a mime type is suitable for being encoded.
     * @param[in] : mime type
     * @param[out] : status
     * @code
     * bool s = MIMETypeRegistry::isSupportedImageMIMETypeForEncoding(m);
     * @endcode
     */
    static bool isSupportedImageMIMETypeForEncoding(const String& mimeType);

    /**
     * Check to see if a mime type is suitable for being loaded as a JavaScript
     * resource.
     * @param[in] : mime type
     * @param[out] : status
     * @code
     * bool s = MIMETypeRegistry::isSupportedJavaScriptMIMEType(m);
     * @endcode
     */
    static bool isSupportedJavaScriptMIMEType(const String& mimeType);    

    /**
     * Check to see if a non-image mime type is suitable for being loaded as a
     * document in a frame.  Includes supported JavaScript MIME types.
     * @param[in] : mime type
     * @param[out] : status
     * @code
     * bool s = MIMETypeRegistry::isSupportedNonImageMIMEType(m);
     * @endcode
     */
    static bool isSupportedNonImageMIMEType(const String& mimeType);

    /**
     * Check to see if a mime type is suitable for being loaded using <video> and <audio>
     * @param[in] : mime type
     * @param[out] : status
     * @code
     * bool s = MIMETypeRegistry::isSupportedMediaMIMEType(m);
     * @endcode
     */
    static bool isSupportedMediaMIMEType(const String& mimeType); 

    /**
     * Check to see if a mime type is a valid Java applet mime type
     * @param[in] : mime type
     * @param[out] : status
     * @code
     * bool s = MIMETypeRegistry::isJavaAppletMIMEType(m);
     * @endcode
     */
    static bool isJavaAppletMIMEType(const String& mimeType);

    /**
     * get supported image MIMETypes
     * @param[out] : mime types
     * @code
     * HashSet<String> m = MIMETypeRegistry::getSupportedImageMIMETypes();
     * @endcode
     */
    static HashSet<String>& getSupportedImageMIMETypes();

    /**
     * get supported image resource mime types 
     * @param[out] : mime types
     * @code
     * HashSet<String> m = MIMETypeRegistry::getSupportedImageResourceMIMETypes();
     * @endcode
     */
    static HashSet<String>& getSupportedImageResourceMIMETypes();

    /**
     * get supported image mime types for encoding
     * @param[out] : mime types
     * @code
     * HashSet<String> m = MIMETypeRegistry::getSupportedImageMIMETypesForEncoding();
     * @endcode
     */
    static HashSet<String>& getSupportedImageMIMETypesForEncoding();

    /**
     * get supported non image mime types
     * @param[out] : mime type
     * @code
     * HashSet<String> m = MIMETypeRegistry::getSupportedNonImageMIMETypes();
     * @endcode
     */
    static HashSet<String>& getSupportedNonImageMIMETypes();

    /**
     * get supported media mime types
     * @param[out] : mime type
     * @code
     * HashSet<String> m = MIMETypeRegistry::getSupportedMediaMIMETypes();
     * @endcode
     */
    static HashSet<String>& getSupportedMediaMIMETypes();
};

} // namespace WebCore

#endif // MIMETypeRegistry_h




