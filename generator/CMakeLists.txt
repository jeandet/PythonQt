cmake_minimum_required(VERSION 2.8)

#-----------------------------------------------------------------------------
project(PythonQtGenerator)
#-----------------------------------------------------------------------------

set(sources
    generatorsetqtscript.h
    metaqtscriptbuilder.h
    metaqtscript.h
    shellgenerator.h
    shellimplgenerator.h
    shellheadergenerator.h
    setupgenerator.h

    generatorsetqtscript.cpp
    metaqtscriptbuilder.cpp
    metaqtscript.cpp
    shellgenerator.cpp
    shellimplgenerator.cpp
    shellheadergenerator.cpp
    setupgenerator.cpp

    generator.h
    main.h
    reporthandler.h
    typeparser.h
    typesystem.h
    asttoxml.h
    fileout.h
    generatorset.h
    metajava.h
    customtypes.h
    abstractmetabuilder.h
    abstractmetalang.h
    prigenerator.h

    generator.cpp
    main.cpp
    reporthandler.cpp
    typeparser.cpp
    typesystem.cpp
    asttoxml.cpp
    fileout.cpp
    generatorset.cpp
    metajava.cpp
    customtypes.cpp
    abstractmetabuilder.cpp
    abstractmetalang.cpp
    prigenerator.cpp

    parser/ast.h
    parser/lexer.h
    parser/list.h
    parser/parser.h
    parser/rxx_allocator.h
    parser/rpp-allocator.h
    parser/smallobject.h
    parser/tokens.h
    parser/symbol.h
    parser/control.h
    parser/visitor.h
    parser/default_visitor.h
    parser/dumptree.h
    parser/binder.h
    parser/codemodel.h
    parser/codemodel_pointer.h
    parser/codemodel_fwd.h
    parser/type_compiler.h
    parser/name_compiler.h
    parser/declarator_compiler.h
    parser/class_compiler.h
    parser/codemodel_finder.h
    parser/compiler_utils.h
    parser/ast.cpp
    parser/lexer.cpp
    parser/list.cpp
    parser/parser.cpp
    parser/smallobject.cpp
    parser/control.cpp
    parser/visitor.cpp
    parser/default_visitor.cpp
    parser/dumptree.cpp
    parser/tokens.cpp
    parser/binder.cpp
    parser/codemodel.cpp
    parser/type_compiler.cpp
    parser/name_compiler.cpp
    parser/declarator_compiler.cpp
    parser/class_compiler.cpp
    parser/codemodel_finder.cpp
    parser/compiler_utils.cpp

    parser/rpp/preprocessor.cpp
    parser/rpp/pp-cctype.h
    parser/rpp/pp-engine-bits.h
    parser/rpp/pp-engine.h
    parser/rpp/pp-environment.h
    parser/rpp/pp-fwd.h
    parser/rpp/pp-internal.h
    parser/rpp/pp-iterator.h
    parser/rpp/pp-macro-expander.h
    parser/rpp/pp-macro.h
    parser/rpp/pp-scanner.h
    parser/rpp/pp-string.h
    parser/rpp/pp-symbol.h
    parser/rpp/pp.h
    parser/rpp/preprocessor.h

  generator.qrc
  )

add_definitions(-DRXX_ALLOCATOR_INIT_0)

#-----------------------------------------------------------------------------
# Copy file expected by the generator and specify install rules

file(GLOB files_to_copy RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "build_*.txt" "typesystem_*.xml")
list(APPEND files_to_copy qtscript_masterinclude.h parser/rpp/pp-qt-configuration)
foreach(file ${files_to_copy})
  configure_file(
    ${file}
    ${CMAKE_CURRENT_BINARY_DIR}/${file}
    COPYONLY
    )
  get_filename_component(destination_dir ${file} PATH)
  install(FILES ${file} DESTINATION bin/${destination_dir})
endforeach()


include_directories(
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_CURRENT_SOURCE_DIR}/parser
  ${CMAKE_CURRENT_SOURCE_DIR}/parser/rpp
  )

add_executable(${PROJECT_NAME}
  ${sources}
)

target_link_libraries(${PROJECT_NAME} Qt5::Core Qt5::Xml)


#-----------------------------------------------------------------------------
# Install library (on windows, put the dll in 'bin' and the archive in 'lib')

install(TARGETS ${PROJECT_NAME}
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib)
