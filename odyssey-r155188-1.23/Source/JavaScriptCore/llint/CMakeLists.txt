if(ENABLE_LLINT)
    # We cannot check for RUBY_FOUND because it is set only when the full package is installed and
    # the only thing we need is the interpreter. Unlike Python, cmake does not provide a macro
    # for finding the only Ruby interpreter.
    if (NOT RUBY_EXECUTABLE)
        message(FATAL_ERROR "The Ruby interpreter is needed to generate LLInt files.")
    endif ()

    set(LLINT_ASM
        llint/LowLevelInterpreter.asm
        llint/LowLevelInterpreter32_64.asm
        llint/LowLevelInterpreter64.asm
    )

    set(OFFLINE_ASM
        offlineasm/arm.rb
        offlineasm/ast.rb
        offlineasm/backends.rb
        offlineasm/cloop.rb
        offlineasm/config.rb
        offlineasm/instructions.rb
        offlineasm/offsets.rb
        offlineasm/opt.rb
        offlineasm/parser.rb
        offlineasm/registers.rb
        offlineasm/risc.rb
        offlineasm/self_hash.rb
        offlineasm/settings.rb
        offlineasm/transform.rb
        offlineasm/x86.rb
    )

    add_custom_command(
        OUTPUT ${JAVASCRIPTCORE_GENERATED_DIR}/LLIntDesiredOffsets.h
        MAIN_DEPENDENCY ${OWB_SOURCE_DIR}/Source/JavaScriptCore/offlineasm/generate_offset_extractor.rb
        DEPENDS ${LLINT_ASM} ${OFFLINE_ASM}
        COMMAND ${RUBY_EXECUTABLE} ${OWB_SOURCE_DIR}/Source/JavaScriptCore/offlineasm/generate_offset_extractor.rb ${OWB_SOURCE_DIR}/Source/JavaScriptCore/llint/LowLevelInterpreter.asm ${JAVASCRIPTCORE_GENERATED_DIR}/LLIntDesiredOffsets.h
        VERBATIM)

    # We add the header file directly to the ADD_EXECUTABLE call instead of setting the
    # OBJECT_DEPENDS property in LLIntOffsetsExtractor.cpp because generate_offset_extractor.rb may
    # not regenerate it in case the hash it calculates does not change.
    # In this case, if some of the dependencies specified in the ADD_CUSTOM_COMMAND above have
    # changed the command will always be called because the mtime of LLIntDesiredOffsets.h will
    # always be older than that of its dependencies.
    # Additionally, setting the OBJECT_DEPENDS property will make LLIntDesiredOffsets.h a Makefile
    # dependency of both LLIntOffsetsExtractor and LLIntOffsetsExtractor.cpp, so the command will
    # actually be run twice!
    add_executable(LLIntOffsetsExtractor
        ${OWB_SOURCE_DIR}/Source/JavaScriptCore/llint/LLIntOffsetsExtractor.cpp
        ${JAVASCRIPTCORE_GENERATED_DIR}/LLIntDesiredOffsets.h
    )
   target_link_libraries(LLIntOffsetsExtractor ${WTF_LIBRARY_NAME})

    # The build system will execute asm.rb every time LLIntOffsetsExtractor's mtime is newer than
    # LLIntAssembly.h's mtime. The problem we have here is: asm.rb has some built-in optimization
    # that generates a checksum of the LLIntOffsetsExtractor binary, if the checksum of the new
    # LLIntOffsetsExtractor matches, no output is generated. To make this target consistent and avoid
    # running this command for every build, we artificially update LLIntAssembly.h's mtime (using touch)
    # after every asm.rb run.
    add_custom_command(
        OUTPUT ${JAVASCRIPTCORE_GENERATED_DIR}/LLIntAssembly.h
        MAIN_DEPENDENCY ${OWB_SOURCE_DIR}/Source/JavaScriptCore/offlineasm/asm.rb
        DEPENDS LLIntOffsetsExtractor ${LLINT_ASM} ${OFFLINE_ASM}
        COMMAND ${RUBY_EXECUTABLE} ${OWB_SOURCE_DIR}/Source/JavaScriptCore/offlineasm/asm.rb ${OWB_SOURCE_DIR}/Source/JavaScriptCore/llint/LowLevelInterpreter.asm $<TARGET_FILE:LLIntOffsetsExtractor> ${JAVASCRIPTCORE_GENERATED_DIR}/LLIntAssembly.h
        COMMAND ${CMAKE_COMMAND} -E touch_nocreate ${JAVASCRIPTCORE_GENERATED_DIR}/LLIntAssembly.h
        VERBATIM)

    # The explanation for not making LLIntAssembly.h part of the OBJECT_DEPENDS property of some of
    # the .cpp files below is similar to the one in the previous comment. However, since these .cpp
    # files are used to build JavaScriptCore itself, we can just add LLIntAssembly.h to JSC_HEADERS
    # since it is used in the add_library() call at the end of this file.
    list(APPEND JSC_SRC
        ${JAVASCRIPTCORE_GENERATED_DIR}/LLIntAssembly.h
    )          


list(APPEND JSC_SRC
        llint/LLIntCLoop.cpp
        llint/LLIntData.cpp
        llint/LLIntEntrypoint.cpp
        llint/LLIntExceptions.cpp
        llint/LLIntSlowPaths.cpp
        llint/LLIntThunks.cpp
        llint/LowLevelInterpreter.cpp   
)
endif(ENABLE_LLINT)
