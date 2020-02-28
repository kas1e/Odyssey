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
#if 0
#include "config.h"
#include "BALValue.h"

#include "BalInstance.h"
#include "BALArray.h"
#include "Color.h"
#include "CallFrame.h"
#include "CString.h"
#include "DOMCoreException.h"
#include "Frame.h"
#include "JSDOMBinding.h"
#include "JSDOMCoreException.h"
#include "WTFString.h"
#include "runtime_object.h"
#include "runtime_array.h"

#include <clib/debug_protos.h>

using namespace JSC;

namespace WebCore {

BALValue::BALValue(Frame* frame)
    : m_obj(0)
    , m_array(0)
    , m_val(JSC::jsUndefined())
    , m_exec(frame->script()->globalObject(mainThreadNormalWorld())->globalExec())
    , m_frame(frame)
    , m_isException(false)
{
    ASSERT_ARG(frame, frame);
}

BALValue::BALValue(Frame* frame, JSC::ExecState* exec, const JSC::JSValue& value)
    : m_obj(0)
    , m_array(0)
    , m_val(value)
    , m_exec(exec)
    , m_frame(frame)
    , m_isException(false)
{
#if 0
    // Translate the JSValue to its BALObject if possible.
    if (m_val.isObject()) {
        JSObject* object = m_val.toObject(m_exec);
        if (object->inherits(&JSC::Bindings::RuntimeObject::s_info)) {
            JSC::Bindings::RuntimeObject* imp = static_cast<JSC::Bindings::RuntimeObject*>(object);
            Bindings::BalInstance* instance = static_cast<JSC::Bindings::BalInstance*>(imp->getInternalInstance());
            if (instance)
                m_obj = instance->getObject();
        }
    }
#endif
}

BALValue::~BALValue()
{
    m_exec = 0;
}

bool BALValue::isUndefined() const
{
    return m_val.isUndefined();
}

bool BALValue::isNull() const
{
    return m_val.isNull();
}

bool BALValue::isUndefinedOrNull() const
{
    return m_val.isUndefinedOrNull();
}

bool BALValue::isBoolean() const
{
    return m_val.isBoolean();
}

bool BALValue::isNumber() const
{
    return m_val.isNumber();
}

bool BALValue::isString() const
{
    return m_val.isString();
}

bool BALValue::isGetterSetter() const
{
    return m_val.isGetterSetter();
}

bool BALValue::isJSObject() const
{
    return m_val.isObject();
}

bool BALValue::isBALObject() const
{
    return m_obj;
}

bool BALValue::isArray() const
{
    return m_array;
}

bool BALValue::isException() const
{
    return m_isException;
}

unsigned int BALValue::toRGBA32() const
{
    Color color(toString());
    return color.rgb();
}

bool BALValue::toBoolean() const
{
    ASSERT(isBoolean());
    return m_val.toBoolean(m_exec);
}

double BALValue::toNumber() const
{
    ASSERT(isNumber());
    return m_val.toNumber(m_exec);
}

int BALValue::toInt(bool& ok) const
{
    double dValue = toNumber();
    int iValue = static_cast<int>(dValue);
    ok = iValue == dValue;
    return iValue;
}

String BALValue::toString() const
{
    ASSERT(isString());
    return m_val.getString(m_exec);
}

JSObject* BALValue::toJSObject(ExecState* exec) const
{
#if 0
    if (isBALObject())
        return JSC::Bindings::BalInstance::getBalInstance(toObject(), JSC::Bindings::findRootObject(exec->dynamicGlobalObject()))->createRuntimeObject(exec);
#endif
    return m_val.toObject(exec);
}

JSValue BALValue::toJSValue(ExecState* exec) const
{
    kprintf("BALValue::toJSValue() called\n");
    if (isJSObject() || isBALObject())
        return toJSObject(exec);
    else if (isArray())
        return RuntimeArray::create(exec, toArray());

    return m_val;
}

BALObject* BALValue::toObject() const
{
    ASSERT(isBALObject());
    return m_obj.get();
}

BALArray* BALValue::toArray() const
{
    // FIXME: this will return always 0!
    return m_array;
}


void BALValue::balUndefined()
{
    m_val = JSC::jsUndefined();
}

void BALValue::balNull()
{
    m_val = JSC::jsNull();
}

void BALValue::balNaN()
{
    m_val = JSC::jsNaN();
}

void BALValue::balBoolean(bool b)
{
    m_val = JSC::jsBoolean(b);
}

void BALValue::balNumber(double dd)
{
    m_val = JSC::jsNumber(dd);
}

void BALValue::balString(const String& s)
{
  m_val = JSC::jsString(m_exec, s);
}

void BALValue::balObject(BALObject* obj)
{
    m_obj = obj;
}

void BALValue::balObject(PassRefPtr<BALObject> obj)
{
    m_obj = obj;
}
void BALValue::balArray(BALArray* array)
{
    m_array = array;
}

#include <clib/debug_protos.h>

void BALValue::balException(short code, const String& name, const String& description)
{
  kprintf("BALValue::balException\n");
#warning "bug bug bug"
    kprintf("!!!! balException skipped %d %s %s\n", code, name.utf8().data(), description.utf8().data());

    /*
    // FIXME: This is stupid to convert the String to a char* (and strdup it!) to have it converted again in DOMCoreException but WebCore does not let us any choice here.
    WebCore::ExceptionCodeDescription exceptionDescription = { "BALObject", strdup(description.utf8().data()), strdup(name.utf8().data()), code, WebCore::DOMExceptionType };
    m_val = WebCore::toJS(m_exec, WebCore::DOMCoreException::create(exceptionDescription).get());
    m_exec->setException(m_val); // __MORPHOS__ bug
    m_isException = true;
    */
}

} // namespace WebCore
#endif
