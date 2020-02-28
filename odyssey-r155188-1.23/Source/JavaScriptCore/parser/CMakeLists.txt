create_lexer(JSC_SRC Source/JavaScriptCore/parser/Keywords.table  generated_sources/JavaScriptCore/Lexer.lut.h Source/JavaScriptCore/parser/Lexer.cpp)

list(APPEND JSC_SRC
    parser/Lexer.cpp
    parser/Nodes.cpp
    parser/Parser.cpp
    parser/ParserArena.cpp
    parser/SourceCode.cpp   
    parser/SourceProvider.cpp
    parser/SourceProviderCache.cpp
)
