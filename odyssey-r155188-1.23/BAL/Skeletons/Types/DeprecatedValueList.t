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
#ifndef DeprecatedValueList_h
#define DeprecatedValueList_h
/**
 *  @file  DeprecatedValueList.t
 *  DeprecatedValueList description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:10 $
 */
#include "BALBase.h"

#include "DeprecatedValueListImpl.h"

namespace WebCore {

template <class T> class DeprecatedValueList;
template <class T> class DeprecatedValueListConstIterator;

template<class T> class DeprecatedValueListNode : public WebCoreBase, private DeprecatedValueListImplNode {
public:
    /**
     *  DeprecatedValueListNode description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListNode(const T &val);
    T value;
    friend class DeprecatedValueList<T>;
};

template<class T> class DeprecatedValueListIterator : public WebCoreBase {
public: 
    /**
     *  DeprecatedValueListIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListIterator() ;

    /**
     *  operator* description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T& operator*() const ;

    /**
     *  &operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListIterator &operator++() ;
    /**
     *  &operator-- description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListIterator &operator--() ;
    /**
     *  operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListIterator operator++(int) ;

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool operator==(const DeprecatedValueListIterator &other) ;
    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool operator!=(const DeprecatedValueListIterator &other) ;

private:
    /**
     *  DeprecatedValueListIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListIterator(const DeprecatedValueListImplIterator &pImp);

    DeprecatedValueListImplIterator impl;

    friend class DeprecatedValueList<T>;
    friend class DeprecatedValueListConstIterator<T>;
};

template<class T> class DeprecatedValueListConstIterator : public WebCoreBase {
public:
    /**
     *  DeprecatedValueListConstIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListConstIterator() ;
    /**
     *  DeprecatedValueListConstIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListConstIterator(const DeprecatedValueListIterator<T> &it);

    /**
     *  operator* description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    const T& operator*() const ;
    
    /**
     *  &operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListConstIterator &operator++() ;
    /**
     *  &operator-- description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListConstIterator &operator--() ;
    /**
     *  operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListConstIterator operator++(int) ;

    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool operator==(const DeprecatedValueListConstIterator &other) ;
    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool operator!=(const DeprecatedValueListConstIterator &other) ;

private:
    /**
     *  DeprecatedValueListConstIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListConstIterator(const DeprecatedValueListImplIterator &pImp);

    DeprecatedValueListImplIterator impl;

    friend class DeprecatedValueList<T>;
};

template<class T> bool operator==(const DeprecatedValueList<T> &a, const DeprecatedValueList<T> &b);

template <class T> class DeprecatedValueList : public WebCoreBase {
public:
    typedef DeprecatedValueListIterator<T> Iterator;
    typedef DeprecatedValueListIterator<T> iterator;
    typedef DeprecatedValueListConstIterator<T> ConstIterator;
    typedef DeprecatedValueListConstIterator<T> const_iterator;

    /**
     *  DeprecatedValueList description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueList();
        
    /**
     *  clear description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void clear() ;
    /**
     *  count description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    unsigned count() const ;
    /**
     *  isEmpty description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool isEmpty() const ;

    /**
     *  append description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    Iterator append(const T &val) ;
    /**
     *  prepend description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    Iterator prepend(const T &val) ;
    /**
     *  remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void remove(const T &val) ;
    /**
     *  contains description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    unsigned contains(const T &val) const ;
    /**
     *  find description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    Iterator find(const T &val) const ;

    /**
     *  insert description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    Iterator insert(Iterator iter, const T& val) ;
    /**
     *  remove description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    Iterator remove(Iterator iter) ;
    /**
     *  fromLast description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    Iterator fromLast() ;

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
     *  begin description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    Iterator begin() ;
    /**
     *  end description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    Iterator end() ;

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
     *  constBegin description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    ConstIterator constBegin() const ;
    /**
     *  constEnd description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    ConstIterator constEnd() const ;
    /**
     *  fromLast description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    ConstIterator fromLast() const ;

    /**
     *   description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    T& operator[] (unsigned index) ;
    /**
     *   description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    const T& operator[] (unsigned index) const ;
    /**
     *  &operator+= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueList &operator+=(const T &value) ;
    /**
     *  &operator<< description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueList &operator<<(const T &value) ;
    
    /**
     *  operator==<> description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    friend bool operator==<>(const DeprecatedValueList<T> &, const DeprecatedValueList<T> &);
    
private:
    DeprecatedValueListImpl impl;

    /**
     *  deleteNode description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    static void deleteNode(DeprecatedValueListImplNode *node) ;
    /**
     *  nodesEqual description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    static bool nodesEqual(const DeprecatedValueListImplNode *a, const DeprecatedValueListImplNode *b);
    /**
     *  *copyNode description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    static DeprecatedValueListImplNode *copyNode(DeprecatedValueListImplNode *node);
};

template<class T> inline bool operator==(const DeprecatedValueList<T> &a, const DeprecatedValueList<T> &b);

}

#endif




