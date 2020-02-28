#ifndef MIMETypeRegistryTest_h_CPPUNIT
#define MIMETypeRegistryTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCMIMETypeRegistry.h"
class MIMETypeRegistryTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( MIMETypeRegistryTestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);

    CPPUNIT_TEST(getMIMETypeForExtension);
    CPPUNIT_TEST(getExtensionsForMIMEType);
    CPPUNIT_TEST(getPreferredExtensionForMIMEType);
    CPPUNIT_TEST(getMIMETypeForPath);

    CPPUNIT_TEST(isSupportedImageMIMEType);

    CPPUNIT_TEST(isSupportedImageResourceMIMEType);

    CPPUNIT_TEST(isSupportedImageMIMETypeForEncoding);

    CPPUNIT_TEST(isSupportedJavaScriptMIMEType);

    CPPUNIT_TEST(isSupportedNonImageMIMEType);

    CPPUNIT_TEST(isSupportedMediaMIMEType);

    CPPUNIT_TEST(isJavaAppletMIMEType);

    CPPUNIT_TEST(getSupportedImageMIMETypes);
    CPPUNIT_TEST(getSupportedImageResourceMIMETypes);
    CPPUNIT_TEST(getSupportedImageMIMETypesForEncoding);
    CPPUNIT_TEST(getSupportedNonImageMIMETypes);
    CPPUNIT_TEST(getSupportedMediaMIMETypes);

    CPPUNIT_TEST_SUITE_END();
	public:
	void constructors() CPPU_NOT_IMPLEMENTED
	void destructors() CPPU_NOT_IMPLEMENTED

    void getMIMETypeForExtension() CPPU_NOT_IMPLEMENTED
    void getExtensionsForMIMEType() CPPU_NOT_IMPLEMENTED
    void getPreferredExtensionForMIMEType() CPPU_NOT_IMPLEMENTED
    void getMIMETypeForPath() CPPU_NOT_IMPLEMENTED

    void isSupportedImageMIMEType() CPPU_NOT_IMPLEMENTED

    void isSupportedImageResourceMIMEType() CPPU_NOT_IMPLEMENTED

    void isSupportedImageMIMETypeForEncoding() CPPU_NOT_IMPLEMENTED

    void isSupportedJavaScriptMIMEType() CPPU_NOT_IMPLEMENTED

    void isSupportedNonImageMIMEType() CPPU_NOT_IMPLEMENTED

    void isSupportedMediaMIMEType() CPPU_NOT_IMPLEMENTED

    void isJavaAppletMIMEType() CPPU_NOT_IMPLEMENTED

    void getSupportedImageMIMETypes() CPPU_NOT_IMPLEMENTED
    void getSupportedImageResourceMIMETypes() CPPU_NOT_IMPLEMENTED
    void getSupportedImageMIMETypesForEncoding() CPPU_NOT_IMPLEMENTED
    void getSupportedNonImageMIMETypes() CPPU_NOT_IMPLEMENTED
    void getSupportedMediaMIMETypes() CPPU_NOT_IMPLEMENTED
};


#endif // MIMETypeRegistry_h

