/*
 * Copyright (C) 2007, 2009 Apple Inc.  All rights reserved.
 * Copyright (C) 2007 Collabora Ltd. All rights reserved.
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

#ifndef MediaPlayerPrivateNone_h
#define MediaPlayerPrivateNone_h

#if ENABLE(VIDEO) || ENABLE(CEHTML_MEDIA_OBJECTS) || ENABLE(DAE_TUNER)

#include "MediaPlayerPrivate.h"
#include "Timer.h"

#if ENABLE(DAE_TUNER)
#include "Channel.h"
#endif

namespace WebCore {

    class GraphicsContext;
    class IntSize;
    class IntRect;
    class String;

    class MediaPlayerPrivate : public MediaPlayerPrivateInterface
    {
    public:

        static void registerMediaEngine(MediaEngineRegistrar);
        ~MediaPlayerPrivate();

        IntSize naturalSize() const;
        bool hasVideo() const;
        bool hasAudio() const;

#if ENABLE(DAE_TUNER)
        void load(PassRefPtr<Channel>);
#endif
        void load(const String &url);
        void cancelLoad();

        void play();
        void pause();

        bool paused() const;
        bool seeking() const;

        float duration() const;
        float currentTime() const;
        void seek(float);
        void setEndTime(float);

        void setRate(float);
        void setVolume(float);
        void setMuted(bool);

        int dataRate() const;

        MediaPlayer::NetworkState networkState() const;
        MediaPlayer::ReadyState readyState() const;

        virtual PassRefPtr<TimeRanges> buffered() const;
        float maxTimeBuffered() const;
        float maxTimeSeekable() const;
        unsigned bytesLoaded() const;
        bool totalBytesKnown() const;
        unsigned totalBytes() const;

        void setVisible(bool);
        void setSize(const IntSize&);

        void loadStateChanged();
        void rateChanged();
        void sizeChanged();
        void timeChanged();
        void volumeChanged(float);
        void didEnd();
        void loadingFailed();

        void repaint();
        void paint(GraphicsContext*, const IntRect&);
        
#if ENABLE(CEHTML_MEDIA_OBJECTS) || ENABLE(DAE_TUNER)
        void stop();
        void setAspect(MediaPlayer::VideoScale);
        WTF::Vector<float> playSpeeds();
#endif

#if ENABLE(CEHTML_MEDIA_OBJECTS)
        bool nextTrack();
        bool previousTrack();
        unsigned int numTracks();
        unsigned int currentTrack();
        void setCurrentTrack(unsigned int);
#endif

    private:

        MediaPlayerPrivate(MediaPlayer*);
        static MediaPlayerPrivateInterface* create(MediaPlayer* player);

        static void getSupportedTypes(HashSet<String>&);
        static MediaPlayer::SupportsType supportsType(const String& type, const String& codecs);
        static bool isAvailable() { return true; }

        void updateStates();
        void cancelSeek();
        void endPointTimerFired(Timer<MediaPlayerPrivate>*);
        float maxTimeLoaded() const;
        void startEndPointTimerIfNeeded();

    private:
        MediaPlayer* m_player;
        float m_rate;
        float m_endTime;
        bool m_isEndReached;
        double m_volume;
        MediaPlayer::NetworkState m_networkState;
        MediaPlayer::ReadyState m_readyState;
        bool m_startedPlaying;
        mutable bool m_isStreaming;
        IntSize m_size;
        bool m_visible;
    };
}

#endif
#endif
