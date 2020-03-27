/*
 * Copyright (C) 2012 Research In Motion Limited. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

#include "config.h"
#include "GCActivityCallback.h"

#include "Heap.h"
#include "VM.h"

/* Debug output to serial handled via D(bug("....."));
*  See Base/debug.h for details.
*  D(x)    - to disable debug
*  D(x) x  - to enable debug
*/
#define D(x)

static char *noperiodicCollect = (char *) getenv("OWB_NO_PERIODIC_COLLECT"); 

namespace JSC {

static unsigned int prev_availmem = 0;

DefaultGCActivityCallback::DefaultGCActivityCallback(Heap* heap)
    : GCActivityCallback(heap->vm())
{
}

void DefaultGCActivityCallback::doWork()
{
    D(bug("DefaultGCActivityCallback::doWork\n"));
    JSLock lock();
    
    if(!noperiodicCollect)
    {
        m_vm->heap.collect(Heap::DoSweep/*Heap::DoNotSweep*/);
	prev_availmem = AvailMem(MEMF_ANY);
    }
}

void DefaultGCActivityCallback::didAllocate(size_t bytesAllocated)
{
    D(bug("DefaultGCActivityCallback::didAllocate(%lu) %f\n", bytesAllocated, m_vm->heap.lastGCLength()));

    if (m_timer.isActive())
        return;
    if(!noperiodicCollect)
    {
        double nextTime = 5*60; //m_globalData->heap.lastGCLength() * 200;
	D(bug("next collect in %f s\n", nextTime));

	if((AvailMem(MEMF_ANY) + 32*1024*1024 < prev_availmem) || (AvailMem(MEMF_ANY) < 16*1024*1024))
	{
	    D(bug(">32MB memory was eaten since last collect, let's do it now\n"));
	    nextTime = 1;
	}

        m_timer.startOneShot(nextTime);
    }
}

void DefaultGCActivityCallback::willCollect()
{
    D(bug("DefaultGCActivityCallback::willCollect\n"));
    if(!noperiodicCollect)
        cancel();
}

void DefaultGCActivityCallback::cancel()
{
    D(bug("DefaultGCActivityCallback::cancel\n"));
    if(!noperiodicCollect)
        m_timer.stop();
}

}
