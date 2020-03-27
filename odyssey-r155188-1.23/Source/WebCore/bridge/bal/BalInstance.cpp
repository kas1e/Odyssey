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
#include "BalInstance.h"

#include "ArgList.h"
#include "BalClass.h"
#include "BalRuntime.h"
#include "BALValue.h"
#include "Frame.h"
#include "JSDOMBinding.h"
#include "JSGlobalObject.h"
#include "JSLock.h"
#include "JSValue.h"
#include "ObjectPrototype.h"
#include "PropertyNameArray.h"
#include "TransferSharedPtr.h"
#include "SharedPtr.h"
#include <wtf/HashMap.h>
#include "runtime_array.h"
#include "runtime_method.h"
#include "runtime_object.h"

/* Debug output to serial handled via D(bug("....."));
*  See Base/debug.h for details.
*  D(x)    - to disable debug
*  D(x) x  - to enable debug
*/
#define D(x)

using namespace WebCore;

namespace JSC {

namespace Bindings {

// This structure garantees that there is only one BalInstance per pair (BALObject, RootObject).
typedef HashMap<BALObject*, HashMap<RootObject*, RefPtr<BalInstance> > > BALObjectInstanceMap;
static BALObjectInstanceMap cachedInstances;

typedef HashMap<BalInstance*, JSObject*> InstanceJSObjectMap;
static InstanceJSObjectMap cachedObjects;

class BalRuntimeObjectImp : public RuntimeObject {
public:
    BalRuntimeObjectImp(ExecState*, JSGlobalObject* globalObject, PassRefPtr<Instance>);
    ~BalRuntimeObjectImp();
    virtual void invalidate();

    static const ClassInfo s_info;

    virtual void visitChildren(JSCell* cell, SlotVisitor& visitor)
    {
      /*
        BalInstance* instance = static_cast<BalInstance*>(getInternalInstance());
        if (instance)
	instance->visitAggregate(visitor);
      */
      RuntimeObject::visitChildren(cell, visitor);
    }

    static BalRuntimeObjectImp* create(ExecState* exec, JSGlobalObject* globalObject, PassRefPtr<Instance> instance)
    {
        return new (allocateCell<BalRuntimeObjectImp>(*exec->heap())) BalRuntimeObjectImp(exec, globalObject, instance);
    }

    static Structure* createStructure(JSGlobalData& globalData, JSGlobalObject* globalObject, JSValue prototype)
    {
        return Structure::create(globalData, globalObject, prototype, TypeInfo(ObjectType, StructureFlags), &s_info);
    } 

protected:
    void removeFromCache();
    void removeInstanceFromCache();

private:
    virtual const ClassInfo* classInfo() const { return &s_info; }
};

const ClassInfo BalRuntimeObjectImp::s_info = { "BalRuntimeObject", &RuntimeObject::s_info, 0, 0 /*, CREATE_METHOD_TABLE(BalRuntimeObjectImp)*/ };

BalRuntimeObjectImp::BalRuntimeObjectImp(ExecState* exec, JSGlobalObject* globalObject, PassRefPtr<Instance> instance)
	: RuntimeObject(exec, globalObject, WebCore::deprecatedGetDOMStructure<BalRuntimeObjectImp>(exec), instance)
{
}

BalRuntimeObjectImp::~BalRuntimeObjectImp()
{
    removeFromCache();
}

void BalRuntimeObjectImp::invalidate()
{
    removeFromCache();
    removeInstanceFromCache();
    RuntimeObject::invalidate();
}

void BalRuntimeObjectImp::removeInstanceFromCache()
{
    // This is called when the associated RuntimeObject is invalidated.
    // So we unregister our instances so that they can be released.
    BalInstance* instance = static_cast<BalInstance*>(getInternalInstance());
    BALObjectInstanceMap::iterator instancesIt = cachedInstances.find(instance->getObject().get());
    ASSERT(instancesIt != cachedInstances.end());
    ASSERT(instancesIt->value.size());

    RootObject* rootObject = getInternalInstance()->rootObject();
    ASSERT(rootObject);
    ASSERT(instancesIt->value.get(rootObject) == instance);
    instancesIt->value.remove(rootObject);
}


void BalRuntimeObjectImp::removeFromCache()
{
    // FIXME: We have a o(n) algorithm here, there should be a better structure for that!
    InstanceJSObjectMap::iterator begin = cachedObjects.begin();
    InstanceJSObjectMap::iterator end = cachedObjects.end();
    for (InstanceJSObjectMap::iterator it = begin; it != end; ++it) 
        if (it->value == this) {
            cachedObjects.remove(it);
            return;
        }

    // FIXME: We cannot guarantee that an object is in the cache when calling this method so we cannot add an assert here.
}

BalInstance::BalInstance(BALObject* o, PassRefPtr<RootObject> rootObject)
    : Instance(rootObject)
    ,  m_class(0)
    ,  m_object(o)
{
}

BalInstance::~BalInstance() 
{
  m_object = 0;
  m_class = 0;
}
/*BalInstance::BalInstance(const BalInstance& other)
    : Instance(other.rootObject()), m_class(0), m_object(other.m_object)
{
}*/

Class* BalInstance::getClass() const
{
    if (!m_class)
        m_class = BalClass::classForObject(m_object.get());
    return m_class;
}

bool BalInstance::supportsInvokeDefaultMethod() const
{
    return false;//m_object->_class->invokeDefault;
}

JSValue BalInstance::getMethod(ExecState* exec, PropertyName propertyName)
{
#if 0
    MethodList methodList = getClass()->methodsNamed(propertyName, this);
    return RuntimeMethod::create(exec, exec->lexicalGlobalObject(), WebCore::deprecatedGetDOMStructure<BalRuntimeObjectImp>(exec), propertyName.publicName(), methodList);
#endif
    return jsUndefined();
}

JSValue BalInstance::invokeMethod(ExecState* exec, RuntimeMethod* runtimeMethod)
{
#if 0
    const MethodList& methodList = *runtimeMethod->methods(); 
    ASSERT(methodList.size() == 1);
    
    BalMethod* method = static_cast<BalMethod*>(methodList[0]);

    const char* ident = method->name();
    if (!m_object->hasMethod(ident))
        return jsUndefined();

    Frame* frame = const_cast<Frame*>(static_cast<const Frame*>(rootObject()->nativeHandle()));
    unsigned count = exec->argumentCount();
    Vector<RefPtr<BALValue> > cArgs(count);
    for (unsigned i = 0; i < count; i++)
        cArgs[i] = BALValue::create(frame, exec, exec->argument(i));

    RefPtr<BALValue> value = 0;
    {
        //JSLock::DropAllLocks dropAllLocks(false);
        value = m_object->invoke(frame, ident, cArgs);
        if (!value) {
            value = BALValue::create(frame);
            value->balUndefined();
        }
    }

    cArgs.clear();
    return value->toJSValue(exec);
#endif
    return jsUndefined();
}

JSValue BalInstance::invokeDefaultMethod(ExecState* exec, const ArgList& args)
{
    return jsUndefined();
}

JSValue BalInstance::defaultValue(ExecState* exec, PreferredPrimitiveType hint) const
{
    if (hint == PreferString)
        return stringValue(exec);
    if (hint == PreferNumber)
        return numberValue(exec);
    return valueOf(exec);
}

JSValue BalInstance::stringValue(ExecState* exec) const
{
    char buf[1024];
    if (!m_class)
        m_class = BalClass::classForObject(m_object.get());
#if COMPILER(MSVC)
    _snprintf(buf, sizeof(buf), "BALObject %p BalClass (%s)", m_object.get(), m_class->name());
#else
    snprintf(buf, sizeof(buf), "BALObject %p BalClass (%s)", m_object.get(), m_class->name());
#endif
    return jsString(exec, buf);
}

JSValue BalInstance::numberValue(ExecState* exec) const
{
    return jsNumber(0);
}

JSValue BalInstance::booleanValue() const
{
    // FIXME: Implement something sensible.
    return jsBoolean(false);
}

JSValue BalInstance::valueOf(ExecState* exec) const 
{
    return stringValue(exec);
}

void BalInstance::getPropertyNames(ExecState* exec, PropertyNameArray& nameArray)
{
    const Vector<String>& methods = m_object->methods();
    const Vector<String>& properties = m_object->properties();

    for (size_t i = 0; i < methods.size(); ++i)
        nameArray.add(Identifier(exec, methods[i]));

    for (size_t i = 0; i < properties.size(); ++i)
        nameArray.add(Identifier(exec, properties[i]));
}

RuntimeObject* BalInstance::newRuntimeObject(ExecState* exec)
{
    D(bug("BalInstance::newRuntimeObject\n"));
    //JSLock lock(exec);
    RuntimeObject* object = static_cast<RuntimeObject*>(cachedObjects.get(this));
    if (!object) {
        object = BalRuntimeObjectImp::create(exec, exec->lexicalGlobalObject(), this);
        cachedObjects.set(this, object);
    }
    return object;
}

PassRefPtr<BalInstance> BalInstance::getBalInstance(BALObject* balObject, PassRefPtr<RootObject> rootObject)
{
#if 0
    //JSLock lock(WebCore::JSDOMWindowBase::commonJSGlobalData());
 
    BALObjectInstanceMap::iterator instancesForBALObjectIt = cachedInstances.find(balObject);
    if (instancesForBALObjectIt == cachedInstances.end())
        instancesForBALObjectIt = cachedInstances.set(balObject, HashMap<RootObject*, RefPtr<BalInstance> >()).iterator;
    else {
        RefPtr<BalInstance> instance = instancesForBALObjectIt->value.get(rootObject.get());
        if (instance)
            return instance.release();
    }

    // The BalInstance constructor clears the PassRefPtr that contains the RootObject so save it now.
    RootObject* rootObjectRaw = rootObject.get();
    RefPtr<BalInstance> instance = BalInstance::create(balObject, rootObject);
    instancesForBALObjectIt->key.set(rootObjectRaw, instance);

    return instance.release();
#endif
    RefPtr<BalInstance> instance;
    return instance.release();
}


}
}

