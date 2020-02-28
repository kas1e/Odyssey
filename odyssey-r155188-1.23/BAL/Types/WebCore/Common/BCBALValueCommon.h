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

#ifndef BALValue_h
#define BALValue_h

#include "JSValue.h"
#include "JSObject.h"
#include "OwnPtr.h"
#include "PassRefPtr.h"
#include "RefCounted.h"

namespace JSC {
    class ExecState;
}

namespace WebCore {

class BALArray;
class BALObject;
class Frame;

class BALValue : public RefCounted<BALValue> {

public:
    static PassRefPtr<BALValue> create(Frame* name)
    {
        return adoptRef(new BALValue(name));
    }

    static PassRefPtr<BALValue> create(Frame* frame, JSC::ExecState* execState, const JSC::JSValue& value)
    {
        return adoptRef(new BALValue(frame, execState, value));
    }

    ~BALValue();

    bool isUndefined() const;
    bool isNull() const;
    bool isUndefinedOrNull() const;
    bool isBoolean() const;
    bool isNumber() const;
    bool isString() const;
    bool isGetterSetter() const;
    bool isJSObject() const;
    bool isBALObject() const;
    bool isException() const;
    bool isArray() const;

    bool toBoolean() const;
    double toNumber() const;
    int toInt(bool& ok) const; // Helper method
    String toString() const;
    BALObject* toObject() const;
    BALArray* toArray() const;

    JSC::JSObject* toJSObject(JSC::ExecState*) const;
    JSC::JSValue toJSValue(JSC::ExecState*) const;

    // Return value converted from string color (named or valued) to binary color. returns 0x0 if problem when decoding color.
    unsigned int toRGBA32() const;

    void balUndefined();
    void balNull();
    void balNaN();
    void balBoolean(bool b);
    void balNumber(double d);
    void balString(const String& s);
    void balObject(BALObject* obj);
    void balObject(PassRefPtr<BALObject>);
    void balException(short code, const String& name, const String& description);
    void balArray(BALArray* array);

    JSC::ExecState* execState() const { return m_exec; }
    Frame* frame() const { return m_frame; }

private:
    explicit BALValue(Frame*);
    BALValue(Frame*, JSC::ExecState*, const JSC::JSValue&);

    RefPtr<BALObject> m_obj;
    BALArray* m_array;
    JSC::JSValue m_val;
    JSC::ExecState* m_exec;
    Frame* m_frame;

    bool m_isException;
};

} // namespace WebCore

using WebCore::BALValue;

#endif // BALValue_h
