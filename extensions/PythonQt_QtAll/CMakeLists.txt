cmake_minimum_required (VERSION 2.6)
project (PythonQt_QtAll)

set(CMAKE_INCLUDE_CURRENT_DIR ON)


set(SOURCES
      PythonQt_QtAll.cpp
      PythonQt_QtAll.h

      ${generated_qt_core_sources}
      ${generated_qt_gui_sources}
      ${generated_qt_multimedia_sources}
      ${generated_qt_network_sources}
      ${generated_qt_opengl_sources}
      ${generated_qt_sql_sources}
      ${generated_qt_svg_sources}
      ${generated_qt_uitools_sources}
      ${generated_qt_webkit_sources}
      ${generated_qt_xml_sources}
      ${generated_qt_xmlpatterns_sources}
    )



find_package(PythonInterp 3 REQUIRED)
find_package(PythonLibs 3 REQUIRED)

include_directories(${PYTHON_INCLUDE_DIRS})

add_library(${PROJECT_NAME} SHARED ${SOURCES})
target_link_libraries(${PROJECT_NAME} Qt5::Widgets Qt5::Multimedia Qt5::OpenGL Qt5::Sql Qt5::Svg Qt5::UiTools Qt5::WebKit Qt5::Xml Qt5::XmlPatterns ${PYTHON_LIBRARIES} PythonQt ${PYTHON_LIBRARIES})
