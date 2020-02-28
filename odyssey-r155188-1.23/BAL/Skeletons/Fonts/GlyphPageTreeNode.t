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
#ifndef GlyphPageTreeNode_h
#define GlyphPageTreeNode_h
/**
 *  @file  GlyphPageTreeNode.t
 *  GlyphPageTreeNode description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:06 $
 */
#include "BALBase.h"

#include <wtf/HashMap.h>
#include <wtf/PassRefPtr.h>
#include <wtf/RefCounted.h>
#include <wtf/unicode/Unicode.h>

namespace WKAL {

class FontData;
class GlyphPageTreeNode;
class SimpleFontData;

typedef unsigned short Glyph;

// Holds the glyph index and the corresponding SimpleFontData information for a given
// character.
struct GlyphData {
    Glyph glyph;
    const SimpleFontData* fontData;
};

// A GlyphPage contains a fixed-size set of GlyphData mappings for a contiguous
// range of characters in the Unicode code space. GlyphPages are indexed
// starting from 0 and incrementing for each 256 glyphs.
//
// One page may actually include glyphs from other fonts if the characters are
// missing in the parimary font. It is owned by exactly one GlyphPageTreeNode,
// although multiple nodes may reference it as their "page" if they are supposed
// to be overriding the parent's node, but provide no additional information.
struct GlyphPage : public RefCounted<GlyphPage> {
    /**
     * create a glyphPage
     * @param[in] : GlyphPageTreeNode
     * @param[out] : GlyphPage
     * @code
     * RefPtr<GlyphPage> gp = GlyphPage::create(gptn);
     * @endcode
     */
    static PassRefPtr<GlyphPage> create(GlyphPageTreeNode* owner);

    static const size_t size = 256; // Covers Latin-1 in a single page.
    GlyphData m_glyphs[size];
    GlyphPageTreeNode* m_owner;

    /**
     * glyphData for a character
     * @param[in] : character
     * @param[out] : glyph data
     * @code
     * GlyphData gd = gp->glyphDataForCharacter(c);
     * @endcode
     */
    const GlyphData& glyphDataForCharacter(UChar32 c) const ;

    /**
     * set glyphData for a character
     * @param[in] : character
     * @param[in] : glyph
     * @param[in] : font data
     * @code
     * gp->setGlyphDataForCharacter(c, g, f);
     * @endcode
     */
    void setGlyphDataForCharacter(UChar32 c, Glyph g, const SimpleFontData* f);

    /**
     * set glyphData for an index
     * @param[in] : index
     * @param[in] : glyph
     * @param[in] : font data
     * @code
     * gp->setGlyphDataForIndex(12, g, f);
     * @endcode
     */
    void setGlyphDataForIndex(unsigned index, Glyph g, const SimpleFontData* f);

    /**
     * get owner
     * @param[out] : GlyphPageTreeNode
     * @code
     * GlyphPageTreeNode *node = gp->owner();
     * @endcode
     */
    GlyphPageTreeNode* owner() const ;

    /**
     * fill GlyphPage
     * @param[in] : offset
     * @param[in] : length
     * @param[in] : character buffer
     * @param[in] : buffer length
     * @param[in] : font data
     * @param[out] : status
     * @code
     * bool s = gp->fill(12, 12, cb, cl, f);
     * @endcode
     */
    bool fill(unsigned offset, unsigned length, UChar* characterBuffer, unsigned bufferLength, const SimpleFontData*);

private:
    /**
     *  GlyphPage private constructor
     */
    GlyphPage(GlyphPageTreeNode* owner);
};

// The glyph page tree is a data structure that maps (FontData, glyph page number)
// to a GlyphPage.  Level 0 (the "root") is special. There is one root
// GlyphPageTreeNode for each glyph page number.  The roots do not have a
// GlyphPage associated with them, and their initializePage() function is never
// called to fill the glyphs.
//
// Each root node maps a FontData pointer to another GlyphPageTreeNode at
// level 1 (the "root child") that stores the actual glyphs for a specific font data.
// These nodes will only have a GlyphPage if they have glyphs for that range.
//
// Levels greater than one correspond to subsequent levels of the fallback list
// for that font. These levels override their parent's page of glyphs by
// filling in holes with the new font (thus making a more complete page).
//
// A NULL FontData pointer corresponds to the system fallback
// font. It is tracked separately from the regular pages and overrides so that
// the glyph pages do not get polluted with these last-resort glyphs. The
// system fallback page is not populated at construction like the other pages,
// but on demand for each glyph, because the system may need to use different
// fallback fonts for each. This lazy population is done by the Font.
class GlyphPageTreeNode : public WKALBase {
public:
    /**
     * GlyphPageTreeNode default constructor
     * @code
     * GlyphPageTreeNode *gptn = new GlyphPageTreeNode();
     * @endcode
     */
    GlyphPageTreeNode();

    /**
     * ~GlyphPageTreeNode destructor
     * @code
     * delete gptn;
     * @endcode
     */
    ~GlyphPageTreeNode();

    static HashMap<int, GlyphPageTreeNode*>* roots;
    static GlyphPageTreeNode* pageZeroRoot;

    /**
     * get root child 
     * @param[in] : font data
     * @param[in] : page number
     * @param[out] : GlyphPageTreeNode
     * @code
     * GlyphPageTreeNode *gptn = GlyphPageTreeNode::getRootChild(fd, pn);
     * @endcode
     */
    static GlyphPageTreeNode* getRootChild(const FontData* fontData, unsigned pageNumber);

    /**
     * pruneCustomFontData on all tree for a font data
     * @param[in] : font data
     * @code
     * GlyphPageTreeNode::pruneTreeCustomFontData(f);
     * @endcode
     */
    static void pruneTreeCustomFontData(const FontData*);

    /**
     * pruneFontData on all tree for a font data
     * @param[in] : font data
     * @code
     * GlyphPageTreeNode::pruneTreeFontData(f);
     * @endcode
     */
    static void pruneTreeFontData(const SimpleFontData*);

    /**
     * pruneCustomFontData on all tree for a font data
     * @param[in] : font data
     * @code
     * gptn->pruneTreeCustomFontData(f);
     * @endcode
     */
    void pruneCustomFontData(const FontData*);

    /**
     * pruneFontData on all tree for a font data
     * @param[in] : font data
     * @code
     * gptn->pruneTreeFontData(f);
     * @endcode
     */
    void pruneFontData(const SimpleFontData*, unsigned level = 0);

    /**
     * get parent 
     * @param[out] : GlyphPageTreeNode
     * @code
     * GlyphPageTreeNode *p = gptn->parent();
     * @endcode
     */
    GlyphPageTreeNode* parent() const ;

    /**
     * get child
     * @param[in] : font data
     * @param[in] : page number
     * @param[out] : GlyphPageTreeNode
     * @code
     * GlyphPageTreeNode *gptn = gptn->getChild(fd, pn);
     * @endcode
     */
    GlyphPageTreeNode* getChild(const FontData*, unsigned pageNumber);

    /**
     * Returns a page of glyphs (or NULL if there are no glyphs in this page's character range).
     * @param[out] : page of glyphs
     * @code
     * GlyphPage *p = gptn->page();
     * @endcode
     */
    GlyphPage* page() const ;

    /**
     * Returns the level of this node. See class-level comment.
     * @param[out] : level
     * @code
     * unsigned l = gptn->level();
     * @endcode
     */
    unsigned level() const ;

    /**
     * The system fallback font has special rules (see above).
     * @param[out] : status
     * @code
     * bool sf = gptn->isSystemFallback();
     * @endcode
     */
    bool isSystemFallback() const ;

    /**
     * GlyphPage count in tree
     * @param[out] : count
     * @code
     * size_t count = gptn->treeGlyphPageCount();
     * @endcode
     */
    static size_t treeGlyphPageCount();

    /**
     * page count
     * @param[out] : count
     * @code
     * size_t count = gptn->pageCount();
     * @endcode
     */
    size_t pageCount() const;

private:
    /**
     * get root
     * @param[in] : page number
     * @param[out] : root
     * @code
     * GlyphPageTreeNode *root = GlyphPageTreeNode::getRoot(2);
     * @endcode
     */
    static GlyphPageTreeNode* getRoot(unsigned pageNumber);

    /**
     * initialize page
     * @param[in] : font data
     * @param[in] : page number
     * @code
     * initializePage(fd, pn);
     * @endcode
     */
    void initializePage(const FontData*, unsigned pageNumber);

    GlyphPageTreeNode* m_parent;
    RefPtr<GlyphPage> m_page;
    unsigned m_level;
    bool m_isSystemFallback;
    HashMap<const FontData*, GlyphPageTreeNode*> m_children;
    GlyphPageTreeNode* m_systemFallbackChild;
    unsigned m_customFontCount;

#ifndef NDEBUG
    unsigned m_pageNumber;
#endif
};

} // namespace WKAL

#endif // GlyphPageTreeNode_h




