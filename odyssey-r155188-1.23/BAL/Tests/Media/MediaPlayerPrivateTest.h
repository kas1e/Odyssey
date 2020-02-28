#ifndef MediaPlayerPrivateTest_h_CPPUNIT
#define MediaPlayerPrivateTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "Platform.h"
#include "BCMediaPlayerPrivate.h"
class MediaPlayerPrivateTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( MediaPlayerPrivateTestTest );
//register each method:
#if ENABLE(VIDEO)
    CPPUNIT_TEST(mediaPlayerPrivateErrorCallback);
    CPPUNIT_TEST(mediaPlayerPrivateEOSCallback);
    CPPUNIT_TEST(mediaPlayerPrivateStateCallback);

//    class MediaPlayerPrivate : Noncopyable
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);
    CPPUNIT_TEST(naturalSize);
    CPPUNIT_TEST(hasVideo);

    CPPUNIT_TEST(load);
    CPPUNIT_TEST(cancelLoad);

    CPPUNIT_TEST(play);
    CPPUNIT_TEST(pause);

    CPPUNIT_TEST(paused);
    CPPUNIT_TEST(seeking);

    CPPUNIT_TEST(duration);
    CPPUNIT_TEST(currentTime);
    CPPUNIT_TEST(seek);
    CPPUNIT_TEST(setEndTime);

    CPPUNIT_TEST(setRate);
    CPPUNIT_TEST(setVolume);
    CPPUNIT_TEST(setMuted);

    CPPUNIT_TEST(dataRate);

    CPPUNIT_TEST(networkState);
    CPPUNIT_TEST(readyState);

    CPPUNIT_TEST(maxTimeBuffered);
    CPPUNIT_TEST(maxTimeSeekable);
    CPPUNIT_TEST(bytesLoaded);
    CPPUNIT_TEST(totalBytesKnown);
    CPPUNIT_TEST(totalBytes);

    CPPUNIT_TEST(setVisible);
    CPPUNIT_TEST(setRect);

    CPPUNIT_TEST(loadStateChanged);
    CPPUNIT_TEST(rateChanged);
    CPPUNIT_TEST(sizeChanged);
    CPPUNIT_TEST(timeChanged);
    CPPUNIT_TEST(volumeChanged);
    CPPUNIT_TEST(didEnd);
    CPPUNIT_TEST(loadingFailed);

    CPPUNIT_TEST(repaint);
    CPPUNIT_TEST(paint);
    CPPUNIT_TEST(getSupportedTypes);
    CPPUNIT_TEST(isAvailable);
#endif

    CPPUNIT_TEST_SUITE_END();
#if ENABLE(VIDEO)
    public:

    void mediaPlayerPrivateErrorCallback() CPPU_NOT_IMPLEMENTED
    void mediaPlayerPrivateEOSCallback() CPPU_NOT_IMPLEMENTED
    void mediaPlayerPrivateStateCallback() CPPU_NOT_IMPLEMENTED

//    class MediaPlayerPrivate : Noncopyable
    void constructors() CPPU_NOT_IMPLEMENTED
    void destructors() CPPU_NOT_IMPLEMENTED
    void naturalSize() CPPU_NOT_IMPLEMENTED
    void hasVideo() CPPU_NOT_IMPLEMENTED

    void load() CPPU_NOT_IMPLEMENTED
    void cancelLoad() CPPU_NOT_IMPLEMENTED

    void play() CPPU_NOT_IMPLEMENTED
    void pause() CPPU_NOT_IMPLEMENTED

    void paused() CPPU_NOT_IMPLEMENTED
    void seeking() CPPU_NOT_IMPLEMENTED

    void duration() CPPU_NOT_IMPLEMENTED
    void currentTime() CPPU_NOT_IMPLEMENTED
    void seek() CPPU_NOT_IMPLEMENTED
    void setEndTime() CPPU_NOT_IMPLEMENTED

    void setRate() CPPU_NOT_IMPLEMENTED
    void setVolume() CPPU_NOT_IMPLEMENTED
    void setMuted() CPPU_NOT_IMPLEMENTED

    void dataRate() CPPU_NOT_IMPLEMENTED

    void networkState() CPPU_NOT_IMPLEMENTED
    void readyState() CPPU_NOT_IMPLEMENTED

    void maxTimeBuffered() CPPU_NOT_IMPLEMENTED
    void maxTimeSeekable() CPPU_NOT_IMPLEMENTED
    void bytesLoaded() CPPU_NOT_IMPLEMENTED
    void totalBytesKnown() CPPU_NOT_IMPLEMENTED
    void totalBytes() CPPU_NOT_IMPLEMENTED

    void setVisible() CPPU_NOT_IMPLEMENTED
    void setRect() CPPU_NOT_IMPLEMENTED

    void loadStateChanged() CPPU_NOT_IMPLEMENTED
    void rateChanged() CPPU_NOT_IMPLEMENTED
    void sizeChanged() CPPU_NOT_IMPLEMENTED
    void timeChanged() CPPU_NOT_IMPLEMENTED
    void volumeChanged() CPPU_NOT_IMPLEMENTED
    void didEnd() CPPU_NOT_IMPLEMENTED
    void loadingFailed() CPPU_NOT_IMPLEMENTED

    void repaint() CPPU_NOT_IMPLEMENTED
    void paint() CPPU_NOT_IMPLEMENTED
    void getSupportedTypes() CPPU_NOT_IMPLEMENTED
    void isAvailable() CPPU_NOT_IMPLEMENTED


#endif
    };
#endif

