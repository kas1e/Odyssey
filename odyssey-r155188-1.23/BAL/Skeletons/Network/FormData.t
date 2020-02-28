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
#ifndef FormData_h
#define FormData_h
/**
 *  @file  FormData.t
 *  FormData description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:10 $
 */
#include "BALBase.h"

#include "PlatformString.h"
#include <wtf/RefCounted.h>
#include <wtf/Vector.h>

namespace WKAL {

class ChromeClient;

class FormDataElement : public WKALBase {
public:
    /**
     * FormDataElement default constructor
     * @code
     * FormDataElement f;
     * @endcode
     */
    FormDataElement();

    /**
     * FormDataElement constructor
     * @param[in] : array
     * @code
     * FormDataElement *f = new FormDataElement(a);
     * @endcode
     */
    FormDataElement(const Vector<char>& array);

    /**
     * FormDataElement constructor
     * @param[in] : filename
     * @param[in] : should generate file
     * @code
     * FormDataElement *f = new FormDataElement(f, s);
     * @endcode
     */
    FormDataElement(const String& filename, bool shouldGenerateFile);

    enum { data, encodedFile } m_type;
    Vector<char> m_data;
    String m_filename;
    String m_generatedFilename;
    bool m_shouldGenerateFile;
};

    /**
     *  operator== 
     */
inline bool operator==(const FormDataElement& a, const FormDataElement& b);
 
    /**
     *  operator!=
     */
inline bool operator!=(const FormDataElement& a, const FormDataElement& b);
 
class FormData : public WKALBase, public RefCounted<FormData> {
public:
    /**
     * create 
     * @param[out] : FormData
     * @code
     * RefPtr<FormData> f = FormData::create();
     * @endcode
     */
    static PassRefPtr<FormData> create();

    /**
     * create
     * @param[in] : data
     * @param[in] : data size
     * @param[out] : FormData
     * @code
     * RefPtr<FormData> f = FormData::create(v, s);
     * @endcode
     */
    static PassRefPtr<FormData> create(const void*, size_t);

    /**
     * create
     * @param[in] : data
     * @param[out] : FormData
     * @code
     * RefPtr<FormData> f = FormData::create(s);
     * @endcode
     */
    static PassRefPtr<FormData> create(const CString&);

    /**
     * create
     * @param[in] : data
     * @param[out] : FormData
     * @code
     * RefPtr<FormData> f = FormData::create(v);
     * @endcode
     */
    static PassRefPtr<FormData> create(const Vector<char>&);

    /**
     * copy
     * @param[out] : FormData
     * @code
     * RefPtr<FormData> fd = f->copy();
     * @endcode
     */
    PassRefPtr<FormData> copy() const;

    /**
     * FormData destruction
     * @code
     * delete f;
     * @endcode
     */
    ~FormData();
    
    /**
     * append data
     * @param[in] : data
     * @param[in] : data size
     * @code
     * f->appendData(v, s);
     * @endcode
     */
    void appendData(const void* data, size_t);

    /**
     * append file
     * @param[in] : file name
     * @param[in] : should generate file
     * @code
     * f->appendFile(f, true);
     * @endcode
     */
    void appendFile(const String& filename, bool shouldGenerateFile = false);

    /**
     * flatten
     * @param[in] : data
     * @code
     * f->flatten(v);
     * @endcode
     */
    void flatten(Vector<char>&) const; // omits files

    /**
     * flatten to string
     * @param[out] : data string
     * @code
     * String d = f->flattenToString();
     * @endcode
     */
    String flattenToString() const; // omits files

    /**
     * test if the FormData is empty
     * @param[out] : true if the FormData is empty
     * @code
     * bool e = f->isEmpty();
     * @endcode
     */
    bool isEmpty() const ;

    /**
     * get elements
     * @param[out] : form data element
     * @code
     * Vector<FormDataElement> e = f->elements();
     * @endcode
     */
    const Vector<FormDataElement>& elements() const ;

    /**
     * generate files
     * @param[in] : chrome client
     * @code
     * f->generateFiles();
     * @endcode
     */
    void generateFiles(ChromeClient*);

    /**
     * remove generated files if needed
     * @code
     * f->removeGeneratedFilesIfNeeded();
     * @endcode
     */
    void removeGeneratedFilesIfNeeded();

private:

    /**
     * getter for always stream information.
     * @param[out] : a boolean.
     * @code
     * @endcode
     */
    bool alwaysStream() const ;


    /**
     * setter for always stream information.
     * @param[in] : a boolean.
     * @code
     * @endcode
     */
    void setAlwaysStream(bool alwaysStream) ;

    /**
     * FormData constructor
     */
    FormData();
    /**
     * FormData constructor by copy
     */
    FormData(const FormData&);
     
    Vector<FormDataElement> m_elements;
    bool m_hasGeneratedFiles;
};

    /**
     *  operator==
     */
inline bool operator==(const FormData& a, const FormData& b);

    /**
     *  operator!= 
     */
inline bool operator!=(const FormData& a, const FormData& b);

} // namespace WKAL

#endif


