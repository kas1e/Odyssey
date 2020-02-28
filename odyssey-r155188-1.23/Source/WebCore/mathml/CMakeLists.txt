if(ENABLE_MATHML)
    list(APPEND WEBCORE_SRC
        mathml/MathMLElement.cpp
        mathml/MathMLInlineContainerElement.cpp
        mathml/MathMLMathElement.cpp
        mathml/MathMLTextElement.cpp
    )
    list(APPEND IDL_SRC
    )
endif(ENABLE_MATHML)
