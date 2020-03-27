/*
 *  Copyright (C) 2005, 2006, 2007, 2008 Apple Inc. All rights reserved.
 *  Copyright (C) 2008 Collabora Ltd.
 *  Copyright (C) 2009 Martin Robinson
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Library General Public
 *  License as published by the Free Software Foundation; either
 *  version 2 of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Library General Public License for more details.
 *
 *  You should have received a copy of the GNU Library General Public License
 *  along with this library; see the file COPYING.LIB.  If not, write to
 *  the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 *  Boston, MA 02110-1301, USA.
 *
 */

#ifndef WTF_GRefPtr_h
#define WTF_GRefPtr_h

#include "config.h"
#include "AlwaysInline.h"
#include "PlatformRefPtr.h"
#include <algorithm>

typedef struct _GHashTable GHashTable; 
typedef struct _GVariant GVariant; 
typedef void* gpointer; 
extern "C" void g_object_unref(gpointer object); 
extern "C" gpointer g_object_ref_sink(gpointer object); 

/* Debug output to serial handled via D(bug("....."));
*  See Base/debug.h for details.
*  D(x)    - to disable debug
*  D(x) x  - to enable debug
*/
#define D(x)

namespace WTF {


template <typename T> inline T* refPlatformPtr(T* ptr)
{
    D(bug("refPlatformPtr for g_object called\n"));
    if (ptr)
        g_object_ref_sink(ptr);
    return ptr;
}

template <typename T> inline void derefPlatformPtr(T* ptr)
{
    D(bug("derefPlatformPtr for g_object called\n"));
    if (ptr)
        g_object_unref(ptr);
}

template <> GHashTable* refPlatformPtr(GHashTable* ptr);
template <> void derefPlatformPtr(GHashTable* ptr);
template <> GVariant* refPlatformPtr(GVariant* ptr);
template <> void derefPlatformPtr(GVariant* ptr);


} // namespace WTF

#endif // WTF_GRefPtr_h
