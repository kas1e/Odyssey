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
#ifndef DeprecatedValueListImpl_h
#define DeprecatedValueListImpl_h
/**
 *  @file  DeprecatedValueListImpl.t
 *  DeprecatedValueListImpl description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:10 $
 */
#include "BALBase.h"

#include <wtf/RefPtr.h>

namespace WebCore {

class DeprecatedValueListImplNode;

class DeprecatedValueListImplIterator
{
public: 
    /**
     *  DeprecatedValueListImplIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplIterator();
    
    /**
     *  operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool operator==(const DeprecatedValueListImplIterator &other);
    /**
     *  operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool operator!=(const DeprecatedValueListImplIterator &other);

    /**
     *  *node description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplNode *node();
    /**
     *  *node description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    const DeprecatedValueListImplNode *node() const;

    /**
     *  operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplIterator& operator++();
    /**
     *  operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplIterator operator++(int);
    /**
     *  operator-- description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplIterator& operator--();

private:
    /**
     *  DeprecatedValueListImplIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplIterator(const DeprecatedValueListImplNode *n);

    DeprecatedValueListImplNode *nodeImpl;

    friend class DeprecatedValueListImpl;
};

class DeprecatedValueListImpl 
{
public:
    /**
     *  DeprecatedValueListImpl description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImpl(void (*deleteFunc)(DeprecatedValueListImplNode *), DeprecatedValueListImplNode *(*copyNode)(DeprecatedValueListImplNode *));
    /**
     *  ~DeprecatedValueListImpl description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    ~DeprecatedValueListImpl();
    
    /**
     *  DeprecatedValueListImpl description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImpl(const DeprecatedValueListImpl&);
    /**
     *  operator= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImpl& operator=(const DeprecatedValueListImpl&);
        
    /**
     *  clear description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void clear();
    /**
     *  count description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    unsigned count() const;
    /**
     *  isEmpty description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool isEmpty() const;

    /**
     *  appendNode description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplIterator appendNode(DeprecatedValueListImplNode *node);
    /**
     *  prependNode description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplIterator prependNode(DeprecatedValueListImplNode *node);
    /**
     *  removeEqualNodes description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void removeEqualNodes(DeprecatedValueListImplNode *node, bool (*equalFunc)(const DeprecatedValueListImplNode *, const DeprecatedValueListImplNode *));
    /**
     *  containsEqualNodes description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    unsigned containsEqualNodes(DeprecatedValueListImplNode *node, bool (*equalFunc)(const DeprecatedValueListImplNode *, const DeprecatedValueListImplNode *)) const;
    
    /**
     *  findEqualNode description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplIterator findEqualNode(DeprecatedValueListImplNode *node, bool (*equalFunc)(const DeprecatedValueListImplNode *, const DeprecatedValueListImplNode *)) const;

    /**
     *  insert description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplIterator insert(const DeprecatedValueListImplIterator &iterator, DeprecatedValueListImplNode* node);
    /**
     *  removeIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplIterator removeIterator(DeprecatedValueListImplIterator &iterator);
    /**
     *  fromLast description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplIterator fromLast();

    /**
     *  *firstNode description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplNode *firstNode();
    /**
     *  *lastNode description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplNode *lastNode();

    /**
     *  *firstNode description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplNode *firstNode() const;
    /**
     *  *lastNode description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplNode *lastNode() const;

    /**
     *  begin description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplIterator begin();
    /**
     *  end description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplIterator end();

    /**
     *  begin description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplIterator begin() const;
    /**
     *  end description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplIterator end() const;
    /**
     *  fromLast description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplIterator fromLast() const;
    
    /**
     *  *nodeAt description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplNode *nodeAt(unsigned index);
    /**
     *  *nodeAt description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplNode *nodeAt(unsigned index) const;
    
    /**
     *  isEqual description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    bool isEqual(const DeprecatedValueListImpl &other, bool (*equalFunc)(const DeprecatedValueListImplNode *, const DeprecatedValueListImplNode *)) const;
    
private:
    /**
     *  copyOnWrite description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    void copyOnWrite();

    class Private;

    RefPtr<Private> d;
    
    friend class DeprecatedValueListImplNode;
};

class DeprecatedValueListImplNode
{
protected:
    /**
     *  DeprecatedValueListImplNode description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    DeprecatedValueListImplNode();

private:
    DeprecatedValueListImplNode *prev;
    DeprecatedValueListImplNode *next;

    friend class DeprecatedValueListImpl;
    friend class DeprecatedValueListImplIterator;
    friend class DeprecatedValueListImpl::Private;
};

    /**
     *  DeprecatedValueListImplIterator::DeprecatedValueListImplIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline DeprecatedValueListImplIterator::DeprecatedValueListImplIterator();

    /**
     *  DeprecatedValueListImplIterator::operator== description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline bool DeprecatedValueListImplIterator::operator==(const DeprecatedValueListImplIterator &other);

    /**
     *  DeprecatedValueListImplIterator::operator!= description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline bool DeprecatedValueListImplIterator::operator!=(const DeprecatedValueListImplIterator &other);

    /**
     *  *DeprecatedValueListImplIterator::node description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline DeprecatedValueListImplNode *DeprecatedValueListImplIterator::node();

    /**
     *  *DeprecatedValueListImplIterator::node description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline const DeprecatedValueListImplNode *DeprecatedValueListImplIterator::node() const;

    /**
     *  DeprecatedValueListImplIterator::operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline DeprecatedValueListImplIterator& DeprecatedValueListImplIterator::operator++();

    /**
     *  DeprecatedValueListImplIterator::operator++ description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline DeprecatedValueListImplIterator DeprecatedValueListImplIterator::operator++(int);

    /**
     *  DeprecatedValueListImplIterator::operator-- description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline DeprecatedValueListImplIterator& DeprecatedValueListImplIterator::operator--();

    /**
     *  DeprecatedValueListImplIterator::DeprecatedValueListImplIterator description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline DeprecatedValueListImplIterator::DeprecatedValueListImplIterator(const DeprecatedValueListImplNode *n) :;
    /**
     *  nodeImpl description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    nodeImpl((DeprecatedValueListImplNode *)n);

    /**
     *  DeprecatedValueListImplNode::DeprecatedValueListImplNode description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
inline DeprecatedValueListImplNode::DeprecatedValueListImplNode();

}

#endif




