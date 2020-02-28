##################################################
# Database support part.                         #
##################################################

if(ENABLE_SQL_DATABASE)
    create_include_link(${BAL_DIR}/Database/WebCore/SQLite BAL)

    aux_source_directory(${BAL_DIR}/Database/WebCore/SQLite WEBCORE_SRC)
endif(ENABLE_SQL_DATABASE)

if(ENABLE_INDEXED_DATABASE)
    create_include_link(${BAL_DIR}/Database/WebCore/LevelDB BAL)

    aux_source_directory(${BAL_DIR}/Database/WebCore/LevelDB WEBCORE_SRC)
endif(ENABLE_INDEXED_DATABASE)
