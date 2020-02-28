create_lut_jsc(JSC_SRC Source/JavaScriptCore/runtime/ArrayConstructor.cpp generated_sources/JavaScriptCore/ArrayConstructor.lut.h Source/JavaScriptCore/runtime/ArrayConstructor.cpp)
create_lut_jsc(JSC_SRC Source/JavaScriptCore/runtime/ArrayPrototype.cpp generated_sources/JavaScriptCore/ArrayPrototype.lut.h Source/JavaScriptCore/runtime/ArrayPrototype.cpp)
create_lut_jsc(JSC_SRC Source/JavaScriptCore/runtime/BooleanPrototype.cpp generated_sources/JavaScriptCore/BooleanPrototype.lut.h Source/JavaScriptCore/runtime/BooleanPrototype.cpp)
create_lut_jsc(JSC_SRC Source/JavaScriptCore/runtime/DateConstructor.cpp generated_sources/JavaScriptCore/DateConstructor.lut.h Source/JavaScriptCore/runtime/DateConstructor.cpp)
create_lut_jsc(JSC_SRC Source/JavaScriptCore/runtime/DatePrototype.cpp generated_sources/JavaScriptCore/DatePrototype.lut.h Source/JavaScriptCore/runtime/DatePrototype.cpp)
create_lut_jsc(JSC_SRC Source/JavaScriptCore/runtime/ErrorPrototype.cpp generated_sources/JavaScriptCore/ErrorPrototype.lut.h Source/JavaScriptCore/runtime/ErrorPrototype.cpp)
create_lut_jsc(JSC_SRC Source/JavaScriptCore/runtime/JSDataViewPrototype.cpp generated_sources/JavaScriptCore/JSDataViewPrototype.lut.h Source/JavaScriptCore/runtime/JSDataViewPrototype.cpp)
create_lut_jsc(JSC_SRC Source/JavaScriptCore/runtime/JSGlobalObject.cpp generated_sources/JavaScriptCore/JSGlobalObject.lut.h Source/JavaScriptCore/runtime/JSGlobalObject.cpp)
create_lut_jsc(JSC_SRC Source/JavaScriptCore/runtime/JSONObject.cpp generated_sources/JavaScriptCore/JSONObject.lut.h Source/JavaScriptCore/runtime/JSONObject.cpp)
create_lut_jsc(JSC_SRC Source/JavaScriptCore/runtime/MathObject.cpp generated_sources/JavaScriptCore/MathObject.lut.h Source/JavaScriptCore/runtime/MathObject.cpp)
create_lut_jsc(JSC_SRC Source/JavaScriptCore/runtime/NamePrototype.cpp generated_sources/JavaScriptCore/NamePrototype.lut.h Source/JavaScriptCore/runtime/NamePrototype.cpp)
create_lut_jsc(JSC_SRC Source/JavaScriptCore/runtime/NumberConstructor.cpp generated_sources/JavaScriptCore/NumberConstructor.lut.h Source/JavaScriptCore/runtime/NumberConstructor.cpp)
create_lut_jsc(JSC_SRC Source/JavaScriptCore/runtime/NumberPrototype.cpp generated_sources/JavaScriptCore/NumberPrototype.lut.h Source/JavaScriptCore/runtime/NumberPrototype.cpp)
create_lut_jsc(JSC_SRC Source/JavaScriptCore/runtime/ObjectConstructor.cpp generated_sources/JavaScriptCore/ObjectConstructor.lut.h Source/JavaScriptCore/runtime/ObjectConstructor.cpp)
create_lut_jsc(JSC_SRC Source/JavaScriptCore/runtime/ObjectPrototype.cpp generated_sources/JavaScriptCore/ObjectPrototype.lut.h Source/JavaScriptCore/runtime/ObjectPrototype.cpp)
create_lut_jsc(JSC_SRC Source/JavaScriptCore/runtime/RegExpConstructor.cpp generated_sources/JavaScriptCore/RegExpConstructor.lut.h Source/JavaScriptCore/runtime/RegExpConstructor.cpp)
create_lut_jsc(JSC_SRC Source/JavaScriptCore/runtime/RegExpObject.cpp generated_sources/JavaScriptCore/RegExpObject.lut.h Source/JavaScriptCore/runtime/RegExpObject.cpp)
create_lut_jsc(JSC_SRC Source/JavaScriptCore/runtime/RegExpPrototype.cpp generated_sources/JavaScriptCore/RegExpPrototype.lut.h Source/JavaScriptCore/runtime/RegExpPrototype.cpp)
create_lut_jsc(JSC_SRC Source/JavaScriptCore/runtime/StringConstructor.cpp generated_sources/JavaScriptCore/StringConstructor.lut.h Source/JavaScriptCore/runtime/StringConstructor.cpp)
create_lut_jsc(JSC_SRC Source/JavaScriptCore/runtime/StringPrototype.cpp generated_sources/JavaScriptCore/StringPrototype.lut.h Source/JavaScriptCore/runtime/StringPrototype.cpp)

list(APPEND JSC_SRC
    runtime/ArgList.cpp
    runtime/Arguments.cpp
    runtime/ArrayBuffer.cpp 
    runtime/ArrayBufferView.cpp 
    runtime/ArrayConstructor.cpp
    runtime/ArrayPrototype.cpp
    runtime/BooleanConstructor.cpp
    runtime/BooleanObject.cpp
    runtime/BooleanPrototype.cpp
    runtime/CallData.cpp
    runtime/CodeCache.cpp 
    runtime/CodeSpecializationKind.cpp  
    runtime/CommonIdentifiers.cpp
    runtime/CommonSlowPaths.cpp  
    runtime/CommonSlowPathsExceptions.cpp 
    runtime/CompilationResult.cpp   
    runtime/Completion.cpp
    runtime/ConstructData.cpp
    runtime/DataView.cpp 
    runtime/DateConstructor.cpp
    runtime/DateConversion.cpp
    runtime/DateInstance.cpp
    runtime/DatePrototype.cpp
    runtime/DumpContext.cpp 
    runtime/Error.cpp
    runtime/ErrorConstructor.cpp
    runtime/ErrorInstance.cpp
    runtime/ErrorPrototype.cpp
    runtime/ExceptionHelpers.cpp
    runtime/Executable.cpp
    runtime/FunctionConstructor.cpp
    runtime/FunctionExecutableDump.cpp
    runtime/FunctionPrototype.cpp
#    runtime/GCActivityCallback.cpp
    runtime/GCActivityCallbackMorphOS.cpp
    runtime/GetterSetter.cpp
    runtime/Identifier.cpp
    runtime/IndexingType.cpp
    runtime/InitializeThreading.cpp
    runtime/IntendedStructureChain.cpp 
    runtime/InternalFunction.cpp
    runtime/JSAPIValueWrapper.cpp    
    runtime/JSActivation.cpp
    runtime/JSArray.cpp
    runtime/JSArrayBuffer.cpp 
    runtime/JSArrayBufferConstructor.cpp 
    runtime/JSArrayBufferPrototype.cpp        
    runtime/JSArrayBufferView.cpp       
    runtime/JSBoundFunction.cpp
    runtime/JSCJSValue.cpp      
    runtime/JSCell.cpp
    runtime/JSChunk.cpp
    runtime/JSDataView.cpp 
    runtime/JSDataViewPrototype.cpp         
    runtime/JSDateMath.cpp  
    runtime/JSFunction.cpp
    runtime/JSGlobalObject.cpp
    runtime/JSGlobalObjectFunctions.cpp
    runtime/JSLock.cpp
    runtime/JSMap.cpp 
    runtime/JSNameScope.cpp
    runtime/JSNotAnObject.cpp
    runtime/JSONObject.cpp        
    runtime/JSObject.cpp
    runtime/JSPromise.cpp 
    runtime/JSPromiseCallback.cpp
    runtime/JSPromiseConstructor.cpp 
    runtime/JSPromisePrototype.cpp   
    runtime/JSPromiseResolver.cpp    
    runtime/JSPromiseResolverConstructor.cpp
    runtime/JSPromiseResolverPrototype.cpp 
    runtime/JSPropertyNameIterator.cpp
    runtime/JSProxy.cpp
    runtime/JSScope.cpp
    runtime/JSSegmentedVariableObject.cpp 
    runtime/JSSet.cpp
    runtime/JSString.cpp
    runtime/JSStringJoiner.cpp
    runtime/JSSymbolTableObject.cpp
    runtime/JSTypedArrayConstructors.cpp 
    runtime/JSTypedArrayPrototypes.cpp   
    runtime/JSTypedArrays.cpp
    runtime/JSVariableObject.cpp
    runtime/JSWithScope.cpp 
    runtime/JSWrapperObject.cpp
    runtime/LiteralParser.cpp
    runtime/Lookup.cpp
    runtime/MapConstructor.cpp  
    runtime/MapData.cpp   
    runtime/MapPrototype.cpp    
    runtime/MathObject.cpp
    runtime/MemoryStatistics.cpp  
    runtime/NameConstructor.cpp
    runtime/NameInstance.cpp
    runtime/NamePrototype.cpp
    runtime/NativeErrorConstructor.cpp
    runtime/NativeErrorPrototype.cpp
    runtime/NumberConstructor.cpp
    runtime/NumberObject.cpp
    runtime/NumberPrototype.cpp
    runtime/ObjectConstructor.cpp
    runtime/ObjectPrototype.cpp
    runtime/Operations.cpp
    runtime/Options.cpp
    runtime/PropertyDescriptor.cpp
    runtime/PropertyNameArray.cpp
    runtime/PropertySlot.cpp
    runtime/PropertyTable.cpp
    runtime/PrototypeMap.cpp
    runtime/RegExp.cpp
    runtime/RegExpCache.cpp
    runtime/RegExpCachedResult.cpp 
    runtime/RegExpConstructor.cpp
    runtime/RegExpMatchesArray.cpp
    runtime/RegExpObject.cpp
    runtime/RegExpPrototype.cpp
    runtime/SamplingCounter.cpp  
    runtime/SetConstructor.cpp 
    runtime/SetPrototype.cpp         
    runtime/SimpleTypedArrayController.cpp                    
    runtime/SmallStrings.cpp
    runtime/SparseArrayValueMap.cpp  
    runtime/StrictEvalActivation.cpp 
    runtime/StringConstructor.cpp
    runtime/StringObject.cpp
    runtime/StringPrototype.cpp
    runtime/StringRecursionChecker.cpp
    runtime/Structure.cpp
    runtime/StructureChain.cpp      
    runtime/StructureRareData.cpp
    runtime/SymbolTable.cpp
    runtime/TestRunnerUtils.cpp  
    runtime/TypedArrayController.cpp 
    runtime/TypedArrayType.cpp 
    runtime/VM.cpp     
    runtime/Watchdog.cpp    
    runtime/WatchdogNone.cpp   
)
