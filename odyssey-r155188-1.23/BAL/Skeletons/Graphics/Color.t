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
#ifndef Color_h
#define Color_h
/**
 *  @file  Color.t
 *  Color description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:06 $
 */
#include "BALBase.h"

#include <wtf/Platform.h>





namespace WKAL {

class String;
class Color;

typedef unsigned RGBA32;        // RGBA quadruplet

    /**
     *  make RGBA quadruplet
     * @param[in] : red value
     * @param[in] : green value
     * @param[in] : blue value
     * @param[out] : RGBA quadruplet
     * @code
     * RGBA32 r = makeRGB(255, 0 ,0);
     * @endcode
     */
RGBA32 makeRGB(int r, int g, int b);

    /**
     *  make RGBA quadruplet
     * @param[in] : red value
     * @param[in] : green value
     * @param[in] : blue value
     * @param[in] : alpha value
     * @param[out] : RGBA quadruplet
     * @code
     * RGBA32 r = makeRGB(255, 0 ,0, 255);
     * @endcode
     */
RGBA32 makeRGBA(int r, int g, int b, int a);


    /**
     *  colorWithOverrideAlpha
     * @param[in] : color
     * @param[in] : override alpha status
     * @param[out] : rgba quadruplet
     */
RGBA32 colorWithOverrideAlpha(RGBA32 color, float overrideAlpha);


    /**
     * makeRGBA32FromFloats
     * @param[in] : red value
     * @param[in] : green value
     * @param[in] : blue value
     * @param[in] : alpha value
     * @param[out] : rgba quadruplet
     */
RGBA32 makeRGBA32FromFloats(float r, float g, float b, float a);

    /**
     * make RGBA quadruplet from HSLA
     * @param[in] : hue value
     * @param[in] : saturation value
     * @param[in] : luminosity value
     * @param[in] : alpha value
     * @param[out] : RGBA quadruplet
     * @code
     * RGBA32 r = makeRGBAFromHSLA(230, 100, 50, 0.2);
     * @endcode
     */
RGBA32 makeRGBAFromHSLA(double h, double s, double l, double a);

    /**
     * difference squared
     * @param[in] : color 
     * @param[in] : color
     * @param[out] : difference value
     * @code
     * int d = differenceSquared(c1, c2);
     * @endcode
     */
int differenceSquared(const Color&, const Color&);

class Color : public WKALBase {
public:
    /**
     * Color default constructor
     * @code
     * Color c;
     * @endcode
     */
    Color();

    /**
     * Color constructor
     * @param[in] : rgba quadruplet
     * @code
     * Color *c = new Color(rgba);
     * @endcode
     */
    Color(RGBA32 col);

    /**
     * Color constructor
     * @param[in] : red value
     * @param[in] : green value
     * @param[in] : blue value
     * @code
     * Color *c = new Color(255, 0, 0);
     * @endcode
     */
    Color(int r, int g, int b);

    /**
     * Color constructor
     * @param[in] : red value
     * @param[in] : green value
     * @param[in] : blue value
     * @param[in] : alpha value
     * @code
     * Color *c = new Color(255, 0, 0, 255);
     * @endcode
     */
    Color(int r, int g, int b, int a);

    /**
     * Color constructor
     * @param[in] : red value
     * @param[in] : green value
     * @param[in] : blue value
     * @param[in] : alpha value
     */
    Color(float r, float g, float b, float a);

    /**
     * Color constructor
     * @param[in] : string
     * @code
     * Color *c = new Color(s);
     * @endcode
     */
    explicit Color(const String&);

    /**
     * Color constructor
     * @param[in] : string
     * @code
     * Color *c = new Color(s);
     * @endcode
     */
    explicit Color(const char*);

    /**
     * get name
     * @param[out] : name
     * @code
     * String n = c->name();
     * @endcode
     */
    String name() const;

    /**
     * setNamedColor
     * @param[in] : color name
     */
    void setNamedColor(const String&);

    /**
     * test if the color is valid
     * @param[out] : true if the color is valid
     * @code
     * bool v = c->isValid();
     * @endcode
     */
    bool isValid() const ;

    /**
     * test if the color has alpha
     */
    bool hasAlpha() const ;

    /**
     * get red value
     * @param[out] : red value
     * @code
     * int r = c->red();
     * @endcode
     */
    int red() const ;
    
    /**
     * get green value
     * @param[out] : green value
     * @code
     * int r = c->green();
     * @endcode
     */
    int green() const ;

    /**
     * get blue value
     * @param[out] : blue value
     * @code
     * int b = c->blue();
     * @endcode
     */
    int blue() const ;
    
    /**
     * get alpha value
     * @param[out] : alpha value
     * @code
     * int r = c->alpa();
     * @endcode
     */
    int alpha() const ;

    /**
     * get rgba quadruplet
     * @param[out] : rgba quadruplet
     * @code
     * RGBA32 r = c->rgb();
     * @endcode
     */
    RGBA32 rgb() const ;

    
    /**
     * setRGB
     * @param[in] : rgb color
     * @code
     * c->setRGB(r, g, b);
     * @endcode
     */
    void setRGB(int r, int g, int b) ;

    /**
     * setRGB
     * @param[in] : rgba quadruplet
     * @code
     * c->setRGB(rgb);
     * @endcode
     */
    void setRGB(RGBA32 rgb) ;

    /**
     * getRGBA
     * @param[out] : red value
     * @param[out] : green value
     * @param[out] : blue value
     * @param[out] : alpha value
     * @code
     * c->getRGBA(r, g, b, a);
     * @endcode
     */
    void getRGBA(float& r, float& g, float& b, float& a) const;

    /**
     * getRGBA
     * @param[out] : red value
     * @param[out] : green value
     * @param[out] : blue value
     * @param[out] : alpha value
     * @code
     * c->getRGBA(r, g, b, a);
     * @endcode
     */
    void getRGBA(double& r, double& g, double& b, double& a) const;


    /**
     * increase the light
     * @param[out] : result color
     * @code
     * Color l = c->light);
     * @endcode
     */
    Color light() const;

    /**
     * increase the dark
     * @param[out] : result color
     * @code
     * Color l = c->dark();
     * @endcode
     */
    Color dark() const;

    /**
     * blend
     * @param[in] : blend color
     * @param[out] : color result
     * @code
     * Color b = c->blend(c);
     * @endcode
     */
    Color blend(const Color&) const;

    /**
     * blendWithWhite
     * @param[out] : color result
     * @code
     * Color b = c->blendWithWhite();
     * @endcode
     */
    Color blendWithWhite() const;

    /**
     * Color platform constructor
     */
    Color(const BalColor&);

    /**
     * parseHexColor
     * @param[in] : color name
     * @param[in] : rgba quadruplet value
     * @param[out] : true if the HexColor is parsed corectly
     * @code
     * Color::parseHexColor(name, rgb);
     * @endcode
     */
    static bool parseHexColor(const String& name, RGBA32& rgb);

    static const RGBA32 black = 0xFF000000;
    static const RGBA32 white = 0xFFFFFFFF;
    static const RGBA32 darkGray = 0xFF808080;
    static const RGBA32 gray = 0xFFA0A0A0;
    static const RGBA32 lightGray = 0xFFC0C0C0;
    static const RGBA32 transparent = 0x00000000;

private:
    RGBA32 m_color;
    bool m_valid;
};
    /**
     *  operator==
     */
inline bool operator==(const Color& a, const Color& b);

    /**
     *  operator!=
     */
inline bool operator!=(const Color& a, const Color& b);

    /**
     * focusRingColor
     */
Color focusRingColor();

    /**
     * setFocusRingColorChangeFunction
     */
void setFocusRingColorChangeFunction(void (*)());

} // namespace WKAL

#endif // Color_h
