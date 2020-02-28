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
#ifndef DragData_h
#define DragData_h
/**
 *  @file  DragData.t
 *  DragData description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:06 $
 */
#include "BALBase.h"

#include "ClipboardAccessPolicy.h"
#include "Color.h"
#include "DragActions.h"
#include "IntPoint.h"

#include <wtf/Forward.h>
#include <wtf/Vector.h>



namespace WKAL {
    
    class Clipboard;
    class Document;
    class DocumentFragment;
    class KURL;
    

    
    class DragData : public WKALBase {
    public:
        //clientPosition is taken to be the position of the drag event within the target window, with (0,0) at the top left
    /**
     * DragData constructor
     * @param[in] : drag data
     * @param[in] : client position
     * @param[in] : global position
     * @param[in] : operation
     * @code
     * DragData *dd = new DragData(data, cp, gp, op);
     * @endcode
     */
        DragData(DragDataRef data, const IntPoint& clientPosition, const IntPoint& globalPosition, DragOperation operation);

    /**
     * get client position
     * @param[out] : client position
     * @code
     * IntPoint p = dd->clientPosition();
     * @endcode
     */
        const IntPoint& clientPosition() const ;

    /**
     * get global position
     * @param[out] : global position
     * @code
     * IntPoint p = dd->globalPosition();
     * @endcode
     */
        const IntPoint& globalPosition() const ;

    /**
     * get platformData
     * @param[out] : DragDataRef
     * @code
     * DragDataRef d = dd->platformData();
     * @endcode
     */
        DragDataRef platformData() const ;

    /**
     * dragging source pperation mask
     * @param[out] : DragOperation
     * @code
     * DragOperation do = dd->draggingSourceOperationMask();
     * @endcode
     */
        DragOperation draggingSourceOperationMask() const ;

    /**
     * create Clipboard 
     * @param[in] : Clipboard Access Policy
     * @param[out] : Clipboard
     * @code
     * RefPtr<Clipboard> c = dd->createClipboard(cap);
     * @endcode
     */
        PassRefPtr<Clipboard> createClipboard(ClipboardAccessPolicy) const;

    /**
     * test if the DragData contains URL
     * @param[out] : true if the DragData contains URL
     * @code
     * bool c = dd->containsURL();
     * @endcode
     */
        bool containsURL() const;

    /**
     * test if the DragData contains plainText
     * @param[out] : true if the DragData contains plainText
     * @code
     * bool c = dd->containsPlainText();
     * @endcode
     */
        bool containsPlainText() const;

    /**
     * test if the DragData contains compatible content
     * @param[out] : true if the DragData contains compatible content
     * @code
     * bool c = dd->containsCompatibleContent();
     * @endcode
     */
        bool containsCompatibleContent() const;

    /**
     * return DragData as URL 
     * @param[in] : title
     * @param[out] : url
     * @code
     * String url = dd->asURL();
     * @endcode
     */
        String asURL(String* title = 0) const;

    /**
     * return DragData as plainText
     * @param[out] : plainText
     * @code
     * String pt = dd->asPlainText();
     * @endcode
     */
        String asPlainText() const;

    /**
     * return DragData as file names
     * @param[in] : 
     * @code
     * dd->asFilenames(v);
     * @endcode
     */
        void asFilenames(Vector<String>&) const;

    /**
     * return DragData as color
     * @param[out] : color
     * @code
     * Color c = dd->asColor();
     * @endcode
     */
        Color asColor() const;

    /**
     * return DragData as document fragment 
     * @param[in] : document
     * @param[out] : DocumentFragment
     * @code
     * RefPtr<DocumentFragment> df = dd->asFragment(d);
     * @endcode
     */
        PassRefPtr<DocumentFragment> asFragment(Document*) const;

    /**
     * test if dragData can smart replace
     * @param[out] : true if you can smart replace
     * @code
     * bool c = dd->canSmartReplace();
     * @endcode
     */
        bool canSmartReplace() const;

    /**
     * test if DragData contains color
     * @param[out] : true if DragData contains color
     * @code
     * bool c = dd->containsColor();
     * @endcode
     */
        bool containsColor() const;

    /**
     * test if DragData contains files
     * @param[out] : true if DragData contains files
     * @code
     * bool c = dd->containsFiles();
     * @endcode
     */
        bool containsFiles() const;
    private:
        IntPoint m_clientPosition;
        IntPoint m_globalPosition;
        DragDataRef m_platformDragData;
        DragOperation m_draggingSourceOperationMask;
};
    
} //namespace WKAL

#endif //!DragData_h





