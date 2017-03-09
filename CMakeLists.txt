cmake_minimum_required(VERSION 2.8.8)


project(PythonQt)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Release" CACHE STRING
      "Choose the type of build, options are: Debug Release RelWithDebInfo MinSizeRel." FORCE)
endif(NOT CMAKE_BUILD_TYPE)

find_package(Qt5 COMPONENTS Core Widgets Xml Test REQUIRED)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

execute_process(COMMAND ${QT_QMAKE_EXECUTABLE} -query QT_INSTALL_HEADERS OUTPUT_VARIABLE QT_INSTALL_HEADERS)

add_subdirectory(generator)

add_subdirectory(src)

get_target_property(QT_QMAKE_EXECUTABLE Qt5::qmake IMPORTED_LOCATION)
message(${QT_QMAKE_EXECUTABLE})
message(${QT_INSTALL_HEADERS})
