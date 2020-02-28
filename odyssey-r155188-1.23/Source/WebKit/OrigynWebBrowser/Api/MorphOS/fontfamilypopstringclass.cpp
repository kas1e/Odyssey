/*
 * Copyright 2001-2005 by David Gerber <zapek@morphos.net>
 * Copyright 2005-2007 Ambient Open Source Team
 * Copyright 2009 Ilkka Lehtoranta <ilkleht@isoveli.org>
 * Copyright 2009 Fabien Coeurjoly <fabien.coeurjoly@wanadoo.fr>
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

#include <string.h>

#include <devices/rawkeycodes.h>
#include <proto/intuition.h>
#include <proto/utility.h>

#include "gui.h"

struct Data
{
	Object * str;
	Object * pop;

	Object * lv_entries;
};

MUI_HOOK(familypopclose, APTR list, APTR str)
{
	STRPTR s;

	DoMethod((Object *) list, MUIM_List_GetEntry, MUIV_List_GetEntry_Active, &s);
	set((Object *) str, MUIA_String_Contents, s);
	set(_win((Object *) str), MUIA_Window_ActiveObject, (Object *) str);

	return 0;
}

MUI_HOOK(familypopopen, APTR pop, APTR win)
{
	Object *list = (Object *)getv((Object *)pop , MUIA_Listview_List);

	SetAttrs((Object *) win, MUIA_Window_DefaultObject, list, MUIA_Window_ActiveObject, list, TAG_DONE);
	set(list, MUIA_List_Active, 0);

	return (TRUE);
}

DEFNEW
{
	Object *str, *bt_prev, *bt_next;
	Object *pop, *bt_pop, *lv_entries;

	obj = (Object *) DoSuperNew(cl, obj,
		MUIA_Group_Horiz, TRUE,
		Child, pop = PopobjectObject,
			MUIA_Popstring_String, str = StringObject,
				StringFrame,
				//MUIA_Textinput_RemainActive, TRUE,
				//MUIA_Textinput_Format, MUIV_Textinput_Format_Center,
				MUIA_CycleChain, 1,
				MUIA_String_MaxLen, 2048,
			End,
			MUIA_Popstring_Button, bt_pop = PopButton(MUII_PopUp),
			MUIA_Popobject_Object, lv_entries = ListviewObject,
				MUIA_Listview_List, ListObject,
					InputListFrame,
					MUIA_List_ConstructHook, MUIV_List_ConstructHook_String,
					MUIA_List_DestructHook, MUIV_List_DestructHook_String,
					End,
				End,
			MUIA_Popobject_ObjStrHook, &familypopclose_hook,
			MUIA_Popobject_WindowHook, &familypopopen_hook,
		End,
		TAG_MORE);

	if (obj)
	{
		GETDATA;

		data->str = str;
		data->pop = pop;
		data->lv_entries = lv_entries;

		set(bt_pop, MUIA_CycleChain, 1);

		DoMethod(data->lv_entries, MUIM_Notify, MUIA_Listview_DoubleClick, TRUE, obj, 2, MUIM_Popstring_Close, TRUE);
	}

	return (IPTR)obj;
}

STATIC VOID doset(APTR obj, struct Data *data, struct TagItem *tags)
{
	struct TagItem *tag, *tstate;

	tstate = tags;

	while ((tag = NextTagItem(&tstate)) != NULL)
	{
		switch (tag->ti_Tag)
		{
			case MUIA_String_Contents:
				set(data->str, MUIA_String_Contents, (STRPTR) tag->ti_Data);
				break;

			case MUIA_ObjectID:
				set(data->str, MUIA_ObjectID, (ULONG) tag->ti_Data);
				break;
		}
	}
}

DEFSET
{
	GETDATA;
	doset(obj, data, msg->ops_AttrList);
	return DOSUPER;
}

DEFGET
{
	GETDATA;

	switch (msg->opg_AttrID)
	{
		case MUIA_String_Contents:
			return get(data->str, MUIA_String_Contents, msg->opg_Storage);

        case MUIA_ObjectID:
			return get(data->str, MUIA_ObjectID, msg->opg_Storage);
	}

	return DOSUPER;
}

DEFSMETHOD(FontFamilyPopString_InsertFamily)
{
	STRPTR s;
	GETDATA;

	s = (STRPTR) msg->txt;

	return DoMethod(data->lv_entries, MUIM_List_InsertSingle, s, MUIV_List_Insert_Bottom);
}

BEGINMTABLE
DECNEW
DECGET
DECSET
DECSMETHOD(FontFamilyPopString_InsertFamily)
ENDMTABLE

DECSUBCLASS_NC(MUIC_Group, fontfamilypopstringclass)
