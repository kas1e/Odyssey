/*
 * Copyright (C) 2007, 2009 Apple Inc.  All rights reserved.
 * Copyright (C) 2007 Collabora Ltd.  All rights reserved.
 * Copyright (C) 2007 Alp Toker <alp@atoker.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * aint with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */

#include "config.h"

#if ENABLE(VIDEO) || ENABLE(CEHTML_MEDIA_OBJECTS) || ENABLE(DAE_TUNER)

#include "MediaPlayerPrivateNone.h"

#include "CString.h"
#include "Font.h"
#include "FontDescription.h"
#include "FontSelector.h"
#include "GraphicsContext.h"
#include "IntRect.h"
#include "KURL.h"
#include "MIMETypeRegistry.h"
#include "MediaPlayer.h"
#include "NotImplemented.h"
#include "ScrollView.h"
#include "TextRun.h"
#include "TimeRanges.h"
#include "Widget.h"

#include <limits>

using namespace std;

namespace WebCore {

MediaPlayerPrivateInterface* MediaPlayerPrivate::create(MediaPlayer* player) 
{
    return new MediaPlayerPrivate(player);
}

void MediaPlayerPrivate::registerMediaEngine(MediaEngineRegistrar registrar)
{
    if (isAvailable())
        registrar(create, getSupportedTypes, supportsType);
}

MediaPlayerPrivate::MediaPlayerPrivate(MediaPlayer* player)
    : m_player(player)
    , m_rate(1.0f)
    , m_endTime(numeric_limits<float>::infinity())
    , m_isEndReached(false)
    , m_volume(0.5f)
    , m_networkState(MediaPlayer::Empty)
    , m_readyState(MediaPlayer::HaveNothing)
    , m_startedPlaying(false)
    , m_isStreaming(false)
    , m_size(IntSize())
    , m_visible(true)
{
}

MediaPlayerPrivate::~MediaPlayerPrivate()
{
}

#if ENABLE(DAE_TUNER)
void MediaPlayerPrivate::load(PassRefPtr<Channel> channel)
{
    LOG_VERBOSE(Media, "Loading WebChannel %p", channel.get());
}
#endif

void MediaPlayerPrivate::load(const String& url)
{
    LOG_VERBOSE(Media, "Load %s", url.utf8().data());
    if (m_networkState != MediaPlayer::Loading) {
        //m_networkState = MediaPlayer::Loading;
        m_networkState = MediaPlayer::Loaded;
        m_player->networkStateChanged();
    }
    if (m_readyState != MediaPlayer::HaveNothing) {
        //m_readyState = MediaPlayer::HaveNothing;
        m_readyState = MediaPlayer::HaveEnoughData;
        m_player->readyStateChanged();
    }

    pause();
}

void MediaPlayerPrivate::play()
{
    LOG_VERBOSE(Media, "Play");
    // When end reached, rewind for Test video-seek-past-end-playing
    if (m_isEndReached)
        seek(0);
    m_isEndReached = false;

    m_startedPlaying = true;
}

void MediaPlayerPrivate::pause()
{
    LOG_VERBOSE(Media, "Pause");
    m_startedPlaying = false;
}

float MediaPlayerPrivate::duration() const
{
    return 0.0;
}

float MediaPlayerPrivate::currentTime() const
{
    return 0;
}

void MediaPlayerPrivate::seek(float time)
{
}

void MediaPlayerPrivate::setEndTime(float time)
{
}

void MediaPlayerPrivate::startEndPointTimerIfNeeded()
{
    notImplemented();
}

void MediaPlayerPrivate::cancelSeek()
{
    notImplemented();
}

void MediaPlayerPrivate::endPointTimerFired(Timer<MediaPlayerPrivate>*)
{
    notImplemented();
}

bool MediaPlayerPrivate::paused() const
{
    return !m_startedPlaying;
}

bool MediaPlayerPrivate::seeking() const
{
    return false;
}

// Returns the size of the video
IntSize MediaPlayerPrivate::naturalSize() const
{
    if (!hasVideo())
        return IntSize();

    return IntSize();
}

bool MediaPlayerPrivate::hasVideo() const
{
    return false;
}

bool MediaPlayerPrivate::hasAudio() const
{
    return false;
}

void MediaPlayerPrivate::setVolume(float volume)
{
    m_volume = volume;
    LOG_VERBOSE(Media, "Volume to %f", volume);
    setMuted(false);
}

void MediaPlayerPrivate::setMuted(bool b)
{
}

void MediaPlayerPrivate::setRate(float rate)
{
    LOG_VERBOSE(Media, "Set Rate to %f", rate);
}

int MediaPlayerPrivate::dataRate() const
{
    notImplemented();
    return 1;
}

MediaPlayer::NetworkState MediaPlayerPrivate::networkState() const
{
    return m_networkState;
}

MediaPlayer::ReadyState MediaPlayerPrivate::readyState() const
{
    return m_readyState;
}

PassRefPtr<TimeRanges> MediaPlayerPrivate::buffered() const
{
    notImplemented();
    return TimeRanges::create();
}

float MediaPlayerPrivate::maxTimeBuffered() const
{
    notImplemented();
    LOG_VERBOSE(Media, "maxTimeBuffered");
    // rtsp streams are not buffered
    return m_isStreaming ? 0 : maxTimeLoaded();
}

float MediaPlayerPrivate::maxTimeSeekable() const
{
    // TODO
    LOG_VERBOSE(Media, "maxTimeSeekable");
    if (m_isStreaming)
        return numeric_limits<float>::infinity();
    // infinite duration means live stream
    return maxTimeLoaded();
}

float MediaPlayerPrivate::maxTimeLoaded() const
{
    // TODO
    LOG_VERBOSE(Media, "maxTimeLoaded");
    notImplemented();
    return duration();
}

unsigned MediaPlayerPrivate::bytesLoaded() const
{
    notImplemented();
    LOG_VERBOSE(Media, "bytesLoaded");
    return 1;//totalBytes() * maxTime / dur;
}

bool MediaPlayerPrivate::totalBytesKnown() const
{
    notImplemented();
    LOG_VERBOSE(Media, "totalBytesKnown");
    return totalBytes() > 0;
}

unsigned MediaPlayerPrivate::totalBytes() const
{
    notImplemented();
    LOG_VERBOSE(Media, "totalBytes");

    // Do something with m_source to get the total bytes of the media

    return 100;
}

void MediaPlayerPrivate::cancelLoad()
{
    notImplemented();
}

void MediaPlayerPrivate::updateStates()
{
}

void MediaPlayerPrivate::loadStateChanged()
{
    updateStates();
}

void MediaPlayerPrivate::rateChanged()
{
    updateStates();
}

void MediaPlayerPrivate::sizeChanged()
{
    notImplemented();
}

void MediaPlayerPrivate::timeChanged()
{
    updateStates();
    m_player->timeChanged();
}

void MediaPlayerPrivate::volumeChanged(float newVolume)
{
    m_player->volumeChanged(newVolume);
}

void MediaPlayerPrivate::didEnd()
{
    m_isEndReached = true;
    pause();
    timeChanged();
}

void MediaPlayerPrivate::loadingFailed()
{
    if (m_networkState != MediaPlayer::NetworkError) {
        m_networkState = MediaPlayer::NetworkError;
        m_player->networkStateChanged();
    }
    if (m_readyState != MediaPlayer::HaveNothing) {
        m_readyState = MediaPlayer::HaveNothing;
        m_player->readyStateChanged();
    }
}

void MediaPlayerPrivate::setSize(const IntSize& size)
{
    m_size = size;
}

void MediaPlayerPrivate::setVisible(bool visible)
{
    m_visible = visible;
}

void MediaPlayerPrivate::repaint()
{
    m_player->repaint();
}

void MediaPlayerPrivate::paint(GraphicsContext* context, const IntRect& rect)
{
    if (context->paintingDisabled())
        return;

    if (!m_visible)
        return;

    //This backend does not know how to play a media
    //so fallback to a default image
    context->save();
    static RefPtr<WebCore::Image> fallback = Image::loadPlatformResource("/video-fallback");
    if (fallback->isNull()) {
        context->fillRect(rect, Color::gray, DeviceColorSpace);

        // Create font
        FontDescription fontDescription;
        // this is normally computed by CSS and fixes the minimum size
        fontDescription.setComputedSize(16);
        fontDescription.setWeight(FontWeightBold);
        Font font(fontDescription, 0, 0);
        font.update(0);

        TextRun fallbackText("No video backend available");
        IntPoint startText(rect.x() + rect.width() / 3, rect.y() + rect.height() / 2);
        font.drawText(context, fallbackText, startText);
    } else
        context->drawImage(fallback.get(), DeviceColorSpace, rect);
    context->restore();
}

#if ENABLE(CEHTML_MEDIA_OBJECTS) || ENABLE(DAE_TUNER)
void MediaPlayerPrivate::stop()
{
}

void MediaPlayerPrivate::setAspect(MediaPlayer::VideoScale)
{
}
WTF::Vector<float> MediaPlayerPrivate::playSpeeds()
{
    static WTF::Vector<float> speed;
    if (!speed.size())
        speed.append(1.0);
    return speed;
}
#endif

void MediaPlayerPrivate::getSupportedTypes(HashSet<String>& types)
{
    // FIXME: query the engine to see what types are supported
    notImplemented();
    types.add(String("video/x-theora+ogg"));
}

MediaPlayer::SupportsType MediaPlayerPrivate::supportsType(const String& type, const String& codecs)
{
    // FIXME: query the engine to see what types are supported
    notImplemented();
    return type == "video/x-theora+ogg" ? (!codecs.isEmpty() ? MediaPlayer::MayBeSupported : MediaPlayer::IsSupported) : MediaPlayer::IsNotSupported;
}

#if ENABLE(CEHTML_MEDIA_OBJECTS)
bool MediaPlayerPrivate::nextTrack()
{
    notImplemented();
    return false;
}

bool MediaPlayerPrivate::previousTrack()
{
    notImplemented();
    return false;
}

unsigned int MediaPlayerPrivate::numTracks()
{
    notImplemented();
    return 1;
}

unsigned int MediaPlayerPrivate::currentTrack()
{
    notImplemented();
    return 0;
}

void MediaPlayerPrivate::setCurrentTrack(unsigned int index)
{
    notImplemented();
}
#endif

}

#endif
