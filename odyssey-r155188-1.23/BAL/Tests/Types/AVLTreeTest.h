#ifndef AVLTreeTest_h_CPPUNIT
#define AVLTreeTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCAVLTree.h"
class AVLTreeDefaultBSetTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( AVLTreeDefaultBSetTestTest );
    CPPUNIT_TEST(operator__);
    CPPUNIT_TEST(set);
    CPPUNIT_TEST(reset);

    CPPUNIT_TEST_SUITE_END();

    void operator__() CPPU_NOT_IMPLEMENTED
    void set() CPPU_NOT_IMPLEMENTED
    void reset() CPPU_NOT_IMPLEMENTED

};

class  AVLTreeTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( AVLTreeTestTest );
    CPPUNIT_TEST(abstractor);

    CPPUNIT_TEST(insert);

    CPPUNIT_TEST(search);
    CPPUNIT_TEST(search_least);
    CPPUNIT_TEST(search_greatest);

    CPPUNIT_TEST(remove);

    CPPUNIT_TEST(subst);

    CPPUNIT_TEST(purge);

    CPPUNIT_TEST(is_empty);

    CPPUNIT_TEST(AVLTree);
    CPPUNIT_TEST(build);

    CPPUNIT_TEST(Iterator);

    CPPUNIT_TEST(start_iter);
    CPPUNIT_TEST(start_iter_least);
    CPPUNIT_TEST(start_iter_greatest);
    CPPUNIT_TEST(operator_star);
    CPPUNIT_TEST(operator_inc);
    CPPUNIT_TEST(operator_dec);
    CPPUNIT_TEST(operator_incInt);
    CPPUNIT_TEST(operator_decInt);

            CPPUNIT_TEST_SUITE_END();
public:
    void abstractor() CPPU_NOT_IMPLEMENTED

    void insert() CPPU_NOT_IMPLEMENTED

    void search() CPPU_NOT_IMPLEMENTED
    void search_least() CPPU_NOT_IMPLEMENTED
    void search_greatest() CPPU_NOT_IMPLEMENTED

    void remove() CPPU_NOT_IMPLEMENTED

    void subst() CPPU_NOT_IMPLEMENTED

    void purge() CPPU_NOT_IMPLEMENTED

    void is_empty() CPPU_NOT_IMPLEMENTED

    void AVLTree() CPPU_NOT_IMPLEMENTED
    void build() CPPU_NOT_IMPLEMENTED

    void Iterator() CPPU_NOT_IMPLEMENTED

    void start_iter() CPPU_NOT_IMPLEMENTED
    void start_iter_least() CPPU_NOT_IMPLEMENTED
    void start_iter_greatest() CPPU_NOT_IMPLEMENTED
    void operator_star() CPPU_NOT_IMPLEMENTED
    void operator_inc() CPPU_NOT_IMPLEMENTED
    void operator_dec() CPPU_NOT_IMPLEMENTED
    void operator_incInt() CPPU_NOT_IMPLEMENTED
    void operator_decInt() CPPU_NOT_IMPLEMENTED

};
#endif

