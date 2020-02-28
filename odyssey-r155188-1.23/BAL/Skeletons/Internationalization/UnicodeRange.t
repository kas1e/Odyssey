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
#ifndef UnicodeRange_H
#define UnicodeRange_H
/**
 *  @file  UnicodeRange.t
 *  UnicodeRange description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:09 $
 */
#include "BALBase.h"

#include <wtf/unicode/Unicode.h>

namespace WebCore {

// The following constants define unicode subranges
// values below cRangeNum must be continuous so that we can map to 
// a lang group directly.
// All ranges we care about should fit within 32 bits.

// Frequently used range definitions
const unsigned char   cRangeCyrillic =    0;
const unsigned char   cRangeGreek    =    1;
const unsigned char   cRangeTurkish  =    2;
const unsigned char   cRangeHebrew   =    3;
const unsigned char   cRangeArabic   =    4;
const unsigned char   cRangeBaltic   =    5;
const unsigned char   cRangeThai     =    6;
const unsigned char   cRangeKorean   =    7;
const unsigned char   cRangeJapanese =    8;
const unsigned char   cRangeSChinese =    9;
const unsigned char   cRangeTChinese =   10;
const unsigned char   cRangeDevanagari = 11;
const unsigned char   cRangeTamil    =   12;
const unsigned char   cRangeArmenian =   13;
const unsigned char   cRangeBengali  =   14;
const unsigned char   cRangeCanadian =   15;
const unsigned char   cRangeEthiopic =   16;
const unsigned char   cRangeGeorgian =   17;
const unsigned char   cRangeGujarati =   18;
const unsigned char   cRangeGurmukhi =   19;
const unsigned char   cRangeKhmer    =   20;
const unsigned char   cRangeMalayalam =  21;

const unsigned char   cRangeSpecificItemNum = 22;

//range/rangeSet grow to this place 22-29

const unsigned char   cRangeSetStart  =  30;    // range set definition starts from here
const unsigned char   cRangeSetLatin  =  30;
const unsigned char   cRangeSetCJK    =  31;
const unsigned char   cRangeSetEnd    =  31;   // range set definition ends here

// less frequently used range definition
const unsigned char   cRangeSurrogate            = 32;
const unsigned char   cRangePrivate              = 33;
const unsigned char   cRangeMisc                 = 34;
const unsigned char   cRangeUnassigned           = 35;
const unsigned char   cRangeSyriac               = 36;
const unsigned char   cRangeThaana               = 37;
const unsigned char   cRangeOriya                = 38;
const unsigned char   cRangeTelugu               = 39;
const unsigned char   cRangeKannada              = 40;
const unsigned char   cRangeSinhala              = 41;
const unsigned char   cRangeLao                  = 42;
const unsigned char   cRangeTibetan              = 43;
const unsigned char   cRangeMyanmar              = 44;
const unsigned char   cRangeCherokee             = 45;
const unsigned char   cRangeOghamRunic           = 46;
const unsigned char   cRangeMongolian            = 47;
const unsigned char   cRangeMathOperators        = 48;
const unsigned char   cRangeMiscTechnical        = 49;
const unsigned char   cRangeControlOpticalEnclose = 50;
const unsigned char   cRangeBoxBlockGeometrics   = 51;
const unsigned char   cRangeMiscSymbols          = 52;
const unsigned char   cRangeDingbats             = 53;
const unsigned char   cRangeBraillePattern       = 54;
const unsigned char   cRangeYi                   = 55;
const unsigned char   cRangeCombiningDiacriticalMarks = 56;
const unsigned char   cRangeSpecials             = 57;

const unsigned char   cRangeTableBase   = 128;    //values over 127 are reserved for internal use only
const unsigned char   cRangeTertiaryTable  = 145; // leave room for 16 subtable 
                                            // indices (cRangeTableBase + 1 ..
                                            // cRangeTableBase + 16)



    /**
     * find char unicode range
     * @param[in] : char
     * @param[out] : position
     */
unsigned int findCharUnicodeRange(UChar32 ch);
    /**
     * get lang group from unicode range description
     * @param[in] : unicode range
     * @param[out] : lang group
     * @code
     * @endcode
     */
const char* langGroupFromUnicodeRange(unsigned char unicodeRange);

}

#endif // UnicodeRange_H




