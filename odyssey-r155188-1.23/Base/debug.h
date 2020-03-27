#ifndef ODYSSEY_DEBUG_H
#define ODYSSEY_DEBUG_H

#if defined(__amigaos4__)
  #include <proto/exec.h>
  #define bug(fmt, args...)  {DebugPrintF("[%s:%ld %s] ", __FILE__, __LINE__, __FUNCTION__); DebugPrintF(fmt, ##args);}  
#elif defined(__amigaos3__)
  #include <clib/debug_protos.h>
  #define bug(fmt, args...)  {kprintf("[%s:%ld] ", __FILE__, __LINE__); kprintf(fmt, ##args);}
#elif defined(__MORPHOS__)
  #include <clib/debug_protos.h>
  #define bug(fmt, args...)  {kprintf("[%s:%ld %s] ", __FILE__, __LINE__, __FUNCTION__); kprintf(fmt, ##args);}
#elif  defined(__AROS__)
  #include <aros/debug.h>
  #undef bug
  #undef D
  #define bug(fmt, args...)  {kprintf("[%s:%ld %s] ", __FILE__, __LINE__, __FUNCTION__); kprintf(fmt, ##args);}
#endif

#endif /* ODYSSEY_DEBUG_H */