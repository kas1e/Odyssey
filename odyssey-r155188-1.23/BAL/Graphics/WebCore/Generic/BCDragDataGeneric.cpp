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
#include "config.h"
#include "DragData.h"

#include "Clipboard.h"
#include "ClipboardGeneric.h"
#include "DataObject.h"
#include "Document.h"
#include "DocumentFragment.h"
#include "FileSystem.h"
#include "markup.h"
#include "SharedBuffer.h"

#include <sys/stat.h>
#include <sys/types.h>
#include <dirent.h>
#include "CString.h"

namespace WebCore {

bool DirectoryExists(const String& path) {
    struct stat stat_buf;
    stat(path.utf8().data(), &stat_buf);
    return S_ISDIR(stat_buf.st_mode);
}

PassRefPtr<Clipboard> DragData::createClipboard(ClipboardAccessPolicy policy) const
{
    RefPtr<ClipboardBal> clipboard = ClipboardBal::create(true, m_platformDragData, policy);
    return clipboard.release();
}

bool DragData::containsURL() const
{
    return !asURL().isEmpty();
}

String DragData::asURL(String* title) const
{
    String url;
    if (m_platformDragData->url.isValid() && !m_platformDragData->url.isEmpty())
        url = m_platformDragData->url.string();
    else if (m_platformDragData->filenames.size() >= 1) {
        String fileName = m_platformDragData->filenames.last();
        url = fileName;
        /*if (fileExists(fileName) && !DirectoryExists(fileName))
            url = fileName;*/
    }

    // |title| can be NULL
    if (title)
        *title = m_platformDragData->urlTitle;
    return url;
}

bool DragData::containsFiles() const
{
    return !m_platformDragData->filenames.isEmpty();
}

void DragData::asFilenames(Vector<String>& result) const
{
    for (size_t i = 0; i < m_platformDragData->filenames.size(); ++i)
        result.append(m_platformDragData->filenames[i]);
}

bool DragData::containsPlainText() const
{
    return !m_platformDragData->plainText.isEmpty();
}

String DragData::asPlainText() const
{
    return m_platformDragData->plainText;
}

bool DragData::containsColor() const
{
    return false;
}

Color DragData::asColor() const
{
    return Color();
}

bool DragData::canSmartReplace() const
{
    return !m_platformDragData->plainText.isEmpty()
        && !m_platformDragData->url.isValid();
}

bool DragData::containsCompatibleContent() const
{
    return containsPlainText()
        || containsURL()
        || (m_platformDragData->textHtml.length() > 0)
        || containsColor()
        || containsFiles();
}

PassRefPtr<DocumentFragment> DragData::asFragment(Document* doc) const
{
    if (containsFiles()) {
        // FIXME: Implement this.  Should be pretty simple to make some HTML
        // and call createFragmentFromMarkup.
        //if (RefPtr<DocumentFragment> fragment = createFragmentFromMarkup(doc,
        //    ?, KURL()))
        //    return fragment;
    }

    if (!m_platformDragData->textHtml.isEmpty()) {
        RefPtr<DocumentFragment> fragment = createFragmentFromMarkup(doc,
            m_platformDragData->textHtml, m_platformDragData->htmlBaseUrl);
        return fragment.release();
    }

    return 0;
}

}
