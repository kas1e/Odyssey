#ifndef HashTraitsTest_h_CPPUNIT
#define HashTraitsTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCHashTraits.h"
class HashTraitsTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( HashTraitsTestTest );
//register each method:
    CPPUNIT_TEST(GenericHashTraitsBase_constructDeletedValue);
    CPPUNIT_TEST(GenericHashTraitsBase_isDeletedValue);
    CPPUNIT_TEST(GenericHashTraits_emptyValue);
    CPPUNIT_TEST(FloatHashTraits_emptyValue);
    CPPUNIT_TEST(FloatHashTraits_constructDeletedValue);
    CPPUNIT_TEST(FloatHashTraits_isDeletedValue);
    CPPUNIT_TEST(HashTraitP_sconstructDeletedValue);
    CPPUNIT_TEST(HashTraitP_isDeletedValue);
    CPPUNIT_TEST(HashTraitRefPtr_constructDeletedValue);
    CPPUNIT_TEST(HashTraitRefPtr_isDeletedValue);
    CPPUNIT_TEST(PairHashTraits_emptyValue);
    CPPUNIT_TEST(PairHashTraits_constructDeletedValue);
    CPPUNIT_TEST(PairHashTraits_isDeletedValue);

    CPPUNIT_TEST_SUITE_END();


    void GenericHashTraitsBase_constructDeletedValue() CPPU_NOT_IMPLEMENTED
    void GenericHashTraitsBase_isDeletedValue() CPPU_NOT_IMPLEMENTED
    void GenericHashTraits_emptyValue() CPPU_NOT_IMPLEMENTED
    void FloatHashTraits_emptyValue() CPPU_NOT_IMPLEMENTED
    void FloatHashTraits_constructDeletedValue() CPPU_NOT_IMPLEMENTED
    void FloatHashTraits_isDeletedValue() CPPU_NOT_IMPLEMENTED
    void HashTraitP_sconstructDeletedValue() CPPU_NOT_IMPLEMENTED
    void HashTraitP_isDeletedValue() CPPU_NOT_IMPLEMENTED
    void HashTraitRefPtr_constructDeletedValue() CPPU_NOT_IMPLEMENTED
    void HashTraitRefPtr_isDeletedValue() CPPU_NOT_IMPLEMENTED
    void PairHashTraits_emptyValue() CPPU_NOT_IMPLEMENTED
    void PairHashTraits_constructDeletedValue() CPPU_NOT_IMPLEMENTED
    void PairHashTraits_isDeletedValue() CPPU_NOT_IMPLEMENTED
    };


#endif // WTF_HashTraits_h

