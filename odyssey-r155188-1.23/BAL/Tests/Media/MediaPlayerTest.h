#ifndef MediaPlayerTest_h_CPPUNIT
#define MediaPlayerTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include <Platform.h>
#include "BCMediaPlayer.h"
class MediaPlayerTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( MediaPlayerTestTest );
//register each method:
#if ENABLE(VIDEO)
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);

//class MediaPlayerClient {
    CPPUNIT_TEST(mediaPlayerNetworkStateChanged);
    CPPUNIT_TEST(mediaPlayerReadyStateChanged);
    CPPUNIT_TEST(mediaPlayerVolumeChanged);
    CPPUNIT_TEST(mediaPlayerTimeChanged);
    CPPUNIT_TEST(mediaPlayerRepaint);

//class MediaPlayer : Noncopyable {
    CPPUNIT_TEST(isAvailable);
    CPPUNIT_TEST(getSupportedTypes);
    
    CPPUNIT_TEST(naturalSize);
    CPPUNIT_TEST(hasVideo);
    
    CPPUNIT_TEST(setFrameView);
    
    CPPUNIT_TEST(rect);
    CPPUNIT_TEST(setRect);
    
    CPPUNIT_TEST(load);
    CPPUNIT_TEST(cancelLoad);
   
    CPPUNIT_TEST(visible);
    CPPUNIT_TEST(setVisible);
    
    CPPUNIT_TEST(play);
    CPPUNIT_TEST(pause);
    
    CPPUNIT_TEST(paused);
    CPPUNIT_TEST(seeking);
    
    CPPUNIT_TEST(duration);
    CPPUNIT_TEST(currentTime);
    CPPUNIT_TEST(seek);
    
    CPPUNIT_TEST(setEndTime);
    
    CPPUNIT_TEST(rate);
    CPPUNIT_TEST(setRate);
    
    CPPUNIT_TEST(maxTimeBuffered);
    CPPUNIT_TEST(maxTimeSeekable);
    
    CPPUNIT_TEST(bytesLoaded);
    CPPUNIT_TEST(totalBytesKnown);
    CPPUNIT_TEST(totalBytes);
    
    CPPUNIT_TEST(volume);
    CPPUNIT_TEST(setVolume);
    
    CPPUNIT_TEST(dataRate);
    
    CPPUNIT_TEST(paint);
    
    CPPUNIT_TEST(networkState);

    CPPUNIT_TEST(readyState);
    
    CPPUNIT_TEST(networkStateChanged);
    CPPUNIT_TEST(readyStateChanged);
    CPPUNIT_TEST(volumeChanged);
    CPPUNIT_TEST(timeChanged);

    CPPUNIT_TEST(repaint);
 #endif
    CPPUNIT_TEST_SUITE_END();


public:
#if ENABLE(VIDEO)
    void constructors() CPPU_NOT_IMPLEMENTED
    void destructors() CPPU_NOT_IMPLEMENTED

//class MediaPlayerClient {
    void mediaPlayerNetworkStateChanged() CPPU_NOT_IMPLEMENTED
    void mediaPlayerReadyStateChanged() CPPU_NOT_IMPLEMENTED
    void mediaPlayerVolumeChanged() CPPU_NOT_IMPLEMENTED
    void mediaPlayerTimeChanged() CPPU_NOT_IMPLEMENTED
    void mediaPlayerRepaint() CPPU_NOT_IMPLEMENTED

//class MediaPlayer : Noncopyable {
    void isAvailable() CPPU_NOT_IMPLEMENTED
    void getSupportedTypes() CPPU_NOT_IMPLEMENTED
    
    void naturalSize() CPPU_NOT_IMPLEMENTED
    void hasVideo() CPPU_NOT_IMPLEMENTED
    
    void setFrameView() CPPU_NOT_IMPLEMENTED
    
    void rect() CPPU_NOT_IMPLEMENTED
    void setRect() CPPU_NOT_IMPLEMENTED
    
    void load() CPPU_NOT_IMPLEMENTED
    void cancelLoad() CPPU_NOT_IMPLEMENTED
   
    void visible() CPPU_NOT_IMPLEMENTED
    void setVisible() CPPU_NOT_IMPLEMENTED
    
    void play() CPPU_NOT_IMPLEMENTED
    void pause() CPPU_NOT_IMPLEMENTED
    
    void paused() CPPU_NOT_IMPLEMENTED
    void seeking() CPPU_NOT_IMPLEMENTED
    
    void duration() CPPU_NOT_IMPLEMENTED
    void currentTime() CPPU_NOT_IMPLEMENTED
    void seek() CPPU_NOT_IMPLEMENTED
    
    void setEndTime() CPPU_NOT_IMPLEMENTED
    
    void rate() CPPU_NOT_IMPLEMENTED
    void setRate() CPPU_NOT_IMPLEMENTED
    
    void maxTimeBuffered() CPPU_NOT_IMPLEMENTED
    void maxTimeSeekable() CPPU_NOT_IMPLEMENTED
    
    void bytesLoaded() CPPU_NOT_IMPLEMENTED
    void totalBytesKnown() CPPU_NOT_IMPLEMENTED
    void totalBytes() CPPU_NOT_IMPLEMENTED
    
    void volume() CPPU_NOT_IMPLEMENTED
    void setVolume() CPPU_NOT_IMPLEMENTED
    
    void dataRate() CPPU_NOT_IMPLEMENTED
    
    void paint() CPPU_NOT_IMPLEMENTED
    
    void networkState() CPPU_NOT_IMPLEMENTED

    void readyState() CPPU_NOT_IMPLEMENTED
    
    void networkStateChanged() CPPU_NOT_IMPLEMENTED
    void readyStateChanged() CPPU_NOT_IMPLEMENTED
    void volumeChanged() CPPU_NOT_IMPLEMENTED
    void timeChanged() CPPU_NOT_IMPLEMENTED

    void repaint() CPPU_NOT_IMPLEMENTED
    
#endif
};
#endif

