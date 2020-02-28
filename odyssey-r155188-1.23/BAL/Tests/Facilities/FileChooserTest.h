#ifndef FileChooserTest_h_CPPUNIT
#define FileChooserTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCFileChooser.h"
class FileChooserTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( FileChooserTestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);
    CPPUNIT_TEST(valueChanged);

    CPPUNIT_TEST(create);

    CPPUNIT_TEST(disconnectClient);
    CPPUNIT_TEST(disconnected);

    CPPUNIT_TEST(openFileChooser);

    CPPUNIT_TEST(filename);
    CPPUNIT_TEST(basenameForWidth);

    CPPUNIT_TEST(icon);

    CPPUNIT_TEST(clear);

    CPPUNIT_TEST(chooseFile);


    CPPUNIT_TEST_SUITE_END();


	void constructors() CPPU_NOT_IMPLEMENTED
	void destructors() CPPU_NOT_IMPLEMENTED
    void valueChanged() CPPU_NOT_IMPLEMENTED

    void create() CPPU_NOT_IMPLEMENTED

    void disconnectClient() CPPU_NOT_IMPLEMENTED
    void disconnected() CPPU_NOT_IMPLEMENTED

    void openFileChooser() CPPU_NOT_IMPLEMENTED

    void filename() CPPU_NOT_IMPLEMENTED
    void basenameForWidth() CPPU_NOT_IMPLEMENTED

    void icon() CPPU_NOT_IMPLEMENTED

    void clear() CPPU_NOT_IMPLEMENTED

    void chooseFile() CPPU_NOT_IMPLEMENTED

};

#endif

