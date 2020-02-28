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
#ifndef ContextMenu_h
#define ContextMenu_h
/**
 *  @file  ContextMenu.t
 *  ContextMenu description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:12 $
 */
#include "BALBase.h"

#include <wtf/Noncopyable.h>

#include "ContextMenuItem.h"
#include "HitTestResult.h"
#include "PlatformMenuDescription.h"
#include "PlatformString.h"

namespace WKAL {
class MenuEventProxy;

    class ContextMenuController;

    class ContextMenu : Noncopyable
    {
    public:
    /**
     * ContextMenu constructor
     * @param[in] : HitTestResult
     * @code
     * ContextMenu *c= new ContextMenu(h);
     * @endcode
     */
        ContextMenu(const HitTestResult&);

    /**
     * ContextMenu constructor
     * @param[in] : HitTestResult
     * @param[in] : platform menu description
     * @code
     * ContextMenu *c= new ContextMenu(h, d);
     * @endcode
     */
        ContextMenu(const HitTestResult&, const PlatformMenuDescription);

    /**
     * ContextMenu destructor
     * @code
     * delete c;
     * @endcode
     */
        ~ContextMenu();

    /**
     * populate context menu
     * @code
     * c->populate();
     * @endcode
     */
        void populate();

    /**
     * add inspect element item
     * @code
     * c->addInspectElementItem();
     * @endcode
     */
        void addInspectElementItem();

    /**
     * check or enable if needed
     * @param[in] : context menu item
     * @code
     * c->checkOrEnableIfNeeded(i);
     * @endcode
     */
        void checkOrEnableIfNeeded(ContextMenuItem&) const;

    /**
     * insert item
     * @param[in] : position
     * @param[in] : context menu item
     * @code
     * c->insertItem(p, i);
     * @endcode
     */
        void insertItem(unsigned position, ContextMenuItem&);

    /**
     * append item 
     * @param[in] : context menu item
     * @code
     * c->appendItem(i);
     * @endcode
     */
        void appendItem(ContextMenuItem&);
        
    /**
     * get item with action
     * @param[in] : action
     * @param[out] : context menu item
     * @code
     * ContextMenuItem *i = c->itemWithAction(a);
     * @endcode
     */
        ContextMenuItem* itemWithAction(unsigned);

    /**
     * get item at index 
     * @param[in] : index
     * @param[in] : platform menu description
     * @param[out] : context menu item
     * @code
     * ContextMenuItem *i = c->itemAtIndex(i, p);
     * @endcode
     */
        ContextMenuItem* itemAtIndex(unsigned, const PlatformMenuDescription);

    /**
     * get item count 
     * @param[out] : item count
     * @code
     * unsigned count = c->itemCount();
     * @endcode
     */
        unsigned itemCount() const;

    /**
     * get hitTestResult value
     * @param[out] : HitTestResult
     * @code
     * HitTestResult h = c->hitTestResult()
     * @endcode
     */
        HitTestResult hitTestResult() const ;

    /**
     * get controller
     * @param[out] : context menu controller
     * @code
     * ContextMenuController *cmc = c->controller();
     * @endcode
     */
        ContextMenuController* controller() const;

    /**
     * get platform menu description
     * @param[out] : platform menu description
     * @code
     * PlatformMenuDescription p = c->platformDescription();
     * @endcode
     */
        PlatformMenuDescription platformDescription() const;

    /**
     * set platform menu description
     * @param[in] : platform menu description
     * @code
     * c->setPlatformDescription(pmd);
     * @endcode
     */
        void setPlatformDescription(PlatformMenuDescription);

    /**
     * release platform menu description
     * @param[out] : platform menu description
     * @code
     * PlatformMenuDescription pmd = c->releasePlatformDescription();
     * @endcode
     */
        PlatformMenuDescription releasePlatformDescription();

    private:
        HitTestResult m_hitTestResult;

    };

}

#endif // ContextMenu_h




