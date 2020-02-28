/*
 * Copyright (C) 2010 Pleyo.  All rights reserved.
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
#include "ClipboardGeneric.h"

#include "CachedImage.h"
#include "DataObject.h"
#include "Document.h"
#include "Element.h"
#include "FileList.h"
#include "Frame.h"
#include "HTMLNames.h"
#include "Image.h"
#include "MIMETypeRegistry.h"
#include "markup.h"
#include "NamedNodeMap.h"
#include "Pasteboard.h"
#include "PlatformString.h"
#include "Range.h"
#include "RenderImage.h"
#include "SharedBuffer.h"
#include "StringBuilder.h"

#include "CString.h"

namespace WebCore {

using namespace HTMLNames;

PassRefPtr<Clipboard> Editor::newGeneralClipboard(ClipboardAccessPolicy policy)
{
    return ClipboardBal::create(false, DataObject::create(), policy);
}

// We provide the IE clipboard types (URL and Text), and the clipboard types specified in the WHATWG Web Applications 1.0 draft
// see http://www.whatwg.org/specs/web-apps/current-work/ Section 6.3.5.3

enum ClipboardDataType { ClipboardDataTypeNone, ClipboardDataTypeURL, ClipboardDataTypeText, ClipboardDataTypeDownloadURL };

static ClipboardDataType clipboardTypeFromMIMEType(const String& type)
{
    String cleanType = type.stripWhiteSpace().lower();

    // two special cases for IE compatibility
    if (cleanType == "text" || cleanType == "text/plain" || cleanType.startsWith("text/plain;"))
        return ClipboardDataTypeText;
    if (cleanType == "url" || cleanType == "text/uri-list")
        return ClipboardDataTypeURL;
    if (cleanType == "downloadurl")
        return ClipboardDataTypeDownloadURL;

    return ClipboardDataTypeNone;
}

ClipboardBal::ClipboardBal(bool isForDragging,
                                     PassRefPtr<DataObject> dataObject,
                                     ClipboardAccessPolicy policy)
    : Clipboard(policy, isForDragging)
    , m_dataObject(dataObject)
{
}

PassRefPtr<ClipboardBal> ClipboardBal::create(bool isForDragging,
    PassRefPtr<DataObject> dataObject, ClipboardAccessPolicy policy)
{
    return adoptRef(new ClipboardBal(isForDragging, dataObject, policy));
}

void ClipboardBal::clearData(const String& type)
{
    if (policy() != ClipboardWritable || !m_dataObject)
        return;

    ClipboardDataType dataType = clipboardTypeFromMIMEType(type);

    if (dataType == ClipboardDataTypeURL) {
        m_dataObject->url = KURL();
        m_dataObject->urlTitle = "";
    }

    if (dataType == ClipboardDataTypeText)
        m_dataObject->plainText = "";
}

void ClipboardBal::clearAllData()
{
    if (policy() != ClipboardWritable)
        return;

    m_dataObject->clear();
}

String ClipboardBal::getData(const String& type, bool& success) const
{
    success = false;
    if (policy() != ClipboardReadable || !m_dataObject)
        return String();

    ClipboardDataType dataType = clipboardTypeFromMIMEType(type);
    String text;
    if (dataType == ClipboardDataTypeText) {
        if (!isForDragging()) {

            text = Pasteboard::generalPasteboard()->plainText();
            success = !text.isEmpty();
        } else if (!m_dataObject->plainText.isEmpty()) {
            success = true;
            text = m_dataObject->plainText;
        }
    } else if (dataType == ClipboardDataTypeURL) {
        // FIXME: Handle the cut/paste event.  This requires adding a new IPC
        // message to get the URL from the clipboard directly.
        if (!m_dataObject->url.isEmpty()) {
            success = true;
            text = m_dataObject->url.string();
        }
    }

    return text;
}

bool ClipboardBal::setData(const String& type, const String& data)
{
    if (policy() != ClipboardWritable)
        return false;

    ClipboardDataType winType = clipboardTypeFromMIMEType(type);

    if (winType == ClipboardDataTypeURL) {
        m_dataObject->url = KURL(ParsedURLString, data);
        Pasteboard::generalPasteboard()->writeURL(m_dataObject->url, "", 0);
        return m_dataObject->url.isValid();
    }

    if (winType == ClipboardDataTypeText) {
        m_dataObject->plainText = data;
        Pasteboard::generalPasteboard()->writePlainText(data);
        return true;
    }
    
    if (winType == ClipboardDataTypeDownloadURL) {
        KURL url = KURL(ParsedURLString, data);
        if (url.isValid()) {
            m_dataObject->downloadURL = url;
            Pasteboard::generalPasteboard()->writeURL(url, "", 0);
            return true;
        }
    }

    return false;
}

// extensions beyond IE's API
HashSet<String> ClipboardBal::types() const
{
    HashSet<String> results;
    if (policy() != ClipboardReadable && policy() != ClipboardTypesReadable)
        return results;

    if (!m_dataObject)
        return results;

    if (!m_dataObject->filenames.isEmpty())
        results.add("Files");

    if (m_dataObject->url.isValid()) {
        results.add("URL");
        results.add("text/uri-list");
    }

    if (!m_dataObject->plainText.isEmpty()) {
        results.add("Text");
        results.add("text/plain");
    }

    return results;
}

PassRefPtr<FileList> ClipboardBal::files() const
{
    if (policy() != ClipboardReadable)
        return FileList::create();

    if (!m_dataObject || m_dataObject->filenames.isEmpty())
        return FileList::create();

    RefPtr<FileList> fileList = FileList::create();
    for (size_t i = 0; i < m_dataObject->filenames.size(); ++i)
        fileList->append(File::create(m_dataObject->filenames.at(i)));

    return fileList.release();
}

void ClipboardBal::setDragImage(CachedImage* image, Node* node, const IntPoint& loc)
{
    if (policy() != ClipboardImageWritable && policy() != ClipboardWritable)
        return;

    if (m_dragImage)
        m_dragImage->removeClient(this);
    m_dragImage = image;
    if (m_dragImage)
        m_dragImage->addClient(this);

    m_dragLoc = loc;
    m_dragImageElement = node;
}

void ClipboardBal::setDragImage(CachedImage* img, const IntPoint& loc)
{
    setDragImage(img, 0, loc);
}

void ClipboardBal::setDragImageElement(Node* node, const IntPoint& loc)
{
    setDragImage(0, node, loc);
}

DragImageRef ClipboardBal::createDragImage(IntPoint& loc) const
{
    DragImageRef result = 0;
    if (m_dragImage) {
        result = createDragImageFromImage(m_dragImage->image());
        loc = m_dragLoc;
    }
    return result;
}

static String imageToMarkup(const String& url, Element* element)
{
    StringBuilder markup;
    markup.append("<img src=\"");
    markup.append(url);
    markup.append("\"");
    // Copy over attributes.  If we are dragging an image, we expect things like
    // the id to be copied as well.
    NamedNodeMap* attrs = element->attributes();
    unsigned length = attrs->length();
    for (unsigned i = 0; i < length; ++i) {
        Attribute* attr = attrs->attributeItem(i);
        if (attr->localName() == "src")
            continue;
        markup.append(" ");
        markup.append(attr->localName());
        markup.append("=\"");
        String escapedAttr = attr->value();
        escapedAttr.replace("\"", "&quot;");
        markup.append(escapedAttr);
        markup.append("\"");
    }

    markup.append("/>");
    return markup.toString();
}

static CachedImage* getCachedImage(Element* element)
{
    // Attempt to pull CachedImage from element
    ASSERT(element);
    RenderObject* renderer = element->renderer();
    if (!renderer || !renderer->isImage())
        return 0;

    RenderImage* image = toRenderImage(renderer);
    if (image->cachedImage() && !image->cachedImage()->errorOccurred())
        return image->cachedImage();

    return 0;
}

static void writeImageToDataObject(DataObject* dataObject, Element* element,
                                   const KURL& url)
{
    // Shove image data into a DataObject for use as a file
    CachedImage* cachedImage = getCachedImage(element);
    if (!cachedImage || !cachedImage->image() || !cachedImage->isLoaded())
        return;

    SharedBuffer* imageBuffer = cachedImage->image()->data();
    if (!imageBuffer || !imageBuffer->size())
        return;

    dataObject->fileContent = imageBuffer;

    // Determine the filename for the file contents of the image.  We try to
    // use the alt tag if one exists, otherwise we fall back on the suggested
    // filename in the http header, and finally we resort to using the filename
    // in the URL.
    /*String extension = MIMETypeRegistry::getPreferredExtensionForMIMEType(
        cachedImage->response().mimeType());*/
    String extension = "png";
    dataObject->fileExtension = extension.isEmpty() ? "" : "." + extension;
    String title = element->getAttribute(altAttr);
    if (title.isEmpty())
        title = cachedImage->response().suggestedFilename();

    //title = ClipboardBal::validateFileName(title, dataObject);
    dataObject->fileContentFilename = title + dataObject->fileExtension;
}

void ClipboardBal::declareAndWriteDragImage(Element* element, const KURL& url, const String& title, Frame* frame)
{
    if (!m_dataObject)
        return;

    m_dataObject->url = url;
    m_dataObject->urlTitle = title;

    // Write the bytes in the image to the file format.
    writeImageToDataObject(m_dataObject.get(), element, url);

    AtomicString imageURL = element->getAttribute(srcAttr);
    if (imageURL.isEmpty())
        return;

    String fullURL = frame->document()->completeURL(deprecatedParseURL(imageURL));
    if (fullURL.isEmpty())
        return;

    // Put img tag on the clipboard referencing the image
    m_dataObject->textHtml = imageToMarkup(fullURL, element);
}

String urlToMarkup(const KURL& url, const String& title)
{
    String markup("<a href=\"");
    markup.append(url.string());
    markup.append("\">");
    // FIXME: HTML escape this, possibly by moving into the glue layer so we
    // can use net/base/escape.h.
    markup.append(title);
    markup.append("</a>");
    return markup;
}

void replaceNBSPWithSpace(String& str)
{
    static const UChar NonBreakingSpaceCharacter = 0xA0;
    static const UChar SpaceCharacter = ' ';
    str.replace(NonBreakingSpaceCharacter, SpaceCharacter);
}

void ClipboardBal::writeURL(const KURL& url, const String& title, Frame*)
{
    if (!m_dataObject)
        return;
    m_dataObject->url = url;
    m_dataObject->urlTitle = title;

    // The URL can also be used as plain text.
    m_dataObject->plainText = url.string();

    // The URL can also be used as an HTML fragment.
    m_dataObject->textHtml = urlToMarkup(url, title);
    m_dataObject->htmlBaseUrl = url;
}

void ClipboardBal::writeRange(Range* selectedRange, Frame* frame)
{
    ASSERT(selectedRange);
    if (!m_dataObject)
         return;

    m_dataObject->textHtml = createMarkup(selectedRange, 0,
        AnnotateForInterchange);
#if OS(DARWIN)
    m_dataObject->textHtml = String("<meta charset='utf-8' id='webkit-interchange-charset'>") + m_dataObject->textHtml;
#endif
    m_dataObject->htmlBaseUrl = frame->document()->url();

    String str = frame->selectedText();
#if OS(WINDOWS)
    replaceNewlinesWithWindowsStyleNewlines(str);
#endif
    replaceNBSPWithSpace(str);
    m_dataObject->plainText = str;
}

void ClipboardBal::writePlainText(const String& plain)
{
    if (!m_dataObject)
        return;
    m_dataObject->plainText = plain;
}

bool ClipboardBal::hasData()
{
    if (!m_dataObject)
        return false;

    return m_dataObject->hasData();
}

} // namespace WebCore
