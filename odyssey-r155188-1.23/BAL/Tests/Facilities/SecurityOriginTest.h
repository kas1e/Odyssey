#ifndef SecurityOriginTest_h_CPPUNIT
#define SecurityOriginTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSecurityOrigin.h"
class SecurityOriginTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SecurityOriginTestTest );
//register each method:

    CPPUNIT_TEST(createForFrame);
    CPPUNIT_TEST(createFromDatabaseIdentifier);
    CPPUNIT_TEST(createFromString);
    CPPUNIT_TEST(create);

    CPPUNIT_TEST(copy);

    CPPUNIT_TEST(setDomainFromDOM);
    CPPUNIT_TEST(protocol);
    CPPUNIT_TEST(host);
    CPPUNIT_TEST(domain);
    CPPUNIT_TEST(port);

    CPPUNIT_TEST(canAccess);
    CPPUNIT_TEST(isSecureTransitionTo);

    CPPUNIT_TEST(isEmpty);
    CPPUNIT_TEST(toString);

    CPPUNIT_TEST(databaseIdentifier);

    CPPUNIT_TEST(equal);

    CPPUNIT_TEST(isSameSchemeHostPort);
 
    CPPUNIT_TEST_SUITE_END();

    void createForFrame() CPPU_NOT_IMPLEMENTED
    void createFromDatabaseIdentifier() CPPU_NOT_IMPLEMENTED
    void createFromString() CPPU_NOT_IMPLEMENTED
    void create() CPPU_NOT_IMPLEMENTED

    void copy() CPPU_NOT_IMPLEMENTED

    void setDomainFromDOM() CPPU_NOT_IMPLEMENTED
    void protocol() CPPU_NOT_IMPLEMENTED
    void host() CPPU_NOT_IMPLEMENTED
    void domain() CPPU_NOT_IMPLEMENTED
    void port() CPPU_NOT_IMPLEMENTED

    void canAccess() CPPU_NOT_IMPLEMENTED
    void isSecureTransitionTo() CPPU_NOT_IMPLEMENTED

    void isEmpty() CPPU_NOT_IMPLEMENTED
    void toString() CPPU_NOT_IMPLEMENTED

    void databaseIdentifier() CPPU_NOT_IMPLEMENTED

    void equal() CPPU_NOT_IMPLEMENTED

    void isSameSchemeHostPort() CPPU_NOT_IMPLEMENTED
    };


#endif // SecurityOrigin_h

