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
#include "WebValueHelper.h"

#include "BALValue.h"
#include "WebFrame.h"
#include "WebArray.h"
#include "WebObject.h"
#include "WebValue.h"

PassRefPtr<BALValue> WebValueHelper::toBALValue(TransferSharedPtr<WebValue> value)
{
    if (value->isObject()) {
        RefPtr<BALValue> newValue = BALValue::create(core(value->webFrame()));
        newValue->balObject(value->toWebObject()->internalObject());
        return newValue.release();
    } else if (value->isArray()) {
        RefPtr<BALValue> newValue = BALValue::create(core(value->webFrame()));
        newValue->balArray(value->toWebArray()->internalArray());
        return newValue.release();
    }
    return value->m_val;
}

bool WebValueHelper::isJSObject(TransferSharedPtr<WebValue> value)
{
    return value->m_val->isJSObject();
}

#endif
