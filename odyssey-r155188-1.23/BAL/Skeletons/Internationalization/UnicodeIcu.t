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
#ifndef KJS_UNICODE_ICU_H
#define KJS_UNICODE_ICU_H
/**
 *  @file  UnicodeIcu.t
 *  UnicodeIcu description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:09 $
 */
#include "BALBase.h"

#include <unicode/uchar.h>
#include <unicode/ustring.h>
#include <unicode/utf16.h>

#include <stdlib.h>

namespace WTF {
  namespace Unicode {

    enum Direction {
      LeftToRight = U_LEFT_TO_RIGHT,
      RightToLeft = U_RIGHT_TO_LEFT,
      EuropeanNumber = U_EUROPEAN_NUMBER,
      EuropeanNumberSeparator = U_EUROPEAN_NUMBER_SEPARATOR,
      EuropeanNumberTerminator = U_EUROPEAN_NUMBER_TERMINATOR,
      ArabicNumber = U_ARABIC_NUMBER,
      CommonNumberSeparator = U_COMMON_NUMBER_SEPARATOR,
      BlockSeparator = U_BLOCK_SEPARATOR,
      SegmentSeparator = U_SEGMENT_SEPARATOR,
      WhiteSpaceNeutral = U_WHITE_SPACE_NEUTRAL,
      OtherNeutral = U_OTHER_NEUTRAL,
      LeftToRightEmbedding = U_LEFT_TO_RIGHT_EMBEDDING,
      LeftToRightOverride = U_LEFT_TO_RIGHT_OVERRIDE,
      RightToLeftArabic = U_RIGHT_TO_LEFT_ARABIC,
      RightToLeftEmbedding = U_RIGHT_TO_LEFT_EMBEDDING,
      RightToLeftOverride = U_RIGHT_TO_LEFT_OVERRIDE,
      PopDirectionalFormat = U_POP_DIRECTIONAL_FORMAT,
      NonSpacingMark = U_DIR_NON_SPACING_MARK,
      BoundaryNeutral = U_BOUNDARY_NEUTRAL
    };

    enum DecompositionType {
      DecompositionNone = U_DT_NONE,
      DecompositionCanonical = U_DT_CANONICAL,
      DecompositionCompat = U_DT_COMPAT,
      DecompositionCircle = U_DT_CIRCLE,
      DecompositionFinal = U_DT_FINAL,
      DecompositionFont = U_DT_FONT,
      DecompositionFraction = U_DT_FRACTION,
      DecompositionInitial = U_DT_INITIAL,
      DecompositionIsolated = U_DT_ISOLATED,
      DecompositionMedial = U_DT_MEDIAL,
      DecompositionNarrow = U_DT_NARROW,
      DecompositionNoBreak = U_DT_NOBREAK,
      DecompositionSmall = U_DT_SMALL,
      DecompositionSquare = U_DT_SQUARE,
      DecompositionSub = U_DT_SUB,
      DecompositionSuper = U_DT_SUPER,
      DecompositionVertical = U_DT_VERTICAL,
      DecompositionWide = U_DT_WIDE,
    };

    enum CharCategory {
      NoCategory =  0,
      Other_NotAssigned = U_MASK(U_GENERAL_OTHER_TYPES),
      Letter_Uppercase = U_MASK(U_UPPERCASE_LETTER),
      Letter_Lowercase = U_MASK(U_LOWERCASE_LETTER),
      Letter_Titlecase = U_MASK(U_TITLECASE_LETTER),
      Letter_Modifier = U_MASK(U_MODIFIER_LETTER),
      Letter_Other = U_MASK(U_OTHER_LETTER),

      Mark_NonSpacing = U_MASK(U_NON_SPACING_MARK),
      Mark_Enclosing = U_MASK(U_ENCLOSING_MARK),
      Mark_SpacingCombining = U_MASK(U_COMBINING_SPACING_MARK),

      Number_DecimalDigit = U_MASK(U_DECIMAL_DIGIT_NUMBER),
      Number_Letter = U_MASK(U_LETTER_NUMBER),
      Number_Other = U_MASK(U_OTHER_NUMBER),

      Separator_Space = U_MASK(U_SPACE_SEPARATOR),
      Separator_Line = U_MASK(U_LINE_SEPARATOR),
      Separator_Paragraph = U_MASK(U_PARAGRAPH_SEPARATOR),

      Other_Control = U_MASK(U_CONTROL_CHAR),
      Other_Format = U_MASK(U_FORMAT_CHAR),
      Other_PrivateUse = U_MASK(U_PRIVATE_USE_CHAR),
      Other_Surrogate = U_MASK(U_SURROGATE),

      Punctuation_Dash = U_MASK(U_DASH_PUNCTUATION),
      Punctuation_Open = U_MASK(U_START_PUNCTUATION),
      Punctuation_Close = U_MASK(U_END_PUNCTUATION),
      Punctuation_Connector = U_MASK(U_CONNECTOR_PUNCTUATION),
      Punctuation_Other = U_MASK(U_OTHER_PUNCTUATION),

      Symbol_Math = U_MASK(U_MATH_SYMBOL),
      Symbol_Currency = U_MASK(U_CURRENCY_SYMBOL),
      Symbol_Modifier = U_MASK(U_MODIFIER_SYMBOL),
      Symbol_Other = U_MASK(U_OTHER_SYMBOL),

      Punctuation_InitialQuote = U_MASK(U_INITIAL_PUNCTUATION),
      Punctuation_FinalQuote = U_MASK(U_FINAL_PUNCTUATION)
    };

    /**
     * get foldCase character
     * @param[in] : character
     * @param[out] : foldcase character
     */
    inline UChar32 foldCase(UChar32 c);

    /**
     * foldCase
     * @param[in] : result length
     * @param[in] : source
     * @param[in] : source length
     * @param[out] : result
     * @param[out] : error
     * @param[out] : length
     */
    inline int foldCase(UChar* result, int resultLength, const UChar* src, int srcLength, bool* error);

    /**
     * toLower 
     * @param[in] : result length
     * @param[in] : source
     * @param[in] : source length
     * @param[out] : result
     * @param[out] : error
     * @param[out] : length
     */
    inline int toLower(UChar* result, int resultLength, const UChar* src, int srcLength, bool* error);

    /**
     * to lower 
     * @param[in] : character
     * @param[out] : character
     */
    inline UChar32 toLower(UChar32 c);

    /**
     * to upper 
     * @param[in] : character
     * @param[out] : character
     */
    inline UChar32 toUpper(UChar32 c);

    /**
     * to upper
     * @param[in] : result length
     * @param[in] : source
     * @param[in] : source length
     * @param[out] : result
     * @param[out] : error
     * @param[out] : length
     */
    inline int toUpper(UChar* result, int resultLength, const UChar* src, int srcLength, bool* error);

    /**
     * to title case
     * @param[in] : character
     * @param[out] : character
     */
    inline UChar32 toTitleCase(UChar32 c);

    /**
     * test if the character is an arabic character
     * @param[in] : character
     * @param[out] : status
     */
    inline bool isArabicChar(UChar32 c);

    /**
     * test if the character is a format character
     * @param[in] : character
     * @param[out] : status
     */
    inline bool isFormatChar(UChar32 c);

    /**
     * test if the character is a separator space
     * @param[in] : character
     * @param[out] : status
     */
    inline bool isSeparatorSpace(UChar32 c);

    /**
     * test if the character is a printable char 
     * @param[in] : character
     * @param[out] : status
     */
    inline bool isPrintableChar(UChar32 c);
    
    /**
     * test if the character is a digit
     * @param[in] : character
     * @param[out] : status
     */
    inline bool isDigit(UChar32 c);

    /**
     * test if the character is a Punctuation character
     * @param[in] : character
     * @param[out] : status
     */
    inline bool isPunct(UChar32 c);

    /**
     * get mirrored character
     * @param[in] : character
     * @param[out] : character
     */
    inline UChar32 mirroredChar(UChar32 c);

    /**
     * get category 
     * @param[in] : character
     * @param[out] : category
     */
    inline CharCategory category(UChar32 c);

    /**
     * get direction 
     * @param[in] : character
     * @param[out] : direction
     */
    inline Direction direction(UChar32 c);

    /**
     * test if the character is lower
     * @param[in] : character
     * @param[out] : status
     */
    inline bool isLower(UChar32 c);

    /**
     * get digit value 
     * @param[in] : character
     * @param[out] : value
     */
    inline int digitValue(UChar32 c);

    /**
     * get combining class 
     * @param[in] : character
     * @param[out] : combining class
     */
    inline uint8_t combiningClass(UChar32 c);

    /**
     * get decomposition type 
     * @param[in] : character
     * @param[out] : decomposition type
     */
    inline DecompositionType decompositionType(UChar32 c);

    /**
     * umemcasecmp
     * @param[in] : character
     * @param[in] : character
     * @param[in] : length
     * @param[out] : status
     * @code
     * @endcode
     */
    inline int umemcasecmp(const UChar* a, const UChar* b, int len);

  }
}

#endif
// vim: ts=2 sw=2 et




