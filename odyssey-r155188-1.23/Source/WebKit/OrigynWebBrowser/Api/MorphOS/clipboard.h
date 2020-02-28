#ifndef __CLIPBOARD_H__
#define __CLIPBOARD_H__

#include "CString.h"
#include "WTFString.h"
#ifndef __amigaos4__
#include "gui.h"
#endif
#undef String

#ifndef ID_CSET
    #define ID_CSET MAKE_ID('C','S','E','T')
#endif

#ifndef ID_UTF8
	#define ID_UTF8 MAKE_ID('U','T','F','8')
#endif

#ifndef CODESET_LATIN1
#define CODESET_LATIN1  0
#endif

#ifndef CODESET_UTF8
#define CODESET_UTF8    1
#endif

#ifndef CODESET_LOCAL
#define CODESET_LOCAL   2
#endif

#ifndef __amigaos4__
typedef int int32;
typedef unsigned int uint32;
#endif

struct IFFCodeSet
{
    uint32 CodeSet;
	uint32 Reserved[5];
};

typedef	struct chkimage
{
	int	width,height;
    union
	{
		unsigned char	*b;
		unsigned int	*l;
		unsigned short	*w;
		void			*p;
	}data ;
	int	pixfmt;					/*	image format (CHK_PIXFMTXXX) */
} ChkImage;

WTF::String pasteFromClipboard(void);
bool copyTextToClipboard(char *text, bool utf8);
bool copyImageToClipboard(ChkImage *img);
bool installClipboardMonitor(void);
void removeClipboardMonitor(void);

#endif
