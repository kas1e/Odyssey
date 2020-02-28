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
#include "BALArray.h"

#include "BALValue.h"
#include "BALObject.h"
#include "Frame.h"
#include "JSLock.h"
#include "JSValue.h"
#include "JSDOMWindow.h"
#include "JSGlobalObject.h"
#include "Bridge.h"
#include "runtime_array.h"
#include "runtime_root.h"
#include "ScriptController.h"
#include "Vector.h"

using namespace JSC;
using namespace JSC::Bindings;

namespace WebCore {

BALArray::BALArray(Frame* frame, Vector<RefPtr<BALValue> > values)
    : Array(frame->script().bindingRootObject() ? frame->script().bindingRootObject() : JSC::Bindings::RootObject::create(frame, frame->script().globalObject(mainThreadNormalWorld()))) 
    , m_frame(frame)
{
    ASSERT_ARG(frame, frame);

    ExecState* exec = m_frame->script().globalObject(mainThreadNormalWorld())->globalExec();
    for (size_t i = 0; i < values.size(); ++i)
        m_values.insert(i, values[i]->toJSValue(exec));
}

BALArray::~BALArray()
{
    ASSERT(m_frame);
}

void BALArray::setValueAt(ExecState*, unsigned index, JSC::JSValue val) const
{
    m_values.insert(index, val);
}

JSC::JSValue BALArray::valueAt(ExecState*, unsigned index) const
{
    if (index >= length())
        return jsUndefined();

    return m_values[index];
}

} // namespace WebCore
