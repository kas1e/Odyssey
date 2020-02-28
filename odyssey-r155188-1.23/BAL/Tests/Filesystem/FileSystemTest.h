#ifndef FileSystemTest_h_CPPUNIT
#define FileSystemTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include <Platform.h>
#include "BCFileSystem.h"
class FileSystemTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( FileSystemTestTest );
//register each method:
    CPPUNIT_TEST(fileExists);
    CPPUNIT_TEST(deleteFile);
    CPPUNIT_TEST(deleteEmptyDirectory);
    CPPUNIT_TEST(getFileSize);
    CPPUNIT_TEST(getFileModificationTime);
    CPPUNIT_TEST(pathByAppendingComponent);
    CPPUNIT_TEST(makeAllDirectories);
    CPPUNIT_TEST(homeDirectoryPath);
    CPPUNIT_TEST(pathGetFileName);
    CPPUNIT_TEST(directoryName);

    CPPUNIT_TEST(fileSystemRepresentation);

    CPPUNIT_TEST(isHandleValid);

    CPPUNIT_TEST(openTemporaryFile);
    CPPUNIT_TEST(closeFile);
    CPPUNIT_TEST(writeToFile);

    CPPUNIT_TEST(unloadModule);

    CPPUNIT_TEST_SUITE_END();

    void fileExists() CPPU_NOT_IMPLEMENTED
    void deleteFile() CPPU_NOT_IMPLEMENTED
    void deleteEmptyDirectory() CPPU_NOT_IMPLEMENTED
    void getFileSize() CPPU_NOT_IMPLEMENTED
    void getFileModificationTime() CPPU_NOT_IMPLEMENTED
    void pathByAppendingComponent() CPPU_NOT_IMPLEMENTED
    void makeAllDirectories() CPPU_NOT_IMPLEMENTED
    void homeDirectoryPath() CPPU_NOT_IMPLEMENTED
    void pathGetFileName() CPPU_NOT_IMPLEMENTED
    void directoryName() CPPU_NOT_IMPLEMENTED

    void fileSystemRepresentation() CPPU_NOT_IMPLEMENTED

    void isHandleValid() CPPU_NOT_IMPLEMENTED

    void openTemporaryFile() CPPU_NOT_IMPLEMENTED
    void closeFile() CPPU_NOT_IMPLEMENTED
    void writeToFile() CPPU_NOT_IMPLEMENTED

    void unloadModule() CPPU_NOT_IMPLEMENTED

};

#endif // FileSystem_h


