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

#ifndef WebArchive_h
#define WebArchive_h


/**
 *  @file  WebArchive.h
 *  WebArchive description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/04 21:14:06 $
 */
#include "BALBase.h"
#include <wtf/PassRefPtr.h>
#include <wtf/PassRefPtr.h>
#include <wtf/RefPtr.h>

namespace WebCore {
    class Archive;
    class SharedBuffer;
}

class WebResource;

class WebArchive
{
public:

    /**
     * create a new instance of WebArchive
     * @param[out]: WebArchive
     * @code
     * WebArchive *a = WebArchive::createInstance();
     * @endcode
     */
    static WebArchive* createInstance();

    /**
     * create a new instance of WebArchive
     * @param[in]: Archive
     * @param[out]: WebArchive
     * @code
     * WebArchive *a = WebArchive::createInstance(a1);
     * @endcode
     */
    static WebArchive* createInstance(PassRefPtr<WebCore::Archive>);
protected:

    /**
     * WebArchive constructor
     * @param[in]: Archive
     */
    WebArchive(PassRefPtr<WebCore::Archive>);

public:

    /**
     * WebArchive destructor
     */
    virtual ~WebArchive();

    /**
     * initialise the WebArchive with main resource
     * Not Implemented
     * @param[in]: main resource
     * @param[in]: sub resources array
     * @param[in]: sub resource length
     * @param[in]: sub frame archive array
     * @param[in]: sub frame archive length
     * @code
     * a->initWithMainResource(mainResource, subResources, cSubResources, subFrameArchives, cSubFrameArchives);
     * @endcode
     */
    virtual void initWithMainResource(WebResource* mainResource, WebResource** subResources, int cSubResources,  WebArchive** subFrameArchives, int cSubFrameArchives);


    /**
     * initialise WebArchive with data
     * Not Implemented
     * @param[in]: shared buffer
     * @code
     * a->initWithData(s);
     * @endcode
     */
    virtual void initWithData(RefPtr<WebCore::SharedBuffer>);

    /**
     * get main resource
     * @param[out]: WebResource
     * @code
     * WebResource *r = a->mainResource();
     * @endcode
     */
    virtual WebResource*  mainResource();

    /**
     * get data
     * @param[out]: SharedBuffer
     * @code
     * RefPtr<WebCore::SharedBuffer> s = a->data();
     * @endcode
     */
    virtual RefPtr<WebCore::SharedBuffer> data();

protected:
    RefPtr<WebCore::Archive> m_archive;
};

#endif // WebArchive_h
