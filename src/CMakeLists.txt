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
    )

find_package(PythonInterp 3 REQUIRED)
find_package(PythonLibs 3 REQUIRED)

include_directories(${PYTHON_INCLUDE_DIRS})

add_library(${PROJECT_NAME} SHARED ${SOURCES})
target_link_libraries(${PROJECT_NAME} Qt5::Widgets ${PYTHON_LIBRARIES})

