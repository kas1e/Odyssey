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

#ifndef BalRuntime_h
#define BalRuntime_h

#include "Bridge.h"
#include "BridgeJSC.h"

namespace JSC {

namespace Bindings {

class BalInstance;

class BalField : public Field {
public:
    BalField(const char* p)
    {
        m_ident = (char*)malloc(strlen(p) +1);
        strcpy(m_ident, p);
    }

    ~BalField()
    {
        if( m_ident != NULL )
            free(m_ident);
    }

    virtual JSValue valueFromInstance(ExecState*, const Instance*) const;
    virtual void setValueToInstance(ExecState*, const Instance*, JSValue) const;
    virtual const char* name() const;

private:
    char* m_ident;
};


class BalMethod : public Method
{
public:
    BalMethod(const char* ident)
    {
        m_identifier = (char*)fastMalloc(strlen(ident) + 1);
        strcpy(m_identifier, ident);
    }

    ~BalMethod()
    {
        if(m_identifier != NULL)
            fastFree(m_identifier);
    }
    virtual const char* name() const { return m_identifier; }
    virtual int numParameters() const { return 0; }

private:
    friend class BalInstance;
    char* m_identifier;
};

} // namespace Bindings

} // namespace KJS

#endif // BalRuntime_h
