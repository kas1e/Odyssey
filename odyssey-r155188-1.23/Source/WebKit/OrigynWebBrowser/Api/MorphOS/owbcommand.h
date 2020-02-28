#ifndef __COMMAND_H__
#define __COMMAND_H__

#include "config.h"
#include "CString.h"

#include <dos/dos.h>
#include <dos/dostags.h>
#include <clib/macros.h>

#include <proto/utility.h>
#include <proto/icon.h>
#include <proto/dos.h>
#include <dos/obsolete.h>

#include "gui.h"

using namespace WebCore;

class OWBCommand
{
public:
	OWBCommand(String &commandString, int actionType)
		: m_commandString(commandString), m_actionType(actionType)
	{}

	void execute()
	{
		switch(m_actionType)
		{
			case ACTION_AMIGADOS:
			{
				BPTR output = NULL;
				char *cli_device = (char *) getv(app, MA_OWBApp_CLIDevice);

				if (!cli_device || !cli_device[0] || !(output = Open(cli_device, MODE_NEWFILE)))
				{
					output = Open("NIL:", MODE_NEWFILE); /* XXX: erk, close input and output if we fail later.. */
				}

				if(output)
				{
					BPTR input;
					struct MsgPort *old;

					old = SetConsoleTask(((struct FileHandle *)BADDR(output))->fh_Type);
					input = Open("*", MODE_OLDFILE); /* XXX: check retcode.. */
					SetConsoleTask(old);

					if(SystemTags(m_commandString.latin1().data(),
							  SYS_Asynch, TRUE,
							  SYS_Input, input,
							  SYS_Output, output,
							  NP_Priority, 0,
							  TAG_DONE))
					{
					}
					else
					{
						/*
						if(input)
							Close(input);
						Close(output);
						*/
					}
				}

				break;
			}

			case ACTION_REXX:
			{
				// XXX: implement
				break;
			}

			case ACTION_INTERNAL:
			{
				// XXX: implement
				break;
			}
		}
	}

private:
	String m_commandString;
	int m_actionType;
};

#endif
