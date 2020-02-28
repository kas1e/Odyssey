#ifndef UnicodeIcuTest_h_CPPUNIT
#define UnicodeIcuTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCUnicode.h"
class UnicodeIcuTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( UnicodeIcuTestTest );
//register each method:
    CPPUNIT_TEST(foldCase);
    CPPUNIT_TEST(foldCase2);
    CPPUNIT_TEST(toLower);
    CPPUNIT_TEST(toLower2);
    CPPUNIT_TEST(toUpper);
    CPPUNIT_TEST(toUpper2);
    CPPUNIT_TEST(toTitleCase);
    CPPUNIT_TEST(isArabicChar);
    CPPUNIT_TEST(isFormatChar);
    CPPUNIT_TEST(isSeparatorSpace);
    CPPUNIT_TEST(isPrintableChar);
    CPPUNIT_TEST(isDigit);
    CPPUNIT_TEST(isPunct);
    CPPUNIT_TEST(mirroredChar);
    CPPUNIT_TEST(category);
    CPPUNIT_TEST(direction);
    CPPUNIT_TEST(isLower);
    CPPUNIT_TEST(digitValue);
    CPPUNIT_TEST(combiningClass);
    CPPUNIT_TEST(decompositionType);
    CPPUNIT_TEST(umemcasecmp);

    CPPUNIT_TEST_SUITE_END();


    void foldCase() CPPU_NOT_IMPLEMENTED
    void foldCase2() CPPU_NOT_IMPLEMENTED
    void toLower() CPPU_NOT_IMPLEMENTED
    void toLower2() CPPU_NOT_IMPLEMENTED
    void toUpper() CPPU_NOT_IMPLEMENTED
    void toUpper2() CPPU_NOT_IMPLEMENTED
    void toTitleCase() CPPU_NOT_IMPLEMENTED
    void isArabicChar() CPPU_NOT_IMPLEMENTED
    void isFormatChar() CPPU_NOT_IMPLEMENTED
    void isSeparatorSpace() CPPU_NOT_IMPLEMENTED
    void isPrintableChar() CPPU_NOT_IMPLEMENTED
    void isDigit() CPPU_NOT_IMPLEMENTED
    void isPunct() CPPU_NOT_IMPLEMENTED
    void mirroredChar() CPPU_NOT_IMPLEMENTED
    void category() CPPU_NOT_IMPLEMENTED
    void direction() CPPU_NOT_IMPLEMENTED
    void isLower() CPPU_NOT_IMPLEMENTED
    void digitValue() CPPU_NOT_IMPLEMENTED
    void combiningClass() CPPU_NOT_IMPLEMENTED
    void decompositionType() CPPU_NOT_IMPLEMENTED
    void umemcasecmp() CPPU_NOT_IMPLEMENTED
};

#endif

