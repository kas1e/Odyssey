#ifndef AOS4FUNCS_API_H
#define AOS4FUNCS_API_H

#include <proto/exec.h>
#include "classes.h"
#include "mui.h"

typedef long long QUAD;
typedef unsigned long long UQUAD;
typedef unsigned long ULONG;
typedef unsigned long IPTR;

#define AllocVecTaskPooled(x) AllocVec(x,MEMF_PRIVATE)
#define FreeVecTaskPooled(x) FreeVec(x)

// typedef of _Msg_ on morphos are the same as typedef of _Msg on os4 (intuition/classusr.h on both oses)
#define _Msg_ _Msg

#ifdef __cplusplus
extern "C" {
#endif

Object * VARARGS68K DoSuperNew(struct IClass *cl, Object *obj, ...);
int stccpy(char *p, const char *q, int n);

#ifdef __cplusplus
}
#endif

#endif