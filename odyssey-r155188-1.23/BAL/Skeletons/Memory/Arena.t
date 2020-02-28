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
#ifndef Arena_h
#define Arena_h
/**
 *  @file  Arena.t
 *  Arena description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:09 $
 */
#include "BALBase.h"

#define ARENA_ALIGN_MASK 3

namespace WebCore {

typedef unsigned long uword;

struct Arena {
    Arena* next;        // next arena
    uword base;         // aligned base address
    uword limit;        // end of arena (1+last byte)
    uword avail;        // points to next available byte in arena
};

struct ArenaPool {
    Arena first;        // first arena in pool list.
    Arena* current;     // current arena.
    unsigned int arenasize;
    uword mask;         // Mask (power-of-2 - 1)
};

    /**
     * Init arena pool 
     * @param[in] : pool
     * @param[in] : name
     * @param[in] : size
     * @param[in] : aligment
     */
void InitArenaPool(ArenaPool *pool, const char *name, 
                   unsigned int size, unsigned int align);

    /**
     * Finish arena pool 
     * @param[in] : pool
     */
void FinishArenaPool(ArenaPool *pool);

    /**
     * Free arena pool
     * @param[in] : pool
     */
void FreeArenaPool(ArenaPool *pool);

    /**
     * Arena allocate
     * @param[in] : pool
     * @param[in] : number
     * @param[out] : pool allocated
     */
void* ArenaAllocate(ArenaPool *pool, unsigned int nb);

#define ARENA_ALIGN(pool, n) (((uword)(n) + ARENA_ALIGN_MASK) & ~ARENA_ALIGN_MASK)
#define INIT_ARENA_POOL(pool, name, size) \
        InitArenaPool(pool, name, size, ARENA_ALIGN_MASK + 1)

#define ARENA_ALLOCATE(p, pool, nb) \
        Arena *_a = (pool)->current; \
        unsigned int _nb = ARENA_ALIGN(pool, nb); \
        uword _p = _a->avail; \
        uword _q = _p + _nb; \
        if (_q > _a->limit) \
            _p = (uword)ArenaAllocate(pool, _nb); \
        else \
            _a->avail = _q; \
        p = (void *)_p;

#define ARENA_GROW(p, pool, size, incr) \
        Arena *_a = (pool)->current; \
        unsigned int _incr = ARENA_ALIGN(pool, incr); \
        uword _p = _a->avail; \
        uword _q = _p + _incr; \
        if (_p == (uword)(p) + ARENA_ALIGN(pool, size) && \

#define ARENA_MARK(pool) ((void *) (pool)->current->avail)
#define UPTRDIFF(p,q) ((uword)(p) - (uword)(q))     

#ifdef DEBUG
#define FREE_PATTERN 0xDA
#define CLEAR_UNUSED(a) ASSERT((a)->avail <= (a)->limit); \
                        memset((void*)(a)->avail, FREE_PATTERN, \
                            (a)->limit - (a)->avail)
#define CLEAR_ARENA(a)  memset((void*)(a), FREE_PATTERN, \
                            (a)->limit - (uword)(a))
#else
#define CLEAR_UNUSED(a)
#define CLEAR_ARENA(a)
#endif

#define ARENA_RELEASE(pool, mark) \
         char *_m = (char *)(mark); \
         Arena *_a = (pool)->current; \

#define ARENA_DESTROY(pool, a, pnext) \
         if ((pool)->current == (a)) (pool)->current = &(pool)->first; \
         *(pnext) = (a)->next; \
         CLEAR_ARENA(a); \
         fastFree(a); \
         (a) = 0;

}

#endif




