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
#ifndef FileChooser_h
#define FileChooser_h
/**
 *  @file  FileChooser.t
 *  FileChooser description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:05 $
 */
#include "BALBase.h"

#include "PlatformString.h"

namespace WebCore {

class Document;
class Font;
class Icon;

class FileChooserClient : public WebCoreBase {
public:
    /**
     * Destructor for FileChooserClient.
     * @code
     * @endcode
     */
    virtual ~FileChooserClient() ;

    /**
     * value changed for FileChooserClient.
     * @code
     * @endcode
     */
    virtual void valueChanged() = 0;
};

class FileChooser : public RefCounted<FileChooser> {
public:
    /**
     * Create a FileChooser from a FileChooserClient and an initial filename.
     * @param[in] : a pointer to a FileChooserClient.
     * @param[in] : a file name.
     * @param[out] : a PassRefPtr to a FileChooser.
     * @code
     * @endcode
     */
    static PassRefPtr<FileChooser> create(FileChooserClient*, const String& initialFilename);

    /**
     * Destructor for FileChooser.
     * @code
     * @endcode
     */
    ~FileChooser();

    /**
     * Disconnect client from FileChooser.
     * @code
     * @endcode
     */
    void disconnectClient() ;
    /**
     * Check FileChooserClient connection status.
     * @param[out] : return true when no client are connected.
     * @code
     * @endcode
     */
    bool disconnected() ;

    // FIXME: It's a layering violation that we pass a Document in here.
    // The platform directory is underneath the DOM, so it can't use the DOM.
    // Because of UI delegates, it's not clear that the FileChooser class
    // belongs in the platform layer at all. It might need to go alongside
    // the Chrome class instead.
    /**
     * Open a file chooser i.e. a widget allowing to choose a file.
     * @param[in] : a pointer to the Document.
     * @code
     * @endcode
     */
    void openFileChooser(Document*);

    /**
     * Get a file name.
     * @param[out] : a file name.
     * @code
     * @endcode
     */
    const String& filename() const ;

    /**
     * basenameForWidth. 
     * @param[in] : a reference to a Font.
     * @param[in] : a width.
     * @param[out] : a string.
     * @code
     * @endcode
     */
    String basenameForWidth(const Font&, int width) const;

    /**
     * Get an icon for the current FileChooser.
     * @param[out] : a pointer to an Icon.
     * @code
     * @endcode
     */
    Icon* icon() const ;

    /**
     * Clear the FileChooser member.
     * @code
     * @endcode
     */
    void clear(); // for use by client; does not call valueChanged

    /**
     * Choose a file.
     * @param[in] : a file name.
     * @code
     * @endcode
     */
    void chooseFile(const String& filename);

private:
    /**
     * Contructor for FileChooser.
     * @param[in] : a pointer to a FileChooserClient.
     * @param[in] : a reference to a filename.
     * @code
     * @endcode
     */
    FileChooser(FileChooserClient*, const String& initialFilename);
    /**
     * Retrieve an icon for a file.
     * @param[in] : a reference to a filename.
     * @param[out] : a PassRefPtr to an icon.
     * @code
     * @endcode
     */
    static PassRefPtr<Icon> chooseIcon(const String& filename);

    FileChooserClient* m_client;
    String m_filename;
    RefPtr<Icon> m_icon;
};

}

#endif




