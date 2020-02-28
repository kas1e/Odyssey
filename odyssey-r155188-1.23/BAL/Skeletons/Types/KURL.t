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
#ifndef KURL_h
#define KURL_h
/**
 *  @file  KURL.t
 *  KURL description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#include "PlatformString.h"




namespace WebCore {

class TextEncoding;

// FIXME: Our terminology here is a bit inconsistent. We refer to the part
// after the "#" as the "fragment" in some places and the "ref" in others.
// We should fix the terminology to match the URL and URI RFCs as closely
// as possible to resolve this.

class KURL : public WebCoreBase {
public:
    // Generates a URL which contains a null string.
    /**
     *  KURL description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    KURL() ;

    // The argument is an absolute URL string. The string is assumed to be
    // already encoded.
    // FIXME: This constructor has a special case for strings that start with
    // "/", prepending "file://" to such strings; it would be good to get
    // rid of that special case.
    /**
     *  KURL description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    explicit KURL(const char*);

    // The argument is an absolute URL string. The string is assumed to be
    // already encoded.
    // FIXME: For characters with codes other than 0000-00FF will be chopped
    // off, so this call is currently not safe to use with arbitrary strings.
    // FIXME: This constructor has a special case for strings that start with
    // "/", prepending "file://" to such strings; it would be good to get
    // rid of that special case.
    /**
     *  KURL description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    explicit KURL(const String&);

    // Resolves the relative URL with the given base URL. If provided, the
    // TextEncoding is used to encode non-ASCII characers. The base URL can be
    // null or empty, in which case the relative URL will be interpreted as
    // absolute.
    // FIXME: If the base URL is invalid, this always creates an invalid
    // URL. Instead I think it would be better to treat all invalid base URLs
    // the same way we treate null and empty base URLs.
    /**
     *  KURL description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    KURL(const KURL& base, const String& relative);
    /**
     *  KURL description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    KURL(const KURL& base, const String& relative, const TextEncoding&);

    // FIXME: The above functions should be harmonized so that passing a
    // base of null or the empty string gives the same result as the
    // standard String constructor.

    /**
     *  isNull description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool isNull() const ;
    /**
     *  isEmpty description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool isEmpty() const ;

    /**
     *  isValid description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool isValid() const ;

    // Returns true if this URL has a path. Note that "http://foo.com/" has a
    // path of "/", so this function will return true. Only invalid or
    // non-hierarchical (like "javascript:") URLs will have no path.
    /**
     *  hasPath description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool hasPath() const;

    /**
     *  string description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    const String& string() const ;

    /**
     *  protocol description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    String protocol() const;
    /**
     *  host description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    String host() const;
    /**
     *  port description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    unsigned short port() const;
    /**
     *  user description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    String user() const;
    /**
     *  pass description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    String pass() const;
    /**
     *  path description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    String path() const;
    /**
     *  lastPathComponent description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    String lastPathComponent() const;
    /**
     *  query description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    String query() const; // Includes the "?".
    /**
     *  ref description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    String ref() const; // Does *not* include the "#".
    /**
     *  hasRef description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool hasRef() const;

    /**
     *  prettyURL description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    String prettyURL() const;
    /**
     *  fileSystemPath description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    String fileSystemPath() const;

    // Returns true if the current URL's protocol is the same as the null-
    // terminated ASCII argument. The argument must be lower-case.
    /**
     *  protocolIs description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool protocolIs(const char*) const;
    /**
     *  isLocalFile description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool isLocalFile() const;

    /**
     *  setProtocol description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void setProtocol(const String&);
    /**
     *  setHost description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void setHost(const String&);

    // Setting the port to 0 will clear any port from the URL.
    /**
     *  setPort description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void setPort(unsigned short);

    // Input is like "foo.com" or "foo.com:8000".
    /**
     *  setHostAndPort description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void setHostAndPort(const String&);

    /**
     *  setUser description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void setUser(const String&);
    /**
     *  setPass description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void setPass(const String&);

    // If you pass an empty path for HTTP or HTTPS URLs, the resulting path
    // will be "/".
    /**
     *  setPath description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void setPath(const String&);

    // The query may begin with a question mark, or, if not, one will be added
    // for you. Setting the query to the empty string will leave a "?" in the
    // URL (with nothing after it). To clear the query, pass a null string.
    /**
     *  setQuery description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void setQuery(const String&);

    /**
     *  setRef description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void setRef(const String&);
    /**
     *  removeRef description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void removeRef();
    

    /**
     *  equalIgnoringRef description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    friend bool equalIgnoringRef(const KURL&, const KURL&);

    /**
     *  protocolHostAndPortAreEqual description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    friend bool protocolHostAndPortAreEqual(const KURL&, const KURL&);
    
    /**
     *  String& description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    operator const String&() const ;

    /**
     *  JSC::UString description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    operator JSC::UString() const ; 

    /**
     *  hostStart description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    unsigned hostStart() const ;
    /**
     *  hostEnd description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    unsigned hostEnd() const ;
    
    /**
     *  pathStart description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    unsigned pathStart() const ;
    /**
     *  pathEnd description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    unsigned pathEnd() const ;
    /**
     *  pathAfterLastSlash description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    unsigned pathAfterLastSlash() const ;




#ifndef NDEBUG
    /**
     *  print description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void print() const;
#endif

private:
    /**
     *  invalidate description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void invalidate();
    /**
     *  isHierarchical description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool isHierarchical() const;
    /**
     *  init description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void init(const KURL&, const String&, const TextEncoding&);
    /**
     *  protocolIs description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    static bool protocolIs(const String&, const char*);
    /**
     *  copyToBuffer description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void copyToBuffer(Vector<char, 512>& buffer) const;
    
    // Parses the given URL. The originalString parameter allows for an
    // optimization: When the source is the same as the fixed-up string,
    // it will use the passed-in string instead of allocating a new one.
    /**
     *  parse description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void parse(const String&);
    /**
     *  parse description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void parse(const char* url, const String* originalString);

    String m_string;
    bool m_isValid;
    int m_schemeEnd;
    int m_userStart;
    int m_userEnd;
    int m_passwordEnd;
    int m_hostEnd;
    int m_portEnd;
    int m_pathAfterLastSlash;
    int m_pathEnd;
    int m_queryEnd;
    int m_fragmentEnd;
};

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
bool operator==(const KURL&, const KURL&);
    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
bool operator==(const KURL&, const String&);
    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
bool operator==(const String&, const KURL&);
    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
bool operator!=(const KURL&, const KURL&);
    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
bool operator!=(const KURL&, const String&);
    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
bool operator!=(const String&, const KURL&);

    /**
     *  equalIgnoringRef description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
bool equalIgnoringRef(const KURL&, const KURL&);
    /**
     *  protocolHostAndPortAreEqual description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
bool protocolHostAndPortAreEqual(const KURL&, const KURL&);
    
    /**
     *  blankURL description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
const KURL& blankURL();

// Functions to do URL operations on strings.
// These are operations that aren't faster on a parsed URL.

    /**
     *  protocolIs description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
bool protocolIs(const String& url, const char* protocol);

    /**
     *  mimeTypeFromDataURL description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
String mimeTypeFromDataURL(const String& url);

// Unescapes the given string using URL escaping rules, given an optional
// encoding (defaulting to UTF-8 otherwise). DANGER: If the URL has "%00"
// in it, the resulting string will have embedded null characters!
    /**
     *  decodeURLEscapeSequences description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
String decodeURLEscapeSequences(const String&);
    /**
     *  decodeURLEscapeSequences description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
String decodeURLEscapeSequences(const String&, const TextEncoding&);

    /**
     *  encodeWithURLEscapeSequences description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
String encodeWithURLEscapeSequences(const String&);

// Inlines.

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline bool operator==(const KURL& a, const KURL& b);

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline bool operator==(const KURL& a, const String& b);

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline bool operator==(const String& a, const KURL& b);

    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline bool operator!=(const KURL& a, const KURL& b);

    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline bool operator!=(const KURL& a, const String& b);

    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline bool operator!=(const String& a, const KURL& b);

}

#endif // KURL_h

