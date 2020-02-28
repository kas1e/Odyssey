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
#ifndef WTF_Deque_h
#define WTF_Deque_h
/**
 *  @file  Deque.t
 *  Deque description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

// FIXME: Could move what Vector and Deque share into a separate file.
// Deque doesn't actually use Vector.

#include "Vector.h"

namespace WTF {

    template<typename T> class DequeIteratorBase;
    template<typename T> class DequeIterator;
    template<typename T> class DequeConstIterator;
    template<typename T> class DequeReverseIterator;
    template<typename T> class DequeConstReverseIterator;

    template<typename T>     class Deque : public OWBALBase {
    public:
        typedef DequeIterator<T> iterator;
        typedef DequeConstIterator<T> const_iterator;
        typedef DequeReverseIterator<T> reverse_iterator;
        typedef DequeConstReverseIterator<T> const_reverse_iterator;

    /**
     *  Deque description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Deque();
    /**
     *  Deque description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Deque(const Deque<T>&);
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Deque& operator=(const Deque<T>&);
    /**
     *  ~Deque description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ~Deque();

    /**
     *  swap description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void swap(Deque<T>&);

    /**
     *  size description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        size_t size() const ;
    /**
     *  isEmpty description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool isEmpty() const ;

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
     *  rbegin description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        reverse_iterator rbegin() ;
    /**
     *  rend description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        reverse_iterator rend() ;
    /**
     *  rbegin description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const_reverse_iterator rbegin() const ;
    /**
     *  rend description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const_reverse_iterator rend() const ;

    /**
     *  first description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T& first() ;
    /**
     *  first description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const T& first() const ;

    /**
     *  append description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename U> void append(const U&);
    /**
     *  prepend description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename U> void prepend(const U&);
    /**
     *  removeFirst description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void removeFirst();

    /**
     *  clear description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void clear();

    private:
        friend class DequeIteratorBase<T>;

        typedef VectorBuffer<T, 0> Buffer;
        typedef VectorTypeOperations<T> TypeOperations;
        typedef DequeIteratorBase<T> IteratorBase;

    /**
     *  invalidateIterators description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void invalidateIterators();
    /**
     *  destroyAll description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void destroyAll();
    /**
     *  checkValidity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void checkValidity() const;
    /**
     *  checkIndexValidity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void checkIndexValidity(size_t) const;
    /**
     *  expandCapacityIfNeeded description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void expandCapacityIfNeeded();
    /**
     *  expandCapacity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void expandCapacity();

        size_t m_start;
        size_t m_end;
        Buffer m_buffer;
#ifndef NDEBUG
        mutable IteratorBase* m_iterators;
#endif
    };

    template<typename T>     class DequeIteratorBase : public OWBALBase {
    private:
        typedef DequeIteratorBase<T> Base;

    protected:
    /**
     *  DequeIteratorBase description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        DequeIteratorBase();
    /**
     *  DequeIteratorBase description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        DequeIteratorBase(const Deque<T>*, size_t);
    /**
     *  DequeIteratorBase description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        DequeIteratorBase(const Base&);
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Base& operator=(const Base&);
    /**
     *  ~DequeIteratorBase description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ~DequeIteratorBase();

    /**
     *  assign description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void assign(const Base& other) ;

    /**
     *  increment description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void increment();
    /**
     *  decrement description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void decrement();

    /**
     *  before description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T* before() const;
    /**
     *  after description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T* after() const;

    /**
     *  isEqual description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool isEqual(const Base&) const;

    private:
    /**
     *  addToIteratorsList description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void addToIteratorsList();
    /**
     *  checkValidity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void checkValidity() const;
    /**
     *  checkValidity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void checkValidity(const Base&) const;

        Deque<T>* m_deque;
        size_t m_index;

        friend class Deque<T>;

#ifndef NDEBUG
        mutable DequeIteratorBase* m_next;
        mutable DequeIteratorBase* m_previous;
#endif
    };

    template<typename T>     class DequeIterator : public OWBALBase, public DequeIteratorBase<T> {
    private:
        typedef DequeIteratorBase<T> Base;
        typedef DequeIterator<T> Iterator;

    public:
    /**
     *  DequeIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        DequeIterator(Deque<T>* deque, size_t index);

    /**
     *  DequeIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        DequeIterator(const Iterator& other);
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        DequeIterator& operator=(const Iterator& other) ;

    /**
     *  operator* description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T& operator*() const ;
    /**
     *  operator-> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T* operator->() const ;

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool operator==(const Iterator& other) const ;
    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool operator!=(const Iterator& other) const ;

    /**
     *  operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Iterator& operator++() ;
        // postfix ++ intentionally omitted
    /**
     *  operator-- description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Iterator& operator--() ;
        // postfix -- intentionally omitted
    };

    template<typename T>     class DequeConstIterator : public OWBALBase, public DequeIteratorBase<T> {
    private:
        typedef DequeIteratorBase<T> Base;
        typedef DequeConstIterator<T> Iterator;
        typedef DequeIterator<T> NonConstIterator;

    public:
    /**
     *  DequeConstIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        DequeConstIterator(const Deque<T>* deque, size_t index);

    /**
     *  DequeConstIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        DequeConstIterator(const Iterator& other);
    /**
     *  DequeConstIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        DequeConstIterator(const NonConstIterator& other);
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        DequeConstIterator& operator=(const Iterator& other) ;
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        DequeConstIterator& operator=(const NonConstIterator& other) ;

    /**
     *  operator* description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const T& operator*() const ;
    /**
     *  operator-> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const T* operator->() const ;

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool operator==(const Iterator& other) const ;
    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool operator!=(const Iterator& other) const ;

    /**
     *  operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Iterator& operator++() ;
        // postfix ++ intentionally omitted
    /**
     *  operator-- description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Iterator& operator--() ;
        // postfix -- intentionally omitted
    };

    template<typename T>     class DequeReverseIterator : public OWBALBase, public DequeIteratorBase<T> {
    private:
        typedef DequeIteratorBase<T> Base;
        typedef DequeReverseIterator<T> Iterator;

    public:
    /**
     *  DequeReverseIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        DequeReverseIterator(const Deque<T>* deque, size_t index);

    /**
     *  DequeReverseIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        DequeReverseIterator(const Iterator& other);
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        DequeReverseIterator& operator=(const Iterator& other) ;

    /**
     *  operator* description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T& operator*() const ;
    /**
     *  operator-> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T* operator->() const ;

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool operator==(const Iterator& other) const ;
    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool operator!=(const Iterator& other) const ;

    /**
     *  operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Iterator& operator++() ;
        // postfix ++ intentionally omitted
    /**
     *  operator-- description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Iterator& operator--() ;
        // postfix -- intentionally omitted
    };

    template<typename T>     class DequeConstReverseIterator : public OWBALBase, public DequeIteratorBase<T> {
    private:
        typedef DequeIteratorBase<T> Base;
        typedef DequeConstReverseIterator<T> Iterator;
        typedef DequeReverseIterator<T> NonConstIterator;

    public:
    /**
     *  DequeConstReverseIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        DequeConstReverseIterator(const Deque<T>* deque, size_t index);

    /**
     *  DequeConstReverseIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        DequeConstReverseIterator(const Iterator& other);
    /**
     *  DequeConstReverseIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        DequeConstReverseIterator(const NonConstIterator& other);
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        DequeConstReverseIterator& operator=(const Iterator& other) ;
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        DequeConstReverseIterator& operator=(const NonConstIterator& other) ;

    /**
     *  operator* description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const T& operator*() const ;
    /**
     *  operator-> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const T* operator->() const ;

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool operator==(const Iterator& other) const ;
    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool operator!=(const Iterator& other) const ;

    /**
     *  operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Iterator& operator++() ;
        // postfix ++ intentionally omitted
    /**
     *  operator-- description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Iterator& operator--() ;
        // postfix -- intentionally omitted
    };

#ifdef NDEBUG
    /**
     *  Deque<T>::checkValidity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T> inline void Deque<T>::checkValidity() const ;
    /**
     *  Deque<T>::checkIndexValidity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T> inline void Deque<T>::checkIndexValidity(size_t) const ;
    /**
     *  Deque<T>::invalidateIterators description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T> inline void Deque<T>::invalidateIterators() ;
#else
    /**
     *  Deque<T>::checkValidity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     void Deque<T>::checkValidity() const;

    /**
     *  Deque<T>::checkIndexValidity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     void Deque<T>::checkIndexValidity(size_t index) const;

    /**
     *  Deque<T>::invalidateIterators description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     void Deque<T>::invalidateIterators();
#endif

    /**
     *  Deque<T>::Deque description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     inline Deque<T>::Deque();

    /**
     *  Deque<T>::Deque description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     inline Deque<T>::Deque(const Deque<T>& other);

    /**
     *  deleteAllValues description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     void deleteAllValues(const Deque<T>& collection);

    /**
     *  Deque<T>::operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     inline Deque<T>& Deque<T>::operator=(const Deque<T>& other);

    /**
     *  Deque<T>::destroyAll description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     inline void Deque<T>::destroyAll();

    /**
     *  Deque<T>::~Deque description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     inline Deque<T>::~Deque();

    /**
     *  Deque<T>::swap description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T>     inline void Deque<T>::swap(Deque<T>& other);

    /**
     *  Deque<T>::clear description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template <typename T>     inline void Deque<T>::clear();

    /**
     *  Deque<T>::expandCapacityIfNeeded description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     inline void Deque<T>::expandCapacityIfNeeded();

    /**
     *  Deque<T>::expandCapacity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     void Deque<T>::expandCapacity();

    /**
     *  Deque<T>::append description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T> template<typename U>     inline void Deque<T>::append(const U& value);

    /**
     *  Deque<T>::prepend description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T> template<typename U>     inline void Deque<T>::prepend(const U& value);

    /**
     *  Deque<T>::removeFirst description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     inline void Deque<T>::removeFirst();

#ifdef NDEBUG
    /**
     *  DequeIteratorBase<T>::checkValidity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T> inline void DequeIteratorBase<T>::checkValidity() const ;
    /**
     *  DequeIteratorBase<T>::checkValidity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T> inline void DequeIteratorBase<T>::checkValidity(const DequeIteratorBase<T>&) const ;
    /**
     *  DequeIteratorBase<T>::addToIteratorsList description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T> inline void DequeIteratorBase<T>::addToIteratorsList() ;
#else
    /**
     *  DequeIteratorBase<T>::checkValidity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     void DequeIteratorBase<T>::checkValidity() const;

    /**
     *  DequeIteratorBase<T>::checkValidity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     void DequeIteratorBase<T>::checkValidity(const Base& other) const;

    /**
     *  DequeIteratorBase<T>::addToIteratorsList description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     void DequeIteratorBase<T>::addToIteratorsList();
#endif

    /**
     *  DequeIteratorBase<T>::DequeIteratorBase description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     inline DequeIteratorBase<T>::DequeIteratorBase();

    /**
     *  DequeIteratorBase<T>::DequeIteratorBase description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     inline DequeIteratorBase<T>::DequeIteratorBase(const Deque<T>* deque, size_t index);

    /**
     *  DequeIteratorBase<T>::DequeIteratorBase description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     inline DequeIteratorBase<T>::DequeIteratorBase(const Base& other);

    /**
     *  DequeIteratorBase<T>::~DequeIteratorBase description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     inline DequeIteratorBase<T>::~DequeIteratorBase();

    /**
     *  DequeIteratorBase<T>::isEqual description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     inline bool DequeIteratorBase<T>::isEqual(const Base& other) const;

    /**
     *  DequeIteratorBase<T>::increment description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     inline void DequeIteratorBase<T>::increment();

    /**
     *  DequeIteratorBase<T>::decrement description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     inline void DequeIteratorBase<T>::decrement();

    /**
     *  DequeIteratorBase<T>::after description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     inline T* DequeIteratorBase<T>::after() const;

    /**
     *  DequeIteratorBase<T>::before description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T>     inline T* DequeIteratorBase<T>::before() const;

} // namespace WTF

using WTF::Deque;

#endif // WTF_Deque_h




