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
#ifndef WTF_HashTable_h
#define WTF_HashTable_h
/**
 *  @file  HashTable.t
 *  HashTable description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#include "FastMalloc.h"
#include "HashTraits.h"
#include <wtf/Assertions.h>

namespace WTF {

#define DUMP_HASHTABLE_STATS 0
#define CHECK_HASHTABLE_CONSISTENCY 0

#ifdef NDEBUG
#define CHECK_HASHTABLE_ITERATORS 0
#define CHECK_HASHTABLE_USE_AFTER_DESTRUCTION 0
#else
#define CHECK_HASHTABLE_ITERATORS 1
#define CHECK_HASHTABLE_USE_AFTER_DESTRUCTION 1
#endif

#if DUMP_HASHTABLE_STATS

    struct HashTableStats {
    /**
     *  ~HashTableStats description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ~HashTableStats();
        static int numAccesses;
        static int numCollisions;
        static int collisionGraph[4096];
        static int maxCollisions;
        static int numRehashes;
        static int numRemoves;
        static int numReinserts;
    /**
     *  recordCollisionAtCount description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void recordCollisionAtCount(int count);
    };

#endif

    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     class HashTable;
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     class HashTableIterator;
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     class HashTableConstIterator;

    /**
     *  addIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     void addIterator(const HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>*,
        HashTableConstIterator<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>*);

    /**
     *  removeIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     void removeIterator(HashTableConstIterator<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>*);

#if !CHECK_HASHTABLE_ITERATORS

    /**
     *  addIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     inline void addIterator(const HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>*,
        HashTableConstIterator<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>*) ;

    /**
     *  removeIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     inline void removeIterator(HashTableConstIterator<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>*) ;

#endif

    typedef enum { HashItemKnownGood } HashItemKnownGoodTag;

    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     class HashTableConstIterator : public OWBALBase {
    private:
        typedef HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits> HashTableType;
        typedef HashTableIterator<Key, Value, Extractor, HashFunctions, Traits, KeyTraits> iterator;
        typedef HashTableConstIterator<Key, Value, Extractor, HashFunctions, Traits, KeyTraits> const_iterator;
        typedef Value ValueType;
        typedef const ValueType& ReferenceType;
        typedef const ValueType* PointerType;

        friend class HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>;
        friend class HashTableIterator<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>;

    /**
     *  skipEmptyBuckets description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void skipEmptyBuckets();

    /**
     *  HashTableConstIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashTableConstIterator(const HashTableType* table, PointerType position, PointerType endPosition);

    /**
     *  HashTableConstIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashTableConstIterator(const HashTableType* table, PointerType position, PointerType endPosition, HashItemKnownGoodTag);

    public:
    /**
     *  HashTableConstIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashTableConstIterator();

        // default copy, assignment and destructor are OK if CHECK_HASHTABLE_ITERATORS is 0

#if CHECK_HASHTABLE_ITERATORS
    /**
     *  ~HashTableConstIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ~HashTableConstIterator();

    /**
     *  HashTableConstIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashTableConstIterator(const const_iterator& other);

    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const_iterator& operator=(const const_iterator& other);
#endif

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
     *  checkValidity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void checkValidity() const;


#if CHECK_HASHTABLE_ITERATORS
    /**
     *  checkValidity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void checkValidity(const const_iterator& other) const;
#else
    /**
     *  checkValidity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void checkValidity(const const_iterator&) const ;
#endif

        PointerType m_position;
        PointerType m_endPosition;

#if CHECK_HASHTABLE_ITERATORS
    public:
        mutable const HashTableType* m_table;
        mutable const_iterator* m_next;
        mutable const_iterator* m_previous;
#endif
    };

    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     class HashTableIterator : public OWBALBase {
    private:
        typedef HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits> HashTableType;
        typedef HashTableIterator<Key, Value, Extractor, HashFunctions, Traits, KeyTraits> iterator;
        typedef HashTableConstIterator<Key, Value, Extractor, HashFunctions, Traits, KeyTraits> const_iterator;
        typedef Value ValueType;
        typedef ValueType& ReferenceType;
        typedef ValueType* PointerType;

        friend class HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>;

    /**
     *  HashTableIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashTableIterator(HashTableType* table, PointerType pos, PointerType end);
    /**
     *  HashTableIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashTableIterator(HashTableType* table, PointerType pos, PointerType end, HashItemKnownGoodTag tag);

    public:
    /**
     *  HashTableIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashTableIterator() ;

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
        const_iterator m_iterator;
    };

    using std::swap;

#if !COMPILER(MSVC)
    // Visual C++ has a swap for pairs defined.

    // swap pairs by component, in case of pair members that specialize swap
    /**
     *  swap description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U> inline void swap(pair<T, U>& a, pair<T, U>& b);
#endif

    template<typename T, bool useSwap> struct Mover;
    template<typename T> struct Mover<T, true> ;
    template<typename T> struct Mover<T, false> ;

    template<typename Key, typename Value, typename HashFunctions> class IdentityHashTranslator : public OWBALBase {
    public:
    /**
     *  hash description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static unsigned hash(const Key& key) ;
    /**
     *  equal description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool equal(const Key& a, const Key& b) ;
    /**
     *  translate description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void translate(Value& location, const Key&, const Value& value) ;
    };

    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     class HashTable : public OWBALBase {
    public:
        typedef HashTableIterator<Key, Value, Extractor, HashFunctions, Traits, KeyTraits> iterator;
        typedef HashTableConstIterator<Key, Value, Extractor, HashFunctions, Traits, KeyTraits> const_iterator;
        typedef Traits ValueTraits;
        typedef Key KeyType;
        typedef Value ValueType;
        typedef IdentityHashTranslator<Key, Value, HashFunctions> IdentityTranslatorType;

    /**
     *  HashTable description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashTable();
    /**
     *  ~HashTable description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ~HashTable() ;

    /**
     *  HashTable description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashTable(const HashTable&);
    /**
     *  swap description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void swap(HashTable&);
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashTable& operator=(const HashTable&);

    /**
     *  begin description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        iterator begin() ;
    /**
     *  end description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        iterator end() ;
    /**
     *  begin description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const_iterator begin() const ;
    /**
     *  end description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const_iterator end() const ;

    /**
     *  size description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        int size() const ;
    /**
     *  capacity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        int capacity() const ;
    /**
     *  isEmpty description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool isEmpty() const ;

    /**
     *  add description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        pair<iterator, bool> add(const ValueType& value) ;

        // A special version of add() that finds the object by hashing and comparing
        // with some other type, to avoid the cost of type conversion if the object is already
        // in the table.
    /**
     *  add description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename T, typename Extra, typename HashTranslator> pair<iterator, bool> add(const T& key, const Extra&);
    /**
     *  addPassingHashCode description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename T, typename Extra, typename HashTranslator> pair<iterator, bool> addPassingHashCode(const T& key, const Extra&);

    /**
     *  find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        iterator find(const KeyType& key) ;
    /**
     *  find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const_iterator find(const KeyType& key) const ;
    /**
     *  contains description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool contains(const KeyType& key) const ;

    /**
     *  find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template <typename T, typename HashTranslator> iterator find(const T&);
    /**
     *  find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template <typename T, typename HashTranslator> const_iterator find(const T&) const;
    /**
     *  contains description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template <typename T, typename HashTranslator> bool contains(const T&) const;

    /**
     *  remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void remove(const KeyType&);
    /**
     *  remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void remove(iterator);
    /**
     *  removeWithoutEntryConsistencyCheck description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void removeWithoutEntryConsistencyCheck(iterator);
    /**
     *  clear description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void clear();

    /**
     *  isEmptyBucket description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool isEmptyBucket(const ValueType& value) ;
    /**
     *  isDeletedBucket description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool isDeletedBucket(const ValueType& value) ;
    /**
     *  isEmptyOrDeletedBucket description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool isEmptyOrDeletedBucket(const ValueType& value) ;

    /**
     *  lookup description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ValueType* lookup(const Key& key) ;
    /**
     *  lookup description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename T, typename HashTranslator> ValueType* lookup(const T&);

#if CHECK_HASHTABLE_CONSISTENCY
    /**
     *  checkTableConsistency description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void checkTableConsistency() const;
#else
    /**
     *  checkTableConsistency description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void checkTableConsistency() ;
#endif

    private:
    /**
     *  allocateTable description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static ValueType* allocateTable(int size);
    /**
     *  deallocateTable description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void deallocateTable(ValueType* table, int size);

        typedef pair<ValueType*, bool> LookupType;
        typedef pair<LookupType, unsigned> FullLookupType;

    /**
     *  lookupForWriting description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        LookupType lookupForWriting(const Key& key) ;
    /**
     *  fullLookupForWriting description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename T, typename HashTranslator> FullLookupType fullLookupForWriting(const T&);
    /**
     *  lookupForWriting description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename T, typename HashTranslator> LookupType lookupForWriting(const T&);

    /**
     *  checkKey description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename T, typename HashTranslator> void checkKey(const T&);

    /**
     *  removeAndInvalidateWithoutEntryConsistencyCheck description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void removeAndInvalidateWithoutEntryConsistencyCheck(ValueType*);
    /**
     *  removeAndInvalidate description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void removeAndInvalidate(ValueType*);
    /**
     *  remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void remove(ValueType*);

    /**
     *  shouldExpand description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool shouldExpand() const ;
    /**
     *  mustRehashInPlace description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool mustRehashInPlace() const ;
    /**
     *  shouldShrink description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool shouldShrink() const ;
    /**
     *  expand description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void expand();
    /**
     *  shrink description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void shrink() ;

    /**
     *  rehash description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void rehash(int newTableSize);
    /**
     *  reinsert description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void reinsert(ValueType&);

    /**
     *  initializeBucket description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void initializeBucket(ValueType& bucket) ;
    /**
     *  deleteBucket description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void deleteBucket(ValueType& bucket) ;

    /**
     *  makeLookupResult description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        FullLookupType makeLookupResult(ValueType* position, bool found, unsigned hash);

    /**
     *  makeIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        iterator makeIterator(ValueType* pos) ;
    /**
     *  makeConstIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const_iterator makeConstIterator(ValueType* pos) const ;
    /**
     *  makeKnownGoodIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        iterator makeKnownGoodIterator(ValueType* pos) ;
    /**
     *  makeKnownGoodConstIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const_iterator makeKnownGoodConstIterator(ValueType* pos) const ;

#if CHECK_HASHTABLE_CONSISTENCY
    /**
     *  checkTableConsistencyExceptSize description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void checkTableConsistencyExceptSize() const;
#else
    /**
     *  checkTableConsistencyExceptSize description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void checkTableConsistencyExceptSize() ;
#endif

#if CHECK_HASHTABLE_ITERATORS
    /**
     *  invalidateIterators description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void invalidateIterators();
#else
    /**
     *  invalidateIterators description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void invalidateIterators() ;
#endif

        static const int m_minTableSize = 64;
        static const int m_maxLoad = 2;
        static const int m_minLoad = 6;

        ValueType* m_table;
        int m_tableSize;
        int m_tableSizeMask;
        int m_keyCount;
        int m_deletedCount;

#if CHECK_HASHTABLE_ITERATORS
    public:
        mutable const_iterator* m_iterators;
#endif
    };

    /**
     *  KeyTraits>::HashTable description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     inline HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::HashTable();

    /**
     *  doubleHash description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    static inline unsigned doubleHash(unsigned key);

#if ASSERT_DISABLED

    /**
     *  KeyTraits>::checkKey description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     template<typename T, typename HashTranslator>     inline void HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::checkKey(const T&);

#else

    /**
     *  KeyTraits>::checkKey description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     template<typename T, typename HashTranslator>     void HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::checkKey(const T& key);

#endif

    /**
     *  KeyTraits>::lookup description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     template<typename T, typename HashTranslator>     inline Value* HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::lookup(const T& key);

    /**
     *  KeyTraits>::lookupForWriting description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     template<typename T, typename HashTranslator>     inline typename HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::LookupType HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::lookupForWriting(const T& key);

    /**
     *  KeyTraits>::fullLookupForWriting description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     template<typename T, typename HashTranslator>     inline typename HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::FullLookupType HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::fullLookupForWriting(const T& key);

    /**
     *  KeyTraits>::add description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     template<typename T, typename Extra, typename HashTranslator>     inline pair<typename HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::iterator, bool> HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::add(const T& key, const Extra& extra);

    /**
     *  KeyTraits>::addPassingHashCode description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     template<typename T, typename Extra, typename HashTranslator>     inline pair<typename HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::iterator, bool> HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::addPassingHashCode(const T& key, const Extra& extra);

    /**
     *  KeyTraits>::reinsert description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     inline void HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::reinsert(ValueType& entry);

    /**
     *  KeyTraits>::find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     template <typename T, typename HashTranslator>      typename HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::iterator HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::find(const T& key);

    /**
     *  KeyTraits>::find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     template <typename T, typename HashTranslator>      typename HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::const_iterator HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::find(const T& key) const;

    /**
     *  KeyTraits>::contains description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     template <typename T, typename HashTranslator>      bool HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::contains(const T& key) const;

    /**
     *  KeyTraits>::removeAndInvalidateWithoutEntryConsistencyCheck description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     void HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::removeAndInvalidateWithoutEntryConsistencyCheck(ValueType* pos);

    /**
     *  KeyTraits>::removeAndInvalidate description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     void HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::removeAndInvalidate(ValueType* pos);

    /**
     *  KeyTraits>::remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     void HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::remove(ValueType* pos);

    /**
     *  KeyTraits>::remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     inline void HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::remove(iterator it);

    /**
     *  KeyTraits>::removeWithoutEntryConsistencyCheck description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     inline void HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::removeWithoutEntryConsistencyCheck(iterator it);

    /**
     *  KeyTraits>::remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     inline void HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::remove(const KeyType& key);

    /**
     *  KeyTraits>::allocateTable description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     Value* HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::allocateTable(int size);

    /**
     *  KeyTraits>::deallocateTable description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     void HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::deallocateTable(ValueType* table, int size);

    /**
     *  KeyTraits>::expand description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     void HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::expand();

    /**
     *  KeyTraits>::rehash description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     void HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::rehash(int newTableSize);

    /**
     *  KeyTraits>::clear description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     void HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::clear();

    /**
     *  KeyTraits>::HashTable description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::HashTable(const HashTable& other);

    /**
     *  KeyTraits>::swap description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     void HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::swap(HashTable& other);

    /**
     *  KeyTraits>::operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>& HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::operator=(const HashTable& other);

#if CHECK_HASHTABLE_CONSISTENCY

    /**
     *  KeyTraits>::checkTableConsistency description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     void HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::checkTableConsistency() const;

    /**
     *  KeyTraits>::checkTableConsistencyExceptSize description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     void HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::checkTableConsistencyExceptSize() const;

#endif // CHECK_HASHTABLE_CONSISTENCY

#if CHECK_HASHTABLE_ITERATORS

    /**
     *  KeyTraits>::invalidateIterators description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     void HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>::invalidateIterators();

    /**
     *  addIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     void addIterator(const HashTable<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>* table,
        HashTableConstIterator<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>* it);

    /**
     *  removeIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Key, typename Value, typename Extractor, typename HashFunctions, typename Traits, typename KeyTraits>     void removeIterator(HashTableConstIterator<Key, Value, Extractor, HashFunctions, Traits, KeyTraits>* it);

#endif // CHECK_HASHTABLE_ITERATORS

    // iterator adapters

    template<typename HashTableType, typename ValueType> struct HashTableConstIteratorAdapter {
    /**
     *  HashTableConstIteratorAdapter description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashTableConstIteratorAdapter(const typename HashTableType::const_iterator& impl);

    /**
     *  get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const ValueType* get() const ;
    /**
     *  operator* description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const ValueType& operator*() const ;
    /**
     *  operator-> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const ValueType* operator->() const ;

    /**
     *  operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashTableConstIteratorAdapter& operator++() ;
        // postfix ++ intentionally omitted

        typename HashTableType::const_iterator m_impl;
    };

    template<typename HashTableType, typename ValueType> struct HashTableIteratorAdapter {
    /**
     *  HashTableIteratorAdapter description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashTableIteratorAdapter(const typename HashTableType::iterator& impl);

    /**
     *  get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ValueType* get() const ;
    /**
     *  operator* description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ValueType& operator*() const ;
    /**
     *  operator-> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ValueType* operator->() const ;

    /**
     *  operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashTableIteratorAdapter& operator++() ;
        // postfix ++ intentionally omitted

    /**
     *  ValueType> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        operator HashTableConstIteratorAdapter<HashTableType, ValueType>() ;

        typename HashTableType::iterator m_impl;
    };

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline bool operator==(const HashTableConstIteratorAdapter<T, U>& a, const HashTableConstIteratorAdapter<T, U>& b);

    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline bool operator!=(const HashTableConstIteratorAdapter<T, U>& a, const HashTableConstIteratorAdapter<T, U>& b);

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline bool operator==(const HashTableIteratorAdapter<T, U>& a, const HashTableIteratorAdapter<T, U>& b);

    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U>     inline bool operator!=(const HashTableIteratorAdapter<T, U>& a, const HashTableIteratorAdapter<T, U>& b);

} // namespace WTF

#include "HashIterators.h"

#endif // WTF_HashTable_h




