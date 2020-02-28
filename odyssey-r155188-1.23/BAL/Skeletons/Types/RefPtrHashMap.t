// -*- mode: c++; c-basic-offset: 4 -*-
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

#ifndef RefPtrHashMap_H
#define RefPtrHashMap_H
/**
 *  @file  RefPtrHashMap.t
 *  RefPtrHashMap description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"


namespace WTF {

    // This specialization is a direct copy of HashMap, with overloaded functions
    // to allow for lookup by pointer instead of RefPtr, avoiding ref-count churn.
    
    // FIXME: Find a better way that doesn't require an entire copy of the HashMap template.     
    template<typename RawKeyType, typename ValueType, typename ValueTraits, typename HashFunctions>     struct RefPtrHashMapRawKeyTranslator {
        typedef typename ValueType::first_type KeyType;
        typedef typename ValueType::second_type MappedType;
        typedef typename ValueTraits::FirstTraits KeyTraits;
        typedef typename ValueTraits::SecondTraits MappedTraits;

    /**
     *  hash description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static unsigned hash(RawKeyType key) ;
    /**
     *  equal description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool equal(const KeyType& a, RawKeyType b) ;
    /**
     *  translate description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void translate(ValueType& location, RawKeyType key, const MappedType& mapped);
    };

    template<typename T, typename MappedArg, typename HashArg, typename KeyTraitsArg, typename MappedTraitsArg>     class HashMap<RefPtr<T>, MappedArg, HashArg, KeyTraitsArg, MappedTraitsArg> : public OWBALBase {
    private:
        typedef KeyTraitsArg KeyTraits;
        typedef MappedTraitsArg MappedTraits;
        typedef PairHashTraits<KeyTraits, MappedTraits> ValueTraits;

    public:
        typedef typename KeyTraits::TraitType KeyType;
        typedef T* RawKeyType;
        typedef typename MappedTraits::TraitType MappedType;
        typedef typename ValueTraits::TraitType ValueType;

    private:
        typedef HashArg HashFunctions;

        typedef HashTable<KeyType, ValueType, PairFirstExtractor<ValueType>,
            HashFunctions, ValueTraits, KeyTraits> HashTableType;

        typedef RefPtrHashMapRawKeyTranslator<RawKeyType, ValueType, ValueTraits, HashFunctions>
            RawKeyTranslator;

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
        iterator find(RawKeyType);
    /**
     *  find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const_iterator find(const KeyType&) const;
    /**
     *  find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const_iterator find(RawKeyType) const;
    /**
     *  contains description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool contains(const KeyType&) const;
    /**
     *  contains description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool contains(RawKeyType) const;
    /**
     *  get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        MappedType get(const KeyType&) const;
    /**
     *  get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        MappedType get(RawKeyType) const;
    /**
     *  inlineGet description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        MappedType inlineGet(RawKeyType) const;

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
    /**
     *  set description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        pair<iterator, bool> set(RawKeyType, const MappedType&); 

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
     *  add description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        pair<iterator, bool> add(RawKeyType, const MappedType&); 

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
        void remove(RawKeyType);
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
    /**
     *  take description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        MappedType take(RawKeyType); // efficient combination of get with remove

    private:
    /**
     *  inlineAdd description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        pair<iterator, bool> inlineAdd(const KeyType&, const MappedType&);
    /**
     *  inlineAdd description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        pair<iterator, bool> inlineAdd(RawKeyType, const MappedType&);

        HashTableType m_impl;
    };
    
    /**
     *  X>::swap description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline void HashMap<RefPtr<T>, U, V, W, X>::swap(HashMap& other);

    /**
     *  X>::size description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline int HashMap<RefPtr<T>, U, V, W, X>::size() const;

    /**
     *  X>::capacity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline int HashMap<RefPtr<T>, U, V, W, X>::capacity() const;

    /**
     *  X>::isEmpty description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline bool HashMap<RefPtr<T>, U, V, W, X>::isEmpty() const;

    /**
     *  X>::begin description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline typename HashMap<RefPtr<T>, U, V, W, X>::iterator HashMap<RefPtr<T>, U, V, W, X>::begin();

    /**
     *  X>::end description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline typename HashMap<RefPtr<T>, U, V, W, X>::iterator HashMap<RefPtr<T>, U, V, W, X>::end();

    /**
     *  X>::begin description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline typename HashMap<RefPtr<T>, U, V, W, X>::const_iterator HashMap<RefPtr<T>, U, V, W, X>::begin() const;

    /**
     *  X>::end description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline typename HashMap<RefPtr<T>, U, V, W, X>::const_iterator HashMap<RefPtr<T>, U, V, W, X>::end() const;

    /**
     *  X>::find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline typename HashMap<RefPtr<T>, U, V, W, X>::iterator HashMap<RefPtr<T>, U, V, W, X>::find(const KeyType& key);

    /**
     *  X>::find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline typename HashMap<RefPtr<T>, U, V, W, X>::iterator HashMap<RefPtr<T>, U, V, W, X>::find(RawKeyType key);

    /**
     *  X>::find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline typename HashMap<RefPtr<T>, U, V, W, X>::const_iterator HashMap<RefPtr<T>, U, V, W, X>::find(const KeyType& key) const;

    /**
     *  X>::find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline typename HashMap<RefPtr<T>, U, V, W, X>::const_iterator HashMap<RefPtr<T>, U, V, W, X>::find(RawKeyType key) const;

    /**
     *  X>::contains description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline bool HashMap<RefPtr<T>, U, V, W, X>::contains(const KeyType& key) const;

    /**
     *  X>::contains description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline bool HashMap<RefPtr<T>, U, V, W, X>::contains(RawKeyType key) const;

    template<typename T, typename U, typename V, typename W, typename X>     inline pair<typename HashMap<RefPtr<T>, U, V, W, X>::iterator, bool>
    /**
     *  X>::inlineAdd description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    HashMap<RefPtr<T>, U, V, W, X>::inlineAdd(const KeyType& key, const MappedType& mapped) ;

    template<typename T, typename U, typename V, typename W, typename X>     inline pair<typename HashMap<RefPtr<T>, U, V, W, X>::iterator, bool>
    /**
     *  X>::inlineAdd description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    HashMap<RefPtr<T>, U, V, W, X>::inlineAdd(RawKeyType key, const MappedType& mapped) ;

    template<typename T, typename U, typename V, typename W, typename X>     pair<typename HashMap<RefPtr<T>, U, V, W, X>::iterator, bool>
    /**
     *  X>::set description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    HashMap<RefPtr<T>, U, V, W, X>::set(const KeyType& key, const MappedType& mapped) ;

    template<typename T, typename U, typename V, typename W, typename X>     pair<typename HashMap<RefPtr<T>, U, V, W, X>::iterator, bool>
    /**
     *  X>::set description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    HashMap<RefPtr<T>, U, V, W, X>::set(RawKeyType key, const MappedType& mapped) ;

    template<typename T, typename U, typename V, typename W, typename X>     pair<typename HashMap<RefPtr<T>, U, V, W, X>::iterator, bool>
    /**
     *  X>::add description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    HashMap<RefPtr<T>, U, V, W, X>::add(const KeyType& key, const MappedType& mapped);

    template<typename T, typename U, typename V, typename W, typename X>     pair<typename HashMap<RefPtr<T>, U, V, W, X>::iterator, bool>
    /**
     *  X>::add description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    HashMap<RefPtr<T>, U, V, W, X>::add(RawKeyType key, const MappedType& mapped);

    template<typename T, typename U, typename V, typename W, typename MappedTraits>     typename HashMap<RefPtr<T>, U, V, W, MappedTraits>::MappedType
    /**
     *  MappedTraits>::get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    HashMap<RefPtr<T>, U, V, W, MappedTraits>::get(const KeyType& key) const;

    template<typename T, typename U, typename V, typename W, typename MappedTraits>     typename HashMap<RefPtr<T>, U, V, W, MappedTraits>::MappedType
    /**
     *  MappedTraits>::inlineGet description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline HashMap<RefPtr<T>, U, V, W, MappedTraits>::inlineGet(RawKeyType key) const;

    template<typename T, typename U, typename V, typename W, typename MappedTraits>     typename HashMap<RefPtr<T>, U, V, W, MappedTraits>::MappedType
    /**
     *  MappedTraits>::get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    HashMap<RefPtr<T>, U, V, W, MappedTraits>::get(RawKeyType key) const;

    /**
     *  X>::remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline void HashMap<RefPtr<T>, U, V, W, X>::remove(iterator it);

    /**
     *  X>::remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline void HashMap<RefPtr<T>, U, V, W, X>::remove(const KeyType& key);

    /**
     *  X>::remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline void HashMap<RefPtr<T>, U, V, W, X>::remove(RawKeyType key);

    /**
     *  X>::clear description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W, typename X>     inline void HashMap<RefPtr<T>, U, V, W, X>::clear();

    template<typename T, typename U, typename V, typename W, typename MappedTraits>     typename HashMap<RefPtr<T>, U, V, W, MappedTraits>::MappedType
    /**
     *  MappedTraits>::take description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    HashMap<RefPtr<T>, U, V, W, MappedTraits>::take(const KeyType& key);

    template<typename T, typename U, typename V, typename W, typename MappedTraits>     typename HashMap<RefPtr<T>, U, V, W, MappedTraits>::MappedType
    /**
     *  MappedTraits>::take description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    HashMap<RefPtr<T>, U, V, W, MappedTraits>::take(RawKeyType key);

} // namespace WTF




