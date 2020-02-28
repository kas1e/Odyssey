#ifndef PasteboardTest_h_CPPUNIT
#define PasteboardTest_h_CPPUNIT

#include "config.h"
#include <cppunit/extensions/HelperMacros.h>
#include "BCPasteboard.h"
class PasteboardTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( PasteboardTestTest );
//register each method:
    CPPUNIT_TEST(generalPasteboard);
    CPPUNIT_TEST(writeSelection);
    CPPUNIT_TEST(writeURL);
    CPPUNIT_TEST(writeImage);
    CPPUNIT_TEST(clear);
    CPPUNIT_TEST(canSmartReplace);
    CPPUNIT_TEST(documentFragment);
    CPPUNIT_TEST(plainText);

    CPPUNIT_TEST(setHelper);


    CPPUNIT_TEST_SUITE_END();


public:
    
    void generalPasteboard() CPPU_NOT_IMPLEMENTED
    void writeSelection() CPPU_NOT_IMPLEMENTED
    void writeURL() CPPU_NOT_IMPLEMENTED
    void writeImage() CPPU_NOT_IMPLEMENTED
    void clear() CPPU_NOT_IMPLEMENTED
    void canSmartReplace() CPPU_NOT_IMPLEMENTED
    void documentFragment() CPPU_NOT_IMPLEMENTED
    void plainText() CPPU_NOT_IMPLEMENTED

    void setHelper() CPPU_NOT_IMPLEMENTED

};


#endif // Pasteboard_h


