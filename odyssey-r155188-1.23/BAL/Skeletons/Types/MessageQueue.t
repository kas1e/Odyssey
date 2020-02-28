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
#ifndef MessageQueue_h
#define MessageQueue_h
/**
 *  @file  MessageQueue.t
 *  MessageQueue description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:11 $
 */
#include "BALBase.h"

#include <wtf/Assertions.h>
#include <wtf/Deque.h>
#include <wtf/Noncopyable.h>
#include <wtf/Threading.h>

namespace WTF {

    template<typename DataType>     class MessageQueue : public OWBALBase, Noncopyable {
    public:
    /**
     *  MessageQueue description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        MessageQueue();
        
    /**
     *  append description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void append(const DataType&);
    /**
     *  prepend description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void prepend(const DataType&);
    /**
     *  waitForMessage description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool waitForMessage(DataType&);
    /**
     *  tryGetMessage description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool tryGetMessage(DataType&);
    /**
     *  kill description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        void kill();
    /**
     *  killed description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
        bool killed() const;

    private:
        mutable Mutex m_mutex;
        ThreadCondition m_condition;
        Deque<DataType> m_queue;
        bool m_killed;
    };

    /**
     *  MessageQueue<DataType>::append description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename DataType>     inline void MessageQueue<DataType>::append(const DataType& message);

    /**
     *  MessageQueue<DataType>::prepend description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename DataType>     inline void MessageQueue<DataType>::prepend(const DataType& message);

    /**
     *  MessageQueue<DataType>::waitForMessage description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename DataType>     inline bool MessageQueue<DataType>::waitForMessage(DataType& result);

    /**
     *  MessageQueue<DataType>::tryGetMessage description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename DataType>     inline bool MessageQueue<DataType>::tryGetMessage(DataType& result);

    /**
     *  MessageQueue<DataType>::kill description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename DataType>     inline void MessageQueue<DataType>::kill();

    /**
     *  MessageQueue<DataType>::killed description
     * @param[in] : description
     * @param[out] : description
     * @code
     * @endcode
     */
    template<typename DataType>     inline bool MessageQueue<DataType>::killed() const;
}

using WTF::MessageQueue;

#endif // MessageQueue_h




