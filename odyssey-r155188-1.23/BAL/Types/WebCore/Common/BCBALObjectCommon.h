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


#ifndef BALObject_h
#define BALObject_h

#include "PassRefPtr.h"
#include "RefCounted.h"
#include "RefPtr.h"
#include "Vector.h"

#include "WTFString.h"

class WebObject; // FIXME: This is bad to have this implicit backward dependence.

namespace WebCore {

class BALValue;
class Frame;

/**
 * This is a native object that can be exposed throught JavaScript.
 * @internal
 */
class BALObject : public RefCounted<BALObject> {

public:
    virtual ~BALObject() { clean(); }
    bool hasMethod(const char* name);
    virtual String getName() = 0;
    virtual PassRefPtr<BALValue> invoke(Frame*, const String& name, const Vector<RefPtr<BALValue> >& /*args*/) = 0;
    bool hasProperty(const char* name);
    virtual PassRefPtr<BALValue> getProperty(Frame*, const String& name) = 0;
    virtual void setProperty(Frame*, const String& name, PassRefPtr<BALValue>) = 0;
    void addMethod(const char*);
    void removeMethod(const char*);
    void addProperty(const char*);
    void removeProperty(const char*);

    Vector<String> methods() const;
    Vector<String> properties() const;

    // Needed by WebValue to cast from a BALObject to its WebObject.
    virtual WebObject* toWebObject() const { return 0; }

private:
    void clean();
};

} // namespace WebCore

using WebCore::BALObject;

#endif // BALObject_h
