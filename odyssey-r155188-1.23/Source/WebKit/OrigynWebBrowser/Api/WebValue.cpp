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
#include "WebValue.h"

#include "Assertions.h"
#include "BALObject.h"
#include "BALValue.h"
#include "Color.h"
#include "CString.h" // For String utf8 conversion.
#include "Frame.h"
#include "WTFString.h"
#include "WebArray.h"
#include "WebFrame.h"
#include "WebObject.h"

using namespace WebCore;

TransferSharedPtr<WebValue> WebValue::createInstance(WebFrame* frame)
{
    return new WebValue(frame);
}

TransferSharedPtr<WebValue> WebValue::createInstance(BALValue* balValue)
{
    return new WebValue(balValue);
}

WebValue::WebValue(WebFrame* webFrame)
    : m_obj(0)
    , m_array(0)
    , m_webFrame(webFrame)
{
    RefPtr<BALValue> emptyValue = BALValue::create(core(webFrame));
    m_val = emptyValue.get();
    m_val->ref();
}

WebValue::WebValue(BALValue* value)
    : m_val(value)
    , m_obj(0)
    , m_array(0)
    , m_webFrame(kit(value->frame()))
{
    ASSERT_ARG(value, value);
    m_val->ref();

    // We need to convert the val into its underlying component.
    if (m_val->isBALObject()) {
        WebObject* object = m_val->toObject()->toWebObject();
        if (object)
            m_obj = object;
    } else if (m_val->isArray())
        m_array = new WebArray(m_val->toArray());
}

WebValue::~WebValue()
{
    ASSERT(m_val);
    m_val->deref();
    m_val = 0;
}

bool WebValue::isUndefined() const
{
    return m_val->isUndefined();
}

bool WebValue::isNull() const
{
    return m_val->isNull();
}

bool WebValue::isUndefinedOrNull() const
{
    return m_val->isUndefinedOrNull();
}

bool WebValue::isBoolean() const
{
    return m_val->isBoolean();
}

bool WebValue::isNumber() const
{
    return m_val->isNumber();
}

bool WebValue::isString() const
{
    return m_val->isString();
}

bool WebValue::isGetterSetter() const
{
    return m_val->isGetterSetter();
}

bool WebValue::isObject() const
{
    return m_obj;
}

bool WebValue::isArray() const
{
    return m_array;
}

bool WebValue::isException() const
{
    return m_val->isException();
}

unsigned int WebValue::toRGBA32() const
{
    return m_val->toRGBA32();
}

bool WebValue::toBoolean() const
{
    return m_val->toBoolean();
}

double WebValue::toNumber() const
{
    return m_val->toNumber();
}

int WebValue::toInt(bool& ok) const
{
    return m_val->toInt(ok);
}

const char* WebValue::toString() const
{
    return strdup(m_val->toString().utf8().data());
}

TransferSharedPtr<WebObject> WebValue::toObject() const
{
    return toWebObject();
}

TransferSharedPtr<WebObject> WebValue::toWebObject() const
{
    ASSERT(isObject());
    return m_obj;
}

WebArray* WebValue::toArray() const
{
    return toWebArray();
}

WebArray* WebValue::toWebArray() const
{
    ASSERT(isArray());
    return m_array;
}

void WebValue::balUndefined()
{
    m_val->balUndefined();
}

void WebValue::balNull()
{
    m_val->balNull();
}

void WebValue::balNaN()
{
    m_val->balNaN();
}

void WebValue::balBoolean(bool b)
{
    m_val->balBoolean(b);
}

void WebValue::balNumber(double dd)
{
    m_val->balNumber(dd);
}

void WebValue::balString(const char* s)
{
    m_val->balString(s);
}

void WebValue::balObject(TransferSharedPtr<WebObject> obj)
{
    m_obj = obj;
}

void WebValue::balArray(WebArray* array)
{
    m_array = array;
}

void WebValue::balException(short code, const char* name, const char* description)
{
    m_val->balException(code, name, description);
}
