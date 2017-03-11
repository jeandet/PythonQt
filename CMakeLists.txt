cmake_minimum_required(VERSION 2.8.8)

SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_LIST_DIR}/cmake")
include(generated_cpp)

project(PythonQt)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Release" CACHE STRING
      "Choose the type of build, options are: Debug Release RelWithDebInfo MinSizeRel." FORCE)
endif(NOT CMAKE_BUILD_TYPE)

find_package(Qt5 COMPONENTS Core Widgets Xml Test REQUIRED)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

build_external_project(PythonQt_generator
    ${CMAKE_CURRENT_LIST_DIR}/generator
    ${CMAKE_BINARY_DIR}/generator
    )


add_subdirectory(src)


