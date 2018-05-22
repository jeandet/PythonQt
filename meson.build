project('pythonqt','cpp')

qt_dir=run_command('qmake-qt5', ['-query', 'QT_INSTALL_HEADERS']).stdout().split()[0]
core_version=run_command('qmake-qt5', ['-query', 'QT_VERSION']).stdout().split()[0]

qt5 = import('qt5')
qt5_dep = dependency('qt5', modules: ['Core', 'Gui', 'Script', 'Widgets',
	'WebKit', 'Qml', 'Quick', 'QuickWidgets', 'UiTools',
	'Xml', 'XmlPatterns', 'Sql', 'Svg',
	'WebKitWidgets', 'Network', 'MultimediaWidgets', 'OpenGL', 'PrintSupport'])
python  = dependency('python3')

inc = include_directories(
	'src',
	qt_dir+'/QtCore/'+core_version+'/QtCore',
	qt_dir+'/QtCore/'+core_version,
	'generated_cpp_58/com_trolltech_qt_core_builtin',
	'generated_cpp_58/com_trolltech_qt_gui_builtin'
)

incs = [
'src/PythonQtSystem.h',
 'src/gui/PythonQtScriptingConsole.h',
 'src/PythonQtSlot.h',
 'src/PythonQtStdOut.h',
 'src/PythonQtClassWrapper.h',
 'src/PythonQtQFileImporter.h',
 'src/PythonQtImporter.h',
 'src/PythonQtSignalReceiver.h',
 'src/PythonQtConversion.h',
 'src/PythonQtStdDecorators.h',
 'src/PythonQt.h',
 'src/PythonQtObjectPtr.h',
 'src/PythonQtStdIn.h',
 'src/PythonQtUtils.h',
 'src/PythonQtMisc.h',
 'src/PythonQtMethodInfo.h',
 'src/PythonQtImportFileInterface.h',
 'src/PythonQtSignal.h',
 'src/PythonQtCppWrapperFactory.h',
 'src/PythonQtVariants.h',
 'src/PythonQtInstanceWrapper.h',
 'src/PythonQtDoc.h',
 'src/PythonQtClassInfo.h',
 'src/PythonQtBoolResult.h',
 'src/PythonQtPythonInclude.h',
 'generated_cpp_58/com_trolltech_qt_core_builtin/com_trolltech_qt_core_builtin0.h',
 'generated_cpp_58/com_trolltech_qt_gui_builtin/com_trolltech_qt_gui_builtin0.h'
 ]

moc_files = qt5.preprocess(moc_headers : incs,
                           include_directories: inc)

srcs = [
'src/PythonQtStdIn.cpp',
 'src/gui/PythonQtScriptingConsole.cpp',
 'src/PythonQtImporter.cpp',
 'src/PythonQtMisc.cpp',
 'src/PythonQtBoolResult.cpp',
 'src/PythonQtSignal.cpp',
 'src/PythonQtConversion.cpp',
 'src/PythonQtSlot.cpp',
 'src/PythonQtObjectPtr.cpp',
 'src/PythonQtMethodInfo.cpp',
 'src/PythonQtStdOut.cpp',
 'src/PythonQtClassInfo.cpp',
 'src/PythonQtClassWrapper.cpp',
 'src/PythonQtInstanceWrapper.cpp',
 'src/PythonQtQFileImporter.cpp',
 'src/PythonQtStdDecorators.cpp',
 'src/PythonQt.cpp',
 'src/PythonQtSignalReceiver.cpp',
 'generated_cpp_58/com_trolltech_qt_gui_builtin/com_trolltech_qt_gui_builtin0.cpp',
 'generated_cpp_58/com_trolltech_qt_gui_builtin/com_trolltech_qt_gui_builtin_init.cpp',
 'generated_cpp_58/com_trolltech_qt_core_builtin/com_trolltech_qt_core_builtin_init.cpp',
 'generated_cpp_58/com_trolltech_qt_core_builtin/com_trolltech_qt_core_builtin0.cpp',
]

pyqt = library('pythonqt',[srcs, moc_files],
	include_directories:  inc, dependencies : [qt5_dep, python])

pythonqt_dep = declare_dependency(link_with:pyqt, dependencies:[python], include_directories:  inc)

lib_all_srcs = [
 'extensions/PythonQt_QtAll/PythonQt_QtAll.cpp',
 'generated_cpp_58/com_trolltech_qt_svg/com_trolltech_qt_svg_init.cpp',
 'generated_cpp_58/com_trolltech_qt_svg/com_trolltech_qt_svg0.cpp',
 'generated_cpp_58/PythonQt_QtBindings.cpp',
 'generated_cpp_58/com_trolltech_qt_opengl/com_trolltech_qt_opengl0.cpp',
 'generated_cpp_58/com_trolltech_qt_opengl/com_trolltech_qt_opengl_init.cpp',
 'generated_cpp_58/com_trolltech_qt_xmlpatterns/com_trolltech_qt_xmlpatterns_init.cpp',
 'generated_cpp_58/com_trolltech_qt_xmlpatterns/com_trolltech_qt_xmlpatterns0.cpp',
 'generated_cpp_58/com_trolltech_qt_network/com_trolltech_qt_network0.cpp',
 'generated_cpp_58/com_trolltech_qt_network/com_trolltech_qt_network_init.cpp',
 'generated_cpp_58/com_trolltech_qt_network/com_trolltech_qt_network1.cpp',
 'generated_cpp_58/com_trolltech_qt_webkit/com_trolltech_qt_webkit_init.cpp',
 'generated_cpp_58/com_trolltech_qt_webkit/com_trolltech_qt_webkit0.cpp',
 'generated_cpp_58/com_trolltech_qt_xml/com_trolltech_qt_xml1.cpp',
 'generated_cpp_58/com_trolltech_qt_xml/com_trolltech_qt_xml_init.cpp',
 'generated_cpp_58/com_trolltech_qt_xml/com_trolltech_qt_xml0.cpp',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui11.cpp',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui9.cpp',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui0.cpp',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui4.cpp',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui8.cpp',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui_init.cpp',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui5.cpp',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui1.cpp',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui12.cpp',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui7.cpp',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui3.cpp',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui10.cpp',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui2.cpp',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui6.cpp',
 'generated_cpp_58/com_trolltech_qt_uitools/com_trolltech_qt_uitools_init.cpp',
 'generated_cpp_58/com_trolltech_qt_uitools/com_trolltech_qt_uitools0.cpp',
 'generated_cpp_58/com_trolltech_qt_core/com_trolltech_qt_core1.cpp',
 'generated_cpp_58/com_trolltech_qt_core/com_trolltech_qt_core3.cpp',
 'generated_cpp_58/com_trolltech_qt_core/com_trolltech_qt_core_init.cpp',
 'generated_cpp_58/com_trolltech_qt_core/com_trolltech_qt_core2.cpp',
 'generated_cpp_58/com_trolltech_qt_core/com_trolltech_qt_core0.cpp',
 'generated_cpp_58/com_trolltech_qt_multimedia/com_trolltech_qt_multimedia0.cpp',
 'generated_cpp_58/com_trolltech_qt_multimedia/com_trolltech_qt_multimedia_init.cpp',
 'generated_cpp_58/com_trolltech_qt_multimedia/com_trolltech_qt_multimedia1.cpp',
 'generated_cpp_58/com_trolltech_qt_sql/com_trolltech_qt_sql_init.cpp',
 'generated_cpp_58/com_trolltech_qt_sql/com_trolltech_qt_sql0.cpp'
]

lib_all_inc_d = include_directories(
 'generated_cpp_58',
 'generated_cpp_58/com_trolltech_qt_svg',
 'generated_cpp_58/com_trolltech_qt_opengl',
 'generated_cpp_58/com_trolltech_qt_xmlpatterns',
 'generated_cpp_58/com_trolltech_qt_network',
 'generated_cpp_58/com_trolltech_qt_webkit',
 'generated_cpp_58/com_trolltech_qt_gui_builtin',
 'generated_cpp_58/com_trolltech_qt_xml',
 'generated_cpp_58/com_trolltech_qt_gui',
 'generated_cpp_58/com_trolltech_qt_core_builtin',
 'generated_cpp_58/com_trolltech_qt_uitools',
 'generated_cpp_58/com_trolltech_qt_core',
 'generated_cpp_58/com_trolltech_qt_multimedia',
 'generated_cpp_58/com_trolltech_qt_sql'
)

lib_all_incs = [
 'extensions/PythonQt_QtAll/PythonQt_QtAll.h',
 'generated_cpp_58/com_trolltech_qt_svg/com_trolltech_qt_svg0.h',
 'generated_cpp_58/com_trolltech_qt_opengl/com_trolltech_qt_opengl0.h',
 'generated_cpp_58/com_trolltech_qt_xmlpatterns/com_trolltech_qt_xmlpatterns0.h',
 'generated_cpp_58/com_trolltech_qt_network/com_trolltech_qt_network0.h',
 'generated_cpp_58/com_trolltech_qt_network/com_trolltech_qt_network1.h',
 'generated_cpp_58/com_trolltech_qt_webkit/com_trolltech_qt_webkit0.h',
 'generated_cpp_58/com_trolltech_qt_gui_builtin/com_trolltech_qt_gui_builtin0.h',
 'generated_cpp_58/PythonQt_QtBindings.h',
 'generated_cpp_58/com_trolltech_qt_xml/com_trolltech_qt_xml1.h',
 'generated_cpp_58/com_trolltech_qt_xml/com_trolltech_qt_xml0.h',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui1.h',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui7.h',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui0.h',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui12.h',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui4.h',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui2.h',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui5.h',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui10.h',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui3.h',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui6.h',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui11.h',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui9.h',
 'generated_cpp_58/com_trolltech_qt_gui/com_trolltech_qt_gui8.h',
 'generated_cpp_58/com_trolltech_qt_core_builtin/com_trolltech_qt_core_builtin0.h',
 'generated_cpp_58/com_trolltech_qt_uitools/com_trolltech_qt_uitools0.h',
 'generated_cpp_58/com_trolltech_qt_core/com_trolltech_qt_core1.h',
 'generated_cpp_58/com_trolltech_qt_core/com_trolltech_qt_core3.h',
 'generated_cpp_58/com_trolltech_qt_core/com_trolltech_qt_core2.h',
 'generated_cpp_58/com_trolltech_qt_core/com_trolltech_qt_core0.h',
 'generated_cpp_58/com_trolltech_qt_multimedia/com_trolltech_qt_multimedia1.h',
 'generated_cpp_58/com_trolltech_qt_multimedia/com_trolltech_qt_multimedia0.h',
 'generated_cpp_58/com_trolltech_qt_sql/com_trolltech_qt_sql0.h'
]

lib_all_moc_files = qt5.preprocess(moc_headers : lib_all_incs,
                           include_directories: [inc, lib_all_inc_d])

pythonqt_all = library('pythonqt_all',[lib_all_srcs, lib_all_moc_files], dependencies : [qt5_dep, pythonqt_dep])

pythonqt_all_dep = declare_dependency(link_with:pythonqt_all, dependencies:[pythonqt_dep])

subdir('generator')