#ifndef BidiResolverTest_h_CPPUNIT
#define BidiResolverTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCBidiResolver.h"
class BidiResolverTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( BidiResolverTestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);

//struct BidiStatus {
    CPPUNIT_TEST(operator_equal_BidiStatus);
    CPPUNIT_TEST(operator_diff_BidiStatus);

//struct BidiCharacterRun {
    CPPUNIT_TEST(destroy);

    CPPUNIT_TEST(start);
    CPPUNIT_TEST(stop);
    CPPUNIT_TEST(level);
    CPPUNIT_TEST(reversed);
    CPPUNIT_TEST(dirOverride);

    CPPUNIT_TEST(next);


//template <class Iterator, class Run> class BidiResolver : public Noncopyable {
    CPPUNIT_TEST(position);
    CPPUNIT_TEST(setPosition);
    CPPUNIT_TEST(increment);

    CPPUNIT_TEST(context);
    CPPUNIT_TEST(setContext);

    CPPUNIT_TEST(setLastDir);
    CPPUNIT_TEST(setLastStrongDir);
    CPPUNIT_TEST(setEorDir);

    CPPUNIT_TEST(dir);
    CPPUNIT_TEST(setDir);

    CPPUNIT_TEST(status);
    CPPUNIT_TEST(setStatus);

    CPPUNIT_TEST(embed);
    CPPUNIT_TEST(createBidiRunsForLine);

    CPPUNIT_TEST(firstRun);
    CPPUNIT_TEST(lastRun);
    CPPUNIT_TEST(logicallyLastRun);
    CPPUNIT_TEST(runCount);

    CPPUNIT_TEST(addRun);
    CPPUNIT_TEST(prependRun);
    CPPUNIT_TEST(moveRunToEnd);
    CPPUNIT_TEST(moveRunToBeginning);

    CPPUNIT_TEST(deleteRuns);

    CPPUNIT_TEST_SUITE_END();

public :
    void constructors() CPPU_NOT_IMPLEMENTED
    void destructors() CPPU_NOT_IMPLEMENTED

//struct BidiStatus {
    void operator_equal_BidiStatus() CPPU_NOT_IMPLEMENTED
    void operator_diff_BidiStatus() CPPU_NOT_IMPLEMENTED

//struct BidiCharacterRun {
    void destroy() CPPU_NOT_IMPLEMENTED

    void start() CPPU_NOT_IMPLEMENTED
    void stop() CPPU_NOT_IMPLEMENTED
    void level() CPPU_NOT_IMPLEMENTED
    void reversed() CPPU_NOT_IMPLEMENTED
    void dirOverride() CPPU_NOT_IMPLEMENTED

    void next() CPPU_NOT_IMPLEMENTED


//template <class Iterator, class Run> class BidiResolver : public Noncopyable {
    void position() CPPU_NOT_IMPLEMENTED
    void setPosition() CPPU_NOT_IMPLEMENTED
    void increment() CPPU_NOT_IMPLEMENTED

    void context() CPPU_NOT_IMPLEMENTED
    void setContext() CPPU_NOT_IMPLEMENTED

    void setLastDir() CPPU_NOT_IMPLEMENTED
    void setLastStrongDir() CPPU_NOT_IMPLEMENTED
    void setEorDir() CPPU_NOT_IMPLEMENTED

    void dir() CPPU_NOT_IMPLEMENTED
    void setDir() CPPU_NOT_IMPLEMENTED

    void status() CPPU_NOT_IMPLEMENTED
    void setStatus() CPPU_NOT_IMPLEMENTED

    void embed() CPPU_NOT_IMPLEMENTED
    void createBidiRunsForLine() CPPU_NOT_IMPLEMENTED

    void firstRun() CPPU_NOT_IMPLEMENTED
    void lastRun() CPPU_NOT_IMPLEMENTED
    void logicallyLastRun() CPPU_NOT_IMPLEMENTED
    void runCount() CPPU_NOT_IMPLEMENTED

    void addRun() CPPU_NOT_IMPLEMENTED
    void prependRun() CPPU_NOT_IMPLEMENTED
    void moveRunToEnd() CPPU_NOT_IMPLEMENTED
    void moveRunToBeginning() CPPU_NOT_IMPLEMENTED

    void deleteRuns() CPPU_NOT_IMPLEMENTED
};


#endif // BidiResolver_h

