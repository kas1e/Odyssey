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
#ifndef DeprecatedPtrList_h
#define DeprecatedPtrList_h
/**
 *  @file  DeprecatedPtrList.t
 *  DeprecatedPtrList description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:10 $
 */
#include "BALBase.h"

#include "DeprecatedPtrListImpl.h"

namespace WebCore {

template <class T> class DeprecatedPtrListIterator;

template <class T> class DeprecatedPtrList : public WebCoreBase {
public:
    /**
     *  DeprecatedPtrList description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedPtrList();
    /**
     *  ~DeprecatedPtrList description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    ~DeprecatedPtrList() ;
    
    /**
     *  DeprecatedPtrList description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedPtrList(const DeprecatedPtrList& l);
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedPtrList& operator=(const DeprecatedPtrList &l) ;

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
    void clear() ;

    /**
     *  *at description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T *at(unsigned n) ;

    /**
     *  insert description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool insert(unsigned n, const T *item) ;
    /**
     *  remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool remove() ;
    /**
     *  remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool remove(unsigned n) ;
    /**
     *  remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool remove(const T *item) ;
    /**
     *  removeFirst description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool removeFirst() ;
    /**
     *  removeLast description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool removeLast() ;
    /**
     *  removeRef description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool removeRef(const T *item) ;

    /**
     *  *getFirst description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T *getFirst() const ;
    /**
     *  *getLast description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T *getLast() const ;
    /**
     *  *getNext description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T *getNext() const ;
    /**
     *  *getPrev description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T *getPrev() const ;
    /**
     *  *current description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T *current() const ;
    /**
     *  *first description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T *first() ;
    /**
     *  *last description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T *last() ;
    /**
     *  *next description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T *next() ;
    /**
     *  *prev description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T *prev() ;
    /**
     *  *take description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T *take(unsigned n) ;
    /**
     *  *take description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T *take() ;

    /**
     *  append description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void append(const T *item) ;
    /**
     *  prepend description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void prepend(const T *item) ;

    /**
     *  containsRef description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    unsigned containsRef(const T *item) const ;
    /**
     *  findRef description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    int findRef(const T *item) ;

    typedef DeprecatedPtrListIterator<T> Iterator;
    typedef DeprecatedPtrListIterator<T> ConstIterator;
    /**
     *  begin description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    ConstIterator begin() const ;
    /**
     *  end description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    ConstIterator end() const ;

    /**
     *  autoDelete description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool autoDelete() const ;
    /**
     *  setAutoDelete description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void setAutoDelete(bool autoDelete) ;

 private:
    /**
     *  deleteFunc description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    static void deleteFunc(void *item) ;

    friend class DeprecatedPtrListIterator<T>;

    DeprecatedPtrListImpl impl;
    bool del_item;
};

template <class T> class DeprecatedPtrListIterator : public WebCoreBase {
public:
    /**
     *  DeprecatedPtrListIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedPtrListIterator() ;
    /**
     *  DeprecatedPtrListIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedPtrListIterator(const DeprecatedPtrList<T> &l);

    /**
     *  count description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    unsigned count() const ;
    /**
     *  *toFirst description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T *toFirst() ;
    /**
     *  *toLast description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T *toLast() ;
    /**
     *  *current description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T *current() const ;

    /**
     *  * description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    operator T *() const ;
    /**
     *  *operator* description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T *operator*() const ;
    /**
     *  *operator-- description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T *operator--() ;
    /**
     *  *operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T *operator++()  ;

private:
    DeprecatedPtrListImplIterator impl;
};

}

#endif




