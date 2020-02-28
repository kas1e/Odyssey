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
#ifndef KJS_AVL_TREE_H_
#define KJS_AVL_TREE_H_
/**
 *  @file  AVLTree.t
 *  AVLTree description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:10 $
 */
#include "BALBase.h"

namespace KJS {

// Here is the reference class for BSet.
//
// class BSet
//   {
//   public:
//
//     class ANY_bitref
//       {
//       public:
//         operator bool ();
//         void operator = (bool b);
//       };
//
//     // Does not have to initialize bits.
//     BSet();
//
//     // Must return a valid value for index when 0 <= index < maxDepth
//     ANY_bitref operator [] (unsigned index);
//
//     // Set all bits to 1.
//     void set();
//
//     // Set all bits to 0.
//     void reset();
//   };

template<unsigned maxDepth> class AVLTreeDefaultBSet : public OWBALBase {
public:
    /**
     *  operator[] description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool& operator[](unsigned i) ;
    /**
     *  set description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void set() ;
    /**
     *  reset description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void reset() ;

private:
    bool m_data[maxDepth];
};

// How to determine maxDepth:
// d  Minimum number of nodes
// 2  2
// 3  4
// 4  7
// 5  12
// 6  20
// 7  33
// 8  54
// 9  88
// 10 143
// 11 232
// 12 376
// 13 609
// 14 986
// 15 1,596
// 16 2,583
// 17 4,180
// 18 6,764
// 19 10,945
// 20 17,710
// 21 28,656
// 22 46,367
// 23 75,024
// 24 121,392
// 25 196,417
// 26 317,810
// 27 514,228
// 28 832,039
// 29 1,346,268
// 30 2,178,308
// 31 3,524,577
// 32 5,702,886
// 33 9,227,464
// 34 14,930,351
// 35 24,157,816
// 36 39,088,168
// 37 63,245,985
// 38 102,334,154
// 39 165,580,140
// 40 267,914,295
// 41 433,494,436
// 42 701,408,732
// 43 1,134,903,169
// 44 1,836,311,902
// 45 2,971,215,072
//
// E.g., if, in a particular instantiation, the maximum number of nodes in a tree instance is 1,000,000, the maximum depth should be 28.
// You pick 28 because MN(28) is 832,039, which is less than or equal to 1,000,000, and MN(29) is 1,346,268, which is strictly greater than 1,000,000.

template <class Abstractor, unsigned maxDepth = 32, class BSet = AVLTreeDefaultBSet<maxDepth> > class AVLTree : public OWBALBase {
public:

    typedef typename Abstractor::key key;
    typedef typename Abstractor::handle handle;
    typedef typename Abstractor::size size;

    enum SearchType {
        EQUAL = 1,
        LESS = 2,
        GREATER = 4,
        LESS_EQUAL = EQUAL | LESS,
        GREATER_EQUAL = EQUAL | GREATER
    };


    /**
     *  abstractor description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    Abstractor& abstractor() ;

    /**
     *  insert description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline handle insert(handle h);

    /**
     *  search description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline handle search(key k, SearchType st = EQUAL);
    /**
     *  search_least description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline handle search_least();
    /**
     *  search_greatest description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline handle search_greatest();

    /**
     *  remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline handle remove(key k);

    /**
     *  subst description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline handle subst(handle new_node);

    /**
     *  purge description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void purge() ;

    /**
     *  is_empty description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool is_empty() ;

    /**
     *  AVLTree description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    AVLTree() ;

    class Iterator : public OWBALBase {
    public:

        // Initialize depth to invalid value, to indicate iterator is
        // invalid.   (Depth is zero-base.)
    /**
     *  Iterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Iterator() ;

    /**
     *  start_iter description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void start_iter(AVLTree &tree, key k, SearchType st = EQUAL);

    /**
     *  start_iter_least description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void start_iter_least(AVLTree &tree);

    /**
     *  start_iter_greatest description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void start_iter_greatest(AVLTree &tree);

    /**
     *  operator* description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        handle operator*();

    /**
     *  operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void operator++();

    /**
     *  operator-- description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void operator--();

    /**
     *  operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void operator++(int) ;
    /**
     *  operator-- description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void operator--(int) ;

    protected:

        // Tree being iterated over.
        AVLTree *tree_;

        // Records a path into the tree.  If branch[n] is true, indicates
        // take greater branch from the nth node in the path, otherwise
        // take the less branch.  branch[0] gives branch from root, and
        // so on.
        BSet branch;

        // Zero-based depth of path into tree.
        unsigned depth;

        // Handles of nodes in path from root to current node (returned by *).
        handle path_h[maxDepth - 1];

    /**
     *  cmp_k_n description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        int cmp_k_n(key k, handle h) ;
    /**
     *  cmp_n_n description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        int cmp_n_n(handle h1, handle h2) ;
    /**
     *  get_lt description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        handle get_lt(handle h) ;
    /**
     *  get_gt description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        handle get_gt(handle h) ;
    /**
     *  null description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        handle null() ;
    };

    /**
     *  build description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename fwd_iter>     bool build(fwd_iter p, size num_nodes);

protected:

    friend class Iterator;

    // Create a class whose sole purpose is to take advantage of
    // the "empty member" optimization.
    struct abs_plus_root : public Abstractor {
        // The handle of the root element in the AVL tree.
        handle root;
    };

    abs_plus_root abs;


    /**
     *  get_lt description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    handle get_lt(handle h) ;
    /**
     *  set_lt description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void set_lt(handle h, handle lh) ;

    /**
     *  get_gt description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    handle get_gt(handle h) ;
    /**
     *  set_gt description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void set_gt(handle h, handle gh) ;

    /**
     *  get_bf description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    int get_bf(handle h) ;
    /**
     *  set_bf description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void set_bf(handle h, int bf) ;

    /**
     *  cmp_k_n description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    int cmp_k_n(key k, handle h) ;
    /**
     *  cmp_n_n description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    int cmp_n_n(handle h1, handle h2) ;

    /**
     *  null description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    handle null() ;

private:

    // Balances subtree, returns handle of root node of subtree
    // after balancing.
    /**
     *  balance description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    handle balance(handle bal_h);

};

template <class Abstractor, unsigned maxDepth, class BSet> inline typename AVLTree<Abstractor, maxDepth, BSet>::handle
    /**
     *  BSet>::insert description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
AVLTree<Abstractor, maxDepth, BSet>::insert(handle h);

template <class Abstractor, unsigned maxDepth, class BSet> inline typename AVLTree<Abstractor, maxDepth, BSet>::handle
    /**
     *  BSet>::search description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
AVLTree<Abstractor, maxDepth, BSet>::search(key k, typename AVLTree<Abstractor, maxDepth, BSet>::SearchType st);

template <class Abstractor, unsigned maxDepth, class BSet> inline typename AVLTree<Abstractor, maxDepth, BSet>::handle
    /**
     *  BSet>::search_least description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
AVLTree<Abstractor, maxDepth, BSet>::search_least();

template <class Abstractor, unsigned maxDepth, class BSet> inline typename AVLTree<Abstractor, maxDepth, BSet>::handle
    /**
     *  BSet>::search_greatest description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
AVLTree<Abstractor, maxDepth, BSet>::search_greatest();

template <class Abstractor, unsigned maxDepth, class BSet> inline typename AVLTree<Abstractor, maxDepth, BSet>::handle
    /**
     *  BSet>::remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
AVLTree<Abstractor, maxDepth, BSet>::remove(key k);

template <class Abstractor, unsigned maxDepth, class BSet> inline typename AVLTree<Abstractor, maxDepth, BSet>::handle
    /**
     *  BSet>::subst description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
AVLTree<Abstractor, maxDepth, BSet>::subst(handle new_node);


}

#endif




