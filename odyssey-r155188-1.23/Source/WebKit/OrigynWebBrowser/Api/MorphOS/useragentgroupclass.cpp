/*
 * Copyright 2009 Fabien Coeurjoly <fabien.coeurjoly@wanadoo.fr>
 * Copyright 2009 Ilkka Lehtoranta <ilkleht@isoveli.org>
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
#include "GraphicsContext.h"
#include "WTFString.h"
#include "CString.h"
#include "FileIO.h"

#include <proto/exec.h>
#include <proto/intuition.h>
#include <proto/utility.h>

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "gui.h"
#include "utils.h"

/* Debug output to serial handled via D(bug("....."));
*  See Base/debug.h for details.
*  D(x)    - to disable debug
*  D(x) x  - to enable debug
*/
#define D(x)


#include "useragent.h"
//const char verfmt[] = "Mozilla/5.0 (Amiga; PowerPC AmigaOS %u.%u; Odyssey Web Browser; rv:" VERSION ") AppleWebKit/" WEBKITVER " (KHTML, like Gecko) OWB/" VERSION " Safari/" WEBKITVER;
// using 'Macintosh' to avoid switching to mobile, etc
const char verfmt[] = "Mozilla/5.0 (Macintosh; PowerPC AmigaOS %u.%u; Odyssey Web Browser; rv:" VERSION ") AppleWebKit/" WEBKITVER " (KHTML, like Gecko) OWB/" VERSION " Safari/" WEBKITVER;

STATIC char odysseyuseragent[sizeof(verfmt) + 2 * (10 - 2)];

//We "build" the arrays from built-in +`'useragents.prefs' file
STATIC STRPTR useragents_labels2[UA_MAX_INMENU+1];  // to be used on spoof menu (+ NULL/EndOfEntries)
STATIC STRPTR useragents_strings2[UA_MAX_INMENU+1]; // to be used on spoof menu (+ NULL/EndOfEntries)

/* Keep the two arrays (ua_builtin_labels, ua_bultin_strings) below in sync */
STATIC STRPTR ua_builtin_labels[] =
{
	"Odyssey Web Browser",
	NULL
};
STATIC STRPTR ua_builtin_strings[] =
{
	odysseyuseragent,
	NULL
};

#define TOTAL_BUILTIN_UA sizeof(ua_builtin_labels)/sizeof(STRPTR) - 1


ULONG get_user_agent_count() // enabled in menu
{
	ULONG i = 0;

	while(i<UA_MAX_INMENU && useragents_labels2[i]) { ++i; }

	return i;
}

ULONG get_user_agent_fullcount() // all entries
{
	ULONG i = 0;
	APTR n;

	ITERATELIST(n, &useragent_list) { ++i; }

	return i;
}

STRPTR * get_user_agent_labels()
{
	return (STRPTR *) useragents_labels2;
}

STRPTR * get_user_agent_strings()
{
	return (STRPTR *) useragents_strings2;
}

ULONG get_default_user_agent_idx()
{
	APTR n;
	ULONG i = 0;
	struct useragentnode *un;

	ITERATELIST(n, &useragent_list)
	{
		un = (useragentnode *)n;
		if( (un->uan_flags&UA_DEFAULT) ) { return i; }
		if( (un->uan_flags&UA_SHOW) ) { ++i; } // only "valid" enabled/showed useragents
	}

	return 0; // Ooops something bad happend ¿:-/ (return built-in useragent)
}

ULONG get_builtin_user_agents()
{
	return (sizeof(ua_builtin_labels)/sizeof(STRPTR) - 1);
}


using namespace WebCore;


void useragent_delete(struct useragentnode *uan)
{
	REMOVE(uan);
	//uan->uan_flags = 0;
	free(uan->uan_status);
	free(uan->uan_label);
	free(uan->uan_string);
	free(uan);
}

void init_useragent()
{
	uint8_t version = 4, revision = 1; // Default OS4.1
	struct Resident *res = FindResident("exec.library");
	if (res)
	{
		if (res->rt_Version >= 60)
		{
			version = 5; // Oooo! Future proof :)
			revision = 0;
		} else if (res->rt_Version >= 54) {
			revision = 2; // Just guessing...
		}
	}
	sprintf(odysseyuseragent, verfmt, version, revision);
}


struct Data
{
	Object *lv_useragents;
	Object *bt_add;
	Object *bt_remove;
	Object *bt_active; // changes ua_status (flags) to UA_DEFAULT
	Object *st_useragent_label;
	Object *st_useragent;
	Object *ch_showinmenu;
	Object *txt_info;
};


struct useragentnode* useragent_create(int uaflags, char *ualabel, char *uastring, struct MinList *ualist)
{
	struct useragentnode *un = (struct useragentnode *) malloc(sizeof(*un));

	if(un)
	{
		un->uan_flags = uaflags;
		if( uaflags&UA_DEFAULT ) un->uan_status = strdup(GSI(MSG_USERAGENTLIST_STATUS_DEFAULT));
		else if( uaflags&UA_SHOW ) un->uan_status = strdup(GSI(MSG_USERAGENTLIST_STATUS_ENABLED));
		     else un->uan_status = strdup(GSI(MSG_USERAGENTLIST_STATUS_DISABLED));

		un->uan_label  = strdup(ualabel);// ? ualabel : "");
		un->uan_string = strdup(uastring);// ? uastring : "");

		ADDTAIL(ualist, un);
	}

	return un;
}

void rebuild_ua_array_menu(void)
{
	ULONG i = get_builtin_user_agents(); // skip/keep built-in user-agents
	APTR n;
	struct useragentnode *un;
	D(bug("rebuild_ua_array_menu(), skipping built-in entries\n"));

	// Rebuild user-agents menu array (only allow UA_MAX_INMENU entries)
	ITERATELIST(n, &useragent_list)
	{
		un = (struct useragentnode *)n;
		if( !(un->uan_flags&UA_BUILTIN) && un->uan_flags&UA_SHOW )
		{
			useragents_labels2[i]  = strdup(un->uan_label);
			useragents_strings2[i] = strdup(un->uan_string);
			D(bug("%d: '%s'\n",i+1,useragents_labels2[i]));
			++i;
		}
		if(i == UA_MAX_INMENU)
		{
			D(bug("Enabled too many spoof menu entries! Only first %d entries will be shown.\n",UA_MAX_INMENU));
			break;
		}
	}

	useragents_labels2[i]  = NULL;
	useragents_strings2[i] = NULL;
	D(bug("%d: 'NULL'\n",i+1));
}

void load_useragents_file(Object *obj, struct Data *data)
{
	D(bug("LOADing user-agents...\n"));
	struct useragentnode *un;
	//char dbg_str[64] = "";
	uint8_t i, j = 0;

	D(bug("BUILT-IN (%d):\n",TOTAL_BUILTIN_UA));
	// Add BUILT-IN user-agents
	for(i = 0; ua_builtin_labels[i]; ++i)
	{
		useragents_labels2[j]  = ua_builtin_labels[i];
		useragents_strings2[j] = ua_builtin_strings[i];
		//strncpy(dbg_str, useragents_strings2[j],40);
		//D(bug("%02u)0x00000001;'%s':'%s..'\n",i+1,useragents_labels2[j],dbg_str));

		un = useragent_create(UA_BUILTIN|UA_SHOW, ua_builtin_labels[i], ua_builtin_strings[i], &useragent_list);
		if(un)
		{
			DoMethod(data->lv_useragents, MUIM_List_InsertSingle, un, MUIV_List_Insert_Bottom);
		}

		++j;
	}

	D(bug("FILE (PROGDIR:Conf/useragents.prefs):\n"));
	// Add FILE 'useragents.prefs' user-agents
	Vector<String> lines;
	OWBFile *uaFile = new OWBFile("PROGDIR:Conf/useragents.prefs");

	if (!uaFile)
	{
		return;
	}

	if (uaFile->open('r') == -1)
	{
		delete uaFile;
		return;
	}

	char *buffer = uaFile->read(uaFile->getSize());
	String fileBuffer = buffer;
	uint32_t has_default = 0;

	delete [] buffer;
	uaFile->close();
	delete uaFile;

	fileBuffer.split("\n", true, lines);

	for(i = 0; i < lines.size(); ++i)
	{
		Vector<String> uaAttributes;

		lines[i].split("\1", true, uaAttributes);

		if(uaAttributes.size() == 3) // file 'useragents.prefs', each line: "<flags>\1<label>\1<string>\n"
		{
			int ua_flags = uaAttributes[0].toInt();

			has_default |= (ua_flags&UA_DEFAULT);

			if( j<UA_MAX_INMENU && ua_flags&UA_SHOW )
			{
				useragents_labels2[j]  = strdup(uaAttributes[1].latin1().data());
				useragents_strings2[j] = strdup(uaAttributes[2].latin1().data());
				++j;
			}
			//strncpy(dbg_str, useragents_strings2[j], 40);
			//D(bug("%02u)0x%08x;'%s':'%s..'\n",i+1,atoi(uaAttributes[0].latin1().data()),useragents_labels2[j],dbg_str));

			un = useragent_create(ua_flags,
			                      strdup(uaAttributes[1].latin1().data()),
			                      strdup(uaAttributes[2].latin1().data()),
			                      &useragent_list);
			if(un)
			{
				DoMethod(data->lv_useragents, MUIM_List_InsertSingle, un, MUIV_List_Insert_Bottom);
			}
		}
	}
	//D(bug("0x%08x\n",has_default));
	// no DEFAULT user-agent -> update built-in (flags) as default (is the first in list)
	if(!has_default)
	{
		un = (struct useragentnode *)GetHead( (struct List *)&useragent_list );
		//un = FIRSTNODE(&useragent_list);
		un->uan_flags |= UA_DEFAULT;
		free(un->uan_status);
		un->uan_status = strdup(GSI(MSG_USERAGENTLIST_STATUS_DEFAULT));
	}
}

void moveList(struct MinList *from, struct MinList *to)
{
	//if(!from || IsListEmpty((struct List *)from))
	if( !from || IsMinListEmpty(from) )
	{
		/*if(to)
			NEWLIST(to);*/
		return;
	}
	to->mlh_Head = from->mlh_Head;
	to->mlh_Tail = NULL;
	to->mlh_TailPred = from->mlh_TailPred;
	to->mlh_Head->mln_Pred = (struct MinNode *)&to->mlh_Head;
	to->mlh_TailPred->mln_Succ = (struct MinNode *)&to->mlh_Tail;
	//NEWLIST(from);
}

void clone_ua_list(struct MinList *src_list, struct MinList *dst_list)
{
	struct useragentnode *tmp;
	APTR n, m;
	D(bug("clone_ua_list()... src=0x%08x -> dts=0x%08x\n",src_list,dst_list));
	ITERATELISTSAFE(n, m, dst_list)
	{
		useragent_delete((useragentnode *) n);
	}
	//NEWLIST(dst_list);

	ITERATELIST(n, src_list)
	{
		tmp = (useragentnode *) n;

		struct useragentnode *un = (struct useragentnode *) malloc(sizeof(*un));
		if(un)
		{
			un->uan_flags = tmp->uan_flags;
			un->uan_status = strdup(tmp->uan_status);
			un->uan_label  = strdup(tmp->uan_label);
			un->uan_string = strdup(tmp->uan_string);

			ADDTAIL(dst_list, un);
		}
	}
/*
	struct MinList temp;

	moveList(src_list, &temp);
	moveList(dst_list, src_list);
	moveList(&temp, dst_list);
*/
}

void use_useragents(void)
{
	D(bug("use_useragents() (ua_list -> BAK)\n"));
	clone_ua_list(&useragent_list, &ua_list_bak);
	rebuild_ua_array_menu();
}

void save_useragents(void)
{
	D(bug("save_useragents() (list -> FILE and BAK)\n"));
	//char dbg_str[64] = "";
	struct useragentnode *un;
	OWBFile *uaFile = new OWBFile("PROGDIR:Conf/useragents.prefs");
	APTR n;

	if(!uaFile)
		return;

	if (uaFile->open('w') == -1)
	{
		delete uaFile;
		return;
	}

	D(bug("FILE 'PROGDIR:Conf/useragents.prefs':\n"));
	ITERATELIST(n, &useragent_list)
	{
		un = (useragentnode *) n;

		if( !(un->uan_flags&UA_BUILTIN) ) // skip built-in user-agents
		{
			//strncpy(dbg_str, un->uan_string,40);
			//D(bug("0x%08x;'%s':'%s..'\n", un->uan_flags, un->uan_label, dbg_str));
			uaFile->write(String::format("%d\1%s\1%s\n", un->uan_flags, un->uan_label, un->uan_string));
		}
	}

	uaFile->close();
	delete uaFile;

	clone_ua_list(&useragent_list, &ua_list_bak);
	rebuild_ua_array_menu();
}

/*void load_useragents(void)
{
D(bug("load_useragents()\n"));
}*/

void cancel_useragents(void)
{
	D(bug("cancel_useragents() (BAK -> ua_list)\n"));
	clone_ua_list(&ua_list_bak, &useragent_list);
	rebuild_ua_array_menu();
}


/*
 * "Homage" to IBrowse v2.5 spoofing prefs (THXaLOT Oliver Roberts)
 */
DEFNEW
{
	Object *lv_useragents, *bt_add, *bt_remove, *bt_active, *st_useragent_label, *st_useragent, *ch_showinmenu, *txt_info;
	D(bug("UserAgent DEFNEW\n"));
	obj = (Object *) DoSuperNew(cl, obj,
			MUIA_ObjectID, MAKE_ID('S','M','0','2'),
			Child, lv_useragents = (Object *) NewObject(getuseragentlistclass(), NULL, TAG_DONE),
			Child, HGroup,
			       Child, bt_add = (Object *) MakeButton(GSI(MSG_USERAGENTGROUP_ADD)),
			       Child, bt_remove = (Object *) MakeButton(GSI(MSG_USERAGENTGROUP_REMOVE)),
			       Child, bt_active = (Object *) MakeButton(GSI(MSG_USERAGENTGROUP_MAKE_DEFAULT)),
			       End,
			Child, txt_info = TextObject,
			       MUIA_Text_Contents, GSI(MSG_USERAGENTLIST_INFO),//"NOTE: max. 64 entries; max. in menu 32",
			       MUIA_Text_SetMin, FALSE,
			       End,
			Child, HSpace(0),

			Child, ColGroup(2),
				Child, MakeLabel(GSI(MSG_USERAGENTGROUP_NAME)),
				Child, HGroup,
				       Child, st_useragent_label = (Object *) MakeString("", FALSE),
				       Child, ch_showinmenu = (Object *) MakeCheck(GSI(MSG_USERAGENTGROUP_SHOW_IN_MENU), FALSE),//, MAKE_ID('S','U','A','1')),
				       Child, LLabel(GSI(MSG_USERAGENTGROUP_SHOW_IN_MENU)),
				       End,
				Child, MakeLabel(GSI(MSG_USERAGENTGROUP_USERAGENT)),
				Child, st_useragent = (Object *) MakeString("", FALSE),

				End,
	      TAG_MORE, msg->ops_AttrList);

	if (obj)
	{
		GETDATA;
		D(bug("odysseyuseragent: '%s'\n",odysseyuseragent));
		data->bt_active = bt_active;
		data->bt_remove = bt_remove;
		data->bt_add = bt_add;
		data->lv_useragents = lv_useragents;
		data->txt_info = txt_info;

		data->st_useragent_label = st_useragent_label;
		data->st_useragent = st_useragent;
		data->ch_showinmenu = ch_showinmenu;

		DoMethod(bt_add,    MUIM_Notify, MUIA_Pressed, FALSE, obj, 1, MM_UserAgentGroup_Add);
		DoMethod(bt_remove, MUIM_Notify, MUIA_Pressed, FALSE, obj, 1, MM_UserAgentGroup_Remove);
		DoMethod(bt_active, MUIM_Notify, MUIA_Pressed, FALSE, obj, 1, MM_UserAgentGroup_Active);
		DoMethod(ch_showinmenu, MUIM_Notify, MUIA_Selected, MUIV_EveryTime, obj, 1, MM_UserAgentGroup_ShowInMenu);

		DoMethod(lv_useragents, MUIM_Notify, MUIA_List_Active, MUIV_EveryTime, obj, 1, MM_UserAgentGroup_Refresh);

		DoMethod(st_useragent_label, MUIM_Notify, MUIA_String_Contents, MUIV_EveryTime, obj, 1, MM_UserAgentGroup_Change);
		DoMethod(st_useragent, MUIM_Notify, MUIA_String_Contents, MUIV_EveryTime, obj, 1, MM_UserAgentGroup_Change);
	}

	return (IPTR)obj;
}

DEFDISP
{
	GETDATA;
	APTR n, m;
	D(bug("UserAgent DEFDISP:\n"));
	DoMethod(data->lv_useragents, MUIM_List_Clear);

	ITERATELISTSAFE(n, m, &useragent_list)
	{
		useragent_delete((useragentnode *) n);
	}

	ITERATELISTSAFE(n, m, &ua_list_bak)
	{
		useragent_delete((useragentnode *) n);
	}

	uint8_t i = TOTAL_BUILTIN_UA; // skip built-in user-agents
	while(useragents_labels2[i])
	{
		free(useragents_labels2[i]);
		free(useragents_strings2[i]);
		++i;
	}

	return DOSUPER;
}

DEFTMETHOD(UserAgentGroup_Refresh)
{
	GETDATA;
	struct useragentnode *un;

	DoMethod(data->lv_useragents, MUIM_List_GetEntry, MUIV_List_GetEntry_Active, (struct useragentnode *) &un);

	if(un)
	{
		bool builtin = (un->uan_flags&UA_BUILTIN);
		bool no_removable = (un->uan_flags&UA_DEFAULT) ? 1 : builtin; // default spoof NOT removable
		//D(bug("clicked entry un->uan_flags=0x%08x\n",un->uan_flags));
		//D(bug("is built-in (NOT removable) = %d\n",builtin));
		//D(bug("is default spoof (NOT removable) = %d\n",(un->uan_flags&UA_DEFAULT)? TRUE : FALSE));
		set(data->bt_remove, MUIA_Disabled, no_removable);
		set(data->bt_active, MUIA_Disabled, (un->uan_flags&UA_DEFAULT)? TRUE : FALSE);

		set(data->st_useragent_label, MUIA_Disabled, builtin);
		set(data->ch_showinmenu, MUIA_Disabled, builtin);
		set(data->st_useragent, MUIA_Disabled, builtin);

		nnset(data->st_useragent_label, MUIA_String_Contents, un->uan_label);
		nnset(data->ch_showinmenu, MUIA_Selected, un->uan_flags&UA_SHOW);
		nnset(data->st_useragent, MUIA_String_Contents, un->uan_string);
	}
	else
	{
		set(data->bt_active, MUIA_Disabled, TRUE);
		set(data->bt_remove, MUIA_Disabled, TRUE);

		set(data->st_useragent_label, MUIA_Disabled, TRUE);
		set(data->ch_showinmenu, MUIA_Disabled, TRUE);
		set(data->st_useragent, MUIA_Disabled, TRUE);
	}

	return 0;
}

DEFTMETHOD(UserAgentGroup_Active)
{
	GETDATA;
	struct useragentnode *un;
	APTR n;

	//Remove UA_DEFAULT (default/active) flag
	ITERATELIST(n, &useragent_list)
	{
		un = (struct useragentnode *)n;

		if( (un->uan_flags&UA_DEFAULT) )
		{
			//D(bug("1)OLD un->uan_flags=0x%08x\n",un->uan_flags));
			un->uan_flags &= ~(UA_DEFAULT);
			//D(bug("2)OLD un->uan_flags=0x%08x\n",un->uan_flags));
			free(un->uan_status);
			if( un->uan_flags&UA_SHOW ) un->uan_status = strdup(GSI(MSG_USERAGENTLIST_STATUS_ENABLED));
			else un->uan_status = strdup(GSI(MSG_USERAGENTLIST_STATUS_DISABLED));

			DoMethod(data->lv_useragents, MUIM_List_Redraw, MUIV_List_Redraw_Entry, un);
			break;
		}
	}

	//Add UA_DEFAULT (default/active) flag
	DoMethod(data->lv_useragents, MUIM_List_GetEntry, MUIV_List_GetEntry_Active, (struct useragentnode *) &un);

	if(un)
	{
		//D(bug("1)NEW un->uan_flags=0x%08x\n",un->uan_flags));
		un->uan_flags |= UA_DEFAULT;
		//D(bug("2)NEW un->uan_flags=0x%08x\n",un->uan_flags));
		free(un->uan_status);
		un->uan_status = strdup(GSI(MSG_USERAGENTLIST_STATUS_DEFAULT));

		DoMethod(data->lv_useragents, MUIM_List_Redraw, MUIV_List_Redraw_Entry, un);
		//D(bug("%d -> '%s'\n",get_default_user_agent_idx(),get_user_agent_strings()[get_default_user_agent_idx()]));
		set(data->bt_active, MUIA_Disabled, TRUE);
	}

	return 0;
}

DEFTMETHOD(UserAgentGroup_ShowInMenu)
{
	GETDATA;
	struct useragentnode *un;
	/*ULONG res = getv(data->ch_showinmenu, MUIA_Selected); // res=1 -> "adding" to menu
	D(bug("UserAgentGroup_ShowInMenu: %d (%d)\n",get_user_agent_count(),res));
	if(res && get_user_agent_count()==UA_MAX_INMENU)
	{
		D(bug("Maximum entries reached!\n"));
		nnset(data->ch_showinmenu, MUIA_Selected, FALSE);
		return 0;
	}*/

	DoMethod(data->lv_useragents, MUIM_List_GetEntry, MUIV_List_GetEntry_Active, (struct useragentnode *) &un);

	if(un)
	{
		if( (un->uan_flags&UA_SHOW) ) un->uan_flags &= ~(UA_SHOW); // remove ENABLE/SHOW flag
		else un->uan_flags |= UA_SHOW;
		D(bug("Changed status to 0x%08x\n",un->uan_flags));

		// Update uan_status string
		free(un->uan_status);
		if( un->uan_flags&UA_DEFAULT ) un->uan_status = strdup(GSI(MSG_USERAGENTLIST_STATUS_DEFAULT));
		else if( un->uan_flags&UA_SHOW ) un->uan_status = strdup(GSI(MSG_USERAGENTLIST_STATUS_ENABLED));
		     else un->uan_status = strdup(GSI(MSG_USERAGENTLIST_STATUS_DISABLED));

		DoMethod(data->lv_useragents, MUIM_List_Redraw, MUIV_List_Redraw_Entry, un);

		//rebuild_ua_array_menu();
	}

	return 0;
}

DEFTMETHOD(UserAgentGroup_Change)
{
	GETDATA;
	struct useragentnode *un;

	DoMethod(data->lv_useragents, MUIM_List_GetEntry, MUIV_List_GetEntry_Active, (struct useragentnode *) &un);

	if(un)
	{
		free(un->uan_label);
		un->uan_label = strdup((char *) getv(data->st_useragent_label, MUIA_String_Contents));
		free(un->uan_string);
		un->uan_string = strdup((char *) getv(data->st_useragent, MUIA_String_Contents));

		DoMethod(data->lv_useragents,  MUIM_List_Redraw, MUIV_List_Redraw_Entry, un);
	}

	return 0;
}

DEFTMETHOD(UserAgentGroup_Add)
{
	GETDATA;
	struct useragentnode *un;
	D(bug("UserAgentGroup_Add: %d\n",get_user_agent_fullcount()));
	if(get_user_agent_fullcount() == UA_MAX_INLIST)
	{
		return 0;
	}

	un = useragent_create(0, "", "", &useragent_list);
	if(un)
	{
		DoMethod(data->lv_useragents, MUIM_List_InsertSingle, un, MUIV_List_Insert_Bottom);
		set(data->lv_useragents, MUIA_List_Active, MUIV_List_Active_Bottom);
		set(_win(obj), MUIA_Window_ActiveObject, data->st_useragent_label);
	}

	return 0;
}

DEFTMETHOD(UserAgentGroup_Remove)
{
	GETDATA;
	struct useragentnode *un;

	DoMethod(data->lv_useragents, MUIM_List_GetEntry, MUIV_List_GetEntry_Active, (struct useragentnode *) &un);

	if(un)
	{
		DoMethod(data->lv_useragents, MUIM_List_Remove, MUIV_List_Remove_Active);
		useragent_delete(un);
	}

	return 0;
}

DEFMMETHOD(Import)
{
	GETDATA;
	APTR n;//, m;
	D(bug("UserAgent IMPORT:\n"));
	//D(bug("IsMinListEmpty=%d (LOAD)\n",IsMinListEmpty(&useragent_list)));
	if( IsMinListEmpty(&useragent_list) )
	{
		load_useragents_file(obj, data); // creates user-agents_(labels2/strings2) arrays and useragent_list..
		D(bug("ua_list=0x%08x  BAK=0x%08x (ua_list -> BAK)\n",&useragent_list,&ua_list_bak));
		clone_ua_list(&useragent_list, &ua_list_bak); //..duplicate to ua_list_bak
	}
	else
	{
		//D(bug("Restoring listview data (%d)\n",get_user_agent_fullcount()));
		DoMethod(data->lv_useragents, MUIM_List_Clear);

		set(data->lv_useragents, MUIA_List_Quiet, TRUE);

		ITERATELIST(n, &useragent_list)
		{
			DoMethod(data->lv_useragents, MUIM_List_InsertSingle, (useragentnode *) n, MUIV_List_Insert_Bottom);
		}

		set(data->lv_useragents, MUIA_List_Quiet, FALSE);
	}

	set(data->bt_active, MUIA_Disabled, TRUE);
	set(data->bt_remove, MUIA_Disabled, TRUE);

	nnset(data->st_useragent_label, MUIA_String_Contents, "");
	nnset(data->ch_showinmenu, MUIA_Selected, FALSE);
	nnset(data->st_useragent, MUIA_String_Contents, "");

	set(data->st_useragent_label, MUIA_Disabled, TRUE);
	set(data->st_useragent, MUIA_Disabled, TRUE);
	set(data->ch_showinmenu, MUIA_Disabled, TRUE);

	return 0;
}

DEFMMETHOD(Export)
{
	D(bug("UserAgent EXPORT:\n"));
/* SAVE (if clicked on SAVE button) is done in appclass.cpp's OWBApp_PrefsSave
 * method (MM_PrefsWindow_SaveUserAgents).
 */
	return 0;
}


BEGINMTABLE
DECNEW
DECDISP
DECMMETHOD(Import)
DECMMETHOD(Export)
DECTMETHOD(UserAgentGroup_Add)
DECTMETHOD(UserAgentGroup_Remove)
DECTMETHOD(UserAgentGroup_Change)
DECTMETHOD(UserAgentGroup_Refresh)
DECTMETHOD(UserAgentGroup_ShowInMenu)
DECTMETHOD(UserAgentGroup_Active)
ENDMTABLE

DECSUBCLASS_NC(MUIC_Group, useragentgroupclass)
