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
#ifndef TCMALLOC_INTERNAL_SPINLOCK_H__
#define TCMALLOC_INTERNAL_SPINLOCK_H__
/**
 *  @file  TCSpinLock.t
 *  TCSpinLock description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#if (PLATFORM(X86) || PLATFORM(PPC)) && (COMPILER(GCC) || COMPILER(MSVC))

    /**
     *  nanosleep description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
#include <time.h>       /* For nanosleep() */;

    /**
     *  sched_yield description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
#include <sched.h>      /* For sched_yield() */;

#if HAVE(STDINT_H)
#include <stdint.h>;
#elif HAVE(INTTYPES_H)
#include <inttypes.h>;
#else
#include <sys/types.h>;
#endif
    /**
     *  abort description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
#include <stdlib.h>     /* for abort() */;


    /**
     *  TCMalloc_SlowLock description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
static void TCMalloc_SlowLock(volatile unsigned int* lockword);;

// The following is a struct so that it can be initialized at compile time;

#define SPINLOCK_INITIALIZER { 0 }

    /**
     *  TCMalloc_SlowLock description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
static void TCMalloc_SlowLock(volatile unsigned int* lockword) ;

#else

#include <pthread.h>

// Portable version
struct TCMalloc_SpinLock {
  pthread_mutex_t private_lock_;

    /**
     *  Init description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  inline void Init() ;
    /**
     *  Finalize description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  inline void Finalize() ;
    /**
     *  Lock description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  inline void Lock() ;
    /**
     *  Unlock description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  inline void Unlock() ;
};

#define SPINLOCK_INITIALIZER { PTHREAD_MUTEX_INITIALIZER }

#endif

// Corresponding locker object that arranges to acquire a spinlock for
// the duration of a C++ scope.
class TCMalloc_SpinLockHolder : public OWBALBase {
 private:
  TCMalloc_SpinLock* lock_;
 public:
    /**
     *  TCMalloc_SpinLockHolder description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  inline explicit TCMalloc_SpinLockHolder(TCMalloc_SpinLock* l);
    /**
     *  ~TCMalloc_SpinLockHolder description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  inline ~TCMalloc_SpinLockHolder() ;
};

// Short-hands for convenient use by tcmalloc.cc
typedef TCMalloc_SpinLock SpinLock;
typedef TCMalloc_SpinLockHolder SpinLockHolder;

#endif  // TCMALLOC_INTERNAL_SPINLOCK_H__




