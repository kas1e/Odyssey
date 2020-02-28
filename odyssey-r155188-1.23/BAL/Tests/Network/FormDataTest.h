#ifndef FormDataTest_h_CPPUNIT
#define FormDataTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCFormData.h"
class FormDataTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( FormDataTestTest );
//register each method:
    CPPUNIT_TEST(FormDataElement);
    CPPUNIT_TEST(FormDataElement_args1);
    CPPUNIT_TEST(FormDataElement_args2);

    CPPUNIT_TEST(FormDataElement_operator_eq);
    CPPUNIT_TEST(FormDataElement_operator_diff);
    
    CPPUNIT_TEST(create);
    CPPUNIT_TEST(create_size);
    CPPUNIT_TEST(create_cstring);
    CPPUNIT_TEST(create_vec_char);
    CPPUNIT_TEST(copy);
    CPPUNIT_TEST(destruct_FormData);
    
    CPPUNIT_TEST(appendData);
    CPPUNIT_TEST(appendFile);

    CPPUNIT_TEST(flatten);
    CPPUNIT_TEST(flattenToString);

    CPPUNIT_TEST(isEmpty);
    CPPUNIT_TEST(elements);

    CPPUNIT_TEST(generateFiles);
    CPPUNIT_TEST(removeGeneratedFilesIfNeeded);

    CPPUNIT_TEST(operator_eq);
    CPPUNIT_TEST(operator_diff);
    CPPUNIT_TEST_SUITE_END();

public:
    void FormDataElement() CPPU_NOT_IMPLEMENTED
    void FormDataElement_args1() CPPU_NOT_IMPLEMENTED
    void FormDataElement_args2() CPPU_NOT_IMPLEMENTED

    void FormDataElement_operator_eq() CPPU_NOT_IMPLEMENTED
    void FormDataElement_operator_diff() CPPU_NOT_IMPLEMENTED
    
    void create() CPPU_NOT_IMPLEMENTED
    void create_size() CPPU_NOT_IMPLEMENTED
    void create_cstring() CPPU_NOT_IMPLEMENTED
    void create_vec_char() CPPU_NOT_IMPLEMENTED
    void copy() CPPU_NOT_IMPLEMENTED
    void destruct_FormData() CPPU_NOT_IMPLEMENTED
    
    void appendData() CPPU_NOT_IMPLEMENTED
    void appendFile() CPPU_NOT_IMPLEMENTED

    void flatten() CPPU_NOT_IMPLEMENTED
    void flattenToString() CPPU_NOT_IMPLEMENTED

    void isEmpty() CPPU_NOT_IMPLEMENTED
    void elements() CPPU_NOT_IMPLEMENTED

    void generateFiles() CPPU_NOT_IMPLEMENTED
    void removeGeneratedFilesIfNeeded() CPPU_NOT_IMPLEMENTED

    void operator_eq() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED
};



#endif

