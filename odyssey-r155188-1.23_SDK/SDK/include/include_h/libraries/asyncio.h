#ifndef LIBRARIES_ASYNCIO_H
#define LIBRARIES_ASYNCIO_H
#ifndef EXEC_PORTS_H
#include <exec/ports.h>
#endif
#ifndef DOS_DOS_H
#include <dos/dos.h>
#endif
#ifndef DOS_DOSEXTENS_H
#include <dos/dosextens.h>
#endif

struct AsyncFile
{
BPTR af_File;
ULONG af_BlockSize;
struct MsgPort *af_Handler;
UBYTE *af_Offset;
LONG af_BytesLeft;
ULONG af_BufferSize;
UBYTE *af_Buffers[2];
struct StandardPacket af_Packet;
struct MsgPort af_PacketPort;
ULONG af_CurrentBuf;
ULONG af_SeekOffset;
UBYTE af_PacketPending;
UBYTE af_ReadMode;
UBYTE af_CloseFH;

/*
The following members were not listed in the V39 source code
of asyncio.library, although they were used.
I decided to add them at the end.
Any, this structure is private and you should keep you hand off
unless you dnot know how to use then !!!
*/

UBYTE af_SeekPastEOF; 
LONG af_LastRes1;
LONG af_LastBytesLeft;
};

/*
These enum werde typedef structures before. I turned them into ints.
But this does not affect your code anyway (100% compatible ! to V39 !)
*/

enum /* OpenModes */
{
MODE_READ,
MODE_WRITE,
MODE_APPEND
};

enum /* SeekModes */
{
MODE_START=-1,
MODE_CURRENT,
MODE_END
};

#endif
