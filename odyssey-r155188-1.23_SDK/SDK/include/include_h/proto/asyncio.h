#ifndef PROTO_ASYNCIO_H
#define PROTO_ASYNCIO_H

/*
**	$Id$
**	Includes Release 50.1
**
**	Prototype/inline/pragma header file combo
**
**	(C) Copyright 2003 Amiga, Inc.
**	    All Rights Reserved
*/

#ifndef LIBRARIES_ASYNCIO_H
#include <libraries/asyncio.h>
#endif

/****************************************************************************/

#ifndef __NOLIBBASE__
extern struct AsyncIOBase * AsyncIOBase;
#endif /* __NOLIBBASE__ */

/****************************************************************************/

#ifdef __amigaos4__
 #ifdef __USE_INLINE__
  #include <inline4/asyncio.h>
 #endif /* __USE_INLINE__ */

 #include <interfaces/asyncio.h>

 #ifndef __NOGLOBALIFACE__
  extern struct AsyncIOIFace *IAsyncIO;
 #endif /* __NOGLOBALIFACE__ */
#else /* __amigaos4__ */
 #if defined(__GNUC__)
  #include <inline/asyncio.h>
 #elif defined(__VBCC__)
  #ifndef __PPC__
   #include <inline/asyncio_protos.h>
  #endif /* __PPC__ */
 #else
  #include <pragmas/asyncio_pragmas.h>
 #endif /* __GNUC__ */
#endif /* __amigaos4__ */

/****************************************************************************/

#endif /* PROTO_ASYNCIO_H */
