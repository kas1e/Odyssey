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
#include "WebArray.h"

#include "Assertions.h"
#include "BALArray.h"
#include "BALValue.h"
#include "CallFrame.h"
#include "Frame.h"
#include "JSLock.h"
#include "JSDOMWindow.h"
#include "JSGlobalObject.h"
#include "ScriptController.h"
#include "Bridge.h"
#include "runtime_root.h"
#include "WebFrame.h"
#include "WebObject.h"
#include "WebValue.h"
#include "WebValueHelper.h"

using namespace JSC;
using namespace JSC::Bindings;
using namespace WebCore;

WebArray::WebArray(WebFrame* webFrame, const std::vector<SharedPtr<WebValue> >& array)
    : m_webFrame(webFrame)
    , m_internalArray(0)
{
    JSDOMWindow* window = toJSDOMWindow(core(webFrame), mainThreadNormalWorld());
    if (!window)
        return;

    Vector<RefPtr<BALValue> > values(array.size());
    for (size_t i = 0; i < array.size(); ++i)
        values.append(toBALValue(array[i]));

    m_internalArray = new BALArray(core(webFrame), values);
}

WebArray::WebArray(BALArray* array)
    : m_webFrame(kit(array->frame()))
    , m_internalArray(array)
{
    ASSERT_ARG(array, array);
}

WebArray::~WebArray()
{
    delete m_internalArray;
}

void WebArray::setValueAt(unsigned index, TransferSharedPtr<WebValue> val) const
{
    ExecState* exec = core(m_webFrame)->script().globalObject(mainThreadNormalWorld())->globalExec();
    RefPtr<BALValue> balValue = toBALValue(val.get());
    m_internalArray->setValueAt(0, index, balValue->toJSValue(exec));
}

TransferSharedPtr<WebValue> WebArray::valueAt(unsigned index) const
{
    // FIXME: Quite a bad way to construct it.
    JSC::ExecState* exec = core(m_webFrame)->script().globalObject(mainThreadNormalWorld())->globalExec();
    RefPtr<BALValue> balValue = BALValue::create(core(m_webFrame), exec, m_internalArray->valueAt(0, index));
    return WebValue::createInstance(balValue.get());
}

unsigned int WebArray::getLength() const
{
    return m_internalArray->getLength();
}

