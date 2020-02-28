/*
 Copyright (C) 2010 Nokia Corporation and/or its subsidiary(-ies)
 
 This library is free software; you can redistribute it and/or
 modify it under the terms of the GNU Library General Public
 License as published by the Free Software Foundation; either
 version 2 of the License, or (at your option) any later version.
 
 This library is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 Library General Public License for more details.
 
 You should have received a copy of the GNU Library General Public License
 along with this library; see the file COPYING.LIB.  If not, write to
 the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 Boston, MA 02110-1301, USA.
 */

#include "config.h"
#include "Tile.h"

#if ENABLE(TILED_BACKING_STORE)

#include "GraphicsContext.h"
#include "NotImplemented.h"
#include "TiledBackingStore.h"
#include "TiledBackingStoreClient.h"

namespace WebCore {
    
Tile::Tile(TiledBackingStore* backingStore, const Coordinate& tileCoordinate)
    : m_backingStore(backingStore)
    , m_coordinate(tileCoordinate)
    , m_rect(m_backingStore->tileRectForCoordinate(tileCoordinate))
{
}

Tile::~Tile()
{
}

bool Tile::isDirty() const
{
    notImplemented();
    return false;
}

bool Tile::isReadyToPaint() const
{
    notImplemented();
    return false;
}

void Tile::invalidate(const IntRect& dirtyRect)
{
    notImplemented();
}
    
void Tile::updateBackBuffer()
{
    notImplemented();
}

void Tile::swapBackBufferToFront()
{
    notImplemented();
}

void Tile::paint(GraphicsContext* context, const IntRect& rect)
{
    notImplemented();
}
    
void Tile::paintCheckerPattern(GraphicsContext* context, const FloatRect& target)
{
    notImplemented();
}

}

#endif
