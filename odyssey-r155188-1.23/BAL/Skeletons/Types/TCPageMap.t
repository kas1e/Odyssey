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
#ifndef TCMALLOC_PAGEMAP_H__
#define TCMALLOC_PAGEMAP_H__
/**
 *  @file  TCPageMap.t
 *  TCPageMap description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#if HAVE(STDINT_H)
#include <stdint.h>
#elif HAVE(INTTYPES_H)
#include <inttypes.h>
#else
#include <sys/types.h>
#endif

#include <string.h>

#include "Assertions.h"

// Single-level array
template <int BITS> class TCMalloc_PageMap1 : public OWBALBase {
 private:
  void** array_;

 public:
  typedef uintptr_t Number;

    /**
     *  init description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  void init(void* (*allocator)(size_t)) ;

  // Ensure that the map contains initialized entries "x .. x+n-1".
  // Returns true if successful, false if we could not allocate memory.
    /**
     *  Ensure description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  bool Ensure(Number x, size_t n) ;

    /**
     *  PreallocateMoreMemory description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  void PreallocateMoreMemory() ;

  // REQUIRES "k" is in range "[0,2^BITS-1]".
  // REQUIRES "k" has been ensured before.
  //
  // Return the current value for KEY.  Returns "Value()" if not
  // yet set.
    /**
     *  get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  void* get(Number k) const ;

  // REQUIRES "k" is in range "[0,2^BITS-1]".
  // REQUIRES "k" has been ensured before.
  //
  // Sets the value for KEY.
    /**
     *  set description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  void set(Number k, void* v) ;
};

// Two-level radix tree
template <int BITS> class TCMalloc_PageMap2 : public OWBALBase {
 private:
  // Put 32 entries in the root and (2^BITS)/32 entries in each leaf.
  static const int ROOT_BITS = 5;
  static const int ROOT_LENGTH = 1 << ROOT_BITS;

  static const int LEAF_BITS = BITS - ROOT_BITS;
  static const int LEAF_LENGTH = 1 << LEAF_BITS;

  // Leaf node
  struct Leaf {
    void* values[LEAF_LENGTH];
  };

  Leaf* root_[ROOT_LENGTH];             // Pointers to 32 child nodes
    /**
     *   description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  void* (*allocator_)(size_t);          // Memory allocator

 public:
  typedef uintptr_t Number;

    /**
     *  init description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  void init(void* (*allocator)(size_t)) ;

    /**
     *  get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  void* get(Number k) const ;

    /**
     *  set description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  void set(Number k, void* v) ;

    /**
     *  Ensure description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  bool Ensure(Number start, size_t n) ;

    /**
     *  PreallocateMoreMemory description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  void PreallocateMoreMemory() ;

#ifdef WTF_CHANGES
  template<class Visitor, class MemoryReader>   void visit(const Visitor& visitor, const MemoryReader& reader);
#endif
};

// Three-level radix tree
template <int BITS> class TCMalloc_PageMap3 : public OWBALBase {
 private:
  // How many bits should we consume at each interior level
    /**
     *   description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  static const int INTERIOR_BITS = (BITS + 2) / 3; // Round-up
  static const int INTERIOR_LENGTH = 1 << INTERIOR_BITS;

  // How many bits should we consume at leaf level
  static const int LEAF_BITS = BITS - 2*INTERIOR_BITS;
  static const int LEAF_LENGTH = 1 << LEAF_BITS;

  // Interior node
  struct Node {
    Node* ptrs[INTERIOR_LENGTH];
  };

  // Leaf node
  struct Leaf {
    void* values[LEAF_LENGTH];
  };

  Node* root_;                          // Root of radix tree
    /**
     *   description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  void* (*allocator_)(size_t);          // Memory allocator

    /**
     *  NewNode description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  Node* NewNode() ;

 public:
  typedef uintptr_t Number;

    /**
     *  init description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  void init(void* (*allocator)(size_t)) ;

    /**
     *  get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  void* get(Number k) const ;

    /**
     *  set description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  void set(Number k, void* v) ;

    /**
     *  Ensure description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  bool Ensure(Number start, size_t n) ;

    /**
     *  PreallocateMoreMemory description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
  void PreallocateMoreMemory() ;

#ifdef WTF_CHANGES
  template<class Visitor, class MemoryReader>   void visit(const Visitor& visitor, const MemoryReader& reader) ;
#endif
};

#endif  // TCMALLOC_PAGEMAP_H__




