#ifndef FontTest_h_CPPUNIT
#define FontTest_h_CPPUNIT

#include "config.h"
#include <cppunit/extensions/HelperMacros.h>
#include "BCFont.h"
class TextRunTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( TextRunTestTest );
//register each method:
    CPPUNIT_TEST(TextRun_uchar);
    CPPUNIT_TEST(TextRun_string);
    CPPUNIT_TEST(operator__);
    CPPUNIT_TEST(data);
    CPPUNIT_TEST(characters);
    CPPUNIT_TEST(length);

    CPPUNIT_TEST(setText);

    CPPUNIT_TEST(allowTabs);
    CPPUNIT_TEST(xPos);
    CPPUNIT_TEST(padding);
    CPPUNIT_TEST(rtl);
    CPPUNIT_TEST(ltr);
    CPPUNIT_TEST(directionalOverride);
    CPPUNIT_TEST(applyRunRounding);
    CPPUNIT_TEST(applyWordRounding);
    CPPUNIT_TEST(spacingDisabled);

    CPPUNIT_TEST(disableSpacing);
    CPPUNIT_TEST(disableRoundingHacks);
    CPPUNIT_TEST(setRTL);
    CPPUNIT_TEST(setDirectionalOverride);

    CPPUNIT_TEST(referencingRenderObject);
    CPPUNIT_TEST(setReferencingRenderObject);
    CPPUNIT_TEST(activePaintServer);
    CPPUNIT_TEST(setActivePaintServer);


    CPPUNIT_TEST_SUITE_END();

public:
    void TextRun_uchar() CPPU_NOT_IMPLEMENTED
    void TextRun_string() CPPU_NOT_IMPLEMENTED
    void operator__() CPPU_NOT_IMPLEMENTED
    void data() CPPU_NOT_IMPLEMENTED
    void characters() CPPU_NOT_IMPLEMENTED
    void length() CPPU_NOT_IMPLEMENTED

    void setText() CPPU_NOT_IMPLEMENTED

    void allowTabs() CPPU_NOT_IMPLEMENTED
    void xPos() CPPU_NOT_IMPLEMENTED
    void padding() CPPU_NOT_IMPLEMENTED
    void rtl() CPPU_NOT_IMPLEMENTED
    void ltr() CPPU_NOT_IMPLEMENTED
    void directionalOverride() CPPU_NOT_IMPLEMENTED
    void applyRunRounding() CPPU_NOT_IMPLEMENTED
    void applyWordRounding() CPPU_NOT_IMPLEMENTED
    void spacingDisabled() CPPU_NOT_IMPLEMENTED

    void disableSpacing() CPPU_NOT_IMPLEMENTED
    void disableRoundingHacks() CPPU_NOT_IMPLEMENTED
    void setRTL() CPPU_NOT_IMPLEMENTED
    void setDirectionalOverride() CPPU_NOT_IMPLEMENTED

    void referencingRenderObject() CPPU_NOT_IMPLEMENTED
    void setReferencingRenderObject() CPPU_NOT_IMPLEMENTED
    void activePaintServer() CPPU_NOT_IMPLEMENTED
    void setActivePaintServer() CPPU_NOT_IMPLEMENTED

};

class FontTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( FontTest );

    CPPUNIT_TEST(Font);
    CPPUNIT_TEST(Font_fontDesc);
    CPPUNIT_TEST(destruct_Font);
    CPPUNIT_TEST(Font_copy);
    CPPUNIT_TEST(operator_copy);

    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);

    CPPUNIT_TEST(fontDescription);

    CPPUNIT_TEST(pixelSize);
    CPPUNIT_TEST(size);

    CPPUNIT_TEST(update);

    CPPUNIT_TEST(drawText);

    CPPUNIT_TEST(width);
    CPPUNIT_TEST(floatWidth);
    CPPUNIT_TEST(floatWidth2);

    CPPUNIT_TEST(offsetForPosition);
    CPPUNIT_TEST(selectionRectForText);

    CPPUNIT_TEST(isSmallCaps);

    CPPUNIT_TEST(wordSpacing);
    CPPUNIT_TEST(letterSpacing);
    CPPUNIT_TEST(setWordSpacing);
    CPPUNIT_TEST(setLetterSpacing);
    CPPUNIT_TEST(isFixedPitch);
    CPPUNIT_TEST(isPrinterFont);
    
    CPPUNIT_TEST(renderingMode);

    CPPUNIT_TEST(firstFamily);
    CPPUNIT_TEST(family);

    CPPUNIT_TEST(italic);
    CPPUNIT_TEST(weight);

    CPPUNIT_TEST(ascent);
    CPPUNIT_TEST(descent);
    CPPUNIT_TEST(height);
    CPPUNIT_TEST(lineSpacing);
    CPPUNIT_TEST(xHeight);
    CPPUNIT_TEST(unitsPerEm);
    CPPUNIT_TEST(spaceWidth);
    CPPUNIT_TEST(tabWidth);

    CPPUNIT_TEST(primaryFont);
    CPPUNIT_TEST(fontDataAt);
    CPPUNIT_TEST(glyphDataForCharacter);
    CPPUNIT_TEST(fontDataForCharacters);
    CPPUNIT_TEST(setCodePath);
    CPPUNIT_TEST(isRoundingHackCharacter);
    CPPUNIT_TEST(fontSelector);
    CPPUNIT_TEST(treatAsSpace);
    CPPUNIT_TEST(treatAsZeroWidthSpace);

    CPPUNIT_TEST(isSVGFont);
    CPPUNIT_TEST(svgFont);

 
    CPPUNIT_TEST_SUITE_END();
public:
    void Font() CPPU_NOT_IMPLEMENTED
    void Font_fontDesc() CPPU_NOT_IMPLEMENTED
    void destruct_Font() CPPU_NOT_IMPLEMENTED
    void Font_copy() CPPU_NOT_IMPLEMENTED
    void operator_copy() CPPU_NOT_IMPLEMENTED

    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED

    void fontDescription() CPPU_NOT_IMPLEMENTED

    void pixelSize() CPPU_NOT_IMPLEMENTED
    void size() CPPU_NOT_IMPLEMENTED

    void update() CPPU_NOT_IMPLEMENTED

    void drawText() CPPU_NOT_IMPLEMENTED

    void width() CPPU_NOT_IMPLEMENTED
    void floatWidth() CPPU_NOT_IMPLEMENTED
    void floatWidth2() CPPU_NOT_IMPLEMENTED

    void offsetForPosition() CPPU_NOT_IMPLEMENTED
    void selectionRectForText() CPPU_NOT_IMPLEMENTED

    void isSmallCaps() CPPU_NOT_IMPLEMENTED

    void wordSpacing() CPPU_NOT_IMPLEMENTED
    void letterSpacing() CPPU_NOT_IMPLEMENTED
    void setWordSpacing() CPPU_NOT_IMPLEMENTED
    void setLetterSpacing() CPPU_NOT_IMPLEMENTED
    void isFixedPitch() CPPU_NOT_IMPLEMENTED
    void isPrinterFont() CPPU_NOT_IMPLEMENTED
    
    void renderingMode() CPPU_NOT_IMPLEMENTED

    void firstFamily() CPPU_NOT_IMPLEMENTED
    void family() CPPU_NOT_IMPLEMENTED

    void italic() CPPU_NOT_IMPLEMENTED
    void weight() CPPU_NOT_IMPLEMENTED

    void ascent() CPPU_NOT_IMPLEMENTED
    void descent() CPPU_NOT_IMPLEMENTED
    void height() CPPU_NOT_IMPLEMENTED
    void lineSpacing() CPPU_NOT_IMPLEMENTED
    void xHeight() CPPU_NOT_IMPLEMENTED
    void unitsPerEm() CPPU_NOT_IMPLEMENTED
    void spaceWidth() CPPU_NOT_IMPLEMENTED
    void tabWidth() CPPU_NOT_IMPLEMENTED

    void primaryFont() CPPU_NOT_IMPLEMENTED
    void fontDataAt() CPPU_NOT_IMPLEMENTED
    void glyphDataForCharacter() CPPU_NOT_IMPLEMENTED
    void fontDataForCharacters() CPPU_NOT_IMPLEMENTED
    void setCodePath() CPPU_NOT_IMPLEMENTED
    void isRoundingHackCharacter() CPPU_NOT_IMPLEMENTED
    void fontSelector() CPPU_NOT_IMPLEMENTED
    void treatAsSpace() CPPU_NOT_IMPLEMENTED
    void treatAsZeroWidthSpace() CPPU_NOT_IMPLEMENTED

    void isSVGFont() CPPU_NOT_IMPLEMENTED
    void svgFont() CPPU_NOT_IMPLEMENTED


};


#endif

