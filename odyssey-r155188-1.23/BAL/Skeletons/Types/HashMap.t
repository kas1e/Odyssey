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
#ifndef WTF_HashMap_h
#define WTF_HashMap_h
/**
 *  @file  HashMap.t
 *  HashMap description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#include "HashTable.h"

namespace WTF {

    template<typename PairType> struct PairFirstExtractor;

    template<typename KeyArg, typename MappedArg, typename HashArg = typename DefaultHash<KeyArg>::Hash,         typename KeyTraitsArg = HashTraits<KeyArg>, typename MappedTraitsArg = HashTraits<MappedArg> >
    class HashMap {
    private:
        typedef KeyTraitsArg KeyTraits;
        typedef MappedTraitsArg MappedTraits;
        typedef PairHashTraits<KeyTraits, MappedTraits> ValueTraits;

    public:
        typedef typename KeyTraits::TraitType KeyType;
        typedef typename MappedTraits::TraitType MappedType;
        typedef typename ValueTraits::TraitType ValueType;

    private:
        typedef HashArg HashFunctions;

        typedef HashTable<KeyType, ValueType, PairFirstExtractor<ValueType>,
            HashFunctions, ValueTraits, KeyTraits> HashTableType;

    public:
        typedef HashTableIteratorAdapter<HashTableType, ValueType> iterator;
        typedef HashTableConstIteratorAdapter<HashTableType, ValueType> const_iterator;

    /**
     *  swap description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void swap(HashMap&);

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

        // iterators iterate over pairs of keys and values
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
        iterator find(const KeyType&);
    /**
     *  find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const_iterator find(const KeyType&) const;
    /**
     *  contains description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool contains(const KeyType&) const;
    /**
     *  get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        MappedType get(const KeyType&) const;

        // replaces value but not key if key is already present
        // return value is a pair of the iterator to the key location, 
        // and a boolean that's true if a new value was actually added
    /**
     *  set description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        pair<iterator, bool> set(const KeyType&, const MappedType&); 

        // does nothing if key is already present
        // return value is a pair of the iterator to the key location, 
        // and a boolean that's true if a new value was actually added
    /**
     *  add description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        pair<iterator, bool> add(const KeyType&, const MappedType&); 

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
     *  clear description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void clear();

    /**
     *  take description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        MappedType take(const KeyType&); // efficient combination of get with remove

    private:
    /**
     *  inlineAdd description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        pair<iterator, bool> inlineAdd(const KeyType&, const MappedType&);

        HashTableType m_impl;
    };

    template<typename PairType> struct PairFirstExtractor {
    /**
     *  extract description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static const typename PairType::first_type& extract(const PairType& p) ;
    };

    template<typename ValueType, typename ValueTraits, typename HashFunctions>     struct HashMapTranslator {
        typedef typename ValueType::first_type KeyType;
        typedef typename ValueType::second_type MappedType;

    /**
     *  hash description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static unsigned hash(const KeyType& key) ;
    /**
     *  equal description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool equal(const KeyType& a, const KeyType& b) ;
    /**
     *  translate description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void translate(ValueType& location, const KeyType& key, const MappedType& mapped);
    };

    /**
     *  X>::swap description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline void HashMap<T, U, V, W, X>::swap(HashMap& other);

    /**
     *  X>::size description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline int HashMap<T, U, V, W, X>::size() const;

    /**
     *  X>::capacity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline int HashMap<T, U, V, W, X>::capacity() const;

    /**
     *  X>::isEmpty description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline bool HashMap<T, U, V, W, X>::isEmpty() const;

    /**
     *  X>::begin description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline typename HashMap<T, U, V, W, X>::iterator HashMap<T, U, V, W, X>::begin();

    /**
     *  X>::end description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline typename HashMap<T, U, V, W, X>::iterator HashMap<T, U, V, W, X>::end();

    /**
     *  X>::begin description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline typename HashMap<T, U, V, W, X>::const_iterator HashMap<T, U, V, W, X>::begin() const;

    /**
     *  X>::end description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline typename HashMap<T, U, V, W, X>::const_iterator HashMap<T, U, V, W, X>::end() const;

    /**
     *  X>::find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline typename HashMap<T, U, V, W, X>::iterator HashMap<T, U, V, W, X>::find(const KeyType& key);

    /**
     *  X>::find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline typename HashMap<T, U, V, W, X>::const_iterator HashMap<T, U, V, W, X>::find(const KeyType& key) const;

    /**
     *  X>::contains description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline bool HashMap<T, U, V, W, X>::contains(const KeyType& key) const;

    template<typename T, typename U, typename V, typename W, typename X>     inline pair<typename HashMap<T, U, V, W, X>::iterator, bool>
    /**
     *  X>::inlineAdd description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    HashMap<T, U, V, W, X>::inlineAdd(const KeyType& key, const MappedType& mapped) ;

    template<typename T, typename U, typename V, typename W, typename X>     pair<typename HashMap<T, U, V, W, X>::iterator, bool>
    /**
     *  X>::set description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    HashMap<T, U, V, W, X>::set(const KeyType& key, const MappedType& mapped) ;

    template<typename T, typename U, typename V, typename W, typename X>     pair<typename HashMap<T, U, V, W, X>::iterator, bool>
    /**
     *  X>::add description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    HashMap<T, U, V, W, X>::add(const KeyType& key, const MappedType& mapped);

    template<typename T, typename U, typename V, typename W, typename MappedTraits>     typename HashMap<T, U, V, W, MappedTraits>::MappedType
    /**
     *  MappedTraits>::get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    HashMap<T, U, V, W, MappedTraits>::get(const KeyType& key) const;

    /**
     *  X>::remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline void HashMap<T, U, V, W, X>::remove(iterator it);

    /**
     *  X>::remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline void HashMap<T, U, V, W, X>::remove(const KeyType& key);

    /**
     *  X>::clear description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline void HashMap<T, U, V, W, X>::clear();

    template<typename T, typename U, typename V, typename W, typename MappedTraits>     typename HashMap<T, U, V, W, MappedTraits>::MappedType
    /**
     *  MappedTraits>::take description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    HashMap<T, U, V, W, MappedTraits>::take(const KeyType& key);

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     bool operator==(const HashMap<T, U, V, W, X>& a, const HashMap<T, U, V, W, X>& b);

    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline bool operator!=(const HashMap<T, U, V, W, X>& a, const HashMap<T, U, V, W, X>& b);

    /**
     *  deleteAllPairSeconds description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename MappedType, typename HashTableType>     void deleteAllPairSeconds(HashTableType& collection);

    /**
     *  deleteAllValues description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline void deleteAllValues(const HashMap<T, U, V, W, X>& collection);

    /**
     *  deleteAllPairFirsts description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename KeyType, typename HashTableType>     void deleteAllPairFirsts(HashTableType& collection);

    /**
     *  deleteAllKeys description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline void deleteAllKeys(const HashMap<T, U, V, W, X>& collection);
    
    /**
     *  copyKeysToVector description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X, typename Y>     inline void copyKeysToVector(const HashMap<T, U, V, W, X>& collection, Y& vector);

    /**
     *  copyValuesToVector description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X, typename Y>     inline void copyValuesToVector(const HashMap<T, U, V, W, X>& collection, Y& vector);

} // namespace WTF

using WTF::HashMap;

#include "RefPtrHashMap.h"

#endif /* WTF_HashMap_h */




