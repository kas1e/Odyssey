/*
 * Copyright (C) 2009 Fabien Coeurjoly
 * Copyright (C) 2008 Pleyo.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1.  Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 * 2.  Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 * 3.  Neither the name of Pleyo nor the names of
 *     its contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY PLEYO AND ITS CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL PLEYO OR ITS CONTRIBUTORS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


#include "config.h"
#include "BALBase.h"
//#include "Pasteboard.h"

#include <cairo.h>

#include <proto/timer.h>
#include <dos/dos.h>
#include <dos/notify.h>
#include <proto/dos.h>
#include <proto/application.h>


#include <workbench/workbench.h>
#include <workbench/icon.h>
#include <proto/icon.h>

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <sys/signal.h>
#include <locale.h>
#include <setjmp.h>

#include "gui.h"
#include "../../../Source/WebKit/OrigynWebBrowser/Api/MorphOS/alocale.h"

#undef accept

#include <proto/intuition.h>
#include <proto/codesets.h>
#include <proto/diskfont.h>
#include <proto/locale.h>

#include <classes/requester.h>
#include <reaction/reaction_macros.h>
#include <diskfont/diskfonttag.h>

/* Debug output to serial handled via D(bug("....."));
*  See Base/debug.h for details.
*  D(x)    - to disable debug
*  D(x) x  - to enable debug
*/
#define D(x)

void close_dictionary();
void destroy_application(void);
void close_libs(void);

static uint32* unicode_map;
//uint32 clearClipboard = FALSE;

uint32 amigaToUnicodeChar(uint32 c)
{
	if (unicode_map && c <= 255 && unicode_map[c] <= 65535)
		return unicode_map[c];

	return c;
}

extern "C"
{
	int raise(int sig)
	{
		D(bug("raise(%d) was called, dumping stackframe...\n", sig));
		#ifndef __amigaos4__
		DumpTaskState(FindTask(NULL));
		#endif

		return(0);
	}
	/*
	void abort(void)
	{
		D(bug("abort was called, dumping stackframe...\n"));

		DumpTaskState(FindTask(NULL));

		Wait(0);
	} */
}

/* Globals */
TEXT version[] __attribute__((section(".text"))) = "$VER: Odyssey Web Browser " VERSION " (" DATE ")";
static const char *  __attribute__((used)) stackcookie = "$STACK: 2000000"; 
unsigned long __stack = 2*1024*1024;
jmp_buf bailout_env;


struct Library			*ApplicationBase	= NULL;
struct ApplicationIFace *IApplication		= NULL;

struct Library			*KeymapBase		= NULL;
struct KeymapIFace		*IKeymap		= NULL;

struct Library			*MUIMasterBase	= NULL;
struct MUIMasterIFace	*IMUIMaster		= NULL;

struct Library			*CodesetsBase	= NULL;
struct CodesetsIFace	*ICodesets		= NULL; 

struct Library			*DiskFontBase	= NULL;
struct DiskFontIFace	*IDiskFont		= NULL;

struct Library			*IconBase		= NULL;
struct IconIFace		*IIcon			= NULL;

struct Library			*ExpatBase		= NULL;
struct ExpatIFace		*IExpat			= NULL;

struct Library			*OpenURLBase	= NULL;
struct OpenURLIFace		*IOpenURL		= NULL;

/* Dos notify stuff */

ULONG dosnotifysig=0;
LONG dosnotifybit=-1;
struct NotifyRequest nr;
uint32 appID;


LONG dosnotify_init(void)
{
	dosnotifybit = AllocSignal(-1);
	if(dosnotifybit!=-1)
	{
		dosnotifysig = 1L << dosnotifybit;
		return (TRUE);
	}
	return (FALSE);
}

void dosnotify_cleanup(void)
{
	if(dosnotifybit)
	{
		FreeSignal(dosnotifybit);
	}
}

struct NotifyRequest *dosnotify_start(CONST_STRPTR name)
{
	struct NotifyRequest *nr;
	ULONG namelen;

	namelen = strlen(name);
	if((namelen) && (dosnotifysig))
	{
		if( (nr = (struct NotifyRequest *)malloc(sizeof(*nr) + namelen + 1)) )
		{
			nr->nr_Name= (char *) (nr + 1);
			memcpy((void *)nr->nr_Name, name, namelen + 1);
			nr->nr_stuff.nr_Signal.nr_Task   = FindTask(NULL);
			nr->nr_stuff.nr_Signal.nr_SignalNum = dosnotifysig;
			nr->nr_Flags           = NRF_SEND_SIGNAL;
			if(StartNotify(nr))
			{
				return (nr);
			}
			free(nr);
		}
	}
	return (NULL);
}


void dosnotify_stop(struct NotifyRequest *nr)
{
	if(nr)
	{
		EndNotify(nr);
		free(nr);
	}
}


ULONG open_libs(void)
{
	if(!(KeymapBase = OpenLibrary("keymap.library", 39))) {
		fprintf(stderr, "Failed to open keymap.library.\n");
		return FALSE;
	}
	IKeymap = (struct KeymapIFace*)GetInterface(KeymapBase, "main", 1, NULL);

	
// handle mui nicely

	Object               *win_obj;
	Object               *requester_object;
	uint32                result = 0; 

	if((MUIMasterBase = OpenLibrary(MUIMASTER_NAME, 20)) != NULL)
	{
		if(MUIMasterBase->lib_Version > 20 || (MUIMasterBase->lib_Version == 20 && MUIMasterBase->lib_Revision >= 6175))
		{		
			// we have MUI4 with a working Title.mui
			IMUIMaster = (struct MUIMasterIFace *)GetInterface(MUIMasterBase, "main", 1, NULL);			
		}
		else
		{
			// something older
			requester_object = NewObject(NULL, "requester.class",
						REQ_Type,  REQTYPE_INFO,
						REQ_Image, REQIMAGE_ERROR,
						REQ_TitleText,  "old mui",
						REQ_BodyText,   "Please install latest versions of mui4",
						REQ_GadgetText, "OK",
						TAG_END);

			SetAttrs(win_obj, WA_BusyPointer, TRUE, TAG_DONE);
			result = IDoMethod(requester_object, RM_OPENREQ, NULL, NULL, /*window,*/ NULL, TAG_DONE);
			DisposeObject(requester_object);
			requester_object = NULL;
			SetAttrs(win_obj, WA_BusyPointer, FALSE, TAG_DONE);
			
			  return FALSE;
		}
	}
	else
	{
		// no MUI at all

		requester_object = NewObject(NULL, "requester.class",
				REQ_Type,  REQTYPE_INFO,
				REQ_Image, REQIMAGE_ERROR,
				REQ_TitleText,  "no mui",
				REQ_BodyText,   "Please install mui",
				REQ_GadgetText, "OK",
				TAG_END);

		SetAttrs(win_obj, WA_BusyPointer, TRUE, TAG_DONE);
		result = IDoMethod(requester_object, RM_OPENREQ, NULL, NULL, /*window,*/ NULL, TAG_DONE);
		DisposeObject(requester_object);
		requester_object = NULL;
		SetAttrs(win_obj, WA_BusyPointer, FALSE, TAG_DONE);
				  
		return FALSE;
	}

	// application.library (to register app, to enable/disable blankers, etc).
	if (!(ApplicationBase = OpenLibrary("application.library", 52))) {	
		fprintf(stderr,"Failed to open application.library\n");
		return FALSE;
	}	 
	IApplication  = (struct ApplicationIFace *)GetInterface(ApplicationBase, "application", 2, NULL);

	// register an app for aplication library	
	appID = RegisterApplication("Odyssey",
				REGAPP_URLIdentifier, "none",
				REGAPP_Description, "Odyssey Web Browser",
				TAG_END);

	if(!(CodesetsBase = OpenLibrary(CODESETSNAME, CODESETSVER))) {
		fprintf(stderr, "Failed to open codesets.library.\n");
		return FALSE;
	}
	ICodesets = (struct CodesetsIFace *)GetInterface(CodesetsBase, "main", 1, NULL); 

	if(!(DiskFontBase = OpenLibrary("diskfont.library", 37))) {
		fprintf(stderr, "Failed to open diskfont.library.\n");
		return FALSE;
	}
	IDiskFont = (struct DiskFontIFace *)GetInterface(DiskFontBase, "main", 1, NULL); 

	if(!(IconBase = OpenLibrary("icon.library", 39))) {
		fprintf(stderr, "Failed to open icon.library.\n");
		return FALSE;
	}
	IIcon = (struct IconIFace *)GetInterface(IconBase, "main", 1, NULL); 

	if(!(ExpatBase = OpenLibrary("expat.library", 0))) {
		fprintf(stderr, "Failed to open expat.library.\n");
		return FALSE;
	}
	IExpat = (struct ExpatIFace *)GetInterface(ExpatBase, "main", 1, NULL); 

// handle openurl differently: dind't exit if can't open, just skip it (use it only as fallback if URLOpen didn't works).
	
	if(OpenURLBase = OpenLibrary("openurl.library", 0)) {
		IOpenURL = (struct OpenURLIFace *)GetInterface(OpenURLBase, "main", 1, NULL); 
	}

	extern void init_useragent();
	init_useragent();

	// Hack to make sure cairo mutex are initialized
	{
		cairo_surface_t *dummysurface = cairo_image_surface_create(CAIRO_FORMAT_ARGB32, 4, 4);
		cairo_surface_destroy(dummysurface);
	}

	return TRUE;
}

void close_libs(void)
{
	if(KeymapBase) {
		DropInterface((struct Interface*)IKeymap);
		CloseLibrary(KeymapBase);
		KeymapBase = NULL;
	}

	if(MUIMasterBase) {
		DropInterface((struct Interface*)IMUIMaster);
		CloseLibrary(MUIMasterBase);
		MUIMasterBase = NULL;
	}

	if (ApplicationBase) {
		UnregisterApplication(appID, NULL);
		DropInterface((struct Interface*)IApplication);
		CloseLibrary(ApplicationBase);
		ApplicationBase	= NULL;
	}

	if(CodesetsBase) {
		DropInterface((struct Interface*)ICodesets);
		CloseLibrary(CodesetsBase);
		CodesetsBase = NULL;
	}

	if(DiskFontBase) {
		DropInterface((struct Interface*)IDiskFont);
		CloseLibrary(DiskFontBase);
		DiskFontBase = NULL;
	}

	if(IconBase) {
		DropInterface((struct Interface*)IIcon);
		CloseLibrary(IconBase);
		IconBase = NULL;
	}

	if(ExpatBase) {
		DropInterface((struct Interface*)IExpat);
		CloseLibrary(ExpatBase);
		ExpatBase = NULL;
	}

	if(OpenURLBase) {
		DropInterface((struct Interface*)IOpenURL);
		CloseLibrary(OpenURLBase);
		OpenURLBase = NULL;
	}
}

void destroy_application(void)
{
	if(app)
	{
		MUI_DisposeObject(app);
		methodstack_cleanup();
		classes_cleanup();
		app = NULL;
	}
	
	locale_cleanup();
}

// Safety checks
extern ULONG icu_check(void);

ULONG safety_check(void)
{
	ULONG passed = TRUE;

	passed &= icu_check();

	return passed;
}

Object *create_application(char *url)
{
	Object *obj = NULL;

	locale_init();

	unicode_map = (uint32*)ObtainCharsetInfo(DFCS_NUMBER, locale->loc_CodeSet, DFCS_MAPTABLE); 

	if(classes_init())
	{
		methodstack_init();
		obj = (Object *) NewObject(getowbappclass(), NULL, MA_OWBBrowser_URL, (ULONG) url, TAG_DONE);
	}
	else
	{
		fprintf(stderr, "Failed to create internal classes.\n");
	}

	return obj;
}


//using namespace WebCore;  // for making Pasteboard::createForGlobalSelection()->clear(); works.

void main_loop(void)
{
	ULONG running = TRUE;
	ULONG signals;

	setIsSafeToQuit(TRUE);

	if(setjmp(bailout_env) == -1)
	{
		running = FALSE;
	}

	while (running)
	{
		ULONG ret = DoMethod(app,MUIM_Application_NewInput,&signals);

/*
		if (clearClipboard)
		{
			clearClipboard = FALSE;
			#warning To fix by adding right includes 
			//Pasteboard::createForGlobalSelection()->clear(); 
		}
*/
		switch(ret)
		{
			case MUIV_Application_ReturnID_Quit:
			{
				setIsQuitting(TRUE);
				if(isSafeToQuit())
					running = FALSE;
				break;
			}
		}

		methodstack_check();

		/* Refresh each active browser if needed */
		DoMethod(app, MM_OWBApp_Expose);

		if(running && signals) signals = Wait(signals | SIGBREAKF_CTRL_C | SIGBREAKF_CTRL_E | SIGBREAKF_CTRL_F/* | dosnotifysig */);

		if((signals & SIGBREAKF_CTRL_C) || isQuitting())
		{
			setIsQuitting(TRUE);
			if(isSafeToQuit())
				running = FALSE;
		}

		if(signals & SIGBREAKF_CTRL_E)
		{
			/* Run webkit events for each active browser */
			DoMethod(app, MM_OWBApp_WebKitEvents);
		}

		/*
		if(signals & dosnotifysig )
		{
			//D(bug("DosNotify Trig\n"));
			//DoMethod(getv(app, MA_OWBApp_BookmarkGroup), MM_Bookmarkgroup_DosNotify);
		}
		*/

		methodstack_check();
	}
}

int main (int argc, char* argv[])
{

	#ifdef __amigaos4__	
	// save tc_UserData on run.	
	struct Task *CurrentTask = FindTask(NULL);
	APTR olduserdata = CurrentTask->tc_UserData;
	CurrentTask->tc_UserData = NULL;
	#endif

	signal(SIGINT, SIG_IGN);
	atexit(close_libs);
	atexit(destroy_application);

	setlocale(LC_TIME, "C");
	setlocale(LC_NUMERIC, "C");

	if (!argc)
	{
		freopen("NIL:", "w", stderr);
		freopen("NIL:", "w", stdout);
	}

	//dosnotify_init();

	if(open_libs())
	{
		if(safety_check())
		{
			app = create_application(argc > 1 ? (char*)argv[1] : (char *)"");

			if(app)
			{
				main_loop();
			}

			destroy_application();
		}
	}
	close_libs();

	//dosnotify_cleanup();

	#ifdef __amigaos4__
	// restore tc_UserData at exit
	CurrentTask->tc_UserData = olduserdata;
	#endif

	return 0;
}
