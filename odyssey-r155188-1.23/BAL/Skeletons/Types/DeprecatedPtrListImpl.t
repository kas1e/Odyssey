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
#ifndef DeprecatedPtrListImpl_h
#define DeprecatedPtrListImpl_h
/**
 *  @file  DeprecatedPtrListImpl.t
 *  DeprecatedPtrListImpl description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:10 $
 */
#include "BALBase.h"

namespace WebCore {

class DeprecatedListNode;
class DeprecatedPtrListImplIterator;

class DeprecatedPtrListImpl
{
public:
    
    /**
     *  DeprecatedPtrListImpl description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedPtrListImpl(void (*deleteFunc)(void *));
    /**
     *  DeprecatedPtrListImpl description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedPtrListImpl(const DeprecatedPtrListImpl &impl);
    /**
     *  ~DeprecatedPtrListImpl description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    ~DeprecatedPtrListImpl();
     
    /**
     *  isEmpty description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool isEmpty() const ;
    /**
     *  count description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    unsigned count() const ;
    /**
     *  clear description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void clear(bool deleteItems);

    /**
     *  *at description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void *at(unsigned n);

    /**
     *  insert description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool insert(unsigned n, const void *item);
    /**
     *  remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool remove(bool deleteItem);
    /**
     *  remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool remove(unsigned n, bool deleteItem);
    /**
     *  removeFirst description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool removeFirst(bool deleteItem);
    /**
     *  removeLast description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool removeLast(bool deleteItem);
    /**
     *  removeRef description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool removeRef(const void *item, bool deleteItem);

    /**
     *  *getFirst description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void *getFirst() const;
    /**
     *  *getLast description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void *getLast() const;
    /**
     *  *getNext description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void *getNext() const;
    /**
     *  *getPrev description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void *getPrev() const;
    /**
     *  *current description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void *current() const;
    /**
     *  *first description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void *first();
    /**
     *  *last description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void *last();
    /**
     *  *next description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void *next();
    /**
     *  *prev description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void *prev();
    /**
     *  *take description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void *take(unsigned n);
    /**
     *  *take description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void *take();

    /**
     *  append description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void append(const void *item);
    /**
     *  prepend description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void prepend(const void *item);

    /**
     *  containsRef description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    unsigned containsRef(const void *item) const;
    /**
     *  findRef description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    int findRef(const void *item);

    /**
     *  &assign description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedPtrListImpl &assign(const DeprecatedPtrListImpl &impl, bool deleteItems);

 private:
    /**
     *  = description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedPtrListImpl &operator =(const DeprecatedPtrListImpl &impl);

    /**
     *  swap description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void swap(DeprecatedPtrListImpl &impl);

    /**
     *  addIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void addIterator(DeprecatedPtrListImplIterator *iter) const;
    /**
     *  removeIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void removeIterator(DeprecatedPtrListImplIterator *iter) const;

    DeprecatedListNode *head;
    DeprecatedListNode *tail;
    DeprecatedListNode *cur;
    unsigned nodeCount;
    /**
     *   description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void (*deleteItem)(void *);
    mutable DeprecatedPtrListImplIterator *iterators;

    friend class DeprecatedPtrListImplIterator;
};


class DeprecatedPtrListImplIterator {
public:
    /**
     *  DeprecatedPtrListImplIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedPtrListImplIterator();
    /**
     *  DeprecatedPtrListImplIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedPtrListImplIterator(const DeprecatedPtrListImpl &impl);
    /**
     *  ~DeprecatedPtrListImplIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    ~DeprecatedPtrListImplIterator();

    /**
     *  DeprecatedPtrListImplIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedPtrListImplIterator(const DeprecatedPtrListImplIterator &impl);
    /**
     *  &operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedPtrListImplIterator &operator=(const DeprecatedPtrListImplIterator &impl);

    /**
     *  count description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    unsigned count() const;
    /**
     *  *toFirst description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void *toFirst();
    /**
     *  *toLast description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void *toLast();
    /**
     *  *current description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void *current() const;

    /**
     *  *operator-- description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void *operator--();
    /**
     *  *operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void *operator++();

private:
    const DeprecatedPtrListImpl *list;
    DeprecatedListNode *node;
    DeprecatedPtrListImplIterator *next;
    DeprecatedPtrListImplIterator *prev;

    friend class DeprecatedPtrListImpl;
};

}

#endif




