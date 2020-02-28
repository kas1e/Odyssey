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
#ifndef MediaPlayer_h
#define MediaPlayer_h
/**
 *  @file  MediaPlayer.t
 *  MediaPlayer description
 *  Repository informations :
 * - $URL$
 * - $Rev$
 * - $Date: 2012/05/10 10:21:09 $
 */
#include "BALBase.h"

#if ENABLE(VIDEO)

#include "IntRect.h"
#include "StringHash.h"
#include <wtf/HashSet.h>
#include <wtf/Noncopyable.h>

namespace WebCore {

class FrameView;
class GraphicsContext;
class IntSize;
class MediaPlayer;
class MediaPlayerPrivate;
class String;

class MediaPlayerClient : public WebCoreBase {
public:
    /**
     * MediaPlayerClient destructor
     */
    virtual ~MediaPlayerClient() ;

    /**
     * media player network state changed
     * @param[in] : Media player
     * @code
     * mc->mediaPlayerNetworkStateChanged(m);
     * @endcode
     */
    virtual void mediaPlayerNetworkStateChanged(MediaPlayer*) ;

    /**
     * media player ready state changed
     * @param[in] : Media player
     * @code
     * mc->mediaPlayerReadyStateChanged(m);
     * @endcode
     */
    virtual void mediaPlayerReadyStateChanged(MediaPlayer*) ;

    /**
     * media player volume changed
     * @param[in] : Media player
     * @code
     * mc->mediaPlayerVolumeChanged(m);
     * @endcode
     */
    virtual void mediaPlayerVolumeChanged(MediaPlayer*) ;

    /**
     * media player time changed
     * @param[in] : Media Player
     * @code
     * mc->mediaPlayerTimeChanged(m);
     * @endcode
     */
    virtual void mediaPlayerTimeChanged(MediaPlayer*) ;

    /**
     * media player repaint
     * @param[in] : media player
     * @code
     * mc->mediaPlayerRepaint(m);
     * @endcode
     */
    virtual void mediaPlayerRepaint(MediaPlayer*) ;
};

class MediaPlayer : public WebCoreBase, Noncopyable {
public:
    /**
     * MediaPlayer constructor
     * @param[in] : media player client
     * @code
     * MediaPlayer *m = new MediaPlayer(mc);
     * @endcode
     */
    MediaPlayer(MediaPlayerClient*);

    /**
     * MediaPlayer destructor
     */
    virtual ~MediaPlayer();
    
    /**
     * test if the media player is available
     * @param[out] : true if the media player is available
     * @code
     * bool a = MediaPlayer::isAvailable();
     * @endcode
     */
    static bool isAvailable();

    /**
     * test if the media player supports type
     * @param[in] : type
     * @code
     * bool s = MediaPlayer::supportsType(t);
     * @endcode
     */
    static bool supportsType(const String&);

    /**
     * get supported types
     * @param[out] : supported types
     * @code
     * MediaPlayer::getSupportedTypes(s);
     * @endcode
     */
    static void getSupportedTypes(HashSet<String>&);
    
    /**
     * get natural size
     * @param[out] : size
     * @code
     * IntSize s m->naturalSize();
     * @endcode
     */
    IntSize naturalSize();

    /**
     * test if the media player has video
     * @param[out] : true if the media player has video
     * @code
     * bool v = m->hasVideo();
     * @endcode
     */
    bool hasVideo();
    
    /**
     * set frame view
     * @param[in] : frame view
     * @code
     * m->setFrameView(fv);
     * @endcode
     */
    void setFrameView(FrameView* frameView) ;
    

    /**
     * Tells if the Document holding the media player is a MediaDocument
     * (created from mime-type detection related to a media)
     * @return true if MediaPlayer element is in a MediaDocument
     */
    bool inMediaDocument();

    /**
     * get rect where the video is played
     * @param[out] : rect
     * @code
     * IntRect r = m->rect();
     * @endcode
     */
    IntRect rect() const ;

    /**
     * set rect where the video is played
     * @param[in] : rect
     * @code
     * m->setRect(r);
     * @endcode
     */
    void setRect(const IntRect& r);
    
    /**
     * load url
     * @param[in] : url
     * @code
     * m->load(u);
     * @endcode
     */
    void load(const String& url);

    /**
     * cancel load 
     * @code
     * m->cancelLoad();
     * @endcode
     */
    void cancelLoad();
    
    /**
     * test if the media player is visible
     * @param[out] : true if the media player is visible
     * @code
     * bool v = m->visible();
     * @endcode
     */
    bool visible() const;

    /**
     * set visible 
     * @param[in] : status
     * @code
     * m->setVisible(true);
     * @endcode
     */
    void setVisible(bool);
    
    /**
     * play video
     * @code
     * m->play();
     * @endcode
     */
    void play();

    /**
     * pause video
     * @code
     * m->pause();
     * @endcode
     */
    void pause();    
    
    /**
     * get paused status
     * @param[out] : true if the player is paused
     * @code
     * bool p = m->paused();
     * @endcode
     */
    bool paused() const;

    /**
     * seeking 
     * @param[out] : status
     * @code
     * m->seeking();
     * @endcode
     */
    bool seeking() const;
    
    /**
     * get duration
     * @param[out] : duration
     * @code
     * float d = m->duration();
     * @endcode
     */
    float duration() const;

    /**
     * get current time
     * @param[out] : current time
     * @code
     * float c = m->currentTime();
     * @endcode
     */
    float currentTime() const;

    /**
     * seek
     * @param[in] : time
     * @code
     * m->seek(t);
     * @endcode
     */
    void seek(float time);
    
    /**
     * set end time 
     * @param[in] : time
     * @code
     * m->setEndTime(t);
     * @endcode
     */
    void setEndTime(float time);
    
    /**
     * get rate
     * @param[out] : rate
     * @code
     * float r = m->rate();
     * @endcode
     */
    float rate() const;

    /**
     * set rate
     * @param[in] : rate
     * @code
     * m->setRate(r);
     * @endcode
     */
    void setRate(float);
    
    /**
     * get max time buffered
     * @param[out] : time
     * @code
     * float t = m->maxTimeBuffered();
     * @endcode
     */
    float maxTimeBuffered();

    /**
     * get max time seekable
     * @param[out] : time
     * @code
     * float t = m->maxTimeSeekable();
     * @endcode
     */
    float maxTimeSeekable();
    
    /**
     * get bytes loaded
     * @param[out] : bytes loaded
     * @code
     * unsigned b = m->bytesLoaded();
     * @endcode
     */
    unsigned bytesLoaded();

    /**
     * get if the total bytes is known
     * @param[out] : status
     * @code
     * bool t = m->totalBytesKnown();
     * @endcode
     */
    bool totalBytesKnown();

    /**
     * get total bytes
     * @param[out] : total bytes
     * @code
     * unsigned b = m->totalBytes();
     * @endcode
     */
    unsigned totalBytes();
    
    /**
     * get volume
     * @param[out] : volume
     * @code
     * float v = m->volume();
     * @endcode
     */
    float volume() const;

    /**
     * set volume
     * @param[in] : volume
     * @code
     * m->setVolume(v);
     * @endcode
     */
    void setVolume(float);
    
    /**
     * get data rate
     * @param[out] : data rate
     * @code
     * int d = m->dataRate();
     * @endcode
     */
    int dataRate() const;
    
    /**
     * paint
     * @param[in] : graphics context
     * @param[in] : rect where the video must be paint
     * @code
     * m->paint(gc, r);
     * @endcode
     */
    void paint(GraphicsContext*, const IntRect&);
    
    enum NetworkState { Empty, LoadFailed, Loading, LoadedMetaData, LoadedFirstFrame, Loaded };

    /**
     * get network state 
     * @param[out] : network state
     * @code
     * NetworkState n = m->networkState();
     * @endcode
     */
    NetworkState networkState();

    enum ReadyState  { DataUnavailable, CanShowCurrentFrame, CanPlay, CanPlayThrough };

    /**
     * get ready state
     * @param[out] : ready state
     * @code
     * ReadyState r = m->readyState();
     * @endcode
     */
    ReadyState readyState();
    
    /**
     * network state changed
     * @code
     * m->networkStateChanged();
     * @endcode
     */
    void networkStateChanged();

    /**
     * ready state changed
     * @code
     * m->readyStateChanged();
     * @endcode
     */
    void readyStateChanged();

    /**
     * volume changed
     * @code
     * m->volumeChanged();
     * @endcode
     */
    void volumeChanged();

    /**
     * time changed
     * @code
     * m->timeChanged();
     * @endcode
     */
    void timeChanged();

    /**
     * repaint
     * @code
     * m->repaint();
     * @endcode
     */
    void repaint();
    
private:
        
    friend class MediaPlayerPrivate;
    
    MediaPlayerClient* m_mediaPlayerClient;
    MediaPlayerPrivate* m_private;
    FrameView* m_frameView;
    IntRect m_rect;
    bool m_visible;
    float m_rate;
    float m_volume;
};

}

#endif
#endif



