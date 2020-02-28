/*
 * Copyright (C) 2009 Pleyo.  All rights reserved.
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

#include "config.h"
#include "WebScriptWorld.h"

#include "APICast.h"
#include "JSDOMBinding.h"
#include "ScriptController.h"

using namespace WebCore;

typedef HashMap<DOMWrapperWorld*, WebScriptWorld*> WorldMap; 

static WorldMap& allWorlds()
{
    static WorldMap& map = *new WorldMap;
    return map;
}

WebScriptWorld* WebScriptWorld::createInstance()
{
    return createInstance(ScriptController::createWorld().get());
}

WebScriptWorld* WebScriptWorld::findOrCreateWorld(DOMWrapperWorld* world)
{
    if (world == mainThreadNormalWorld())
        return standardWorld();

    if (WebScriptWorld* existingWorld = allWorlds().get(world))
        return existingWorld;

    return createInstance(world);
}

WebScriptWorld* WebScriptWorld::createInstance(DOMWrapperWorld* world)
{
    return new WebScriptWorld(world);
}

WebScriptWorld::WebScriptWorld(DOMWrapperWorld* world)
    : m_world(world)
{
    ASSERT(!allWorlds().contains(m_world));
    allWorlds().add(m_world, this);
    m_world->ref();
}

WebScriptWorld::~WebScriptWorld()
{
    ASSERT(allWorlds().contains(m_world));
    allWorlds().remove(m_world);
    m_world->deref();
    m_world = 0;
}

WebScriptWorld* WebScriptWorld::standardWorld()
{
    static WebScriptWorld* standardWorld = new WebScriptWorld(mainThreadNormalWorld());
    return standardWorld;
}

WebScriptWorld* WebScriptWorld::scriptWorldForGlobalContext(JSGlobalContextRef context)
{
    return findOrCreateWorld(currentWorld(toJS(context)));
}

void WebScriptWorld::unregisterWorld()
{
    m_world->clearWrappers();
}
