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
#ifndef Path_h
#define Path_h
/**
 *  @file  Path.t
 *  Path description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:07 $
 */
#include "BALBase.h"


namespace WKAL {

    class AffineTransform;
    class FloatPoint;
    class FloatSize;
    class FloatRect;
    class String;

    enum WindRule {
        RULE_NONZERO = 0,
        RULE_EVENODD = 1
    };

    enum PathElementType {
        PathElementMoveToPoint,
        PathElementAddLineToPoint,
        PathElementAddQuadCurveToPoint,
        PathElementAddCurveToPoint,
        PathElementCloseSubpath
    };

    struct PathElement {
        PathElementType type;
        FloatPoint* points;
    };

    /**
     * function template
     */
    typedef void (*PathApplierFunction) (void* info, const PathElement*);

    class Path : public WKALBase {
    public:
    /**
     * Path default constructor
     * @code
     * Path *p = new Path();
     * @endcode
     */
        Path();

    /**
     * Path destructor
     * @code
     * delete p;
     * @endcode
     */
        ~Path();

    /**
     * Path constructor by copy
     * @param[in] : path
     * @code
     * Path *p = new Path(p1);
     * @endcode
     */
        Path(const Path&);

    /**
     * operator= 
     * @param[in] : Path
     * @param[out] : Path
     * @code
     * Path p = p1;
     * @endcode
     */
        Path& operator=(const Path&);

    /**
     * test if Path contains the point
     * @param[in] : point 
     * @param[in] : rule
     * @param[out] : true if Path contains the point
     * @code
     * bool c = p->contains(p);
     * @endcode
     */
        bool contains(const FloatPoint&, WindRule rule = RULE_NONZERO) const;

    /**
     * bounding rect
     * @param[out] : rect
     * @code
     * FloatRect r = p->boundingRect();
     * @endcode
     */
        FloatRect boundingRect() const;
        
    /**
     * get length
     * @param[out] : lenght
     * @code
     * float l = p->length();
     * @endcode
     */
        float length();

    /**
     * get point at length
     * @param[in] : length
     * @param[out] : status
     * @param[out] : point
     * @code
     * FloatPoint pf = p->pointAtLength(l, &ok);
     * @endcode
     */
        FloatPoint pointAtLength(float length, bool& ok);

    /**
     * get normal angle at length
     * @param[in] : length
     * @param[out] : status
     * @param[out] : angle
     * @code
     * float n = p->normalAngleAtLength(l, &ok);
     * @endcode
     */
        float normalAngleAtLength(float length, bool& ok);

    /**
     * clear
     * @code
     * p->clear();
     * @endcode
     */
        void clear();

    /**
     * test if the path is empty
     * @param[out] : true if the path is empty
     * @code
     * bool emp = p->isEmpty();
     * @endcode
     */
        bool isEmpty() const;

    /**
     * move to point
     * @param[in] : point
     * @code
     * p->moveTo(pf);
     * @endcode
     */
        void moveTo(const FloatPoint&);

    /**
     * add line to point
     * @param[in] : point
     * @code
     * p->addLineTo(fp);
     * @endcode
     */
        void addLineTo(const FloatPoint&);

    /**
     * add quad curve to point
     * @param[in] : control point
     * @param[in] : point
     * @code
     * p->addQuadCurveTo(cp, fp);
     * @endcode
     */
        void addQuadCurveTo(const FloatPoint& controlPoint, const FloatPoint& endPoint);

    /**
     * add bezier curve to point
     * @param[in] : control point 
     * @param[in] : control point 
     * @param[in] : point
     * @code
     * p->addBezierCurveTo(cp1, cp2, fp);
     * @endcode
     */
        void addBezierCurveTo(const FloatPoint& controlPoint1, const FloatPoint& controlPoint2, const FloatPoint& endPoint);

    /**
     * add arc to point
     * @param[in] : point
     * @param[in] : point 
     * @param[in] : radius
     * @code
     * p->addArcTo( fp1, fp2, r);
     * @endcode
     */
        void addArcTo(const FloatPoint&, const FloatPoint&, float radius);

    /**
     * close sub path
     * @code
     * p->closeSubpath();
     * @endcode
     */
        void closeSubpath();

    /**
     * add arc
     * @param[in] : point
     * @param[in] : radius
     * @param[in] : start angle
     * @param[in] : end angle
     * @param[in] : anti clockwise
     * @code
     * p->addArc(p, r, sa, ea, true);
     * @endcode
     */
        void addArc(const FloatPoint&, float radius, float startAngle, float endAngle, bool anticlockwise);

    /**
     * add rect
     * @param[in] : rect
     * @code
     * p->addRect(r);
     * @endcode
     */
        void addRect(const FloatRect&);

    /**
     * add ellipse
     * @param[in] : rect which contains the elipse
     * @code
     * p->addEllipse(r);
     * @endcode
     */
        void addEllipse(const FloatRect&);

    /**
     * translate
     * @param[in] : delta
     * @code
     * p->translate(s);
     * @endcode
     */
        void translate(const FloatSize&);


    /**
     * debug string
     */
        String debugString() const;

    /**
     * get platform path
     * @param[out] : platform path
     * @code
     * PlatformPath *pf = p->platformPath();
     * @endcode
     */
        PlatformPath* platformPath() const ;

    /**
     * create rounded rectangle
     * @param[in] : rect
     * @param[in] : size
     * @param[out] : path
     * @code
     * Path p = Path::createRoundedRectangle(r, s);
     * @endcode
     */
        static Path createRoundedRectangle(const FloatRect&, const FloatSize& roundingRadii);

    /**
     * create rounded rectangle
     * @param[in] : rect
     * @param[in] : size
     * @param[in] : top left radius
     * @param[in] : top rigth radius
     * @param[in] : bottom left radius
     * @param[in] : bottom right radius
     * @param[out] : Path
     * @code
     * Path p = Path::createRoundedRectangle(r, tlr, trr, blr, brr);
     * @endcode
     */
        static Path createRoundedRectangle(const FloatRect&, const FloatSize& topLeftRadius, const FloatSize& topRightRadius, const FloatSize& bottomLeftRadius, const FloatSize& bottomRightRadius);

    /**
     * create rectangle
     * @param[in] : rect
     * @param[out] : Path
     * @code
     * Path p = Path::createRectangle(fr);
     * @endcode
     */
        static Path createRectangle(const FloatRect&);

    /**
     * create ellipse
     * @param[in] : center
     * @param[in] : x value
     * @param[in] : y value
     * @param[out] : Path
     * @code
     * Path p = Path::createEllipse(c, x, y);
     * @endcode
     */
        static Path createEllipse(const FloatPoint& center, float rx, float ry);

    /**
     * create circle
     * @param[in] : center
     * @param[in] : radius
     * @param[out] : Path
     * @code
     * Path p = Path::createCircle(c, r);
     * @endcode
     */
        static Path createCircle(const FloatPoint& center, float r);

    /**
     * create line
     * @param[in] : start point
     * @param[in] : end point
     * @param[out] : Path
     * @code
     * Path p = Path::createLine(p1, p2);
     * @endcode
     */
        static Path createLine(const FloatPoint&, const FloatPoint&);

    /**
     * apply
     * @param[in] : info
     * @param[in] : PathApplierFunction
     * @code
     * p->apply(i, pf);
     * @endcode
     */
        void apply(void* info, PathApplierFunction) const;

    /**
     * transform
     * @param[in] : affine transform
     * @code
     * p->transform(a);
     * @endcode
     */
        void transform(const AffineTransform&);

    private:
        PlatformPath* m_path;
        WindRule m_rule;
    };

}

#endif
