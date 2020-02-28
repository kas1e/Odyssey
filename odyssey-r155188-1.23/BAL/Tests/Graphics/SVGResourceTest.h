#include "Platform.h"
#if ENABLE(SVG)
#ifndef SVGResourceTest_h_CPPUNIT
#define SVGResourceTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSVGResource.h"
class SVGResourceTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SVGResourceTestTest );
//register each method:
    CPPUNIT_TEST(destruct_SVGResource);
      
    CPPUNIT_TEST(invalidate);

    CPPUNIT_TEST(addClient);
    CPPUNIT_TEST(resourceType);
        
    CPPUNIT_TEST(isPaintServer);
    CPPUNIT_TEST(isFilter);
    CPPUNIT_TEST(isClipper);
    CPPUNIT_TEST(isMarker);
    CPPUNIT_TEST(isMasker);

    CPPUNIT_TEST(externalRepresentation);

    CPPUNIT_TEST(invalidateClients);
    CPPUNIT_TEST(removeClient);
    CPPUNIT_TEST(getResourceById);
    CPPUNIT_TEST(operator_left);


    CPPUNIT_TEST_SUITE_END();


    public:
    void destruct_SVGResource() CPPU_NOT_IMPLEMENTED
      
    void invalidate() CPPU_NOT_IMPLEMENTED

    void addClient() CPPU_NOT_IMPLEMENTED
    void resourceType() CPPU_NOT_IMPLEMENTED
        
    void isPaintServer() CPPU_NOT_IMPLEMENTED
    void isFilter() CPPU_NOT_IMPLEMENTED
    void isClipper() CPPU_NOT_IMPLEMENTED
    void isMarker() CPPU_NOT_IMPLEMENTED
    void isMasker() CPPU_NOT_IMPLEMENTED

    void externalRepresentation() CPPU_NOT_IMPLEMENTED

    void invalidateClients() CPPU_NOT_IMPLEMENTED
    void removeClient() CPPU_NOT_IMPLEMENTED
    void getResourceById() CPPU_NOT_IMPLEMENTED
    void operator_left() CPPU_NOT_IMPLEMENTED

    };


#endif // SVGResource_h
#endif

