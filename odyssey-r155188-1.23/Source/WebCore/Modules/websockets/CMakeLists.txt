if(ENABLE_WEB_SOCKETS)
    list(APPEND WEBCORE_SRC
        Modules/websockets/WebSocket.cpp
        Modules/websockets/WebSocketChannel.cpp
	Modules/websockets/WebSocketDeflater.cpp
	Modules/websockets/WebSocketDeflateFramer.cpp
	Modules/websockets/WebSocketExtensionDispatcher.cpp
	Modules/websockets/WebSocketExtensionParser.cpp
	Modules/websockets/WebSocketFrame.cpp
        Modules/websockets/WebSocketHandshake.cpp
        Modules/websockets/ThreadableWebSocketChannel.cpp
	Modules/websockets/ThreadableWebSocketChannelClientWrapper.cpp 
    )
    list(APPEND IDL_SRC
        Modules/websockets/CloseEvent.idl 
        Modules/websockets/WebSocket.idl
    )
    if(ENABLE_WORKERS)
        list(APPEND WEBCORE_SRC
            Modules/websockets/WorkerThreadableWebSocketChannel.cpp
        )

	list(APPEND IDL_SRC
	    Modules/websockets/WorkerContextWebSocket.idl
	)
    endif(ENABLE_WORKERS)
endif(ENABLE_WEB_SOCKETS)
