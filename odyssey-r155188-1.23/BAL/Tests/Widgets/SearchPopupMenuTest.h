#ifndef SearchPopupMenuTest_h_CPPUNIT
#define SearchPopupMenuTest_h_CPPUNIT

#include <cppunit/extensions/HelperMacros.h>
#include "BCSearchPopupMenu.h"
class SearchPopupMenuTestTest : public CppUnit::TestFixture
{
    CPPUNIT_TEST_SUITE( SearchPopupMenuTestTest );
//register each method:
    CPPUNIT_TEST(create);

    CPPUNIT_TEST(saveRecentSearches);
    CPPUNIT_TEST(loadRecentSearches);

    CPPUNIT_TEST(enabled);
    
    CPPUNIT_TEST_SUITE_END();


public:
    void create() CPPU_NOT_IMPLEMENTED

    void saveRecentSearches() CPPU_NOT_IMPLEMENTED
    void loadRecentSearches() CPPU_NOT_IMPLEMENTED

    void enabled() CPPU_NOT_IMPLEMENTED
    

};

#endif

