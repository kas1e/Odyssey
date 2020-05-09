#include <stdio.h>
#include <proto/exec.h>
#include <proto/intuition.h>
#include <proto/graphics.h>
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

// old realisation with calling DoSuperMethod which internally do call DoSuperMethodA.
// that mean one unnecessary step and more stack used in compare with calling DoSuperMethodA directly
// keeping here for reference.
/*
Object * VARARGS68K DoSuperNew(struct IClass *cl, Object *obj, ...)
{
Object *rc;
va_list args;

va_startlinear(args, obj);
rc = (Object *)DoSuperMethod(cl, obj, OM_NEW, va_getlinearva(args, ULONG), NULL);
va_end(args);

return rc;
}
*/

Object * STDARGS VARARGS68K DoSuperNew(struct IClass *cl, Object * obj, ...)
{
        Object *rc;
        va_list args;
        struct opSet msg;

        va_start(args, obj);
        msg.MethodID = OM_NEW;
        msg.ops_AttrList = va_getlinearva(args, struct TagItem *);
        msg.ops_GInfo = NULL;
        rc = (Object *)DoSuperMethodA(cl, obj, (Msg)&msg);
        va_end(args);

        return rc;
}

#define AllocVecShared(size, flags)  AllocVecTags((size), AVT_Type, MEMF_SHARED, AVT_Lock, FALSE, ((flags)&MEMF_CLEAR) ? AVT_ClearWithValue : TAG_IGNORE, 0, TAG_DONE)

static LONG do_alpha(LONG a, LONG v)
{
  LONG tmp  = (a*v);
  return ((tmp<<8) + tmp + 32768)>>16;
}

ULONG WritePixelArrayAlpha(APTR src, UWORD srcx, UWORD srcy, UWORD srcmod, struct RastPort *rp, UWORD destx, UWORD desty, UWORD width, UWORD height, ULONG globalalpha)
{
  ULONG pixels = 0;

  if(width > 0 && height > 0)
  {
    ULONG *buf;

    if((buf = (ULONG *)AllocVecShared(width * 4, MEMF_ANY)) != NULL)
    {
      ULONG x, y;

      // Incorrect but cant bother with alpha channel math for now
      globalalpha = 255 - (globalalpha >> 24);

      for(y = 0; y < height; y++)
      {
        ULONG *spix;
        ULONG *dpix;

        //ReadPixelArray(buf, 0, 0, width * 4, rp, destx, desty + y, width, 1, RECTFMT_ARGB);
        ReadPixelArray(rp, destx, desty + y, (uint8 *)buf, 0, 0, width * 4, PIXF_A8R8G8B8, width, 1);
        

        spix = (ULONG *)((ULONG)src + (srcy + y) * srcmod + srcx * sizeof(ULONG));
        dpix = buf;

        for(x = 0; x < width; x++)
        {
          ULONG srcpix, dstpix, a, r, g, b;

          srcpix = *spix++;
          dstpix = *dpix;

          a = (srcpix >> 24) & 0xff;
          r = (srcpix >> 16) & 0xff;
          g = (srcpix >> 8) & 0xff;
          b = (srcpix >> 0) & 0xff;

          a = a - globalalpha;

          if(a > 0)
          {
            ULONG dest_r, dest_g, dest_b;

            dest_r = (dstpix >> 16) & 0xff;
            dest_g = (dstpix >> 8) & 0xff;
            dest_b = (dstpix >> 0) & 0xff;

            dest_r += do_alpha(a, r - dest_r);
            dest_g += do_alpha(a, g - dest_g);
            dest_b += do_alpha(a, b - dest_b);

            dstpix = 0xff000000 | dest_r << 16 | dest_g << 8 | dest_b;
          }

          *dpix++ = dstpix;
          pixels++;
        }

        //WritePixelArray(buf, 0, 0, width * 4, rp, destx, desty + y, width, 1, RECTFMT_ARGB);
        WritePixelArray((uint8 *)buf,0,0,width *4, PIXF_A8R8G8B8,rp,destx, desty + y, width, 1);
      }

      FreeVec(buf);
    }
  }

  return pixels;
}


#ifdef __cplusplus
}
#endif

