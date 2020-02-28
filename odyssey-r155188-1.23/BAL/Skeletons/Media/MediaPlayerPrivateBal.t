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
#ifndef MediaPlayerPrivateBal_h
#define MediaPlayerPrivateBal_h
/**
 *  @file  MediaPlayerPrivateBal.t
 *  MediaPlayerPrivateGStreamer description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:09 $
 */
#include "BALBase.h"

#if ENABLE(VIDEO)

#include "MediaPlayer.h"
#include "Timer.h"

namespace WebCore {

    class GraphicsContext;
    class IntSize;
    class IntRect;
    class String;

    class MediaPlayerPrivate : Noncopyable
    {
    public:
    /**
     * MediaPlayerPrivate constructor
     * @param[in] : media player
     * @code
     * MediaPlayerPrivate *mp = new MediaPlayerPrivate(m);
     * @endcode
     */
        MediaPlayerPrivate(MediaPlayer*);

    /**
     * MediaPlayerPrivate destructor
     */
        ~MediaPlayerPrivate();

    /**
     * @see MediaPlayer
     */
        IntSize naturalSize();

    /**
     * @see MediaPlayer
     */
        bool hasVideo();

    /**
     * @see MediaPlayer
     */
        void load(String url);

    /**
     * @see MediaPlayer
     */
        void cancelLoad();

    /**
     * @see MediaPlayer
     */
        void play();

    /**
     * @see MediaPlayer
     */
        void pause();

    /**
     * @see MediaPlayer
     */
        bool paused() const;

    /**
     * @see MediaPlayer
     */
        bool seeking() const;

    /**
     * @see MediaPlayer
     */
        float duration();

    /**
     * @see MediaPlayer
     */
        float currentTime() const;

    /**
     * @see MediaPlayer
     */
        void seek(float);

    /**
     * @see MediaPlayer
     */
        void setEndTime(float);

    /**
     * @see MediaPlayer
     */
        void setRate(float);

    /**
     * @see MediaPlayer
     */
        void setVolume(float);

    /**
     * @see MediaPlayer
     */
        void setMuted(bool);

    /**
     * @see MediaPlayer
     */
        int dataRate() const;

    /**
     * @see MediaPlayer
     */
        MediaPlayer::NetworkState networkState();

    /**
     * @see MediaPlayer
     */
        MediaPlayer::ReadyState readyState();

    /**
     * @see MediaPlayer
     */
        float maxTimeBuffered();

    /**
     * @see MediaPlayer
     */
        float maxTimeSeekable();

    /**
     * @see MediaPlayer
     */
        unsigned bytesLoaded();

    /**
     * @see MediaPlayer
     */
        bool totalBytesKnown();

    /**
     * @see MediaPlayer
     */
        unsigned totalBytes();

    /**
     * @see MediaPlayer
     */
        void setVisible(bool);

    /**
     * @see MediaPlayer
     */
        void setRect(const IntRect&);

    /**
     * @see MediaPlayer
     */
        void loadStateChanged();

    /**
     * @see MediaPlayer
     */
        void rateChanged();

    /**
     * @see MediaPlayer
     */
        void sizeChanged();

    /**
     * @see MediaPlayer
     */
        void timeChanged();

    /**
     * @see MediaPlayer
     */
        void volumeChanged();

    /**
     * @see MediaPlayer
     */
        void didEnd();

    /**
     * @see MediaPlayer
     */
        void loadingFailed();

    /**
     * @see MediaPlayer
     */
        void repaint();

    /**
     * @see MediaPlayer
     */
        void paint(GraphicsContext*, const IntRect&);

    /**
     * @see MediaPlayer
     */
        static void getSupportedTypes(HashSet<String>&);

    /**
     * @see MediaPlayer
     */
        static bool isAvailable() ;

    private:

    /**
     * updateStates
     */
        void updateStates();

    /**
     * cancelSeek
     */
        void cancelSeek();

    /**
     * endPointTimerFired
     */
        void endPointTimerFired(Timer<MediaPlayerPrivate>*);

    /**
     * maxTimeLoaded
     */
        float maxTimeLoaded();

    /**
     * startEndPointTimerIfNeeded
     */
        void startEndPointTimerIfNeeded();

    /**
     * createGSTPlayBin description
     */
        void createGSTPlayBin(String url);

    private:
        MediaPlayer* m_player;
        float m_rate;
        float m_endTime;
        bool m_isEndReached;
        double m_volume;
        MediaPlayer::NetworkState m_networkState;
        MediaPlayer::ReadyState m_readyState;
        bool m_startedPlaying;
        bool m_isStreaming;
        IntRect m_rect;
        bool m_visible;
        BalSurface* m_surface;
    };
}

#endif
#endif




