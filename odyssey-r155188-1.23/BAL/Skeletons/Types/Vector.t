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
#ifndef WTF_Vector_h
#define WTF_Vector_h
/**
 *  @file  Vector.t
 *  Vector description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#include "Assertions.h"
#include "FastMalloc.h"
#include "Noncopyable.h"
#include "VectorTraits.h"
#include <limits>
#include <stdlib.h>
#include <string.h>
#include <utility>

namespace WTF {

    using std::min;
    using std::max;
    
    template <bool needsDestruction, typename T>     class VectorDestructor;

    template<typename T>     struct VectorDestructor<false, T>
    

    /**
     *  destruct description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void destruct(T*, T*) ;
    };

    template<typename T>     struct VectorDestructor<true, T>
    {
    /**
     *  destruct description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void destruct(T* begin, T* end) ;
    };

    template <bool needsInitialization, bool canInitializeWithMemset, typename T>     class VectorInitializer;

    template<bool ignore, typename T>     struct VectorInitializer<false, ignore, T>
    {
    /**
     *  initialize description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void initialize(T*, T*) ;
    };

    template<typename T>     struct VectorInitializer<true, false, T>
    {
    /**
     *  initialize description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void initialize(T* begin, T* end) ;
    };

    template<typename T>     struct VectorInitializer<true, true, T>
    {
    /**
     *  initialize description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void initialize(T* begin, T* end) ;
    };

    template <bool canMoveWithMemcpy, typename T>     class VectorMover;

    template<typename T>     struct VectorMover<false, T>
    {
    /**
     *  move description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void move(const T* src, const T* srcEnd, T* dst);
    /**
     *  moveOverlapping description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void moveOverlapping(const T* src, const T* srcEnd, T* dst);
    };

    template<typename T>     struct VectorMover<true, T>
    {
    /**
     *  move description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void move(const T* src, const T* srcEnd, T* dst) ;
    /**
     *  moveOverlapping description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void moveOverlapping(const T* src, const T* srcEnd, T* dst) ;
    };

    template <bool canCopyWithMemcpy, typename T>     class VectorCopier;

    template<typename T>     struct VectorCopier<false, T>
    {
    /**
     *  uninitializedCopy description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void uninitializedCopy(const T* src, const T* srcEnd, T* dst) ;
    };

    template<typename T>     struct VectorCopier<true, T>
    {
    /**
     *  uninitializedCopy description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void uninitializedCopy(const T* src, const T* srcEnd, T* dst) ;
    };

    template <bool canFillWithMemset, typename T>     class VectorFiller;

    template<typename T>     struct VectorFiller<false, T>
    {
    /**
     *  uninitializedFill description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void uninitializedFill(T* dst, T* dstEnd, const T& val) ;
    };

    template<typename T>     struct VectorFiller<true, T>
    {
    /**
     *  uninitializedFill description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void uninitializedFill(T* dst, T* dstEnd, const T& val) ;
    };
    
    template<bool canCompareWithMemcmp, typename T>     class VectorComparer;
    
    template<typename T>     struct VectorComparer<false, T>
    {
    /**
     *  compare description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool compare(const T* a, const T* b, size_t size);
    };

    template<typename T>     struct VectorComparer<true, T>
    {
    /**
     *  compare description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool compare(const T* a, const T* b, size_t size);
    };
    
    template<typename T>     struct VectorTypeOperations
    {
    /**
     *  destruct description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void destruct(T* begin, T* end);

    /**
     *  initialize description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void initialize(T* begin, T* end);

    /**
     *  move description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void move(const T* src, const T* srcEnd, T* dst);

    /**
     *  moveOverlapping description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void moveOverlapping(const T* src, const T* srcEnd, T* dst);

    /**
     *  uninitializedCopy description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void uninitializedCopy(const T* src, const T* srcEnd, T* dst);

    /**
     *  uninitializedFill description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static void uninitializedFill(T* dst, T* dstEnd, const T& val);
        
    /**
     *  compare description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static bool compare(const T* a, const T* b, size_t size);
    };

    template<typename T>     class VectorBufferBase : Noncopyable {
    public:
    /**
     *  allocateBuffer description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void allocateBuffer(size_t newCapacity);

    /**
     *  deallocateBuffer description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void deallocateBuffer(T* bufferToDeallocate);

    /**
     *  buffer description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T* buffer() ;
    /**
     *  buffer description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const T* buffer() const ;
    /**
     *  bufferSlot description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T** bufferSlot() ;
    /**
     *  capacity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        size_t capacity() const ;

    /**
     *  releaseBuffer description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T* releaseBuffer();

    protected:
    /**
     *  VectorBufferBase description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        VectorBufferBase();

    /**
     *  VectorBufferBase description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        VectorBufferBase(T* buffer, size_t capacity);

    /**
     *  ~VectorBufferBase description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ~VectorBufferBase();

        T* m_buffer;
        size_t m_capacity;
    };

    template<typename T, size_t inlineCapacity>     class VectorBuffer;

    template<typename T>     class VectorBuffer<T, 0> :  private VectorBufferBase<T> {
    private:
        typedef VectorBufferBase<T> Base;
    public:
    /**
     *  VectorBuffer description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        VectorBuffer();

    /**
     *  VectorBuffer description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        VectorBuffer(size_t capacity);

    /**
     *  ~VectorBuffer description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ~VectorBuffer();
        
    /**
     *  swap description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void swap(VectorBuffer<T, 0>& other);

        using Base::allocateBuffer;
        using Base::deallocateBuffer;

        using Base::buffer;
        using Base::bufferSlot;
        using Base::capacity;

        using Base::releaseBuffer;
    private:
        using Base::m_buffer;
        using Base::m_capacity;
    };

    template<typename T, size_t inlineCapacity>     class VectorBuffer : private VectorBufferBase<T> {
    private:
        typedef VectorBufferBase<T> Base;
    public:
    /**
     *  VectorBuffer description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        VectorBuffer();

    /**
     *  VectorBuffer description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        VectorBuffer(size_t capacity);

    /**
     *  ~VectorBuffer description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ~VectorBuffer();

    /**
     *  allocateBuffer description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void allocateBuffer(size_t newCapacity);

    /**
     *  deallocateBuffer description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void deallocateBuffer(T* bufferToDeallocate);

        using Base::buffer;
        using Base::bufferSlot;
        using Base::capacity;

    /**
     *  releaseBuffer description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T* releaseBuffer();

    private:
        using Base::m_buffer;
        using Base::m_capacity;

    /**
     *  sizeof description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        static const size_t m_inlineBufferSize = inlineCapacity * sizeof(T);
    /**
     *  inlineBuffer description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T* inlineBuffer() ;

        // FIXME: Nothing guarantees this buffer is appropriately aligned to hold objects of type T.
        char m_inlineBuffer[m_inlineBufferSize];
    };

    template<typename T, size_t inlineCapacity = 0>     class Vector  {
    private:
        typedef VectorBuffer<T, inlineCapacity> Buffer;
        typedef VectorTypeOperations<T> TypeOperations;

    public:
        typedef T ValueType;

        typedef T* iterator;
        typedef const T* const_iterator;

    /**
     *  Vector description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Vector() ;
        
    /**
     *  Vector description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        explicit Vector(size_t size) ;

    /**
     *  ~Vector description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        ~Vector();

    /**
     *  Vector description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Vector(const Vector&);
    /**
     *  Vector description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<size_t otherCapacity>          Vector(const Vector<T, otherCapacity>&);

    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Vector& operator=(const Vector&);
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<size_t otherCapacity>          Vector& operator=(const Vector<T, otherCapacity>&);

    /**
     *  size description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        size_t size() const ;
    /**
     *  capacity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        size_t capacity() const ;
    /**
     *  isEmpty description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool isEmpty() const ;

    /**
     *  at description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T& at(size_t i) ;
    /**
     *  at description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const T& at(size_t i) const ;

    /**
     *  operator[] description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T& operator[](size_t i) ;
    /**
     *  operator[] description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const T& operator[](size_t i) const ;

    /**
     *  data description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T* data() ;
    /**
     *  data description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const T* data() const ;
    /**
     *  dataSlot description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T** dataSlot() ;

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
     *  last description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T& last() ;
    /**
     *  last description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const T& last() const ;


    /**
     *  find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename U> size_t find(const U&) const;

    /**
     *  shrink description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void shrink(size_t size);
    /**
     *  grow description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void grow(size_t size);
    /**
     *  resize description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void resize(size_t size);
    /**
     *  reserveCapacity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void reserveCapacity(size_t newCapacity);
    /**
     *  shrinkCapacity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void shrinkCapacity(size_t newCapacity);

    /**
     *  clear description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void clear() ;

    /**
     *  append description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename U> void append(const U*, size_t);
    /**
     *  append description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename U> void append(const U&);
    /**
     *  uncheckedAppend description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename U> void uncheckedAppend(const U& val);
    /**
     *  append description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename U, size_t c> void append(const Vector<U, c>&);

    /**
     *  insert description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename U> void insert(size_t position, const U*, size_t);
    /**
     *  insert description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename U> void insert(size_t position, const U&);
    /**
     *  insert description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename U, size_t c> void insert(size_t position, const Vector<U, c>&);

    /**
     *  prepend description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename U> void prepend(const U*, size_t);
    /**
     *  prepend description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename U> void prepend(const U&);
    /**
     *  prepend description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename U, size_t c> void prepend(const Vector<U, c>&);

    /**
     *  remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void remove(size_t position);
    /**
     *  remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void remove(size_t position, size_t length);

    /**
     *  removeLast description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void removeLast() ;

    /**
     *  Vector description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        Vector(size_t size, const T& val);

    /**
     *  fill description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void fill(const T&, size_t);
    /**
     *  fill description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void fill(const T& val) ;

    /**
     *  appendRange description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename Iterator> void appendRange(Iterator start, Iterator end);

    /**
     *  releaseBuffer description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        T* releaseBuffer();

    /**
     *  swap description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void swap(Vector<T, inlineCapacity>& other);

    private:
    /**
     *  expandCapacity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void expandCapacity(size_t newMinCapacity);
    /**
     *  expandCapacity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        const T* expandCapacity(size_t newMinCapacity, const T*);
    /**
     *  expandCapacity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        template<typename U> U* expandCapacity(size_t newMinCapacity, U*); 

        size_t m_size;
        Buffer m_buffer;
    };

    /**
     *  inlineCapacity>::Vector description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity>     Vector<T, inlineCapacity>::Vector(const Vector& other);

    /**
     *  inlineCapacity>::Vector description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity>     template<size_t otherCapacity>      Vector<T, inlineCapacity>::Vector(const Vector<T, otherCapacity>& other);

    /**
     *  inlineCapacity>::operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity>     Vector<T, inlineCapacity>& Vector<T, inlineCapacity>::operator=(const Vector<T, inlineCapacity>& other);

    /**
     *  inlineCapacity>::operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity>     template<size_t otherCapacity>      Vector<T, inlineCapacity>& Vector<T, inlineCapacity>::operator=(const Vector<T, otherCapacity>& other);


    /**
     *  inlineCapacity>::find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity>     template<typename U>     size_t Vector<T, inlineCapacity>::find(const U& value) const;

    /**
     *  inlineCapacity>::fill description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity>     void Vector<T, inlineCapacity>::fill(const T& val, size_t newSize);

    /**
     *  inlineCapacity>::appendRange description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity>     template<typename Iterator>     void Vector<T, inlineCapacity>::appendRange(Iterator start, Iterator end);

    /**
     *  inlineCapacity>::expandCapacity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity>     void Vector<T, inlineCapacity>::expandCapacity(size_t newMinCapacity);
    
    /**
     *  inlineCapacity>::expandCapacity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity>     const T* Vector<T, inlineCapacity>::expandCapacity(size_t newMinCapacity, const T* ptr);

    /**
     *  inlineCapacity>::expandCapacity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity> template<typename U>     inline U* Vector<T, inlineCapacity>::expandCapacity(size_t newMinCapacity, U* ptr);

    /**
     *  inlineCapacity>::resize description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity>     void Vector<T, inlineCapacity>::resize(size_t size);

    /**
     *  inlineCapacity>::shrink description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity>     void Vector<T, inlineCapacity>::shrink(size_t size);

    /**
     *  inlineCapacity>::grow description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity>     void Vector<T, inlineCapacity>::grow(size_t size);

    /**
     *  inlineCapacity>::reserveCapacity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity>     void Vector<T, inlineCapacity>::reserveCapacity(size_t newCapacity);
    
    /**
     *  inlineCapacity>::shrinkCapacity description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity>     void Vector<T, inlineCapacity>::shrinkCapacity(size_t newCapacity);

    // Templatizing these is better than just letting the conversion happen implicitly,
    // because for instance it allows a PassRefPtr to be appended to a RefPtr vector
    // without refcount thrash.

    /**
     *  inlineCapacity>::append description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity> template<typename U>     void Vector<T, inlineCapacity>::append(const U* data, size_t dataSize);

    /**
     *  inlineCapacity>::append description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity> template<typename U>     inline void Vector<T, inlineCapacity>::append(const U& val);

    // This version of append saves a branch in the case where you know that the
    // vector's capacity is large enough for the append to succeed.

    /**
     *  inlineCapacity>::uncheckedAppend description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity> template<typename U>     inline void Vector<T, inlineCapacity>::uncheckedAppend(const U& val);

    /**
     *  inlineCapacity>::append description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity> template<typename U, size_t c>     inline void Vector<T, inlineCapacity>::append(const Vector<U, c>& val);

    /**
     *  inlineCapacity>::insert description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity> template<typename U>     void Vector<T, inlineCapacity>::insert(size_t position, const U* data, size_t dataSize);
     
    /**
     *  inlineCapacity>::insert description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity> template<typename U>     inline void Vector<T, inlineCapacity>::insert(size_t position, const U& val);
   
    /**
     *  inlineCapacity>::insert description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity> template<typename U, size_t c>     inline void Vector<T, inlineCapacity>::insert(size_t position, const Vector<U, c>& val);

    /**
     *  inlineCapacity>::prepend description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity> template<typename U>     void Vector<T, inlineCapacity>::prepend(const U* data, size_t dataSize);

    /**
     *  inlineCapacity>::prepend description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity> template<typename U>     inline void Vector<T, inlineCapacity>::prepend(const U& val);
   
    /**
     *  inlineCapacity>::prepend description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity> template<typename U, size_t c>     inline void Vector<T, inlineCapacity>::prepend(const Vector<U, c>& val);
    
    /**
     *  inlineCapacity>::remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity>     inline void Vector<T, inlineCapacity>::remove(size_t position);

    /**
     *  inlineCapacity>::remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity>     inline void Vector<T, inlineCapacity>::remove(size_t position, size_t length);

    /**
     *  inlineCapacity>::releaseBuffer description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity>     inline T* Vector<T, inlineCapacity>::releaseBuffer();

    /**
     *  deleteAllValues description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity>     void deleteAllValues(const Vector<T, inlineCapacity>& collection);

    /**
     *  swap description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity>     inline void swap(Vector<T, inlineCapacity>& a, Vector<T, inlineCapacity>& b);

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity>     bool operator==(const Vector<T, inlineCapacity>& a, const Vector<T, inlineCapacity>& b);

    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename T, size_t inlineCapacity>     inline bool operator!=(const Vector<T, inlineCapacity>& a, const Vector<T, inlineCapacity>& b);


} // namespace WTF

using WTF::Vector;

#endif // WTF_Vector_
