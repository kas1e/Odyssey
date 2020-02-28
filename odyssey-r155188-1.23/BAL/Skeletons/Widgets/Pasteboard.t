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
#ifndef Pasteboard_h
#define Pasteboard_h
/**
 *  @file  Pasteboard.t
 *  Pasteboard description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:12 $
 */
#include "BALBase.h"

#include <wtf/Forward.h>
#include <wtf/HashSet.h>
#include <wtf/Noncopyable.h>



// FIXME: This class is too high-level to be in the platform directory, since it
// uses the DOM and makes calls to Editor. It should either be divested of its
// knowledge of the frame and editor or moved into the editing directory.



namespace WKAL {


class CString;
class DocumentFragment;
class Frame;
class HitTestResult;
class KURL;
class Node;
class Range;
class String;
    
class Pasteboard : public WKALBase, Noncopyable {
public:
    
    /**
     * get general pasteboard 
     * @param[out] : pasteBoard
     * @code
     * Pasteboard *p = Pasteboard::generalPasteboard();
     * @endcode
     */
    static Pasteboard* generalPasteboard();

    /**
     * write selection
     * @param[in] : range
     * @param[in] : can smart copy or delete
     * @param[in] : frame
     * @code
     * p->writeSelection(r, c, f);
     * @endcode
     */
    void writeSelection(Range*, bool canSmartCopyOrDelete, Frame*);

    /**
     * write URL
     * @param[in] : url
     * @param[in] : title
     * @param[in] : frame
     * @code
     * p->writeURL(url, t, f);
     * @endcode
     */
    void writeURL(const KURL&, const String&, Frame* = 0);

    /**
     * write image 
     * @param[in] : node
     * @param[in] : url
     * @param[in] : title
     * @code
     * p->writeImage(n, url, t);
     * @endcode
     */
    void writeImage(Node*, const KURL&, const String& title);

    /**
     * clear
     * @code
     * p->clear();
     * @endcode
     */
    void clear();

    /**
     * test if Pasteboard can smart replace
     * @param[out] : true if Pasteboard can smart replace
     * @code
     * bool c = p->canSmartReplace();
     * @endcode
     */
    bool canSmartReplace();

    /**
     * get document fragment 
     * @param[in] : frame
     * @param[in] : range
     * @param[in] : allow plain text
     * @param[in] : chose plain text
     * @param[out] : document fragment
     * @code
     * RefPtr<DocumentFragment> df = p->documentFragment(f, r, a, c);
     * @endcode
     */
    PassRefPtr<DocumentFragment> documentFragment(Frame*, PassRefPtr<Range>, bool allowPlainText, bool& chosePlainText);

    /**
     * get plain text
     * @param[out] : plain text
     * @code
     * String pt = p->plainText(f);
     * @endcode
     */
    String plainText(Frame* = 0);

    /**
     * set helper
     * @param[in] : pasteboard helper
     * @code
     * p->setHelper(pbh);
     * @endcode
     */
    void setHelper(PasteboardHelper*);

private:
    /**
     * Pasteboard default constructor
     */
    Pasteboard();

    /**
     * Pasteboard destructor
     */
    ~Pasteboard();



    PasteboardHelper* m_helper;

};

} // namespace WKAL

#endif // Pasteboard_h




