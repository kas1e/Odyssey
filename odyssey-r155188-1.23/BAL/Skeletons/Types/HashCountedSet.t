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
#ifndef WTF_HashCountedSet_h
#define WTF_HashCountedSet_h
/**
 *  @file  HashCountedSet.t
 *  HashCountedSet description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#include "Assertions.h"
#include "HashMap.h"
#include "Vector.h"

namespace WTF {

    template<typename Value, typename HashFunctions = typename DefaultHash<Value>::Hash,         typename Traits = HashTraits<Value> > class HashCountedSet : public OWBALBase {
    private:
        typedef HashMap<Value, unsigned, HashFunctions, Traits> ImplType;
    public:
        typedef Value ValueType;
        typedef typename ImplType::iterator iterator;
        typedef typename ImplType::const_iterator const_iterator;
        
    /**
     *  HashCountedSet description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        HashCountedSet() ;
        
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
        
        // iterators iterate over pairs of values and counts
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
        iterator find(const ValueType& value);
    /**
     *  find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const_iterator find(const ValueType& value) const;
    /**
     *  contains description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool contains(const ValueType& value) const;
    /**
     *  count description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        unsigned count(const ValueType& value) const;

        // increases the count if an equal value is already present
        // the return value is a pair of an interator to the new value's location, 
        // and a bool that is true if an new entry was added
    /**
     *  add description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        std::pair<iterator, bool> add(const ValueType &value);
        
        // reduces the count of the value, and removes it if count
        // goes down to zero
    /**
     *  remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void remove(const ValueType& value);
    /**
     *  remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void remove(iterator it);
 
    /**
     *  clear description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
       void clear();
        
    private:
        ImplType m_impl;
    };
    
    /**
     *  Traits>::size description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Value, typename HashFunctions, typename Traits>     inline int HashCountedSet<Value, HashFunctions, Traits>::size() const;
    
    /**
     *  Traits>::capacity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Value, typename HashFunctions, typename Traits>     inline int HashCountedSet<Value, HashFunctions, Traits>::capacity() const;
    
    /**
     *  Traits>::isEmpty description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Value, typename HashFunctions, typename Traits>     inline bool HashCountedSet<Value, HashFunctions, Traits>::isEmpty() const;
    
    /**
     *  Traits>::begin description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Value, typename HashFunctions, typename Traits>     inline typename HashCountedSet<Value, HashFunctions, Traits>::iterator HashCountedSet<Value, HashFunctions, Traits>::begin();

    /**
     *  Traits>::end description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Value, typename HashFunctions, typename Traits>     inline typename HashCountedSet<Value, HashFunctions, Traits>::iterator HashCountedSet<Value, HashFunctions, Traits>::end();
    
    /**
     *  Traits>::begin description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Value, typename HashFunctions, typename Traits>     inline typename HashCountedSet<Value, HashFunctions, Traits>::const_iterator HashCountedSet<Value, HashFunctions, Traits>::begin() const;
    
    /**
     *  Traits>::end description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Value, typename HashFunctions, typename Traits>     inline typename HashCountedSet<Value, HashFunctions, Traits>::const_iterator HashCountedSet<Value, HashFunctions, Traits>::end() const;
    
    /**
     *  Traits>::find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Value, typename HashFunctions, typename Traits>     inline typename HashCountedSet<Value, HashFunctions, Traits>::iterator HashCountedSet<Value, HashFunctions, Traits>::find(const ValueType& value);
    
    /**
     *  Traits>::find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Value, typename HashFunctions, typename Traits>     inline typename HashCountedSet<Value, HashFunctions, Traits>::const_iterator HashCountedSet<Value, HashFunctions, Traits>::find(const ValueType& value) const;
    
    /**
     *  Traits>::contains description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Value, typename HashFunctions, typename Traits>     inline bool HashCountedSet<Value, HashFunctions, Traits>::contains(const ValueType& value) const;

    /**
     *  Traits>::count description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Value, typename HashFunctions, typename Traits>     inline unsigned HashCountedSet<Value, HashFunctions, Traits>::count(const ValueType& value) const;
    
    /**
     *  Traits>::add description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Value, typename HashFunctions, typename Traits>     inline std::pair<typename HashCountedSet<Value, HashFunctions, Traits>::iterator, bool> HashCountedSet<Value, HashFunctions, Traits>::add(const ValueType &value);
    
    /**
     *  Traits>::remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Value, typename HashFunctions, typename Traits>     inline void HashCountedSet<Value, HashFunctions, Traits>::remove(const ValueType& value);
    
    /**
     *  Traits>::remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Value, typename HashFunctions, typename Traits>     inline void HashCountedSet<Value, HashFunctions, Traits>::remove(iterator it);
    
    /**
     *  Traits>::clear description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Value, typename HashFunctions, typename Traits>     inline void HashCountedSet<Value, HashFunctions, Traits>::clear();
    
    /**
     *  copyToVector description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Value, typename HashFunctions, typename Traits, typename VectorType>     inline void copyToVector(const HashCountedSet<Value, HashFunctions, Traits>& collection, VectorType& vector);

    /**
     *  copyToVector description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename Value, typename HashFunctions, typename Traits>     inline void copyToVector(const HashCountedSet<Value, HashFunctions, Traits>& collection, Vector<Value>& vector);


} // namespace khtml

using WTF::HashCountedSet;

#endif /* WTF_HashCountedSet_h */




