/*
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
#ifndef TCMALLOC_SYSTEM_ALLOC_H__
#define TCMALLOC_SYSTEM_ALLOC_H__
/**
 *  @file  TCSystemAlloc.t
 *  TCSystemAlloc description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:09 $
 */
#include "BALBase.h"

// REQUIRES: "alignment" is a power of two or "0" to indicate default alignment
//
// Allocate and return "N" bytes of zeroed memory.
//
// If actual_bytes is NULL then the returned memory is exactly the
// requested size.  If actual bytes is non-NULL then the allocator
// may optionally return more bytes than asked for (i.e. return an
// entire "huge" page if a huge page allocator is in use).
//
// The returned pointer is a multiple of "alignment" if non-zero.
//
// Returns NULL when out of memory.
    /**
     * Allocate and zero a memory region.
     * @param[in] : bytes to allocate.
     * @param[in] : If actual_bytes is NULL then the returned memory is exactly the requested size. If actual bytes is non-NULL then the allocator may optionally return more bytes than asked for (i.e. return an entire "huge" page if a huge page allocator is in use).
     * @param[in] : "alignment" is a power of two or "0" to indicate default alignment.
     * @param[out] : Allocate and return "N" bytes of zeroed memory.
     * @code
     * @endcode
     */
extern void* TCMalloc_SystemAlloc(size_t bytes, size_t *actual_bytes,
                                  size_t alignment = 0);

// This call is a hint to the operating system that the pages
// contained in the specified range of memory will not be used for a
// while, and can be released for use by other processes or the OS.
// Pages which are released in this way may be destroyed (zeroed) by
// the OS.  The benefit of this function is that it frees memory for
// use by the system, the cost is that the pages are faulted back into
// the address space next time they are touched, which can impact
// performance.  (Only pages fully covered by the memory region will
// be released, partial pages will not.)
    /**
     * Release a memory region.
     * This call is a hint to the operating system that the pages
     * contained in the specified range of memory will not be used for a
     * while, and can be released for use by other processes or the OS.
     * Pages which are released in this way may be destroyed (zeroed) by
     * the OS.  The benefit of this function is that it frees memory for
     * use by the system, the cost is that the pages are faulted back into
     * the address space next time they are touched, which can impact
     * performance.  (Only pages fully covered by the memory region will
     * be released, partial pages will not.)
     * @param[in] : start address of region to release.
     * @param[in] : length of memory region to release.
     * @code
     * @endcode
     */
extern void TCMalloc_SystemRelease(void* start, size_t length);

#if HAVE(VIRTUALALLOC)
    /**
     * Commit an allocation for a memory region.
     * @param[in] : start address of region to commit.
     * @param[in] : length of memory region to commit.
     * @code
     * @endcode
     */
extern void TCMalloc_SystemCommit(void* start, size_t length);
#else
    /**
     * Commit an allocation for a memory region.
     * @param[in] : start address of region to commit.
     * @param[in] : length of memory region to commit.
     * @code
     * @endcode
     */
inline void TCMalloc_SystemCommit(void*, size_t) ;
#endif

#endif /* TCMALLOC_SYSTEM_ALLOC_H__ */




