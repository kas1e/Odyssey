#include <stdio.h>
#include <proto/exec.h>
#include <proto/intuition.h>
#include <stdarg.h>


#ifdef __cplusplus
extern "C" {
#endif


int stccpy(char *p, const char *q, int n)
{
   char *t = p;
   while ((*p++ = *q++) && --n > 0);
   p[-1] = '\0';
   return p - t;
}



Object * VARARGS68K DoSuperNew(struct IClass *cl, Object *obj, ...)
{
Object *rc;
va_list args;

va_startlinear(args, obj);
rc = (Object *)DoSuperMethod(cl, obj, OM_NEW, va_getlinearva(args, ULONG), NULL);
va_end(args);

return rc;
} 

#ifdef __cplusplus
}
#endif

