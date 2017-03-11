cmake_minimum_required (VERSION 2.6)
project (PythonQt)

set(CMAKE_INCLUDE_CURRENT_DIR ON)


set(SOURCES
      PythonQt.h
      PythonQtStdDecorators.h
      PythonQtClassInfo.h
      PythonQtImporter.h
      PythonQtObjectPtr.h
      PythonQtSignal.h
      PythonQtSlot.h
      PythonQtStdIn.h
      PythonQtStdOut.h
      PythonQtMisc.h
      PythonQtMethodInfo.h
      PythonQtImportFileInterface.h
      PythonQtConversion.h
      PythonQtSignalReceiver.h
      PythonQtInstanceWrapper.h
      PythonQtClassWrapper.h
      PythonQtCppWrapperFactory.h
      PythonQtQFileImporter.h
      PythonQtQFileImporter.h
      PythonQtVariants.h
      gui/PythonQtScriptingConsole.h
      PythonQtSystem.h
      PythonQtUtils.h
      PythonQtBoolResult.h

      PythonQtStdDecorators.cpp
      PythonQt.cpp
      PythonQtClassInfo.cpp
      PythonQtImporter.cpp
      PythonQtObjectPtr.cpp
      PythonQtStdIn.cpp
      PythonQtStdOut.cpp
      PythonQtSignal.cpp
      PythonQtSlot.cpp
      PythonQtMisc.cpp
      PythonQtMethodInfo.cpp
      PythonQtConversion.cpp
      PythonQtSignalReceiver.cpp
      PythonQtInstanceWrapper.cpp
      PythonQtQFileImporter.cpp
      PythonQtClassWrapper.cpp
      PythonQtBoolResult.cpp
      gui/PythonQtScriptingConsole.cpp

      ${generated_qt_core_builtin_sources}
    )

find_package(PythonInterp 3 REQUIRED)
find_package(PythonLibs 3 REQUIRED)

include_directories(${PYTHON_INCLUDE_DIRS})


add_library(${PROJECT_NAME} SHARED ${SOURCES})
set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)
target_link_libraries(${PROJECT_NAME} Qt5::Widgets ${PYTHON_LIBRARIES})


foreach(module Core Gui PrintSupport)
        set(qt_module Qt${module})
        set(qt5_module Qt5${module})
        find_package(${qt5_module})
        if("${${qt5_module}_PRIVATE_INCLUDE_DIRS}" STREQUAL "")
                foreach(base_dir ${${qt5_module}_INCLUDE_DIRS})
                        if("${base_dir}" MATCHES "/${qt_module}\$")
                                list(APPEND ${qt5_module}_PRIVATE_INCLUDE_DIRS "${base_dir}/${${qt5_module}_VERSION}/${qt_module}")
                        endif()
                endforeach()
        endif()
        target_include_directories(${PROJECT_NAME} PRIVATE ${${qt5_module}_PRIVATE_INCLUDE_DIRS})
endforeach()

