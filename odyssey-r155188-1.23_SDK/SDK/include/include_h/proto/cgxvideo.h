#ifndef PROTO_CGXVIDEO_H
#define PROTO_CGXVIDEO_H

/*
**	$Id$
**
**	Prototype/inline/pragma header file combo
**
**	Copyright (c) 2010 Hyperion Entertainment CVBA.
**	All Rights Reserved.
*/

#ifndef INTUITION_INTUITION_H
#include <intuition/intuition.h>
#endif
#ifndef INTUITION_SCREENS_H
#include <intuition/screens.h>
#endif
#ifndef CYBERGRAPHX_CGXVIDEO_H
#include <cybergraphx/cgxvideo.h>
#endif
#ifndef UTILITY_TAGITEM_H
#include <utility/tagitem.h>
#endif

/****************************************************************************/

#ifndef __NOLIBBASE__
 #ifndef __USE_BASETYPE__
  extern struct Library * CGXVideoBase;
 #else
  extern struct Library * CGXVideoBase;
 #endif /* __USE_BASETYPE__ */
#endif /* __NOLIBBASE__ */

/****************************************************************************/

#ifdef __amigaos4__
 #include <interfaces/cgxvideo.h>
 #ifdef __USE_INLINE__
  #include <inline4/cgxvideo.h>
 #endif /* __USE_INLINE__ */
 #ifndef CLIB_CGXVIDEO_PROTOS_H
  #define CLIB_CGXVIDEO_PROTOS_H 1
 #endif /* CLIB_CGXVIDEO_PROTOS_H */
 #ifndef __NOGLOBALIFACE__
  extern struct CgxvideoIFace *ICgxvideo;
 #endif /* __NOGLOBALIFACE__ */
#else /* __amigaos4__ */
 #ifndef CLIB_CGXVIDEO_PROTOS_H
  #include <clib/cgxvideo_protos.h>
 #endif /* CLIB_CGXVIDEO_PROTOS_H */
 #if defined(__GNUC__)
  #ifndef __PPC__
   #include <inline/cgxvideo.h>
  #else /* __PPC__ */
   #include <ppcinline/cgxvideo.h>
  #endif /* __PPC__ */
 #elif defined(__VBCC__)
  #ifndef __PPC__
   #include <inline/cgxvideo_protos.h>
  #endif /* __PPC__ */
 #else /* __GNUC__ */
  #include <pragmas/cgxvideo_pragmas.h>
 #endif /* __GNUC__ */
#endif /* __amigaos4__ */

/****************************************************************************/

#endif /* PROTO_CGXVIDEO_H */
