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
#ifndef WTF_HashIterators_h
#define WTF_HashIterators_h
/**
 *  @file  HashIterators.t
 *  HashIterators description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

namespace WTF {

    template<typename HashTableType, typename KeyType, typename MappedType> struct HashTableConstKeysIterator;
    template<typename HashTableType, typename KeyType, typename MappedType> struct HashTableConstValuesIterator;
    template<typename HashTableType, typename KeyType, typename MappedType> struct HashTableKeysIterator;
    template<typename HashTableType, typename KeyType, typename MappedType> struct HashTableValuesIterator;

    template<typename HashTableType, typename KeyType, typename MappedType> struct HashTableConstIteratorAdapter<HashTableType, std::pair<KeyType, MappedType> > {
    private:
        typedef std::pair<KeyType, MappedType> ValueType;
    public:
        typedef HashTableConstKeysIterator<HashTableType, KeyType, MappedType> Keys;
        typedef HashTableConstValuesIterator<HashTableType, KeyType, MappedType> Values;

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

    /**
     *  keys description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Keys keys() ;
    /**
     *  values description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Values values() ;

        typename HashTableType::const_iterator m_impl;
    };

    template<typename HashTableType, typename KeyType, typename MappedType> struct HashTableIteratorAdapter<HashTableType, std::pair<KeyType, MappedType> > {
    private:
        typedef std::pair<KeyType, MappedType> ValueType;
    public:
        typedef HashTableKeysIterator<HashTableType, KeyType, MappedType> Keys;
        typedef HashTableValuesIterator<HashTableType, KeyType, MappedType> Values;

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

    /**
     *  keys description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Keys keys() ;
    /**
     *  values description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Values values() ;

        typename HashTableType::iterator m_impl;
    };

    template<typename HashTableType, typename KeyType, typename MappedType> struct HashTableConstKeysIterator {
    private:
        typedef HashTableConstIteratorAdapter<HashTableType, std::pair<KeyType, MappedType> > ConstIterator;

    public:
    /**
     *  HashTableConstKeysIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashTableConstKeysIterator(const ConstIterator& impl);
        
    /**
     *  get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const KeyType* get() const ;
    /**
     *  operator* description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const KeyType& operator*() const ;
    /**
     *  operator-> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const KeyType* operator->() const ;

    /**
     *  operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashTableConstKeysIterator& operator++() ;
        // postfix ++ intentionally omitted

        ConstIterator m_impl;
    };

    template<typename HashTableType, typename KeyType, typename MappedType> struct HashTableConstValuesIterator {
    private:
        typedef HashTableConstIteratorAdapter<HashTableType, std::pair<KeyType, MappedType> > ConstIterator;

    public:
    /**
     *  HashTableConstValuesIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashTableConstValuesIterator(const ConstIterator& impl);
        
    /**
     *  get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const MappedType* get() const ;
    /**
     *  operator* description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const MappedType& operator*() const ;
    /**
     *  operator-> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const MappedType* operator->() const ;

    /**
     *  operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashTableConstValuesIterator& operator++() ;
        // postfix ++ intentionally omitted

        ConstIterator m_impl;
    };

    template<typename HashTableType, typename KeyType, typename MappedType> struct HashTableKeysIterator {
    private:
        typedef HashTableIteratorAdapter<HashTableType, std::pair<KeyType, MappedType> > Iterator;
        typedef HashTableConstIteratorAdapter<HashTableType, std::pair<KeyType, MappedType> > ConstIterator;

    public:
    /**
     *  HashTableKeysIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashTableKeysIterator(const Iterator& impl);
        
    /**
     *  get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        KeyType* get() const ;
    /**
     *  operator* description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        KeyType& operator*() const ;
    /**
     *  operator-> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        KeyType* operator->() const ;

    /**
     *  operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashTableKeysIterator& operator++() ;
        // postfix ++ intentionally omitted

    /**
     *  MappedType> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        operator HashTableConstKeysIterator<HashTableType, KeyType, MappedType>() ;

        Iterator m_impl;
    };

    template<typename HashTableType, typename KeyType, typename MappedType> struct HashTableValuesIterator {
    private:
        typedef HashTableIteratorAdapter<HashTableType, std::pair<KeyType, MappedType> > Iterator;
        typedef HashTableConstIteratorAdapter<HashTableType, std::pair<KeyType, MappedType> > ConstIterator;

    public:
    /**
     *  HashTableValuesIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashTableValuesIterator(const Iterator& impl);
        
    /**
     *  get description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        MappedType* get() const ;
    /**
     *  operator* description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        MappedType& operator*() const ;
    /**
     *  operator-> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        MappedType* operator->() const ;

    /**
     *  operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashTableValuesIterator& operator++() ;
        // postfix ++ intentionally omitted

    /**
     *  MappedType> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        operator HashTableConstValuesIterator<HashTableType, KeyType, MappedType>() ;

        Iterator m_impl;
    };

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>         inline bool operator==(const HashTableConstKeysIterator<T, U, V>& a, const HashTableConstKeysIterator<T, U, V>& b);

    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>         inline bool operator!=(const HashTableConstKeysIterator<T, U, V>& a, const HashTableConstKeysIterator<T, U, V>& b);

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>         inline bool operator==(const HashTableConstValuesIterator<T, U, V>& a, const HashTableConstValuesIterator<T, U, V>& b);

    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>         inline bool operator!=(const HashTableConstValuesIterator<T, U, V>& a, const HashTableConstValuesIterator<T, U, V>& b);

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>         inline bool operator==(const HashTableKeysIterator<T, U, V>& a, const HashTableKeysIterator<T, U, V>& b);

    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>         inline bool operator!=(const HashTableKeysIterator<T, U, V>& a, const HashTableKeysIterator<T, U, V>& b);

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>         inline bool operator==(const HashTableValuesIterator<T, U, V>& a, const HashTableValuesIterator<T, U, V>& b);

    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, typename U, typename V>         inline bool operator!=(const HashTableValuesIterator<T, U, V>& a, const HashTableValuesIterator<T, U, V>& b);


} // namespace WTF

#endif // WTF_HashIterators_h




