if(ENABLE_WORKERS)
    list(APPEND WEBCORE_SRC
        workers/AbstractWorker.cpp
        workers/DedicatedWorkerGlobalScope.cpp
        workers/DedicatedWorkerThread.cpp
        workers/Worker.cpp
        workers/WorkerGlobalScope.cpp
	workers/WorkerEventQueue.cpp
        workers/WorkerLocation.cpp
        workers/WorkerMessagingProxy.cpp
        workers/WorkerRunLoop.cpp
        workers/WorkerScriptLoader.cpp
        workers/WorkerThread.cpp
    )
    list(APPEND IDL_SRC
        workers/AbstractWorker.idl
        workers/DedicatedWorkerGlobalScope.idl
        workers/Worker.idl
        workers/WorkerGlobalScope.idl
        workers/WorkerLocation.idl
    )
    if(ENABLE_SHARED_WORKERS)
        list(APPEND WEBCORE_SRC
            workers/DefaultSharedWorkerRepository.cpp
            workers/SharedWorker.cpp
            workers/SharedWorkerGlobalScope.cpp
	    workers/SharedWorkerRepository.cpp 
            workers/SharedWorkerThread.cpp
        )
        list(APPEND IDL_SRC
            workers/SharedWorker.idl
            workers/SharedWorkerGlobalScope.idl
        )
    endif(ENABLE_SHARED_WORKERS)
endif(ENABLE_WORKERS)
