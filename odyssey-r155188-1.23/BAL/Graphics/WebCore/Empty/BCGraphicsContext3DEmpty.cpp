/*
 * Copyright (C) 2009 Apple Inc. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY APPLE COMPUTER, INC. ``AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL APPLE COMPUTER, INC. OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 
 */

#include "config.h"

#if ENABLE(3D_CANVAS)

#include "GraphicsContext3D.h"

#include "CachedImage.h"
#include "UnusedParam.h"
#include "WebGLActiveInfo.h"
#include "ArrayBufferView.h"
#include "WebGLBuffer.h"
#include "WebGLFramebuffer.h"
#include "Float32Array.h"
#include "Int32Array.h"
#include "WebGLProgram.h"
#include "WebGLRenderbuffer.h"
#include "WebGLShader.h"
#include "WebGLTexture.h"
#include "Uint8Array.h"
#include "CString.h"
#include "Image.h"
#include "ImageBuffer.h"
#include "NotImplemented.h"
#include "WebKitCSSMatrix.h"


namespace WebCore {

PassOwnPtr<GraphicsContext3D> GraphicsContext3D::create(GraphicsContext3D::Attributes attributes, HostWindow* hostWindow, GraphicsContext3D::RenderStyle renderStyle)
{
    // This implementation doesn't currently support rendering directly to the HostWindow.
    if (renderStyle == RenderDirectlyToHostWindow)
      return 0;

    OwnPtr<GraphicsContext3D> context(new GraphicsContext3D(attributes, hostWindow, false));
    //return context->m_contextObj ? context.release() : 0;
    return context.release();
}

GraphicsContext3D::GraphicsContext3D(GraphicsContext3D::Attributes, HostWindow* hostWindow, bool)
{
}

GraphicsContext3D::~GraphicsContext3D()
{
}

GraphicsContext3D::Attributes GraphicsContext3D::getContextAttributes()
{
    GraphicsContext3D::Attributes attr;
    return attr;
}

void GraphicsContext3D::makeContextCurrent()
{
}

bool GraphicsContext3D::isGLES2NPOTStrict() const
{
    return false;
}

bool GraphicsContext3D::isErrorGeneratedOnOutOfBoundsAccesses() const
{
    return false;
}

void GraphicsContext3D::reshape(int width, int height)
{
    notImplemented();
}

void GraphicsContext3D::activeTexture(unsigned long texture)
{
    notImplemented();
}

void GraphicsContext3D::attachShader(Platform3DObject program, Platform3DObject shader)
{
    notImplemented();
}

void GraphicsContext3D::bindAttribLocation(Platform3DObject program, unsigned long index, const String& name)
{
    notImplemented();
}

void GraphicsContext3D::bindBuffer(unsigned long target, Platform3DObject buffer)
{
    notImplemented();
}


void GraphicsContext3D::bindFramebuffer(unsigned long target, Platform3DObject buffer)
{
    notImplemented();
}

void GraphicsContext3D::bindRenderbuffer(unsigned long target, Platform3DObject renderbuffer)
{
    notImplemented();
}


void GraphicsContext3D::bindTexture(unsigned long target, Platform3DObject texture)
{
    notImplemented();
}

void GraphicsContext3D::blendColor(double red, double green, double blue, double alpha)
{
    notImplemented();
}

void GraphicsContext3D::blendEquation( unsigned long mode )
{
    notImplemented();
}

void GraphicsContext3D::blendEquationSeparate(unsigned long modeRGB, unsigned long modeAlpha)
{
    notImplemented();
}


void GraphicsContext3D::blendFunc(unsigned long sfactor, unsigned long dfactor)
{
    notImplemented();
}       

void GraphicsContext3D::blendFuncSeparate(unsigned long srcRGB, unsigned long dstRGB, unsigned long srcAlpha, unsigned long dstAlpha)
{
    notImplemented();
}

void GraphicsContext3D::bufferData(unsigned long target, int size, unsigned long usage)
{
    notImplemented();
}

void GraphicsContext3D::bufferData(unsigned long target, int size, const void* data, unsigned long usage)
{
    notImplemented();
}

void GraphicsContext3D::bufferSubData(unsigned long target, long offset, int size, const void* data)
{
    notImplemented();
}

unsigned long GraphicsContext3D::checkFramebufferStatus(unsigned long target)
{
    notImplemented();
    return 0;
}

void GraphicsContext3D::clearColor(double r, double g, double b, double a)
{
    notImplemented();
}

void GraphicsContext3D::clear(unsigned long mask)
{
    notImplemented();
}

void GraphicsContext3D::clearDepth(double depth)
{
    notImplemented();
}

void GraphicsContext3D::clearStencil(long s)
{
    notImplemented();
}

void GraphicsContext3D::colorMask(bool red, bool green, bool blue, bool alpha)
{
    notImplemented();
}

void GraphicsContext3D::compileShader(Platform3DObject shader)
{
    notImplemented();
}

void GraphicsContext3D::copyTexImage2D(unsigned long target, long level, unsigned long internalformat, long x, long y, unsigned long width, unsigned long height, long border)
{
    notImplemented();
}

void GraphicsContext3D::copyTexSubImage2D(unsigned long target, long level, long xoffset, long yoffset, long x, long y, unsigned long width, unsigned long height)
{
    notImplemented();
}

void GraphicsContext3D::cullFace(unsigned long mode)
{
    notImplemented();
}

void GraphicsContext3D::depthFunc(unsigned long func)
{
    notImplemented();
}

void GraphicsContext3D::depthMask(bool flag)
{
    notImplemented();
}

void GraphicsContext3D::depthRange(double zNear, double zFar)
{
    notImplemented();
}

void GraphicsContext3D::detachShader(Platform3DObject program, Platform3DObject shader)
{
    notImplemented();
}

void GraphicsContext3D::disable(unsigned long cap)
{
    notImplemented();
}

void GraphicsContext3D::disableVertexAttribArray(unsigned long index)
{
    notImplemented();
}

void GraphicsContext3D::drawArrays(unsigned long mode, long first, long count)
{
    notImplemented();
}

void GraphicsContext3D::drawElements(unsigned long mode, unsigned long count, unsigned long type, long offset)
{
    notImplemented();
}

void GraphicsContext3D::enable(unsigned long cap)
{
    notImplemented();
}

void GraphicsContext3D::enableVertexAttribArray(unsigned long index)
{
    notImplemented();
}

void GraphicsContext3D::finish()
{
    notImplemented();
}

void GraphicsContext3D::flush()
{
    notImplemented();
}

void GraphicsContext3D::framebufferRenderbuffer(unsigned long target, unsigned long attachment, unsigned long renderbuffertarget, Platform3DObject buffer)
{
    notImplemented();
}

void GraphicsContext3D::framebufferTexture2D(unsigned long target, unsigned long attachment, unsigned long textarget, Platform3DObject texture, long level)
{
    notImplemented();
}

void GraphicsContext3D::frontFace(unsigned long mode)
{
    notImplemented();
}

void GraphicsContext3D::generateMipmap(unsigned long target)
{
    notImplemented();
}

bool GraphicsContext3D::getActiveAttrib(Platform3DObject program, unsigned long index, ActiveInfo& info)
{
    notImplemented();
    return false;
}
    
bool GraphicsContext3D::getActiveUniform(Platform3DObject program, unsigned long index, ActiveInfo& info)
{
    notImplemented();
    return false;
}

int GraphicsContext3D::getAttribLocation(Platform3DObject program, const String& name)
{
    notImplemented();
    return 0;
}

unsigned long GraphicsContext3D::getError()
{
    notImplemented();
    return 0;
}

String GraphicsContext3D::getString(unsigned long name)
{
    notImplemented();
    return String();
}

void GraphicsContext3D::hint(unsigned long target, unsigned long mode)
{
    notImplemented();
}

bool GraphicsContext3D::isBuffer(Platform3DObject buffer)
{
    notImplemented();
    return false;
}

bool GraphicsContext3D::isEnabled(unsigned long cap)
{
    notImplemented();
    return false;
}

bool GraphicsContext3D::isFramebuffer(Platform3DObject framebuffer)
{
    notImplemented();
    return false;
}

bool GraphicsContext3D::isProgram(Platform3DObject program)
{
    notImplemented();
    return false;
}

bool GraphicsContext3D::isRenderbuffer(Platform3DObject renderbuffer)
{
    notImplemented();
    return false;
}

bool GraphicsContext3D::isShader(Platform3DObject shader)
{
    notImplemented();
    return false;
}

bool GraphicsContext3D::isTexture(Platform3DObject texture)
{
    notImplemented();
    return false;
}

void GraphicsContext3D::lineWidth(double width)
{
    notImplemented();
}

void GraphicsContext3D::linkProgram(Platform3DObject program)
{
    notImplemented();
}

void GraphicsContext3D::pixelStorei(unsigned long pname, long param)
{
    notImplemented();
}

void GraphicsContext3D::polygonOffset(double factor, double units)
{
    notImplemented();
}

void GraphicsContext3D::readPixels(long x, long y, unsigned long width, unsigned long height, unsigned long format, unsigned long type, void* data)
{
    notImplemented();
}

void GraphicsContext3D::releaseShaderCompiler()
{
    notImplemented();
}

void GraphicsContext3D::renderbufferStorage(unsigned long target, unsigned long internalformat, unsigned long width, unsigned long height)
{
    notImplemented();
}

void GraphicsContext3D::sampleCoverage(double value, bool invert)
{
    notImplemented();
}

void GraphicsContext3D::scissor(long x, long y, unsigned long width, unsigned long height)
{
    notImplemented();
}

void GraphicsContext3D::shaderSource(Platform3DObject shader, const String& string)
{
    notImplemented();
}

void GraphicsContext3D::stencilFunc(unsigned long func, long ref, unsigned long mask)
{
    notImplemented();
}

void GraphicsContext3D::stencilFuncSeparate(unsigned long face, unsigned long func, long ref, unsigned long mask)
{
    notImplemented();
}

void GraphicsContext3D::stencilMask(unsigned long mask)
{
    notImplemented();
}

void GraphicsContext3D::stencilMaskSeparate(unsigned long face, unsigned long mask)
{
    notImplemented();
}

void GraphicsContext3D::stencilOp(unsigned long fail, unsigned long zfail, unsigned long zpass)
{
    notImplemented();
}

void GraphicsContext3D::stencilOpSeparate(unsigned long face, unsigned long fail, unsigned long zfail, unsigned long zpass)
{
    notImplemented();
}

void GraphicsContext3D::texParameterf(unsigned target, unsigned pname, float value)
{
    notImplemented();
}

void GraphicsContext3D::texParameteri(unsigned target, unsigned pname, int value)
{
    notImplemented();
}

void GraphicsContext3D::uniform1f(long location, float v0)
{
    notImplemented();
}

void GraphicsContext3D::uniform1fv(long location, float* array, int size)
{
    notImplemented();
}

void GraphicsContext3D::uniform2f(long location, float v0, float v1)
{
    notImplemented();
}

void GraphicsContext3D::uniform2fv(long location, float* array, int size)
{
    notImplemented();
}

void GraphicsContext3D::uniform3f(long location, float v0, float v1, float v2)
{
    notImplemented();
}

void GraphicsContext3D::uniform3fv(long location, float* array, int size)
{
    notImplemented();
}

void GraphicsContext3D::uniform4f(long location, float v0, float v1, float v2, float v3)
{
    notImplemented();
}

void GraphicsContext3D::uniform4fv(long location, float* array, int size)
{
    notImplemented();
}

void GraphicsContext3D::uniform1i(long location, int v0)
{
    notImplemented();
}

void GraphicsContext3D::uniform1iv(long location, int* array, int size)
{
    notImplemented();
}

void GraphicsContext3D::uniform2i(long location, int v0, int v1)
{
    notImplemented();
}

void GraphicsContext3D::uniform2iv(long location, int* array, int size)
{
    notImplemented();
}

void GraphicsContext3D::uniform3i(long location, int v0, int v1, int v2)
{
    notImplemented();
}

void GraphicsContext3D::uniform3iv(long location, int* array, int size)
{
    notImplemented();
}

void GraphicsContext3D::uniform4i(long location, int v0, int v1, int v2, int v3)
{
    notImplemented();
}

void GraphicsContext3D::uniform4iv(long location, int* array, int size)
{
    notImplemented();
}

void GraphicsContext3D::uniformMatrix2fv(long location, bool transpose, float* array, int size)
{
    notImplemented();
}

void GraphicsContext3D::uniformMatrix3fv(long location, bool transpose, float* array, int size)
{
    notImplemented();
}

void GraphicsContext3D::uniformMatrix4fv(long location, bool transpose, float* array, int size)
{
    notImplemented();
}

void GraphicsContext3D::useProgram(Platform3DObject program)
{
    notImplemented();
}

void GraphicsContext3D::validateProgram(Platform3DObject program)
{
    notImplemented();
}

void GraphicsContext3D::vertexAttrib1f(unsigned long indx, float v0)
{
    notImplemented();
}

void GraphicsContext3D::vertexAttrib1fv(unsigned long indx, float* array)
{
    notImplemented();
}

void GraphicsContext3D::vertexAttrib2f(unsigned long indx, float v0, float v1)
{
    notImplemented();
}

void GraphicsContext3D::vertexAttrib2fv(unsigned long indx, float* array)
{
    notImplemented();
}

void GraphicsContext3D::vertexAttrib3f(unsigned long indx, float v0, float v1, float v2)
{
    notImplemented();
}

void GraphicsContext3D::vertexAttrib3fv(unsigned long indx, float* array)
{
    notImplemented();
}

void GraphicsContext3D::vertexAttrib4f(unsigned long indx, float v0, float v1, float v2, float v3)
{
    notImplemented();
}

void GraphicsContext3D::vertexAttrib4fv(unsigned long indx, float* array)
{
    notImplemented();
}

void GraphicsContext3D::vertexAttribPointer(unsigned long indx, int size, int type, bool normalized, unsigned long stride, unsigned long offset)
{
    notImplemented();
}

void GraphicsContext3D::viewport(long x, long y, unsigned long width, unsigned long height)
{
    notImplemented();
}

void GraphicsContext3D::getBooleanv(unsigned long pname, unsigned char* value)
{
    notImplemented();
}

void GraphicsContext3D::getFloatv(unsigned long pname, float* value)
{
    notImplemented();
}

void GraphicsContext3D::getIntegerv(unsigned long pname, int* value)
{
    notImplemented();
}

void GraphicsContext3D::getBufferParameteriv(unsigned long target, unsigned long pname, int* value)
{
    notImplemented();
}

void GraphicsContext3D::getFramebufferAttachmentParameteriv(unsigned long target, unsigned long attachment, unsigned long pname, int* value)
{
    notImplemented();
}

void GraphicsContext3D::getProgramiv(Platform3DObject program, unsigned long pname, int* value)
{
    notImplemented();
}

String GraphicsContext3D::getProgramInfoLog(Platform3DObject program)
{
    notImplemented();
    return String();
}

void GraphicsContext3D::getRenderbufferParameteriv(unsigned long target, unsigned long pname, int* value)
{
    notImplemented();
}

void GraphicsContext3D::getShaderiv(Platform3DObject shader, unsigned long pname, int* value)
{
    notImplemented();
}

String GraphicsContext3D::getShaderInfoLog(Platform3DObject shader)
{
    notImplemented();
    return String();
}

String GraphicsContext3D::getShaderSource(Platform3DObject shader)
{
    notImplemented();
    return String();
}


void GraphicsContext3D::getTexParameterfv(unsigned long target, unsigned long pname, float* value)
{
    notImplemented();
}

void GraphicsContext3D::getTexParameteriv(unsigned long target, unsigned long pname, int* value)
{
    notImplemented();
}

void GraphicsContext3D::getUniformfv(Platform3DObject program, long location, float* value)
{
    // FIXME: We need to query glGetUniformLocation to determine the size needed
    UNUSED_PARAM(program);
    UNUSED_PARAM(location);
    UNUSED_PARAM(value);
    notImplemented();
}

void GraphicsContext3D::getUniformiv(Platform3DObject program, long location, int* value)
{
    // FIXME: We need to query glGetUniformLocation to determine the size needed
    UNUSED_PARAM(program);
    UNUSED_PARAM(location);
    UNUSED_PARAM(value);
    notImplemented();
}

long GraphicsContext3D::getUniformLocation(Platform3DObject program, const String& name)
{
    notImplemented();
    return -1;
}

void GraphicsContext3D::getVertexAttribfv(unsigned long index, unsigned long pname, float* value)
{
    notImplemented();
}

void GraphicsContext3D::getVertexAttribiv(unsigned long index, unsigned long pname, int* value)
{
    notImplemented();
}

long GraphicsContext3D::getVertexAttribOffset(unsigned long index, unsigned long pname)
{
    notImplemented();
    return 0;
}

int GraphicsContext3D::texImage2D(unsigned target, unsigned level, unsigned internalformat, unsigned width, unsigned height, unsigned border, unsigned format, unsigned type, void* pixels)
{
    // FIXME: need to implement this form
    UNUSED_PARAM(target);
    UNUSED_PARAM(level);
    UNUSED_PARAM(internalformat);
    UNUSED_PARAM(width);
    UNUSED_PARAM(height);
    UNUSED_PARAM(border);
    UNUSED_PARAM(format);
    UNUSED_PARAM(type);
    UNUSED_PARAM(pixels);
    return -1;
}

int GraphicsContext3D::texSubImage2D(unsigned target, unsigned level, unsigned xoff, unsigned yoff, unsigned width, unsigned height, unsigned format, unsigned type, void* pixels)
{
    // FIXME: we will need to deal with PixelStore params when dealing with image buffers that differ from the subimage size
    UNUSED_PARAM(target);
    UNUSED_PARAM(level);
    UNUSED_PARAM(xoff);
    UNUSED_PARAM(yoff);
    UNUSED_PARAM(width);
    UNUSED_PARAM(height);
    UNUSED_PARAM(format);
    UNUSED_PARAM(type);
    UNUSED_PARAM(pixels);
    return -1;
}

unsigned GraphicsContext3D::createBuffer()
{
    notImplemented();
    return 0;
}

unsigned GraphicsContext3D::createFramebuffer()
{
    notImplemented();
    return 0;
}

unsigned GraphicsContext3D::createProgram()
{
    notImplemented();
    return 0;
}

unsigned GraphicsContext3D::createRenderbuffer()
{
    notImplemented();
    return 0;
}

unsigned GraphicsContext3D::createShader(unsigned long)
{
    notImplemented();
    return 0;
}

unsigned GraphicsContext3D::createTexture()
{
    notImplemented();
    return 0;
}

void GraphicsContext3D::deleteBuffer(unsigned buffer)
{
    notImplemented();
}

void GraphicsContext3D::deleteFramebuffer(unsigned framebuffer)
{
    notImplemented();
}

void GraphicsContext3D::deleteProgram(unsigned program)
{
    notImplemented();
}

void GraphicsContext3D::deleteRenderbuffer(unsigned renderbuffer)
{
    notImplemented();
}

void GraphicsContext3D::deleteShader(unsigned shader)
{
    notImplemented();
}

void GraphicsContext3D::deleteTexture(unsigned texture)
{
    notImplemented();
}

void GraphicsContext3D::synthesizeGLError(unsigned long error)
{
    notImplemented();
}

int GraphicsContext3D::sizeInBytes(int type)
{
    notImplemented();
    return 0;
}

void GraphicsContext3D::paintRenderingResultsToCanvas(WebCore::CanvasRenderingContext* context)
{

}

} // namespace WebCore

#endif // ENABLE(3D_CANVAS)
