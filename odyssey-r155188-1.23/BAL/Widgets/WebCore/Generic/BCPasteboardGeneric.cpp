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
#include "Logging.h"
#include "Pasteboard.h"

#include "CString.h"
#include "DocumentFragment.h"
#include "Frame.h"
#include "Image.h"
#include "KURL.h"
#include "NotImplemented.h"
#include "markup.h"
#include "PlatformString.h"
#include "Range.h"
#include "RenderImage.h"

#if ENABLE(SVG)
#include "SVGNames.h"
#include "XLinkNames.h"
#endif

namespace WebCore {

/* FIXME: we must get rid of this and use the enum in webkitwebview.h someway */
typedef enum
{
    WEBKIT_WEB_VIEW_TARGET_INFO_HTML = - 1,
    WEBKIT_WEB_VIEW_TARGET_INFO_TEXT = - 2
} WebKitWebViewTargetInfo;

class PasteboardSelectionData {
public:
    PasteboardSelectionData() 
    : m_text("")
    , m_markup("")
    , m_title("")
    , m_image(0)
    {
    }

    ~PasteboardSelectionData() {
    }

    void clear() {
        m_text = "";
        m_markup = "";
        m_url = KURL();
        m_title = "";
        m_image = 0;
    }

    String m_text;
    String m_markup;
    KURL m_url;
    String m_title;
    NativeImagePtr m_image;
};

Pasteboard* Pasteboard::generalPasteboard()
{
    static Pasteboard* pasteboard = new Pasteboard();
    return pasteboard;
}

Pasteboard::Pasteboard()
: m_data(new PasteboardSelectionData())
{
    notImplemented();
}

Pasteboard::~Pasteboard()
{
    delete m_data;
}

void replacePasteboardNBSPWithSpace(String& str)
{
    static const UChar NonBreakingSpaceCharacter = 0xA0;
    static const UChar SpaceCharacter = ' ';
    str.replace(NonBreakingSpaceCharacter, SpaceCharacter);
}

void Pasteboard::writeSelection(Range* selectedRange, bool canSmartCopyOrDelete, Frame* frame)
{
    m_data->m_text = frame->selectedText();
    m_data->m_markup = createMarkup(selectedRange, 0, AnnotateForInterchange);
    ExceptionCode ec = 0;
    KURL url = selectedRange->startContainer(ec)->document()->url();
    m_data->m_url = url;
    replacePasteboardNBSPWithSpace(m_data->m_text);
}

void Pasteboard::writePlainText(const String& text)
{
    m_data->m_text = text;
}

void Pasteboard::writeURL(const KURL& url, const String& titleStr, Frame* frame)
{
    m_data->m_url = url;
    String title(titleStr);
    if (title.isEmpty()) {
        title = url.lastPathComponent();
        if (title.isEmpty())
            title = url.host();
    }
    m_data->m_title = title;
}

void Pasteboard::writeImage(Node* node, const KURL&, const String& title)
{
    ASSERT(node);
    ASSERT(node->renderer());
    ASSERT(node->renderer()->isImage());
    RenderImage* renderer = toRenderImage(node->renderer());
    CachedImage* cachedImage = renderer->cachedImage();
    ASSERT(cachedImage);
    Image* image = cachedImage->image();
    ASSERT(image);

    // If the image is wrapped in a link, |url| points to the target of the
    // link.  This isn't useful to us, so get the actual image URL.
    AtomicString urlString;
    if (node->hasTagName(HTMLNames::imgTag) || node->hasTagName(HTMLNames::inputTag))
        urlString = static_cast<Element*>(node)->getAttribute(HTMLNames::srcAttr);
#if ENABLE(SVG)
    else if (node->hasTagName(SVGNames::imageTag))
        urlString = static_cast<Element*>(node)->getAttribute(XLinkNames::hrefAttr);
#endif
    else if (node->hasTagName(HTMLNames::embedTag) || node->hasTagName(HTMLNames::objectTag)) {
        Element* element = static_cast<Element*>(node);
        urlString = element->getAttribute(element->imageSourceAttributeName());
    }
    KURL url = urlString.isEmpty() ? KURL() : node->document()->completeURL(deprecatedParseURL(urlString));

    m_data->m_image = image->nativeImageForCurrentFrame();
}

void Pasteboard::clear()
{
    m_data->clear();
}

bool Pasteboard::canSmartReplace()
{
    notImplemented();
    return false;
}

PassRefPtr<DocumentFragment> Pasteboard::documentFragment(Frame* frame, PassRefPtr<Range> context,
                                                          bool allowPlainText, bool& chosePlainText)
{
    if (!m_data)
        return 0;

    chosePlainText = false;
    String html = m_data->m_markup;
    if (!html.isEmpty()) {
        RefPtr<DocumentFragment> fragment = createFragmentFromMarkup(frame->document(), html, m_data->m_url);
        if (fragment)
            return fragment.release();
    }


    if (!allowPlainText)
        return 0;

    String text = m_data->m_text;

    chosePlainText = true;
    RefPtr<DocumentFragment> fragment = createFragmentFromText(context.get(), text);
    if (fragment)
        return fragment.release();

    return 0;
}

String Pasteboard::plainText(Frame* frame)
{
    if (!m_data)
        return String();
    return m_data->m_text;
}

}
