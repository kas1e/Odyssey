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
#ifndef ResourceHandleManager_h
#define ResourceHandleManager_h
/**
 *  @file  ResourceHandleManager.t
 *  ResourceHandleManager description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:10 $
 */
#include "BALBase.h"

#include "Frame.h"
#include "Timer.h"
#include "ResourceHandleClient.h"

#include <curl/curl.h>
#include <wtf/Vector.h>

namespace WKAL {

class ResourceHandleManager : public WKALBase {
public:
    /**
     * shared instance
     * @param[out] : resource handle manager
     * @code
     * ResourceHandleManager* rhm = ResourceHandleManager::sharedInstance();
     * @endcode
     */
    static ResourceHandleManager* sharedInstance();

    /**
     * add
     * @param[in] : resource handle
     * @code
     * rhm->add(rh);
     * @endcode
     */
    void add(ResourceHandle*);

    /**
     * cancel
     * @param[in] : resource handle
     * @code
     * rhm->cancel(rh);
     * @endcode
     */
    void cancel(ResourceHandle*);

    /**
     * set cookieJar file name
     * @param[in] : file name
     * @code
     * rhm->setCookieJarFileName(f);
     * @endcode
     */
    void setCookieJarFileName(const char* cookieJarFileName);

    /**
     * dispatch synchronous job
     * @param[in] : resource handle
     * @code
     * rhm->dispatchSynchronousJob(rh);
     * @endcode
     */
    void dispatchSynchronousJob(ResourceHandle*);

    /**
     * setup POST 
     * @param[in] : resource handle
     * @param[in] : curl list
     * @code
     * rhm->setupPOST(rh, c);
     * @endcode
     */
    void setupPOST(ResourceHandle*, struct curl_slist**);

    /**
     * setup PUT
     * @param[in] : resource handle
     * @param[in] : curl list
     * @code
     * rhm->setupPUT(rh, c);
     * @endcode
     */
    void setupPUT(ResourceHandle*, struct curl_slist**);

private:
    /**
     *  ResourceHandleManager constructor
     */
    ResourceHandleManager();

    /**
     * ResourceHandleManager destructor
     */
    ~ResourceHandleManager();

    /**
     * downloadTimerCallback
     */
    void downloadTimerCallback(Timer<ResourceHandleManager>*);

    /**
     * removeFromCurl 
     */
    void removeFromCurl(ResourceHandle*);

    /**
     *  removeScheduledJob 
     */
    bool removeScheduledJob(ResourceHandle*);

    /**
     *  startJob 
     */
    void startJob(ResourceHandle*);

    /**
     *  startScheduledJobs 
     */
    bool startScheduledJobs();

    /**
     *  initializeHandle
     */
    void initializeHandle(ResourceHandle*);

    Timer<ResourceHandleManager> m_downloadTimer;
    CURLM* m_curlMultiHandle;
    CURLSH* m_curlShareHandle;
    char* m_cookieJarFileName;
    char m_curlErrorBuffer[CURL_ERROR_SIZE];
    Vector<ResourceHandle*> m_resourceHandleList;
    int m_runningJobs;
};

}

#endif




