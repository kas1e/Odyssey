/*
 * Copyright (C) 2007 Apple Inc. All rights reserved.
 * Copyright (C) 2007 Justin Haygood (jhaygood@reaktix.com)
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
 * 3.  Neither the name of Apple Computer, Inc. ("Apple") nor the names of
 *     its contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission. 
 *
 * THIS SOFTWARE IS PROVIDED BY APPLE AND ITS CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL APPLE OR ITS CONTRIBUTORS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "config.h"
#include "DateMath.h"
#include "dtoa.h"
#include "dtoa/cached-powers.h"
#include "Threading.h"
#include "CurrentTime.h"
#include "HashMap.h"
#include "MainThread.h"
#include "RandomNumberSeed.h"
#include "StdLibExtras.h"
#include "UnusedParam.h"
#include <wtf/WTFThreadData.h>

#include <errno.h>
#include <limits.h>
#include <sys/time.h>
#include <unistd.h>

#define __USE_OLD_TIMEVAL__

#include "../../../../Source/WebKit/OrigynWebBrowser/Api/MorphOS/gui.h"
#include <exec/exec.h>
#include <devices/timer.h>
#include <dos/dos.h>
#include <dos/dostags.h>
#include <dos/dosextens.h>
#include <proto/dos.h>
#include <proto/exec.h>


/* Debug output to serial handled via D(bug("....."));
*  See Base/debug.h for details.
*  D(x)    - to disable debug
*  D(x) x  - to enable debug
*/
#define D(x)
#define D2(x)


namespace WTF {


#ifdef __amigaos4__
struct ThreadStartMsg
{
	struct DeathMessage  tsm_Msg;
	void*  			tsm_Result;
};
#else

struct ThreadStartMsg
{
	struct Message  tsm_Msg;
	void*  			tsm_Result;
};
#endif

struct ThreadSpecificData
{
	void *tsd_Value;
	void (*tsd_DestroyFunc)(void *); // Called at thread end with td_Value if not NULL
};

struct ThreadData
{
	struct Process* td_Thread;
	struct MsgPort* td_MsgPort;
	bool            td_Detached;

	// MachineThread specific data
	void *td_SpecificData;
	void (*td_SpecificDestroyFunc)(void *); // Called at thread end with td_SpecificData

	// ThreadSpecificData td_specific[64];
};

struct ThreadReplyState
{
	struct Process        *trs_ParentThread;
	struct ThreadData     *trs_ThreadHandle;
	struct ThreadStartMsg *trs_Msg;
	ULONG                  trs_Replied;
};

/* a condition variable */
struct _Condition
{
	struct SignalSemaphore  lock;       /* lock for this condition data */
	struct MinList          waiters;    /* list of _CondWaiters */
	int                     count;      /* number of waiters in the list */
};

/* a waiter for a condition */
struct _CondWaiter
{
	struct MinNode          node;       /* node for cond->waiters */
	struct Task*            task;       /* task to signal when the condition is met */
};

typedef HashMap<ThreadIdentifier, APTR> ThreadMap; // (ThreadIdentifier, ThreadHandle) map
typedef HashMap<APTR, APTR> SyncPortMap;           // (Msgport, Process) map
typedef HashMap<APTR, APTR> ThreadReplyStateMap;   // (ThreadReplyState, ThreadHandle) map


static Mutex* atomicallyInitializedStaticMutex;

static ThreadIdentifier mainThreadIdentifier; // The thread that was the first to call initializeThreading(), which must be the main thread.

static Mutex& threadMapMutex()
{
	DEFINE_STATIC_LOCAL(Mutex, mutex, ());
	return mutex;
}

static Mutex& syncPortMapMutex()
{
	DEFINE_STATIC_LOCAL(Mutex, mutex, ());
	return mutex;
}

static Mutex& threadReplyStateMapMutex()
{
	DEFINE_STATIC_LOCAL(Mutex, mutex, ());
	return mutex;
}

/* to avoid alising issues */
static void newList(struct List *l)
{
	l->lh_TailPred = (struct Node *) l; \
	l->lh_Tail = (struct Node *) NULL; \
	l->lh_Head = (struct Node *) &l->lh_Tail;
}

static struct Device *sTimerBase;
static struct Unit *sUnitMicroHz;

static void initializeStaticTimerBase()
{
	struct MsgPort port;
	struct timerequest timereq;
	port.mp_Node.ln_Type = NT_MSGPORT;
	port.mp_Flags = PA_IGNORE;
	newList(&port.mp_MsgList);
	timereq.tr_node.io_Message.mn_Node.ln_Type = NT_MESSAGE;
	timereq.tr_node.io_Message.mn_ReplyPort    = &port;
	timereq.tr_node.io_Message.mn_Length       = sizeof(timereq);
	if (OpenDevice(TIMERNAME, UNIT_MICROHZ, &timereq.tr_node, 0) == 0)
	{
		sTimerBase   = timereq.tr_node.io_Device;
		sUnitMicroHz = timereq.tr_node.io_Unit;
		CloseDevice(&timereq.tr_node);
	}
	//else CRASH();
}

void initializeThreading()
{
	D(bug("initializeThreading()\n")); 
	if (!atomicallyInitializedStaticMutex)
	{
		D(bug("we in initializeThreading(): inside of the !atomicallyinitializedstaticmutex and before StringImp::empty\n"));
		StringImpl::empty();
		D(bug("we in initializeThreading(): before atoicallyinitializedstaticmutex = new Mutex\n"));
		atomicallyInitializedStaticMutex = new Mutex;
		D(bug("we in initializeThreading(): before threadmapmutex()\n"));
		threadMapMutex();
		D(bug("we in initializeThreading(): before syncportmapmutex()\n"));
		syncPortMapMutex();
		D(bug("we in initializeThreading(): before threadReplyStateMapMutex()\n"));
		threadReplyStateMapMutex();

		D(bug("we in initializeThreading(): before wtfThreadData()\n"));
		wtfThreadData();
		D(bug("we in initializeThreading(): before initializeRandomNumberGenerator()\n"));
		initializeRandomNumberGenerator();
		D(bug("we in initializeThreading(): before s_dtoap5mutex = new mutex\n"));
		s_dtoaP5Mutex = new Mutex;
		D(bug("we in initializeThreading(): before initializeDates\n"));
		initializeDates();

		D(bug("we in initializeThreading(): before mainthreadidentifier = currentThread()\n"));
		mainThreadIdentifier = currentThread();
		
		D(bug("mainThreadIdentifier %d\n", mainThreadIdentifier));

		initializeStaticTimerBase();
	}
}

void lockAtomicallyInitializedStaticMutex()
{
	ASSERT(atomicallyInitializedStaticMutex);
	atomicallyInitializedStaticMutex->lock();
}

void unlockAtomicallyInitializedStaticMutex()
{
	atomicallyInitializedStaticMutex->unlock();
}

static ThreadMap& threadMap()
{
	DEFINE_STATIC_LOCAL(ThreadMap, map, ());
	return map;
}

static SyncPortMap& syncPortMap()
{
	DEFINE_STATIC_LOCAL(SyncPortMap, map, ());
	return map;
}

static ThreadReplyStateMap& threadReplyStateMap()
{
	DEFINE_STATIC_LOCAL(ThreadReplyStateMap, map, ());
	return map;
}

/* Thread identifier management */

// Not used
/*
static ThreadIdentifier identifierByThreadHandle(APTR threadHandle)
{
    MutexLocker locker(threadMapMutex());

    ThreadMap::iterator i = threadMap().begin();
	for (; i != threadMap().end(); ++i)
	{
		if (i->value == threadHandle)
            return i->key;
    }

    return 0;
}
*/

static ThreadIdentifier identifierByThread(APTR process)
{
	MutexLocker locker(threadMapMutex());

	ThreadMap::iterator i = threadMap().begin();
	for (; i != threadMap().end(); ++i)
	{
		struct ThreadData *threadHandle = (struct ThreadData *) i->value;
		if(threadHandle && threadHandle->td_Thread == process)
			return i->key;
	}

	return 0;
}

static ThreadIdentifier establishIdentifierForThreadHandle(APTR threadHandle)
{
	ASSERT(!identifierByThreadHandle(threadHandle));

	MutexLocker locker(threadMapMutex());

	static ThreadIdentifier identifierCount = 1;

	D(bug("establishIdentifierForThreadHandle() adding thread id %lu\n", identifierCount));

	threadMap().add(identifierCount, threadHandle);

	return identifierCount++;
}

static APTR threadHandleForIdentifier(ThreadIdentifier id)
{
	MutexLocker locker(threadMapMutex());

	return threadMap().get(id);
}

static void clearThreadHandleForIdentifier(ThreadIdentifier id)
{
	MutexLocker locker(threadMapMutex());

	ASSERT(threadMap().contains(id));

	threadMap().remove(id);
}

/* MsgPort management */

static struct MsgPort* syncPortByProcess(APTR process)
{
	MutexLocker locker(syncPortMapMutex());

	D(bug("syncPortByProcess(%p)\n", process));

	SyncPortMap::iterator i = syncPortMap().begin();
	for (; i != syncPortMap().end(); ++i)
	{
		if(i->value == process)
			return (struct MsgPort *) i->key;
	}

	return 0;
}

static struct MsgPort* createSyncPortForProcess(APTR process)
{
	MutexLocker locker(syncPortMapMutex());

	struct MsgPort *msgPort = CreateMsgPort();

	D(bug("createSyncPortForThreadProcess(%p) -> MsgPort %p\n", process, msgPort));

	if(msgPort)
	{
		syncPortMap().add(msgPort, process);
	}
	return msgPort;
}

static void removeSyncPort(APTR syncPort)
{
	D(bug("removeSyncPort(%p)\n", syncPort));

	MutexLocker locker(syncPortMapMutex());

	syncPortMap().remove(syncPort);
}

/* Reply Message management */

struct ThreadReplyState* threadReplyStateByThreadHandle(APTR threadHandle)
{
	MutexLocker locker(threadReplyStateMapMutex());

	D(bug("threadReplyStateByThreadHandle(%p)\n", threadHandle));

	ThreadReplyStateMap::iterator i = threadReplyStateMap().begin();
	for (; i != threadReplyStateMap().end(); ++i)
	{
		if(i->value == threadHandle)
			return (ThreadReplyState*) i->key;
	}

	return 0;
}

struct ThreadReplyState* threadReplyStateByThreadStartMsg(APTR threadStartMsg)
{
	MutexLocker locker(threadReplyStateMapMutex());

	D(bug("threadReplyStateByThreadStartMsg(%p)\n", threadStartMsg));

	ThreadReplyStateMap::iterator i = threadReplyStateMap().begin();
	for (; i != threadReplyStateMap().end(); ++i)
	{
		struct ThreadReplyState* threadReplyState = (struct ThreadReplyState *) i->key;
		if(threadReplyState->trs_Msg == threadStartMsg)
			return (ThreadReplyState *) i->key;
	}

	return 0;
}

static ThreadReplyState* createThreadReplyState(struct ThreadData *threadHandle, struct Process *parentThread, struct ThreadStartMsg *threadStartMsg)
{
	MutexLocker locker(threadReplyStateMapMutex());

	struct ThreadReplyState *threadReplyState = (struct ThreadReplyState *) malloc(sizeof(*threadReplyState));

	D(bug("createReplyState(%p, %p) -> %p\n", threadHandle, threadStartMsg, threadReplyState));

	if(threadReplyState)
	{
		threadReplyState->trs_ParentThread = parentThread;
		threadReplyState->trs_ThreadHandle = threadHandle;
		threadReplyState->trs_Replied      = FALSE;
		threadReplyState->trs_Msg          = threadStartMsg;

		threadReplyStateMap().add(threadReplyState, threadHandle);
	}

	return threadReplyState;
}

static void removeThreadReplyState(ThreadReplyState *threadReplyState)
{
	MutexLocker locker(threadReplyStateMapMutex());

	D(bug("removeThreadReplyState(%p)\n", threadReplyState));

	threadReplyStateMap().remove(threadReplyState);
}

int	pendingChildrenForThread(APTR process)
{
	int count = 0;
	MutexLocker locker(threadReplyStateMapMutex());

	D(bug("pendingChildrenForThread(%p)\n", process));

	ThreadReplyStateMap::iterator i = threadReplyStateMap().begin();
	for (; i != threadReplyStateMap().end(); ++i)
	{
		struct ThreadReplyState* threadReplyState = (struct ThreadReplyState *) i->key;
		if(threadReplyState->trs_ParentThread == process)
			count++;
	}

	return count;
}

/* Thread Management */

ThreadIdentifier createThreadInternal(ThreadFunction entryPoint, void* data, const char* threadName)
{
	D(bug("createThreadInternal(%s)\n", threadName));

	struct ThreadData* threadHandle = (struct ThreadData *) malloc(sizeof(*threadHandle));

	if (threadHandle)
	{
		struct MsgPort *port = syncPortByProcess(FindTask(NULL));

		if(port == NULL)
		{
			port = createSyncPortForProcess(FindTask(NULL));
		}

		threadHandle->td_Detached = false;
		threadHandle->td_MsgPort  = port;
		threadHandle->td_SpecificData = NULL;
		threadHandle->td_SpecificDestroyFunc = NULL;

		if (threadHandle->td_MsgPort)
		{
			struct ThreadStartMsg* startup_msg = (struct ThreadStartMsg*) malloc(sizeof(*startup_msg));

			if (startup_msg)
			{

				#ifdef __amigaos4__
				startup_msg->tsm_Msg.dm_Msg.mn_Node.ln_Type = NT_MESSAGE;
				startup_msg->tsm_Msg.dm_Msg.mn_ReplyPort    = threadHandle->td_MsgPort;
				startup_msg->tsm_Msg.dm_Msg.mn_Length       = sizeof (*startup_msg);
				#else
				startup_msg->tsm_Msg.mn_Node.ln_Type = NT_MESSAGE;
				startup_msg->tsm_Msg.mn_ReplyPort    = threadHandle->td_MsgPort;
				startup_msg->tsm_Msg.mn_Length       = sizeof (*startup_msg);
				#endif
																	  
				threadHandle->td_Thread = CreateNewProcTags(NP_Entry, (ULONG) entryPoint,
													NP_Name,		  (ULONG) threadName,
													#ifdef __amigaos4__
													NP_Child,      TRUE,
													NP_NotifyOnDeathMessage, (ULONG) startup_msg,
													NP_EntryData,	(uint32)data,
													NP_StackSize, 512*1024,
													#else
													NP_CodeType,	  CODETYPE_PPC,
													NP_StartupMsg,  (ULONG) startup_msg,
													NP_PPC_Arg1,	  (ULONG) data,
													NP_PPCStackSize, 512*1024,
													#endif
													TAG_DONE);
													  
													  
													  
													  
				if (threadHandle->td_Thread)
				{
					createThreadReplyState(threadHandle, (struct Process *) FindTask(NULL), startup_msg);
					return establishIdentifierForThreadHandle((APTR) threadHandle);
				}

				free(startup_msg);
			}
			DeleteMsgPort(threadHandle->td_MsgPort);
		}
		free(threadHandle);
	}

	LOG_ERROR("Failed to create thread at entry point %p with data %p", entryPoint, data);

	return 0;
}

void initializeCurrentThreadInternal(const char* threadName)
{
	D(bug("setThreadNameInternal(%s)\n", threadName));
}

int waitForThreadCompletion(ThreadIdentifier threadID)
{
	ASSERT(threadID);

	struct ThreadData *threadHandle = (struct ThreadData *) threadHandleForIdentifier(threadID);

	D(bug("waitForThreadCompletion(%lu) -> threadHandle %p\n", threadID, threadHandle));

	// If the thread was detached, don't wait
	if(threadHandle && !threadHandle->td_Detached)
	{
		ULONG processed = FALSE;
		struct ThreadReplyState *threadReplyState = threadReplyStateByThreadHandle(threadHandle);

		D(bug("Matching threadreplystate %p\n", threadReplyState));
		// First check if the thread didn't already complete
		if(threadReplyState && threadReplyState->trs_Replied)
		{
			D(bug("Already replied\n"));
			processed = TRUE;
		}

		// Else, wait for a thread completion on the msg port
		while(!processed)
		{
			if(threadHandle->td_MsgPort)
			{
				struct ThreadStartMsg* tsm;

				D(bug("Waiting for startupmsg\n"));
				WaitPort(threadHandle->td_MsgPort);
				tsm = (struct ThreadStartMsg*) GetMsg(threadHandle->td_MsgPort);

				// We received a message, but not necessarily from the thread we're waiting for.
				if(tsm)
				{
					threadReplyState = threadReplyStateByThreadStartMsg(tsm);

					if(threadReplyState)
					{
						// It's the one we're waiting for.
						if(threadReplyState->trs_ThreadHandle == threadHandle)
						{
							D(bug("Our thread, proceed\n"));
							processed = TRUE;
						}
						// It's not. Mark it as replied and keep waiting
						else
						{
							D(bug("Not our thread, marking as replied\n"));
							threadReplyState->trs_Replied = TRUE;
						}
					}
				}
			}
		}
/*
		if(result)
		{
			*result	= (void *) threadReplyState->trs_Msg->tsm_Result;
		}
*/
		removeThreadReplyState(threadReplyState);
		free(threadReplyState->trs_Msg);
		free(threadReplyState);

		threadReplyStateMapMutex().lock();
		int remaining = pendingChildrenForThread(FindTask(NULL));
		D(bug("Remaining children %d\n", remaining));
		if(remaining == 0)
		{
			// No more child thread, then we can delete the message port.
			removeSyncPort(threadHandle->td_MsgPort);
			D(bug("DeleteMsgPort(%p)\n", threadHandle->td_MsgPort));
			DeleteMsgPort(threadHandle->td_MsgPort);
		}
		threadReplyStateMapMutex().unlock();

		// Remove the thread from map
		clearThreadHandleForIdentifier(threadID);
		free(threadHandle);
	}

	D(bug("waitForThreadCompletion(%lu) OK\n", threadID));

	return 0;
}

void waitForDetachedThreads()
{
	bug("waitForDetachedThreads() (probably doesn't work)\n");

	MutexLocker locker(threadMapMutex());

	ThreadMap::iterator i = threadMap().begin();
	for (; i != threadMap().end(); ++i)
	{
		struct ThreadData *threadHandle = (struct ThreadData *) i->value;

		if (threadHandle && threadHandle->td_Detached)
		{
			bug("Found detached thread\n");

			ULONG processed = FALSE;
			struct ThreadReplyState *threadReplyState = threadReplyStateByThreadHandle(threadHandle);

			D(bug("Matching threadreplystate %p\n", threadReplyState));
			// First check if the thread didn't already complete
			if(threadReplyState && threadReplyState->trs_Replied)
			{
				D(bug("Already replied\n"));
				processed = TRUE;
			}

			// Else, wait for a thread completion on the msg port
			while(!processed)
			{
				if(threadHandle->td_MsgPort)
				{
					struct ThreadStartMsg* tsm;

					D(bug("Waiting for startupmsg\n"));
					WaitPort(threadHandle->td_MsgPort);
					tsm = (struct ThreadStartMsg*) GetMsg(threadHandle->td_MsgPort);

					// We received a message, but not necessarily from the thread we're waiting for.
					if(tsm)
					{
						threadReplyState = threadReplyStateByThreadStartMsg(tsm);

						if(threadReplyState)
						{
							// It's the one we're waiting for.
							if(threadReplyState->trs_ThreadHandle == threadHandle)
							{
								D(bug("Our thread, proceed\n"));
								processed = TRUE;
							}
							// It's not. Mark it as replied and keep waiting
							else
							{
								D(bug("Not our thread, marking as replied\n"));
								threadReplyState->trs_Replied = TRUE;
							}
						}
					}
				}
			}

			removeThreadReplyState(threadReplyState);
			free(threadReplyState->trs_Msg);
			free(threadReplyState);

			threadReplyStateMapMutex().lock();
			int remaining = pendingChildrenForThread(FindTask(NULL));
			D(bug("Remaining children %d\n", remaining));
			if(remaining == 0)
			{
				// No more child thread, then we can delete the message port.
				removeSyncPort(threadHandle->td_MsgPort);
				D(bug("DeleteMsgPort(%p)\n", threadHandle->td_MsgPort));
				DeleteMsgPort(threadHandle->td_MsgPort);
			}
			threadReplyStateMapMutex().unlock();

			// Remove the thread from map
			free(threadHandle);
		}
	}

	threadMap().clear();
}

void detachThread(ThreadIdentifier threadID)
{
	D(bug("detachThread() (probably doesn't work)\n"));

	struct ThreadData *threadHandle = (struct ThreadData *) threadHandleForIdentifier(threadID);

	if (threadHandle)
	{
		threadHandle->td_Detached = true;
		// XXX: surely wrong.
	}
}

ThreadIdentifier currentThread()
{
	struct ThreadData *threadHandle;
	APTR currentThread = FindTask(NULL);

	D(bug("currentThread() task %p\n", currentThread));

	if (ThreadIdentifier id = identifierByThread(currentThread))
		return id;

	threadHandle = (struct ThreadData *) malloc(sizeof(*threadHandle));

	if(threadHandle)
	{
		threadHandle->td_Thread = (struct Process *) currentThread;
		threadHandle->td_MsgPort = NULL; /* hm, should only happen for main thread, hopefully */
		threadHandle->td_SpecificData = NULL;
		threadHandle->td_SpecificDestroyFunc = NULL;

		return establishIdentifierForThreadHandle(threadHandle);
	}
	return 0;
}

bool isMainThread()
{
	D(bug("isMainThread() %d\n", currentThread() == mainThreadIdentifier));
	return currentThread() == mainThreadIdentifier;
}

/* Thread Specific hack */

void threadSetSpecific(void* process, void* value, void(*destroyFunc)(void*))
{
	if (ThreadIdentifier id = identifierByThread(process))
	{
		struct ThreadData *threadHandle = (struct ThreadData *) threadHandleForIdentifier(id);

		if (threadHandle)
		{
			threadHandle->td_SpecificData = value;
			threadHandle->td_SpecificDestroyFunc = destroyFunc;
		}
	}
}

void *threadGetSpecific(void *process)
{
	void *value = NULL;

	if (ThreadIdentifier id = identifierByThread(process))
	{
		struct ThreadData *threadHandle = (struct ThreadData *) threadHandleForIdentifier(id);

		if (threadHandle)
		{
			value = threadHandle->td_SpecificData;
		}
	}

	return value;
}

void threadDestroySpecific()
{
	if (ThreadIdentifier id = identifierByThread(FindTask(NULL)))
	{
		struct ThreadData *threadHandle = (struct ThreadData *) threadHandleForIdentifier(id);

		if (threadHandle)
		{
			if(threadHandle->td_SpecificData && threadHandle->td_SpecificDestroyFunc)
			{
				threadHandle->td_SpecificDestroyFunc(threadHandle->td_SpecificData);
			}
		}
	}
}


/* Mutex primitives */

Mutex::Mutex()
{
	struct SignalSemaphore *mutex = (struct SignalSemaphore *) AllocMem(sizeof(struct SignalSemaphore), MEMF_PUBLIC | MEMF_CLEAR);

	if(mutex)
	{
		m_mutex = (PlatformMutex) mutex;
		InitSemaphore((struct SignalSemaphore *) m_mutex);
	}
}

Mutex::~Mutex()
{
	FreeMem(m_mutex, sizeof(struct SignalSemaphore)); 
}

void Mutex::lock()
{
	ObtainSemaphore((struct SignalSemaphore *) m_mutex);
}

bool Mutex::tryLock()
{
	return AttemptSemaphore((struct SignalSemaphore *) m_mutex) != 0;
}

void Mutex::unlock()
{
	ReleaseSemaphore((struct SignalSemaphore *) m_mutex);
}

ThreadCondition::ThreadCondition()
{
	struct _Condition *c;

	D2(bug("ThreadCondition::ThreadCondition()\n"));

	/* allocate */
	if ((c = (struct _Condition *)  AllocMem(sizeof(struct _Condition), MEMF_PUBLIC)))
	{
		m_condition = (void *) c;
		memset(&c->lock, 0, sizeof(c->lock));
		InitSemaphore(&c->lock);
		NEWLIST(&c->waiters);
		c->count = 0;
	}

	D2(bug("ThreadCondition::ThreadCondition() OK\n"));
}

ThreadCondition::~ThreadCondition()
{
	struct _Condition *c = (struct _Condition *) m_condition;

	D2(bug("ThreadCondition::~ThreadCondition()\n"));

	if(c)
	{
		/* we can only destroy the cond if noone is waiting on it */
		ObtainSemaphoreShared(&c->lock);
		if (c->count > 0)
		{
			ReleaseSemaphore(&c->lock);
			return;
		}

		FreeMem(c, sizeof(struct _Condition));
	}

	D2(bug("ThreadCondition::~ThreadCondition() OK\n"));
}

void ThreadCondition::wait(Mutex & mutex)
{
	struct _Condition *c = (struct _Condition *) m_condition;
	struct _CondWaiter *waiter;

	D2(bug("ThreadCondition::wait()\n"));

	/* setup a new waiter */
	if ((waiter = (struct _CondWaiter *) AllocMem(sizeof(struct _CondWaiter), MEMF_CLEAR)) == NULL)
	{
		return;
	}

	waiter->task = FindTask(NULL);

	/* safely add ourselves to the list of waiters */
	ObtainSemaphore(&c->lock);
	ADDTAIL(&c->waiters, waiter);
	c->count++;
	ReleaseSemaphore(&c->lock);

	/* disable task switches. we must atomically unlock the mutex and wait for
	 * the signal, otherwise the signal may be missed */
	Forbid();

	/* release the mutex that protects the condition */
	mutex.unlock();

	/* and now wait for someone to hit the condition. this will break the
	 * Forbid(), which is what we want */
	Wait(SIGF_SINGLE);

	/* the Forbid() is restored when Wait() exits, so we have to turn task
	 * switches on again. */
	Permit();

	/* retake the mutex */
	mutex.lock();

	D2(bug("ThreadCondition::wait() OK\n"));
}

bool ThreadCondition::timedWait(Mutex& mutex, double absoluteTime)
{
	struct _Condition *c = (struct _Condition *) m_condition;
	struct _CondWaiter *waiter;
	bool conditionHit = false;
	double interval = absoluteTime - currentTime();

	D2(bug("ThreadCondition::timedWait()\n"));

	if (interval < 0.0)
		return false;

	if (absoluteTime > INT_MAX)
	{
		wait(mutex);
		return true;
	}

	/* setup a new waiter */
	if ((waiter = (struct _CondWaiter *) AllocMem(sizeof(struct _CondWaiter), MEMF_CLEAR)) == NULL)
	{
		return false;
	}

	waiter->task = FindTask(NULL);

	/* safely add ourselves to the list of waiters */
	ObtainSemaphore(&c->lock);
	ADDTAIL(&c->waiters, waiter);
	c->count++;
	ReleaseSemaphore(&c->lock);

	/* disable task switches. we must atomically unlock the mutex and wait for
	 * the signal, otherwise the signal may be missed */
	//Forbid();

	/* release the mutex that protects the condition */
	mutex.unlock();

	/* and now wait for someone to hit the condition. this will break the
	 * Forbid(), which is what we want */

	if (interval > 0.000020)
	{
		struct MsgPort port;
		struct timerequest timereq;
		port.mp_Node.ln_Type = NT_MSGPORT;
		port.mp_Flags        = PA_SIGNAL;
		port.mp_SigTask      = waiter->task;
		port.mp_SigBit       = SIGB_SINGLE;
		newList(&port.mp_MsgList);
		timereq.tr_node.io_Message.mn_Node.ln_Type = NT_MESSAGE;
		timereq.tr_node.io_Message.mn_ReplyPort    = &port;
		timereq.tr_node.io_Message.mn_Length       = sizeof(timereq);
		timereq.tr_node.io_Device  = sTimerBase;
		timereq.tr_node.io_Unit    = sUnitMicroHz;
		timereq.tr_node.io_Command = TR_ADDREQUEST;
		timereq.tr_time.tv_secs    = (ULONG) interval;
		timereq.tr_time.tv_micro   = (ULONG) ((interval - timereq.tr_time.tv_secs) * 1000000.0);
		SendIO(&timereq.tr_node);
		Wait(SIGF_SINGLE);
		/* If the port is empty it means the timer didn't expire */
		conditionHit = IsListEmpty(&port.mp_MsgList) ? true : false;
		AbortIO(&timereq.tr_node);
		WaitIO(&timereq.tr_node);
		/* Make sure the signal is cleared */
		SetSignal(0L, SIGF_SINGLE);
	}
	else
	{
		conditionHit = (SetSignal(0L, SIGF_SINGLE) & SIGF_SINGLE) ? true : false;
	}

	/* the Forbid() is restored when Wait() exits, so we have to turn task
	 * switches on again. */
	//Permit();

	/* retake the mutex */
	mutex.lock();

	D2(bug("ThreadCondition::timedWait() caught signal: %d\n", conditionHit));

	return conditionHit;
}

void ThreadCondition::signal()
{
	struct _Condition *c = (struct _Condition *) m_condition;
	struct _CondWaiter *waiter;

	D2(bug("ThreadCondition::signal()\n"));

	/* safely remove a waiter from the list */
	ObtainSemaphore(&c->lock);
	waiter = (struct _CondWaiter *) REMHEAD(&c->waiters);
	if (waiter != NULL)
		c->count--;
	ReleaseSemaphore(&c->lock);

	/* noone waiting */
	if (waiter == NULL)
		return;

	/* signal the task */
	Signal(waiter->task, SIGF_SINGLE);

	/* all done */
	FreeMem(waiter, sizeof(struct _CondWaiter));

	D2(bug("ThreadCondition::signal() OK\n"));
}

void ThreadCondition::broadcast()
{
	struct _Condition *c = (struct _Condition *) m_condition;
	struct _CondWaiter *waiter;

	D2(bug("ThreadCondition::broadcast()\n"));

	/* safely operation on the condition */
	ObtainSemaphore(&c->lock);

	/* wake up all the waiters */
	while ((waiter = (struct _CondWaiter *) REMHEAD(&c->waiters)) != NULL)
	{
	    Signal(waiter->task, SIGF_SINGLE);
	    FreeMem(waiter, sizeof(struct _CondWaiter));
	}

	/* none left */
	c->count = 0;

	ReleaseSemaphore(&c->lock);
}

} // namespace WebCore
