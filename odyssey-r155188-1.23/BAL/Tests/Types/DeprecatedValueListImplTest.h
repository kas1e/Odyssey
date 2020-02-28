#ifndef DeprecatedValueListImplTest_h_CPPUNIT
#define DeprecatedValueListImplTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCDeprecatedValueListImpl.h"
class DeprecatedValueListImplTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( DeprecatedValueListImplTestTest );
//register each method:
    CPPUNIT_TEST(constructorsItr);
    CPPUNIT_TEST(destructorsItr);
    CPPUNIT_TEST(operator_equal);
    CPPUNIT_TEST(operator_diff);

    CPPUNIT_TEST(node);
    CPPUNIT_TEST(nodeC);

    CPPUNIT_TEST(operator_preInc);
    CPPUNIT_TEST(operator_postInc);
    CPPUNIT_TEST(operator_dec);

//class DeprecatedValueListImpl 
    CPPUNIT_TEST(constructors);
    CPPUNIT_TEST(destructors);
    CPPUNIT_TEST(operator_copy);
        
    CPPUNIT_TEST(clear);
    CPPUNIT_TEST(count);
    CPPUNIT_TEST(isEmpty);

    CPPUNIT_TEST(appendNode);
    CPPUNIT_TEST(prependNode);
    CPPUNIT_TEST(removeEqualNodes);
    CPPUNIT_TEST(containsEqualNodes);
    
    CPPUNIT_TEST(findEqualNode);

    CPPUNIT_TEST(insert);
    CPPUNIT_TEST(removeIterator);
    CPPUNIT_TEST(fromLast);

    CPPUNIT_TEST(firstNode);
    CPPUNIT_TEST(lastNode);

    CPPUNIT_TEST(firstNodeC);
    CPPUNIT_TEST(lastNodeC);

    CPPUNIT_TEST(begin);
    CPPUNIT_TEST(end);

    CPPUNIT_TEST(beginC);
    CPPUNIT_TEST(endC);
    CPPUNIT_TEST(fromLastC);
    
    CPPUNIT_TEST(nodeAt);
    CPPUNIT_TEST(nodeAtC);
    
    CPPUNIT_TEST(isEqual);
 
    CPPUNIT_TEST_SUITE_END();


//class DeprecatedValueListImplIterator
public: 
    void constructorsItr() CPPU_NOT_IMPLEMENTED
    void destructorsItr() CPPU_NOT_IMPLEMENTED 
    void operator_equal() CPPU_NOT_IMPLEMENTED
    void operator_diff() CPPU_NOT_IMPLEMENTED

    void node() CPPU_NOT_IMPLEMENTED
    void nodeC() CPPU_NOT_IMPLEMENTED

    void operator_preInc() CPPU_NOT_IMPLEMENTED
    void operator_postInc() CPPU_NOT_IMPLEMENTED
    void operator_dec() CPPU_NOT_IMPLEMENTED

//class DeprecatedValueListImpl 
    void constructors() CPPU_NOT_IMPLEMENTED
    void destructors() CPPU_NOT_IMPLEMENTED
    void operator_copy() CPPU_NOT_IMPLEMENTED
        
    void clear() CPPU_NOT_IMPLEMENTED
    void count() CPPU_NOT_IMPLEMENTED
    void isEmpty() CPPU_NOT_IMPLEMENTED

    void appendNode() CPPU_NOT_IMPLEMENTED
    void prependNode() CPPU_NOT_IMPLEMENTED
    void removeEqualNodes() CPPU_NOT_IMPLEMENTED
    void containsEqualNodes() CPPU_NOT_IMPLEMENTED
    
    void findEqualNode() CPPU_NOT_IMPLEMENTED

    void insert() CPPU_NOT_IMPLEMENTED
    void removeIterator() CPPU_NOT_IMPLEMENTED
    void fromLast() CPPU_NOT_IMPLEMENTED

    void firstNode() CPPU_NOT_IMPLEMENTED
    void lastNode() CPPU_NOT_IMPLEMENTED

    void firstNodeC() CPPU_NOT_IMPLEMENTED
    void lastNodeC() CPPU_NOT_IMPLEMENTED

    void begin() CPPU_NOT_IMPLEMENTED
    void end() CPPU_NOT_IMPLEMENTED

    void beginC() CPPU_NOT_IMPLEMENTED
    void endC() CPPU_NOT_IMPLEMENTED
    void fromLastC() CPPU_NOT_IMPLEMENTED
    
    void nodeAt() CPPU_NOT_IMPLEMENTED
    void nodeAtC() CPPU_NOT_IMPLEMENTED
    
    void isEqual() CPPU_NOT_IMPLEMENTED
    
//class DeprecatedValueListImplNode
//nothing...

};

#endif

