/*
 * Copyright (C) 2007 Pleyo.  All rights reserved.
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
#include "WebObject.h"

#include "Assertions.h"
#include "BALObject.h"
#include "BALValue.h"
#include "CString.h"
#include "WTFString.h"
#include "WebValue.h"
#include "WebValueHelper.h"
#include "WebFrame.h"

using namespace WebCore;

// This is a trick to be able to share the underlying BALObject and be able to dispatch the right method!
class BALInternalObject : public BALObject {

public:
    BALInternalObject(WebObject* webObject)
        : BALObject()
        , m_webObject(webObject)
    {
        ASSERT_ARG(webObject, webObject);
    }

    virtual String getName()
    {
        return String(m_webObject->getName());
    }

    virtual PassRefPtr<BALValue> invoke(Frame* frame, const String& name, const Vector<RefPtr<BALValue> >& args)
    {
        std::vector<SharedPtr<WebValue> > translatedArgs;
        for (size_t i = 0; i < args.size(); ++i)
            translatedArgs.push_back(WebValue::createInstance(args[i].get()));

        SharedPtr<WebValue> result = m_webObject->invoke(kit(frame), name.utf8().data(), translatedArgs);

        translatedArgs.clear();
        return result ? toBALValue(result) : 0;
    }

    virtual PassRefPtr<BALValue> getProperty(Frame* frame, const String& name)
    {
        SharedPtr<WebValue> property = m_webObject->getProperty(kit(frame), name.utf8().data());
        return property ? toBALValue(property) : 0;
    }

    virtual void setProperty(Frame* frame, const String& name, PassRefPtr<BALValue> balValue)
    {
        SharedPtr<WebValue> value = WebValue::createInstance(balValue.get());
        m_webObject->setProperty(kit(frame), name.utf8().data(), value);
    }

    virtual WebObject* toWebObject() const { return m_webObject.get(); }

private:
    SharedPtr<WebObject> m_webObject; 
};

WebObject::WebObject()
    : m_internalObject(new BALInternalObject(this))
{
    // We do not hold a strong reference to our internal object as it is the one who determines our lifetime.
}

WebObject::WebObject(BALObject* object)
    : m_internalObject(object)
{
    ASSERT_ARG(object, object);
}

void WebObject::deleteMe()
{
    ASSERT(m_internalObject);
    m_internalObject->deref();
    m_internalObject = 0;
}

bool WebObject::hasMethod(const char* name)
{
    return m_internalObject->hasMethod(name);
}

bool WebObject::hasProperty(const char* name)
{
    return m_internalObject->hasProperty(name);
}

void WebObject::addMethod(const char* aMethod)
{
    m_internalObject->addMethod(aMethod);
}

void WebObject::removeMethod(const char* aMethod)
{
    m_internalObject->removeMethod(aMethod);
}

void WebObject::addProperty(const char* aProperty)
{
    m_internalObject->addProperty(aProperty);
}

void WebObject::removeProperty(const char* aProperty)
{
    m_internalObject->removeProperty(aProperty);
}
