/*
 * Copyright (C) 2007, 2009 Pleyo.  All rights reserved.
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
#include "BalRuntime.h"

#include "BALArray.h"
#include "BalInstance.h"
#include "BALValue.h"
#include "Frame.h"
#include "JSLock.h"
#include "JSObject.h"
#include "runtime_array.h"
#include "runtime_object.h"

using namespace WebCore;

namespace JSC {

namespace Bindings {

const char* BalField::name() const
{
    return "";
}

JSValue BalField::valueFromInstance(ExecState* exec, const Instance* inst) const
{
    const BalInstance* instance = static_cast<const BalInstance*>(inst);
    RefPtr<BALObject> obj = instance->getObject();
    Frame* frame = const_cast<Frame*>(static_cast<const Frame*>(inst->rootObject()->nativeHandle()));
    RefPtr<BALValue> value;
    {
        //JSLock::DropAllLocks dropAllLocks(false);
        value = obj->getProperty(frame, m_ident);
        if (!value) {
            value = BALValue::create(frame);
            value->balUndefined();
        }
    }
    return value->toJSValue(exec);
}

void BalField::setValueToInstance(ExecState* exec, const Instance* inst, JSValue jsValue) const
{
    const BalInstance* instance = static_cast<const BalInstance*>(inst);
    RefPtr<BALObject> obj = instance->getObject();
    Frame* frame = const_cast<Frame*>(static_cast<const Frame*>(inst->rootObject()->nativeHandle()));
    {
        //JSLock::DropAllLocks dropAllLocks(false);
        obj->setProperty(frame, m_ident, BALValue::create(frame, exec, jsValue));
    }
    //delete val;
}

} // namespace Bindings

} // namespace JSC
