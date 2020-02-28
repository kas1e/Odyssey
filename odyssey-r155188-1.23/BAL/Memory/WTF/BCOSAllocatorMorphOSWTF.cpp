/*
 * Copyright (C) 2010 Apple Inc. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY APPLE INC. AND ITS CONTRIBUTORS ``AS IS''
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL APPLE INC. OR ITS CONTRIBUTORS
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "config.h"
#include "OSAllocator.h"

#include <wtf/FastMalloc.h>

#include <string.h>
#include <clib/debug_protos.h>
#define D(x)

namespace WTF {

void* OSAllocator::reserveUncommitted(size_t bytes, Usage usage, bool, bool, bool)
{
    void *ptr = fastMalloc(bytes);
    D(kprintf("A %p | OSAllocator::reserveUncommitted(%lu usage %d)\n", ptr, bytes, usage));
    return ptr;
}

void* OSAllocator::reserveAndCommit(size_t bytes, Usage usage, bool, bool, bool)
{
    void *ptr = fastMalloc(bytes);
    D(kprintf("A %p | OSAllocator::reserveAndCommit(%lu usage %d)\n", ptr, bytes, usage));
    return ptr;
}

void OSAllocator::commit(void* address, size_t bytes, bool, bool)
{
    //D(kprintf("OSAllocator::commit(%p, %lu)\n", address, bytes));
}

void OSAllocator::decommit(void* address, size_t bytes)
{
    //D(kprintf("OSAllocator::decommit(%p, %lu)\n", address, bytes));
}

void OSAllocator::releaseDecommitted(void* address, size_t bytes)
{
    D(kprintf("D %p | OSAllocator::releaseDecommitted(%p, %lu)\n", address, address, bytes));
    fastFree(address);
}

} // namespace WTF
