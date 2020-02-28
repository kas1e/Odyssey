#ifndef StringHashTest_h_CPPUNIT
#define StringHashTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCStringHash.h"
class StringHashTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( StringHashTestTest );
//register each method:
    CPPUNIT_TEST(hash);
    CPPUNIT_TEST(equal);
    CPPUNIT_TEST(hash2);
    CPPUNIT_TEST(equal2);
    CPPUNIT_TEST(hash3);
    CPPUNIT_TEST(equal3);

//    class CaseFoldingHash {
    CPPUNIT_TEST(hash4);
    CPPUNIT_TEST(hash5);
    CPPUNIT_TEST(hash6);
    CPPUNIT_TEST(equal4);
    CPPUNIT_TEST(hash7);
    CPPUNIT_TEST(equal5);
    CPPUNIT_TEST(hash8);
    CPPUNIT_TEST(equal6);
//    struct AlreadyHashed : IntHash<unsigned> {
    CPPUNIT_TEST(hash9);
    CPPUNIT_TEST(avoidDeletedValue);


//    template<> struct HashTraits<WebCore::String> : GenericHashTraits<WebCore::String> {
    CPPUNIT_TEST(constructDeletedValue);
    CPPUNIT_TEST(isDeletedValue);


    CPPUNIT_TEST_SUITE_END();


    public:
//    struct StringHash {
    void hash() CPPU_NOT_IMPLEMENTED
    void equal() CPPU_NOT_IMPLEMENTED
    void hash2() CPPU_NOT_IMPLEMENTED
    void equal2() CPPU_NOT_IMPLEMENTED
    void hash3() CPPU_NOT_IMPLEMENTED
    void equal3() CPPU_NOT_IMPLEMENTED

//    class CaseFoldingHash {
    void hash4() CPPU_NOT_IMPLEMENTED
    void hash5() CPPU_NOT_IMPLEMENTED
    void hash6() CPPU_NOT_IMPLEMENTED
    void equal4() CPPU_NOT_IMPLEMENTED
    void hash7() CPPU_NOT_IMPLEMENTED
    void equal5() CPPU_NOT_IMPLEMENTED
    void hash8() CPPU_NOT_IMPLEMENTED
    void equal6() CPPU_NOT_IMPLEMENTED
//    struct AlreadyHashed : IntHash<unsigned> {
    void hash9() CPPU_NOT_IMPLEMENTED
    void avoidDeletedValue() CPPU_NOT_IMPLEMENTED


//    template<> struct HashTraits<WebCore::String> : GenericHashTraits<WebCore::String> {
    void constructDeletedValue() CPPU_NOT_IMPLEMENTED
    void isDeletedValue() CPPU_NOT_IMPLEMENTED

};

#endif

