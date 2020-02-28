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
#ifndef PopupMenu_h
#define PopupMenu_h
/**
 *  @file  PopupMenu.t
 *  PopupMenu description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:12 $
 */
#include "BALBase.h"

#include "IntRect.h"
#include "PopupMenuClient.h"
#include <wtf/PassRefPtr.h>
#include <wtf/RefCounted.h>


namespace WKAL {

class FrameView;
class PlatformScrollbar;

class PopupMenu : public RefCounted<PopupMenu>
{
public:
    /**
     * create PopupMenu
     * @param[in] : popup menu client
     * @param[out] : popup menu
     * @code
     * RefPtr<PopupMenu> p = PopupMenu::create(c);
     * @endcode
     */
    static PassRefPtr<PopupMenu> create(PopupMenuClient* client) ;

    /**
     * PopupMenu destructor
     * @code
     * delete p;
     * @endcode
     */
    ~PopupMenu();
    
    /**
     * disconnect client
     * @code
     * p->disconnectClient();
     * @endcode
     */
    void disconnectClient() ;

    /**
     * show
     * @param[in] : rect
     * @param[in] : frame view
     * @param[in] : index
     * @code
     * p->show(r, f, i);
     * @endcode
     */
    void show(const IntRect&, FrameView*, int index);

    /**
     * hide
     * @code
     * p->hide();
     * @endcode
     */
    void hide();

    /**
     * update from element 
     * @code
     * p->updateFromElement();
     * @endcode
     */
    void updateFromElement();
    
    /**
     * get client
     * @param[out] : popup menu client
     * @code
     * PopupMenuClient *pmc = p->client();
     * @endcode
     */
    PopupMenuClient* client() const ;

    /**
     * test if item writing direction is natural
     * @param[out] : true if item writing direction is natural
     * @code
     * bool i = p->itemWritingDirectionIsNatural();
     * @endcode
     */
    static bool itemWritingDirectionIsNatural();


protected:
    /**
     * PopupMenu constructor
     * @param[in] : popup menu client
     */
    PopupMenu(PopupMenuClient*);
    
private:
    PopupMenuClient* m_popupClient;
    

};

}

#endif




