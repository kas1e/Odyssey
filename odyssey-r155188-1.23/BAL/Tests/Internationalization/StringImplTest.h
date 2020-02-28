#ifndef StringImplTest_h_CPPUNIT
#define StringImplTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCStringImpl.h"
class StringImplTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( StringImplTestTest );
//register each method:
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);
     
    CPPUNIT_TEST(create);
    CPPUNIT_TEST(create2);
    CPPUNIT_TEST(create3);

    CPPUNIT_TEST(createWithTerminatingNullCharacter);

    CPPUNIT_TEST(createStrippingNullCharacters);
    CPPUNIT_TEST(adopt);
    CPPUNIT_TEST(adopt2);

    CPPUNIT_TEST(characters);
    CPPUNIT_TEST(length);

    CPPUNIT_TEST(hasTerminatingNullCharacter);

    CPPUNIT_TEST(hash);
    CPPUNIT_TEST(computeHash);
    CPPUNIT_TEST(computeHash2);
    
    CPPUNIT_TEST(copy);

    CPPUNIT_TEST(substring);

    CPPUNIT_TEST(operator__);
    CPPUNIT_TEST(characterStartingAt);

    CPPUNIT_TEST(toLength);

    CPPUNIT_TEST(containsOnlyWhitespace);

    CPPUNIT_TEST(toIntStrict);
    CPPUNIT_TEST(toUIntStrict);
    CPPUNIT_TEST(toInt64Strict);
    CPPUNIT_TEST(toUInt64Strict);

    CPPUNIT_TEST(toInt);
    CPPUNIT_TEST(toUInt);
    CPPUNIT_TEST(toInt64);
    CPPUNIT_TEST(toUInt64);

    CPPUNIT_TEST(toDouble);
    CPPUNIT_TEST(toFloat);

    CPPUNIT_TEST(toCoordsArray);
    CPPUNIT_TEST(toLengthArray);
    CPPUNIT_TEST(isLower);
    CPPUNIT_TEST(lower);
    CPPUNIT_TEST(upper);
    CPPUNIT_TEST(secure);
    CPPUNIT_TEST(capitalize);
    CPPUNIT_TEST(foldCase);

    CPPUNIT_TEST(stripWhiteSpace);
    CPPUNIT_TEST(simplifyWhiteSpace);

    CPPUNIT_TEST(find);
    CPPUNIT_TEST(find2);
    CPPUNIT_TEST(find3);

    CPPUNIT_TEST(reverseFind);
    CPPUNIT_TEST(reverseFind2);
    
    CPPUNIT_TEST(startsWith);
    CPPUNIT_TEST(endsWith);

    CPPUNIT_TEST(replace);
    CPPUNIT_TEST(replace2);
    CPPUNIT_TEST(replace3);
    CPPUNIT_TEST(replace4);

    CPPUNIT_TEST(empty);

    CPPUNIT_TEST(ascii);

    CPPUNIT_TEST(defaultWritingDirection);

#ifdef __OBJC__
    CPPUNIT_TEST(operator_NSString);
#endif


    CPPUNIT_TEST(equal1);
    CPPUNIT_TEST(equal2);
    CPPUNIT_TEST(equal3);

    CPPUNIT_TEST(equalIgnoringCase1);
    CPPUNIT_TEST(equalIgnoringCase2);
    CPPUNIT_TEST(equalIgnoringCase3);

    CPPUNIT_TEST(isSpaceOrNewline);


    CPPUNIT_TEST_SUITE_END();


//class StringImpl : public RefCounted<StringImpl> {
public:
    void constructors() CPPU_NOT_IMPLEMENTED
    void destructors() CPPU_NOT_IMPLEMENTED
     
    void create() CPPU_NOT_IMPLEMENTED
    void create2() CPPU_NOT_IMPLEMENTED
    void create3() CPPU_NOT_IMPLEMENTED

    void createWithTerminatingNullCharacter() CPPU_NOT_IMPLEMENTED

    void createStrippingNullCharacters() CPPU_NOT_IMPLEMENTED
    void adopt() CPPU_NOT_IMPLEMENTED
    void adopt2() CPPU_NOT_IMPLEMENTED

    void characters() CPPU_NOT_IMPLEMENTED
    void length() CPPU_NOT_IMPLEMENTED

    void hasTerminatingNullCharacter() CPPU_NOT_IMPLEMENTED

    void hash() CPPU_NOT_IMPLEMENTED
    void computeHash() CPPU_NOT_IMPLEMENTED
    void computeHash2() CPPU_NOT_IMPLEMENTED
    
    void copy() CPPU_NOT_IMPLEMENTED

    void substring() CPPU_NOT_IMPLEMENTED

    void operator__() CPPU_NOT_IMPLEMENTED
    void characterStartingAt() CPPU_NOT_IMPLEMENTED

    void toLength() CPPU_NOT_IMPLEMENTED

    void containsOnlyWhitespace() CPPU_NOT_IMPLEMENTED

    void toIntStrict() CPPU_NOT_IMPLEMENTED
    void toUIntStrict() CPPU_NOT_IMPLEMENTED
    void toInt64Strict() CPPU_NOT_IMPLEMENTED
    void toUInt64Strict() CPPU_NOT_IMPLEMENTED

    void toInt() CPPU_NOT_IMPLEMENTED
    void toUInt() CPPU_NOT_IMPLEMENTED
    void toInt64() CPPU_NOT_IMPLEMENTED
    void toUInt64() CPPU_NOT_IMPLEMENTED

    void toDouble() CPPU_NOT_IMPLEMENTED
    void toFloat() CPPU_NOT_IMPLEMENTED

    void toCoordsArray() CPPU_NOT_IMPLEMENTED
    void toLengthArray() CPPU_NOT_IMPLEMENTED
    void isLower() CPPU_NOT_IMPLEMENTED
    void lower() CPPU_NOT_IMPLEMENTED
    void upper() CPPU_NOT_IMPLEMENTED
    void secure() CPPU_NOT_IMPLEMENTED
    void capitalize() CPPU_NOT_IMPLEMENTED
    void foldCase() CPPU_NOT_IMPLEMENTED

    void stripWhiteSpace() CPPU_NOT_IMPLEMENTED
    void simplifyWhiteSpace() CPPU_NOT_IMPLEMENTED

    void find() CPPU_NOT_IMPLEMENTED
    void find2() CPPU_NOT_IMPLEMENTED
    void find3() CPPU_NOT_IMPLEMENTED

    void reverseFind() CPPU_NOT_IMPLEMENTED
    void reverseFind2() CPPU_NOT_IMPLEMENTED
    
    void startsWith() CPPU_NOT_IMPLEMENTED
    void endsWith() CPPU_NOT_IMPLEMENTED

    void replace() CPPU_NOT_IMPLEMENTED
    void replace2() CPPU_NOT_IMPLEMENTED
    void replace3() CPPU_NOT_IMPLEMENTED
    void replace4() CPPU_NOT_IMPLEMENTED

    void empty() CPPU_NOT_IMPLEMENTED

    void ascii() CPPU_NOT_IMPLEMENTED

    void defaultWritingDirection() CPPU_NOT_IMPLEMENTED

#ifdef __OBJC__
    void operator_NSString() CPPU_NOT_IMPLEMENTED
#endif


    void equal1() CPPU_NOT_IMPLEMENTED
    void equal2() CPPU_NOT_IMPLEMENTED
    void equal3() CPPU_NOT_IMPLEMENTED

    void equalIgnoringCase1() CPPU_NOT_IMPLEMENTED
    void equalIgnoringCase2() CPPU_NOT_IMPLEMENTED
    void equalIgnoringCase3() CPPU_NOT_IMPLEMENTED

    void isSpaceOrNewline() CPPU_NOT_IMPLEMENTED

};

#endif

