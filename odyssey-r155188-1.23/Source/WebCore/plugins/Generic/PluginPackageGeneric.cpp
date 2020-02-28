/*
 * Copyright (C) 2006, 2007 Apple Inc.  All rights reserved.
 * Copyright (C) 2008 Collabora Ltd. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY APPLE COMPUTER, INC. ``AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL APPLE COMPUTER, INC. OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 
 */

#include "config.h"
#include "PluginPackage.h"

#include "CString.h"
#include "MIMETypeRegistry.h"
#include "NotImplemented.h"
#include "npruntime_impl.h"
#include "PluginDebug.h"
#include <dlfcn.h>

namespace WebCore {

bool PluginPackage::fetchInfo()
{
#if defined(XP_UNIX)
    if (!load())
        return false;

    NP_GetMIMEDescriptionFuncPtr NP_GetMIMEDescription = 0;
    NPP_GetValueProcPtr NPP_GetValue = 0;

    NP_GetMIMEDescription = (NP_GetMIMEDescriptionFuncPtr)dlsym(m_module, "NP_GetMIMEDescription");
    NPP_GetValue = (NPP_GetValueProcPtr)dlsym(m_module, "NP_GetValue");

    if (!NP_GetMIMEDescription || !NPP_GetValue)
        return false;

    char* buffer = 0;
    NPError err = NPP_GetValue(0, NPPVpluginNameString, &buffer);
    if (err == NPERR_NO_ERROR)
        m_name = buffer;

    buffer = 0;
    err = NPP_GetValue(0, NPPVpluginDescriptionString, &buffer);
    if (err == NPERR_NO_ERROR) {
        m_description = buffer;
        determineModuleVersionFromDescription();
    }

    const char* t = NP_GetMIMEDescription();
    char* types = strdup(t);
    char** mimeDescs = 0;
    char *pch = strtok(types,";");
    int sizeTab = 0;
    while (pch != NULL) {
        sizeTab++;
        mimeDescs = (char**) realloc(mimeDescs,sizeof(char*) * sizeTab);
        mimeDescs[sizeTab - 1] = (char*) malloc( sizeof(char) * (strlen(pch) + 1));
        mimeDescs[sizeTab - 1] = pch;
        mimeDescs[sizeTab - 1][strlen(pch)]='\0';
        pch = strtok (NULL, ";");
    }

    for (int i = 0; i < sizeTab; i++) {
        char** mimeData = 0;
        char* mime = strdup(mimeDescs[i]);
        pch = strtok (mime,":");
        int sizeMime = 0;
        while (pch != NULL) {
            sizeMime++;
            mimeData = (char**) realloc(mimeData,sizeof(char*) * sizeMime);
            mimeData[sizeMime - 1] = (char*) malloc( sizeof(char) * (strlen(pch) + 1));
            mimeData[sizeMime - 1] = pch;
            mimeData[sizeMime - 1][strlen(pch)]='\0';
            pch = strtok (NULL, ":");
        }
/*    
        if (sizeMime < 3) {
            for (int j = 0; j < sizeMime; j++)
                free(mimeData[j]);
            free(mimeData);
            continue;
        }
*/
        String description = String::fromUTF8(mimeData[2]);
        char** extensions = 0;
        char *ext = strdup(mimeData[2]);
        pch = strtok (ext,",");
        int sizeExt = 0;
        while (pch != NULL) {
            sizeExt++;
            extensions = (char**) realloc(extensions,sizeof(char*) * sizeExt);
            extensions[sizeExt - 1] = (char*) malloc( sizeof(char) * (strlen(pch) + 1));
            extensions[sizeExt - 1] = pch;
            extensions[sizeExt - 1][strlen(pch)]='\0';
            pch = strtok (NULL, ",");
        }


        Vector<String> extVector;
        for (int j = 0; j < sizeExt; j++)
            extVector.append(String::fromUTF8(extensions[j]));

        determineQuirks(mimeData[0]);
        m_mimeToExtensions.add(mimeData[0], extVector);
        m_mimeToDescriptions.add(mimeData[0], description);

       
        for (int j = 0; j < sizeExt; j++)
            free(extensions[j]);
        free(extensions);
        // FIXME : clean the content
        /*for (int j = 0; j < sizeMime; j++) {
            printf("mimeData[j] = %p %s\n", mimeData[j], mimeData[j]);
            free(mimeData[j]);
        }*/
        free(mimeData);
    }
    // FIXME : clean the content
/*    for (int j = 0; j < sizeTab; j++)
        free(mimeDescs[j]);*/
    free(mimeDescs);

    return true;
#else
    notImplemented();
    return false;
#endif
 
}

bool PluginPackage::load()
{
    if (m_isLoaded) {
        m_loadCount++;
        return true;
    }

    m_module = dlopen (m_path.utf8().data(), RTLD_LAZY);

    if (!m_module) {
        LOG(Plugins,"Module Load Failed :%s, Error:%s\n", (m_path.utf8()).data(), dlerror());
        return false;
    }

    m_isLoaded = true;

    NP_InitializeFuncPtr NP_Initialize = 0;
    m_NPP_Shutdown = 0;

    NPError npErr;

    NP_Initialize = (NP_InitializeFuncPtr)dlsym(m_module, "NP_Initialize");
    m_NPP_Shutdown = (NPP_ShutdownProcPtr)dlsym(m_module, "NP_Shutdown");

    if (!NP_Initialize || !m_NPP_Shutdown)
        goto abort;

    memset(&m_pluginFuncs, 0, sizeof(m_pluginFuncs));
    m_pluginFuncs.size = sizeof(m_pluginFuncs);

    memset(&m_browserFuncs, 0, sizeof(m_browserFuncs));
    m_browserFuncs.size = sizeof (m_browserFuncs);
    m_browserFuncs.version = NP_VERSION_MINOR;

    m_browserFuncs.geturl = NPN_GetURL;
    m_browserFuncs.posturl = NPN_PostURL;
    m_browserFuncs.requestread = NPN_RequestRead;
    m_browserFuncs.newstream = NPN_NewStream;
    m_browserFuncs.write = NPN_Write;
    m_browserFuncs.destroystream = NPN_DestroyStream;
    m_browserFuncs.status = NPN_Status;
    m_browserFuncs.uagent = NPN_UserAgent;
    m_browserFuncs.memalloc = NPN_MemAlloc;
    m_browserFuncs.memfree = NPN_MemFree;
    m_browserFuncs.memflush = NPN_MemFlush;
    m_browserFuncs.reloadplugins = NPN_ReloadPlugins;
    m_browserFuncs.geturlnotify = NPN_GetURLNotify;
    m_browserFuncs.posturlnotify = NPN_PostURLNotify;
    m_browserFuncs.getvalue = NPN_GetValue;
    m_browserFuncs.setvalue = NPN_SetValue;
    m_browserFuncs.invalidaterect = NPN_InvalidateRect;
    m_browserFuncs.invalidateregion = NPN_InvalidateRegion;
    m_browserFuncs.forceredraw = NPN_ForceRedraw;
    m_browserFuncs.getJavaEnv = NPN_GetJavaEnv;
    m_browserFuncs.getJavaPeer = NPN_GetJavaPeer;
    m_browserFuncs.pushpopupsenabledstate = NPN_PushPopupsEnabledState;
    m_browserFuncs.poppopupsenabledstate = NPN_PopPopupsEnabledState;
    m_browserFuncs.pluginthreadasynccall = NPN_PluginThreadAsyncCall;

    m_browserFuncs.releasevariantvalue = _NPN_ReleaseVariantValue;
    m_browserFuncs.getstringidentifier = _NPN_GetStringIdentifier;
    m_browserFuncs.getstringidentifiers = _NPN_GetStringIdentifiers;
    m_browserFuncs.getintidentifier = _NPN_GetIntIdentifier;
    m_browserFuncs.identifierisstring = _NPN_IdentifierIsString;
    m_browserFuncs.utf8fromidentifier = _NPN_UTF8FromIdentifier;
    m_browserFuncs.intfromidentifier = _NPN_IntFromIdentifier;
    m_browserFuncs.createobject = _NPN_CreateObject;
    m_browserFuncs.retainobject = _NPN_RetainObject;
    m_browserFuncs.releaseobject = _NPN_ReleaseObject;
    m_browserFuncs.invoke = _NPN_Invoke;
    m_browserFuncs.invokeDefault = _NPN_InvokeDefault;
    m_browserFuncs.evaluate = _NPN_Evaluate;
    m_browserFuncs.getproperty = _NPN_GetProperty;
    m_browserFuncs.setproperty = _NPN_SetProperty;
    m_browserFuncs.removeproperty = _NPN_RemoveProperty;
    m_browserFuncs.hasproperty = _NPN_HasMethod;
    m_browserFuncs.hasmethod = _NPN_HasProperty;
    m_browserFuncs.setexception = _NPN_SetException;
    m_browserFuncs.enumerate = _NPN_Enumerate;
    m_browserFuncs.construct = _NPN_Construct;

#if defined(XP_UNIX)
    npErr = NP_Initialize(&m_browserFuncs, &m_pluginFuncs);
#else
    npErr = NP_Initialize(&m_browserFuncs);
#endif
    if (npErr != NPERR_NO_ERROR)
        goto abort;

    m_loadCount++;
    return true;

abort:
    unloadWithoutShutdown();
    return false;
}

uint16_t PluginPackage::NPVersion() const
{
    return NP_VERSION_MINOR;
}

}
