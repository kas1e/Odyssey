/*
    Copyright (C) 2010 Tieto Corporation.

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.
     
    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.
     
    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
*/

#include "config.h"

#if ENABLE(3D_CANVAS)

#include "GraphicsContext3D.h"

namespace WebCore {

bool GraphicsContext3D::getImageData(Image* image,
		    unsigned int format,
		    unsigned int type,
		    bool premultiplyAlpha,
		    Vector<uint8_t>& outputVector)
{
    return true;
}

  void GraphicsContext3D::getAttachedShaders(Platform3DObject program, int maxCount, int* count, unsigned int* shaders)
{
	*count = 0;
}

bool GraphicsContext3D::isGLES2Compliant() const
{
    return false;
}

}

#endif // ENABLE(3D_CANVAS)
