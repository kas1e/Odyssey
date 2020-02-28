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
#ifndef BidiResolver_h
#define BidiResolver_h
/**
 *  @file  BidiResolver.t
 *  BidiResolver description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:08 $
 */
#include "BALBase.h"

#include "BidiContext.h"
#include <wtf/Noncopyable.h>
#include <wtf/PassRefPtr.h>

namespace WebCore {

// The BidiStatus at a given position (typically the end of a line) can
// be cached and then used to restart bidi resolution at that position.
struct BidiStatus {
    /**
     *  BidiStatus default constructor
     */
    BidiStatus();

    /**
     * BidiStatus constructor
     */
    BidiStatus(WTF::Unicode::Direction eorDir, WTF::Unicode::Direction lastStrongDir, WTF::Unicode::Direction lastDir, PassRefPtr<BidiContext> bidiContext);

    WTF::Unicode::Direction eor;
    WTF::Unicode::Direction lastStrong;
    WTF::Unicode::Direction last;
    RefPtr<BidiContext> context;
};

    /**
     *  operator== 
     */
inline bool operator==(const BidiStatus& status1, const BidiStatus& status2);

    /**
     *  operator!= 
     */
inline bool operator!=(const BidiStatus& status1, const BidiStatus& status2);

struct BidiCharacterRun {
    /**
     * BidiCharacterRun constructor
     */
    BidiCharacterRun(int start, int stop, BidiContext* context, WTF::Unicode::Direction dir);

    /**
     * destroy
     * @code
     * b->destroy();
     * @endcode
     */
    void destroy() ;

    /**
     * get start
     * @param[out] : start
     * @code
     * int s = b->start();
     * @endcode
     */
    int start() const ;

    /**
     * get stop
     * @param[out] : stop
     * @code
     * int s = b->stop();
     * @endcode
     */
    int stop() const ;

    /**
     * get level 
     * @param[out] : level
     * @code
     * unsigned char l = b->level();
     * @endcode
     */
    unsigned char level() const ;

    /**
     * test if it's reversed 
     * @param[in] : visually ordered
     * @param[out] : status
     * @code
     * bool r = b->reversed(v);
     * @endcode
     */
    bool reversed(bool visuallyOrdered) ;

    /**
     * test if the BidiCharacterRun direction Override 
     * @param[in] : visually ordered
     * @param[out] : status
     * @code
     * bool d = b->dirOverride(v);
     * @endcode
     */
    bool dirOverride(bool visuallyOrdered) ;

    /**
     * get next BidiCharacterRun
     * @param[out] : BidiCharacterRun
     * @code
     * BidiCharacterRun *bcr = b->next();
     * @endcode
     */
    BidiCharacterRun* next() const ;

    unsigned char m_level;
    int m_start;
    int m_stop;
    bool m_override;
    BidiCharacterRun* m_next;
};

template <class Iterator, class Run> class BidiResolver : public WebCoreBase, public Noncopyable {
public :
    /**
     * BidiResolver default constructor
     */
    BidiResolver();

    /**
     * get position
     * @param[out] : position
     * @code
     * Iterator it = b->position();
     * @endcode
     */
    const Iterator& position() const ;

    /**
     * set position
     * @param[in] : position 
     * @code
     * b->setPosition(it);
     * @endcode
     */
    void setPosition(const Iterator& position) ;

    /**
     * increment
     * @code
     * b->increment();
     * @endcode
     */
    void increment() ;

    /**
     * get bidi context
     * @param[out] : bidi context
     * @code
     * BidiContext *bc = b->context();
     * @endcode
     */
    BidiContext* context() const ;

    /**
     * set context
     * @param[in] : bidi context
     * @code
     * b->setContext(c);
     * @endcode
     */
    void setContext(PassRefPtr<BidiContext> c) ;

    /**
     * set last direction 
     * @param[in] : last direction
     * @code
     * b->setLastDir(ld);
     * @endcode
     */
    void setLastDir(WTF::Unicode::Direction lastDir) ;

    /**
     * set last strong direction
     * @param[in] : last strong direction
     * @code
     * b->setLastStrongDir(lsd);
     * @endcode
     */
    void setLastStrongDir(WTF::Unicode::Direction lastStrongDir) ;

    /**
     * set eor direction
     * @param[in] : eor direction
     * @code
     * b->setEorDir(eor);
     * @endcode
     */
    void setEorDir(WTF::Unicode::Direction eorDir) ;

    /**
     * get direction
     * @param[out] : direction
     * @code
     * WTF::Unicode::Direction d = b->dir();
     * @endcode
     */
    WTF::Unicode::Direction dir() const ;

    /**
     * set direction
     * @param[in] : direction
     * @code
     * b->setDir(d);
     * @endcode
     */
    void setDir(WTF::Unicode::Direction d) ;

    /**
     * get bidi status 
     * @param[out] : bidi status
     * @code
     * BidiStatus s = b->status();
     * @endcode
     */
    const BidiStatus& status() const ;

    /**
     * set status
     * @param[in] : bidi status
     * @code
     * b->setStatus(s);
     * @endcode
     */
    void setStatus(const BidiStatus s) ;

    /**
     * embed
     * @param[in] : direction
     * @code
     * b->embed(d);
     * @endcode
     */
    void embed(WTF::Unicode::Direction);

    /**
     * create BidiRuns for line
     * @param[in] : end
     * @param[in] : visual order
     * @param[in] : hard line break
     * @code
     * b->createBidiRunsForLine(e, v, h);
     * @endcode
     */
    void createBidiRunsForLine(const Iterator& end, bool visualOrder = false, bool hardLineBreak = false);

    /**
     * get first Run 
     * @param[out] : Run
     * @code
     * Run *f = b->firstRun();
     * @endcode
     */
    Run* firstRun() const ;

    /**
     * get last Run
     * @param[out] : Run
     * @code
     * Run *l = b->lastRun();
     * @endcode
     */
    Run* lastRun() const ;

    /**
     * get logically last Run 
     * @param[out] : Run
     * @code
     * Run *r = b->logicallyLastRun();
     * @endcode
     */
    Run* logicallyLastRun() const ;

    /**
     * get run count
     * @param[out] : run count
     * @code
     * unsigned c = b->runCount();
     * @endcode
     */
    unsigned runCount() const ;

    /**
     * add Run
     * @param[in] : Run
     * @code
     * b->addRun(r);
     * @endcode
     */
    void addRun(Run*);

    /**
     * prepend Run
     * @param[in] : Run
     * @code
     * b->prependRun(r);
     * @endcode
     */
    void prependRun(Run*);

    /**
     * move Run to end 
     * @param[in] : Run
     * @code
     * b->moveRunToEnd(r);
     * @endcode
     */
    void moveRunToEnd(Run*);

    /**
     * move Run to beginning
     * @param[in] : Run
     * @code
     * b->moveRunToBeginning(r);
     * @endcode
     */
    void moveRunToBeginning(Run*);

    /**
     * delete Runs
     * @code
     * b->deleteRuns();
     * @endcode
     */
    void deleteRuns();

protected:
    /**
     * appendRun
     */
    void appendRun();

    /**
     * reverseRuns 
     * @param[in] : start position
     * @param[in] : end position
     */
    void reverseRuns(unsigned start, unsigned end);

    Iterator current;
    Iterator sor;
    Iterator eor;
    Iterator last;
    BidiStatus m_status;
    WTF::Unicode::Direction m_direction;
    Iterator endOfLine;
    bool reachedEndOfLine;
    Iterator lastBeforeET;
    bool emptyRun;

    Run* m_firstRun;
    Run* m_lastRun;
    Run* m_logicallyLastRun;
    unsigned m_runCount;
};

template <class Iterator, class Run> inline void BidiResolver<Iterator, Run>::addRun(Run* run);

template <class Iterator, class Run> inline void BidiResolver<Iterator, Run>::prependRun(Run* run);

template <class Iterator, class Run> inline void BidiResolver<Iterator, Run>::moveRunToEnd(Run* run);

template <class Iterator, class Run> inline void BidiResolver<Iterator, Run>::moveRunToBeginning(Run* run);

template <class Iterator, class Run> void BidiResolver<Iterator, Run>::appendRun();

template <class Iterator, class Run> void BidiResolver<Iterator, Run>::embed(WTF::Unicode::Direction d);

template <class Iterator, class Run> void BidiResolver<Iterator, Run>::deleteRuns();

template <class Iterator, class Run> void BidiResolver<Iterator, Run>::reverseRuns(unsigned start, unsigned end);

template <class Iterator, class Run> void BidiResolver<Iterator, Run>::createBidiRunsForLine(const Iterator& end, bool visualOrder, bool hardLineBreak);

} // namespace WebCore

#endif // BidiResolver_h




