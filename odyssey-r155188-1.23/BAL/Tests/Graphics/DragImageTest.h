#ifndef DragImageTest_h_CPPUNIT
#define DragImageTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCDragImage.h"
class DragImageTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( DragImageTestTest );
//register each method:

    CPPUNIT_TEST(dragImageSize);
    
    CPPUNIT_TEST(fitDragImageToMaxSize);
    CPPUNIT_TEST(scaleDragImage);
    CPPUNIT_TEST(dissolveDragImageToFraction);
    
    CPPUNIT_TEST(createDragImageFromImage);
    CPPUNIT_TEST(createDragImageForSelection);
    CPPUNIT_TEST(createDragImageIconForCachedImage);
    CPPUNIT_TEST(deleteDragImage);


    CPPUNIT_TEST_SUITE_END();


    void dragImageSize() CPPU_NOT_IMPLEMENTED
    
    void fitDragImageToMaxSize() CPPU_NOT_IMPLEMENTED
    void scaleDragImage() CPPU_NOT_IMPLEMENTED
    void dissolveDragImageToFraction() CPPU_NOT_IMPLEMENTED
    
    void createDragImageFromImage() CPPU_NOT_IMPLEMENTED
    void createDragImageForSelection() CPPU_NOT_IMPLEMENTED
    void createDragImageIconForCachedImage() CPPU_NOT_IMPLEMENTED
    void deleteDragImage() CPPU_NOT_IMPLEMENTED

};


#endif //!DragImage_h

