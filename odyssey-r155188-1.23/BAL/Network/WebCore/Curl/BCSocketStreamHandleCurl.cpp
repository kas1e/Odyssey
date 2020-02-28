/*
 * Copyright (C) 2009 Brent Fulgham.  All rights reserved.
 * Copyright (C) 2009 Google Inc.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 *     * Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above
 * copyright notice, this list of conditions and the following disclaimer
 * in the documentation and/or other materials provided with the
 * distribution.
 *     * Neither the name of Google Inc. nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "config.h"
#include "SocketStreamHandle.h"

#include "CString.h" // For latin1().
#include "KURL.h"
#include "Logging.h"
#include "NotImplemented.h"
#include "SocketStreamError.h"
#include "SocketStreamHandleClient.h"

#include <errno.h>
#include <unistd.h> // For read(2).
#include <sys/socket.h>
#include <sys/types.h> // The 2 previous for read(2).

//#undef __USE_INLINE__
//#include <clib/debug_protos.h>
//#define D(x) // no debug
#include <proto/exec.h>
#define kprintf IExec->DebugPrintF
#define D(x) //x //debug

#ifndef __amigaos4__
#include <proto/bsdsocket.h>
#endif

const double pollInterval = 0.5; // Half a second.

//#ifdef __amigaos4__
//struct SocketIFace		*ISocket		= NULL;
//#endif

namespace WebCore {

SocketStreamHandle::SocketStreamHandle(const KURL& url, SocketStreamHandleClient* client)
    : SocketStreamHandleBase(url, client)
    , m_pollTimer(this, &SocketStreamHandle::pollCallback)
    , m_didOpenAsyncCallTimer(this, &SocketStreamHandle::didOpenCallback)
    , m_curlHandle(0)
    , m_curlURL(0)
{
	D(kprintf("SocketStreamHandle %p client %p\n", this, m_client));
    LOG(Network, "SocketStreamHandle %p new client %p", this, m_client);

  //  struct Library *SocketBase = IExec->OpenLibrary("bsdsocket.library", 4);
//    if (SocketBase)
    //{
     //  ISocket = (struct SocketIFace *)IExec->GetInterface(SocketBase, "main", 1, NULL);
   // }
	
	
    RefPtr<SocketStreamHandle> protect(this);

    // We mimic the mac port here.
    ASSERT(url.protocolIs("ws") || url.protocolIs("wss"));
    if (!url.port())
        m_url.setPort(shouldUseSSL() ? 443 : 80);

    CURLcode result = createConnection();
    if (result != CURLE_OK) {
        ASSERT(m_curlHandle);
        // Only curl_easy_perform can fail, so we have to clean-up.
        curl_easy_cleanup(m_curlHandle);
        m_curlHandle = 0;
        if(m_client) m_client->didFailSocketStream(this, SocketStreamError(result));
    } else
        m_didOpenAsyncCallTimer.startOneShot(0);
}

SocketStreamHandle::~SocketStreamHandle()
{
    D(kprintf("~SocketStreamHandle %p\n", this));
    LOG(Network, "SocketStreamHandle %p delete", this);
    closeConnection();
    setClient(0);
}

int SocketStreamHandle::platformSend(const char* data, int length)
{
    D(kprintf("platformSend %p\n", this));
    LOG(Network, "SocketStreamHandle %p platformSend", this);
    if (!m_curlHandle)
        return 0;

    RefPtr<SocketStreamHandle> protect(this);

    long socket;
	
	D(kprintf("platformSend socket before curl_easy_getinfo = %08x\n", socket));
	D(kprintf("platformSend data before curl_easy_getinfo =  [%s]\n", data));
	
    CURLcode result = curl_easy_getinfo(m_curlHandle, CURLINFO_LASTSOCKET, &socket);
	
	D(kprintf("platformSend socket after curl_easy_getinfo = %08x\n", socket));
	D(kprintf("platformSend data after curl_easy_getinfo =  [%s]\n", data));	
	D(kprintf("platformSend curl_easy_getinfo result ='%s'\n", curl_easy_strerror(result)));

	

    ASSERT_UNUSED(result, result == CURLE_OK);
    
    ssize_t lengthSend = ::send(socket, (UBYTE *)data, length, 0);
	
	D(kprintf("platformSend lengthSend = %d\n", lengthSend));
	D(kprintf("platformSend length = %d\n", length));	
	
    if (lengthSend < 0) {
		D(kprintf("platformSend Error sending: %s\n",strerror(errno)));
        D(kprintf("1 m_client %p\n", m_client));
	if(m_client) m_client->didFailSocketStream(this, SocketStreamError(errno));
        platformClose();
        return 0;
    }

    // FIXME: Should we check for overflow here?
    return lengthSend;
}

void SocketStreamHandle::platformClose()
{
    LOG(Network, "SocketStreamHandle %p platformClose", this);

    D(kprintf("platformClose %p %p\n", this, m_curlHandle));

    RefPtr<SocketStreamHandle> protect(this);

    bool shouldCallDidClose = m_curlHandle;
    closeConnection();
    if (shouldCallDidClose)
        if(m_client) m_client->didCloseSocketStream(this);
    m_client = 0;
}

void SocketStreamHandle::didReceiveAuthenticationChallenge(const AuthenticationChallenge& authentificationChallenge)
{
    notImplemented();
    if(m_client) m_client->didReceiveAuthenticationChallenge(this, authentificationChallenge);
}

void SocketStreamHandle::receivedCredential(const AuthenticationChallenge&, const Credential&)
{
    notImplemented();
}

void SocketStreamHandle::receivedRequestToContinueWithoutCredential(const AuthenticationChallenge&)
{
    notImplemented();
}

void SocketStreamHandle::receivedCancellation(const AuthenticationChallenge& authentificationChallenge)
{
    notImplemented();
    if(m_client) m_client->didCancelAuthenticationChallenge(this, authentificationChallenge);
}

CURLcode SocketStreamHandle::createConnection()
{
    ASSERT(m_state == Connecting);

    m_curlHandle = curl_easy_init();

    D(kprintf("createConnection %p\n", m_curlHandle));

    // Mutate the protocol so that curl can use it.
    KURL url(m_url);
    if (shouldUseSSL())
        url.setProtocol("https");
    else
        url.setProtocol("http");
    m_curlURL = strdup(url.string().latin1().data());

    CURLcode result = curl_easy_setopt(m_curlHandle, CURLOPT_URL, m_curlURL);
    ASSERT(result == CURLE_OK);
    result = curl_easy_setopt(m_curlHandle, CURLOPT_CONNECT_ONLY, 1L);
    ASSERT(result == CURLE_OK);
    result = curl_easy_perform(m_curlHandle);
    return result;
}

void SocketStreamHandle::closeConnection()
{

    D(kprintf("closeConnection %p\n", m_curlHandle));
	
    if (m_curlHandle) {
        ASSERT(m_pollTimer.isActive());
        m_pollTimer.stop();
        curl_easy_cleanup(m_curlHandle);
        m_curlHandle = 0;
        free(m_curlURL);
    }

}

void SocketStreamHandle::pollCallback(Timer<SocketStreamHandle>* timer)
{
    ASSERT(m_curlHandle > 0);
    if (!m_curlHandle)
        m_pollTimer.stop();

    D(kprintf("pollCallback %p client %p\n", m_curlHandle, m_client));

    RefPtr<SocketStreamHandle> protect(this);

    long socket;
    CURLcode result = curl_easy_getinfo(m_curlHandle, CURLINFO_LASTSOCKET, &socket);
    ASSERT_UNUSED(result, result == CURLE_OK);

    if (socket < 0) {
        D(kprintf("2 client %p\n", m_client));
	if(m_client) m_client->didFailSocketStream(this, SocketStreamError(errno));
	platformClose();
        return;
    }

    fd_set read;
    FD_ZERO(&read);
    FD_SET(socket, &read);
  
    // We limit the waiting time to 100 ms.
    static struct timeval timeout = { 0, 20 }; // 20 ms
    for (unsigned short i = 0; i < 5; ++i) {
	int nbRead = select(socket + 1, &read, 0, 0, &timeout);
	D(kprintf("select() %ld\n", nbRead));
        if (nbRead == -1) {
  	    D(kprintf("3 m_client %p\n", m_client));
	    if(m_client) m_client->didFailSocketStream(this, SocketStreamError(errno));
	    platformClose();
            return;
        } else if (nbRead == 0)
            // Nothing to read.
            break;

        char buffer[1024];
		ssize_t length = /*ISocket->*/recv(socket, (UBYTE *)buffer, sizeof(buffer), 0);
        if (length < 0) {
	    D(kprintf("4 m_client %p\n", m_client));
	    if(m_client) m_client->didFailSocketStream(this, SocketStreamError(errno));
	    platformClose();
            return;
        }
	D(kprintf("5 m_client %p\n", m_client));
        if(m_client) m_client->didReceiveSocketStreamData(this, buffer, length);
    }
}

void SocketStreamHandle::didOpenCallback(Timer<SocketStreamHandle>*)
{
    D(kprintf("didOpenCallback %p client %p\n", this, m_client));
	
	//#ifdef __amigaos4__	
	//RefPtr<SocketStreamHandle> protect(this);
	//#endif	

    ASSERT(m_state == Connecting);
    m_state = Open;
    if(m_client) m_client->didOpenSocketStream(this);

    // This starts polling for notification.
    m_pollTimer.startRepeating(pollInterval);
}

}  // namespace WebCore
