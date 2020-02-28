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
#ifndef WTF_ListHashSet_h
#define WTF_ListHashSet_h
/**
 *  @file  ListHashSet.t
 *  ListHashSet description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#include "Assertions.h"
#include "HashSet.h"
#include "OwnPtr.h"

namespace WTF {

    // ListHashSet: Just like HashSet, this class provides a Set
    // interface - a collection of unique objects with O(1) insertion,
    // removal and test for containership. However, it also has an
    // order - iterating it will always give back values in the order
    // in which they are added.

    // In theory it would be possible to add prepend, insertAfter, insertBefore,
    // and an append that moves the element to the end even if already present,
    // but unclear yet if these are needed.

    template<typename Value, typename HashFunctions> class ListHashSet;

    template<typename T> struct IdentityExtractor;

    /**
     *  deleteAllValues description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Value, typename HashFunctions>     void deleteAllValues(const ListHashSet<Value, HashFunctions>&);

    template<typename ValueArg, typename HashArg> class ListHashSetIterator;
    template<typename ValueArg, typename HashArg> class ListHashSetConstIterator;

    template<typename ValueArg> struct ListHashSetNode;
    template<typename ValueArg> struct ListHashSetNodeAllocator;
    template<typename ValueArg, typename HashArg> struct ListHashSetNodeHashFunctions;

    template<typename ValueArg, typename HashArg = typename DefaultHash<ValueArg>, Hash> class ListHashSet {
    private:
        typedef ListHashSetNode<ValueArg> Node;
        typedef ListHashSetNodeAllocator<ValueArg> NodeAllocator;

        typedef HashTraits<Node*> NodeTraits;
        typedef ListHashSetNodeHashFunctions<ValueArg, HashArg> NodeHash;

        typedef HashTable<Node*, Node*, IdentityExtractor<Node*>, NodeHash, NodeTraits, NodeTraits> ImplType;

        typedef HashArg HashFunctions;

    public:
        typedef ValueArg ValueType;
        typedef ListHashSetIterator<ValueType, HashArg> iterator;
        typedef ListHashSetConstIterator<ValueType, HashArg> const_iterator;

        friend class ListHashSetConstIterator<ValueType, HashArg>;

    /**
     *  ListHashSet description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ListHashSet();
    /**
     *  ListHashSet description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ListHashSet(const ListHashSet&);
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ListHashSet& operator=(const ListHashSet&);
    /**
     *  ~ListHashSet description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ~ListHashSet();

    /**
     *  swap description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void swap(ListHashSet&);

    /**
     *  size description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        int size() const;
    /**
     *  capacity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        int capacity() const;
    /**
     *  isEmpty description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool isEmpty() const;

    /**
     *  begin description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        iterator begin();
    /**
     *  end description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        iterator end();
    /**
     *  begin description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const_iterator begin() const;
    /**
     *  end description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const_iterator end() const;

    /**
     *  find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        iterator find(const ValueType&);
    /**
     *  find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const_iterator find(const ValueType&) const;
    /**
     *  contains description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool contains(const ValueType&) const;

        // the return value is a pair of an interator to the new value's location, 
        // and a bool that is true if an new entry was added
    /**
     *  add description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        pair<iterator, bool> add(const ValueType&);


    /**
     *  insertBefore description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        pair<iterator, bool> insertBefore(const ValueType& beforeValue, const ValueType& newValue);


    /**
     *  insertBefore description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        pair<iterator, bool> insertBefore(iterator it, const ValueType&);

    /**
     *  remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void remove(const ValueType&);
    /**
     *  remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void remove(iterator);
    /**
     *  clear description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void clear();

    private:
    /**
     *  unlinkAndDelete description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void unlinkAndDelete(Node*);
    /**
     *  appendNode description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void appendNode(Node*);

    /**
     *  insertNodeBefore description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void insertNodeBefore(Node* beforeNode, Node* newNode);

    /**
     *  deleteAllNodes description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void deleteAllNodes();
    /**
     *  makeIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        iterator makeIterator(Node*);
    /**
     *  makeConstIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const_iterator makeConstIterator(Node*) const;

    /**
     *  deleteAllValues<> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        friend void deleteAllValues<>(const ListHashSet&);

        ImplType m_impl;
        Node* m_head;
        Node* m_tail;
        OwnPtr<NodeAllocator> m_allocator;
    };

    template<typename ValueArg> struct ListHashSetNodeAllocator {
        typedef ListHashSetNode<ValueArg> Node;
        typedef ListHashSetNodeAllocator<ValueArg> NodeAllocator;

    /**
     *  ListHashSetNodeAllocator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ListHashSetNodeAllocator() ;

    /**
     *  allocate description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Node* allocate();

    /**
     *  deallocate description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void deallocate(Node* node) ;

    private:
    /**
     *  pool description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Node* pool() ;
    /**
     *  pastPool description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Node* pastPool() ;

    /**
     *  inPool description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool inPool(Node* node);

        Node* m_freeList;
        bool m_isDoneWithInitialFreeList;
        static const size_t m_poolSize = 256;
        union {
    /**
     *  pool[sizeof description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
            char pool[sizeof(Node) * m_poolSize];
            double forAlignment;
        } m_pool;
    };

    template<typename ValueArg> struct ListHashSetNode {
        typedef ListHashSetNodeAllocator<ValueArg> NodeAllocator;

    /**
     *  ListHashSetNode description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ListHashSetNode(ValueArg value);

    /**
     *  new description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void* operator new(size_t, NodeAllocator* allocator);
    /**
     *  destroy description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void destroy(NodeAllocator* allocator);

        ValueArg m_value;
        ListHashSetNode* m_prev;
        ListHashSetNode* m_next;

#ifndef NDEBUG
        bool m_isAllocated;
#endif
    };

    template<typename ValueArg, typename HashArg> struct ListHashSetNodeHashFunctions {
        typedef ListHashSetNode<ValueArg> Node;
        
    /**
     *  hash description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static unsigned hash(Node* const& key) ;
    /**
     *  equal description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool equal(Node* const& a, Node* const& b) ;
        static const bool safeToCompareToEmptyOrDeleted = false;
    };

    template<typename ValueArg, typename HashArg> class ListHashSetIterator {
    private:
        typedef ListHashSet<ValueArg, HashArg> ListHashSetType;
        typedef ListHashSetIterator<ValueArg, HashArg> iterator;
        typedef ListHashSetConstIterator<ValueArg, HashArg> const_iterator;
        typedef ListHashSetNode<ValueArg> Node;
        typedef ValueArg ValueType;
        typedef ValueType& ReferenceType;
        typedef ValueType* PointerType;

        friend class ListHashSet<ValueArg, HashArg>;

    /**
     *  ListHashSetIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ListHashSetIterator(const ListHashSetType* set, Node* position);

    public:
    /**
     *  ListHashSetIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ListHashSetIterator() ;

        // default copy, assignment and destructor are OK

    /**
     *  get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        PointerType get() const ;
    /**
     *  operator* description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ReferenceType operator*() const ;
    /**
     *  operator-> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        PointerType operator->() const ;

    /**
     *  operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        iterator& operator++() ;

        // postfix ++ intentionally omitted

    /**
     *  operator-- description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        iterator& operator--() ;

        // postfix -- intentionally omitted

        // Comparison.
    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool operator==(const iterator& other) const ;
    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool operator!=(const iterator& other) const ;

    /**
     *  const_iterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        operator const_iterator() const ;

    private:
    /**
     *  node description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Node* node() ;

        const_iterator m_iterator;
    };

    template<typename ValueArg, typename HashArg> class ListHashSetConstIterator {
    private:
        typedef ListHashSet<ValueArg, HashArg> ListHashSetType;
        typedef ListHashSetIterator<ValueArg, HashArg> iterator;
        typedef ListHashSetConstIterator<ValueArg, HashArg> const_iterator;
        typedef ListHashSetNode<ValueArg> Node;
        typedef ValueArg ValueType;
        typedef const ValueType& ReferenceType;
        typedef const ValueType* PointerType;

        friend class ListHashSet<ValueArg, HashArg>;
        friend class ListHashSetIterator<ValueArg, HashArg>;

    /**
     *  ListHashSetConstIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ListHashSetConstIterator(const ListHashSetType* set, Node* position);

    public:
    /**
     *  ListHashSetConstIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ListHashSetConstIterator();

    /**
     *  get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        PointerType get() const;
    /**
     *  operator* description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ReferenceType operator*() const ;
    /**
     *  operator-> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        PointerType operator->() const ;

    /**
     *  operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const_iterator& operator++();

        // postfix ++ intentionally omitted

    /**
     *  operator-- description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const_iterator& operator--();

        // postfix -- intentionally omitted

        // Comparison.
    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool operator==(const const_iterator& other) const;
    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool operator!=(const const_iterator& other) const;

    private:
    /**
     *  node description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Node* node() ;

        const ListHashSetType* m_set;
        Node* m_position;
    };


    template<typename ValueType, typename HashFunctions>     struct ListHashSetTranslator {
    private:
        typedef ListHashSetNode<ValueType> Node;
        typedef ListHashSetNodeAllocator<ValueType> NodeAllocator;
    public:
    /**
     *  hash description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static unsigned hash(const ValueType& key) ;
    /**
     *  equal description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool equal(Node* const& a, const ValueType& b) ;
    /**
     *  translate description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void translate(Node*& location, const ValueType& key, NodeAllocator* allocator);
    };

    /**
     *  U>::ListHashSet description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline ListHashSet<T, U>::ListHashSet();

    /**
     *  U>::ListHashSet description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline ListHashSet<T, U>::ListHashSet(const ListHashSet& other);

    /**
     *  U>::operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline ListHashSet<T, U>& ListHashSet<T, U>::operator=(const ListHashSet& other);

    /**
     *  U>::swap description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline void ListHashSet<T, U>::swap(ListHashSet& other);

    /**
     *  U>::~ListHashSet description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline ListHashSet<T, U>::~ListHashSet();

    /**
     *  U>::size description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline int ListHashSet<T, U>::size() const;

    /**
     *  U>::capacity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline int ListHashSet<T, U>::capacity() const;

    /**
     *  U>::isEmpty description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline bool ListHashSet<T, U>::isEmpty() const;

    /**
     *  U>::begin description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline typename ListHashSet<T, U>::iterator ListHashSet<T, U>::begin();

    /**
     *  U>::end description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline typename ListHashSet<T, U>::iterator ListHashSet<T, U>::end();

    /**
     *  U>::begin description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline typename ListHashSet<T, U>::const_iterator ListHashSet<T, U>::begin() const;

    /**
     *  U>::end description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline typename ListHashSet<T, U>::const_iterator ListHashSet<T, U>::end() const;

    /**
     *  U>::find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline typename ListHashSet<T, U>::iterator ListHashSet<T, U>::find(const ValueType& value);

    /**
     *  U>::find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline typename ListHashSet<T, U>::const_iterator ListHashSet<T, U>::find(const ValueType& value) const;

    /**
     *  U>::contains description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline bool ListHashSet<T, U>::contains(const ValueType& value) const;

    /**
     *  U>::add description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     pair<typename ListHashSet<T, U>::iterator, bool> ListHashSet<T, U>::add(const ValueType &value);


    /**
     *  U>::insertBefore description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     pair<typename ListHashSet<T, U>::iterator, bool> ListHashSet<T, U>::insertBefore(iterator it, const ValueType& newValue);


    /**
     *  U>::insertBefore description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     pair<typename ListHashSet<T, U>::iterator, bool> ListHashSet<T, U>::insertBefore(const ValueType& beforeValue, const ValueType& newValue);

    /**
     *  U>::remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline void ListHashSet<T, U>::remove(iterator it);

    /**
     *  U>::remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline void ListHashSet<T, U>::remove(const ValueType& value);

    /**
     *  U>::clear description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline void ListHashSet<T, U>::clear();

    /**
     *  U>::unlinkAndDelete description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     void ListHashSet<T, U>::unlinkAndDelete(Node* node);

    /**
     *  U>::appendNode description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     void ListHashSet<T, U>::appendNode(Node* node);


    /**
     *  U>::insertNodeBefore description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     void ListHashSet<T, U>::insertNodeBefore(Node* beforeNode, Node* newNode);

    /**
     *  U>::deleteAllNodes description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     void ListHashSet<T, U>::deleteAllNodes();

    /**
     *  U>::makeIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline ListHashSetIterator<T, U> ListHashSet<T, U>::makeIterator(Node* position) ;

    /**
     *  U>::makeConstIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline ListHashSetConstIterator<T, U> ListHashSet<T, U>::makeConstIterator(Node* position) const;

    /**
     *  deleteAllValues description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<bool, typename ValueType, typename HashTableType>     void deleteAllValues(HashTableType& collection);

    /**
     *  deleteAllValues description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline void deleteAllValues(const ListHashSet<T, U>& collection);

} // namespace WTF

using WTF::ListHashSet;

#endif /* WTF_ListHashSet_h *
