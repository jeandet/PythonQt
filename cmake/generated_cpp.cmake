include(ExternalProject)

function (build_external_project target src bin) #FOLLOWING ARGUMENTS are the CMAKE_ARGS of ExternalProject_Add

    set(trigger_build_dir ${CMAKE_BINARY_DIR}/force_${target})

    #mktemp dir in build tree
    file(MAKE_DIRECTORY ${trigger_build_dir} ${trigger_build_dir}/build)

    #generate false dependency project
    set(CMAKE_LIST_CONTENT "
    cmake_minimum_required(VERSION 2.8)

    include(ExternalProject)
    ExternalProject_add(${target}
            CMAKE_ARGS ${ARGN}
            SOURCE_DIR ${src}
            BINARY_DIR ${bin}
            INSTALL_COMMAND \"\"
            )

            add_custom_target(trigger_${target})
            add_dependencies(trigger_${target} ${target})")

    file(WRITE ${trigger_build_dir}/CMakeLists.txt "${CMAKE_LIST_CONTENT}")

    execute_process(COMMAND ${CMAKE_COMMAND} ..
        WORKING_DIRECTORY ${trigger_build_dir}/build
        )
    execute_process(COMMAND ${CMAKE_COMMAND} --build .
        WORKING_DIRECTORY ${trigger_build_dir}/build
        )

    get_target_property(QT_QMAKE_EXECUTABLE Qt5::qmake IMPORTED_LOCATION)
    execute_process(COMMAND ${QT_QMAKE_EXECUTABLE} -query QT_INSTALL_HEADERS
        OUTPUT_VARIABLE QT_INSTALL_HEADERS)

    message("generating Qt wrapper from ${QT_INSTALL_HEADERS}")
    execute_process(COMMAND ${bin}/PythonQtGenerator --include-paths=${QT_INSTALL_HEADERS} --output-directory=${CMAKE_BINARY_DIR}/
          WORKING_DIRECTORY ${bin}
        )

    file(GLOB generated_qt_core_builtin_sources_glob
        ${CMAKE_BINARY_DIR}/generated_cpp/com_trolltech_qt_gui_builtin/*.h
        ${CMAKE_BINARY_DIR}/generated_cpp/com_trolltech_qt_gui_builtin/*.cpp
        ${CMAKE_BINARY_DIR}/generated_cpp/com_trolltech_qt_core_builtin/*.cpp
        ${CMAKE_BINARY_DIR}/generated_cpp/com_trolltech_qt_core_builtin/*.h
    )
    set(generated_qt_core_builtin_sources ${generated_qt_core_builtin_sources_glob} PARENT_SCOPE)
endfunction()


