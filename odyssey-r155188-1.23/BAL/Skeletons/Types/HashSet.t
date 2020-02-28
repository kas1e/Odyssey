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
#ifndef WTF_HashSet_h
#define WTF_HashSet_h
/**
 *  @file  HashSet.t
 *  HashSet description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#include "HashTable.h"

namespace WTF {

    template<typename Value, typename HashFunctions, typename Traits> class HashSet;
    /**
     *  deleteAllValues description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Value, typename HashFunctions, typename Traits>     void deleteAllValues(const HashSet<Value, HashFunctions, Traits>&);

    template<typename T> struct IdentityExtractor;

    template<typename ValueArg, typename HashArg = typename DefaultHash<ValueArg>::Hash,         typename TraitsArg = HashTraits<ValueArg> > class HashSet : public OWBALBase {
    private:
        typedef HashArg HashFunctions;
        typedef TraitsArg ValueTraits;

    public:
        typedef typename ValueTraits::TraitType ValueType;

    private:
        typedef HashTable<ValueType, ValueType, IdentityExtractor<ValueType>,
            HashFunctions, ValueTraits, ValueTraits> HashTableType;

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
        void swap(HashSet&);

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

        // An alternate version of find() that finds the object by hashing and comparing
        // with some other type, to avoid the cost of type conversion. HashTranslator
        // must have the following function members:
        //   static unsigned hash(const T&);
        //   static bool equal(const ValueType&, const T&);
    /**
     *  find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename T, typename HashTranslator> iterator find(const T&);
    /**
     *  find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename T, typename HashTranslator> const_iterator find(const T&) const;
    /**
     *  contains description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename T, typename HashTranslator> bool contains(const T&) const;

        // The return value is a pair of an interator to the new value's location, 
        // and a bool that is true if an new entry was added.
    /**
     *  add description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        pair<iterator, bool> add(const ValueType&);

        // An alternate version of add() that finds the object by hashing and comparing
        // with some other type, to avoid the cost of type conversion if the object is already
        // in the table. HashTranslator must have the following methods:
        //   static unsigned hash(const T&);
        //   static bool equal(const ValueType&, const T&);
        //   static translate(ValueType&, const T&, unsigned hashCode);
    /**
     *  add description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename T, typename HashTranslator> pair<iterator, bool> add(const T&);

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
     *  deleteAllValues<> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        friend void deleteAllValues<>(const HashSet&);

        HashTableType m_impl;
    };

    template<typename T> struct IdentityExtractor {
    /**
     *  extract description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static const T& extract(const T& t) ;
    };

    template<typename ValueType, typename ValueTraits, typename T, typename Translator>     struct HashSetTranslatorAdapter {
    /**
     *  hash description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static unsigned hash(const T& key) ;
    /**
     *  equal description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool equal(const ValueType& a, const T& b) ;
    /**
     *  translate description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void translate(ValueType& location, const T& key, const T&, unsigned hashCode);
    };

    /**
     *  V>::swap description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>     inline void HashSet<T, U, V>::swap(HashSet& other);

    /**
     *  V>::size description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>     inline int HashSet<T, U, V>::size() const;

    /**
     *  V>::capacity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>     inline int HashSet<T, U, V>::capacity() const;

    /**
     *  V>::isEmpty description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>     inline bool HashSet<T, U, V>::isEmpty() const;

    /**
     *  V>::begin description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>     inline typename HashSet<T, U, V>::iterator HashSet<T, U, V>::begin();

    /**
     *  V>::end description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>     inline typename HashSet<T, U, V>::iterator HashSet<T, U, V>::end();

    /**
     *  V>::begin description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>     inline typename HashSet<T, U, V>::const_iterator HashSet<T, U, V>::begin() const;

    /**
     *  V>::end description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>     inline typename HashSet<T, U, V>::const_iterator HashSet<T, U, V>::end() const;

    /**
     *  V>::find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>     inline typename HashSet<T, U, V>::iterator HashSet<T, U, V>::find(const ValueType& value);

    /**
     *  V>::find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>     inline typename HashSet<T, U, V>::const_iterator HashSet<T, U, V>::find(const ValueType& value) const;

    /**
     *  V>::contains description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>     inline bool HashSet<T, U, V>::contains(const ValueType& value) const;

    template<typename Value, typename HashFunctions, typename Traits>     template<typename T, typename Translator>      typename HashSet<Value, HashFunctions, Traits>::iterator
    /**
     *  Traits>::find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline HashSet<Value, HashFunctions, Traits>::find(const T& value);

    template<typename Value, typename HashFunctions, typename Traits>     template<typename T, typename Translator>      typename HashSet<Value, HashFunctions, Traits>::const_iterator
    /**
     *  Traits>::find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    inline HashSet<Value, HashFunctions, Traits>::find(const T& value) const;

    /**
     *  Traits>::contains description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Value, typename HashFunctions, typename Traits>     template<typename T, typename Translator>      inline bool HashSet<Value, HashFunctions, Traits>::contains(const T& value) const;

    /**
     *  V>::add description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>     pair<typename HashSet<T, U, V>::iterator, bool> HashSet<T, U, V>::add(const ValueType& value);

    template<typename Value, typename HashFunctions, typename Traits>     template<typename T, typename Translator>      pair<typename HashSet<Value, HashFunctions, Traits>::iterator, bool>
    /**
     *  Traits>::add description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    HashSet<Value, HashFunctions, Traits>::add(const T& value);

    /**
     *  V>::remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>     inline void HashSet<T, U, V>::remove(iterator it);

    /**
     *  V>::remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>     inline void HashSet<T, U, V>::remove(const ValueType& value);

    /**
     *  V>::clear description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>     inline void HashSet<T, U, V>::clear();

    /**
     *  deleteAllValues description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename ValueType, typename HashTableType>     void deleteAllValues(HashTableType& collection);

    /**
     *  deleteAllValues description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>     inline void deleteAllValues(const HashSet<T, U, V>& collection);
    
    /**
     *  copyToVector description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V, typename W>     inline void copyToVector(const HashSet<T, U, V>& collection, W& vector);

} // namespace WTF

using WTF::HashSet;

#endif /* WTF_HashSet_h */




