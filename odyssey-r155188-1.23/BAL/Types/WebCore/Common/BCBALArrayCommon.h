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


#ifndef BALArray_h
#define BALArray_h

#include "Bridge.h"
#include "BridgeJSC.h"
#include "JSValue.h"
#include "Vector.h"

namespace JSC {
    class ExecState;
}

namespace WebCore {

class BALValue;
class Frame;

class BALArray : public JSC::Bindings::Array {
public:
    BALArray(Frame*, Vector<RefPtr<BALValue> >);
    virtual ~BALArray();

    virtual void setValueAt(JSC::ExecState*, unsigned /*index*/, JSC::JSValue) const;
    virtual JSC::JSValue valueAt(JSC::ExecState*, unsigned /*index*/) const;
    virtual unsigned int getLength() const { return length(); }

    Frame* frame() const { return m_frame; }
private:
    unsigned int length() const { return m_values.size(); }

    Frame* m_frame;
    // it might be better to store directly BALValue's here.
    mutable Vector<JSC::JSValue> m_values;
};

using WebCore::BALArray;

} // namespace WebCore

#endif // BALArray_h
