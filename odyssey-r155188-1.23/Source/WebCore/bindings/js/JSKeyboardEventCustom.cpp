/*
 * Copyright (C) 2009 Pleyo. All rights reserved.
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
 * 3.  Neither the name of Apple Computer, Inc. ("Apple") nor the names of
 *     its contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission. 
 *
 * THIS SOFTWARE IS PROVIDED BY PLEYO AND ITS CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL APPLE OR ITS CONTRIBUTORS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "config.h"
#include "KeyboardEvent.h"
#include "JSDOMBinding.h"
#include "JSKeyboardEvent.h"
#include "JSDOMWindowCustom.h"
#include <runtime/Error.h>

using namespace JSC;

namespace WebCore {

JSValue JSKeyboardEvent::initKeyEvent(ExecState* exec, const ArgList& args)
{
    if (args.size() < 8)
        throwError(exec, SyntaxError, "Not enough arguments");

    DOMWindow* window = asJSDOMWindow(exec->lexicalGlobalObject())->impl(); 
    static_cast<KeyboardEvent*>(impl())->initKeyEvent(ustringToString(args.at(0).toString(exec)), args.at(1).toBoolean(exec), args.at(2).toBoolean(exec), window, args.at(3).toBoolean(exec), args.at(4).toBoolean(exec), args.at(5).toBoolean(exec), args.at(6).toBoolean(exec), args.at(7).toNumber(exec));

    return jsUndefined();
}

} // namespace WebCore
