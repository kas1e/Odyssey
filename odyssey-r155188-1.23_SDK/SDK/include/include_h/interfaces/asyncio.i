#ifndef ASYNCIO_INTERFACE_DEF_H
#define ASYNCIO_INTERFACE_DEF_H
/*
** This file is machine generated from idltool
** Do not edit
*/ 

#include <exec/types.i>
#include <exec/exec.i>
#include <exec/interfaces.i>

STRUCTURE AsyncIOIFace, InterfaceData_SIZE
	    FPTR IAsyncIO_Obtain
	    FPTR IAsyncIO_Release
	    FPTR IAsyncIO_Expunge
	    FPTR IAsyncIO_Clone
	    FPTR IAsyncIO_OpenAsync
	    FPTR IAsyncIO_OpenAsyncFromFH
	    FPTR IAsyncIO_CloseAsync
	    FPTR IAsyncIO_SeekAsync
	    FPTR IAsyncIO_ReadAsync
	    FPTR IAsyncIO_WriteAsync
	    FPTR IAsyncIO_ReadCharAsync
	    FPTR IAsyncIO_WriteCharAsync
	    FPTR IAsyncIO_ReadLineAsync
	    FPTR IAsyncIO_WriteLineAsync
	    FPTR IAsyncIO_FGetsAsync
	    FPTR IAsyncIO_FGetsLenAsync
	    FPTR IAsyncIO_PeekAsync
	LABEL AsyncIOIFace_SIZE

#endif
