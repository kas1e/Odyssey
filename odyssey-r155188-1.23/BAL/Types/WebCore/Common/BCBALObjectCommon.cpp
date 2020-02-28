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

#include "config.h"
#include "BALObject.h"

#include "WTFString.h"
#include "wtf/HashMap.h"
#include "wtf/Vector.h"

namespace WebCore {

typedef HashMap<BALObject*, Vector<String> > PropertyMap;
typedef HashMap<BALObject*, Vector<String> > MethodMap;
static MethodMap gMethodMap;
static PropertyMap gPropertyMap;

void BALObject::clean()
{
    gMethodMap.remove(this);
    gPropertyMap.remove(this);
}

bool BALObject::hasMethod(const char* name)
{
    Vector<String> methodList = gMethodMap.get(this);
    return methodList.find(String(name)) != notFound;
}

bool BALObject::hasProperty( const char* name)
{
    Vector<String> propertyList = gPropertyMap.get(this);
    return propertyList.find(String(name)) != notFound;
}

void BALObject::addMethod(const char* newMethod)
{
    MethodMap::iterator methodIt = gMethodMap.find(this);
    if (methodIt == gMethodMap.end()) {
        methodIt = gMethodMap.set(this, Vector<String>()).iterator;
    }
    methodIt->value.append(String(newMethod));
}

void BALObject::removeMethod(const char* methodToRemove)
{
    Vector<String> methodList = gMethodMap.get(this);
    size_t index = methodList.find(String(methodToRemove));
    methodList.remove(index);
}

void BALObject::addProperty(const char* newProperty)
{
    PropertyMap::iterator propertyIt = gPropertyMap.find(this);
    if (propertyIt == gPropertyMap.end())
        propertyIt = gPropertyMap.set(this, Vector<String>()).iterator;

    propertyIt->value.append(String(newProperty));
}

void BALObject::removeProperty(const char* propertyToRemove)
{
    Vector<String> propertyList = gPropertyMap.get(this);
    size_t index = propertyList.find(String(propertyToRemove));
    propertyList.remove(index);
}

Vector<String> BALObject::methods() const
{
    return gMethodMap.get(const_cast<BALObject*>(this));
}

Vector<String> BALObject::properties() const
{
    return gPropertyMap.get(const_cast<BALObject*>(this));
}

} // namespace WebCore
