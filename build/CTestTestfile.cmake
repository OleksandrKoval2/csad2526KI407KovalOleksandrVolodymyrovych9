# CMake generated Testfile for 
# Source directory: C:/Users/acer/Desktop/csad2526KI407KovalOleksandrVolodymyrovych9
# Build directory: C:/Users/acer/Desktop/csad2526KI407KovalOleksandrVolodymyrovych9/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
if(CTEST_CONFIGURATION_TYPE MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(unit_tests "C:/Users/acer/Desktop/csad2526KI407KovalOleksandrVolodymyrovych9/build/Debug/unit_tests.exe")
  set_tests_properties(unit_tests PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/acer/Desktop/csad2526KI407KovalOleksandrVolodymyrovych9/CMakeLists.txt;43;add_test;C:/Users/acer/Desktop/csad2526KI407KovalOleksandrVolodymyrovych9/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(unit_tests "C:/Users/acer/Desktop/csad2526KI407KovalOleksandrVolodymyrovych9/build/Release/unit_tests.exe")
  set_tests_properties(unit_tests PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/acer/Desktop/csad2526KI407KovalOleksandrVolodymyrovych9/CMakeLists.txt;43;add_test;C:/Users/acer/Desktop/csad2526KI407KovalOleksandrVolodymyrovych9/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(unit_tests "C:/Users/acer/Desktop/csad2526KI407KovalOleksandrVolodymyrovych9/build/MinSizeRel/unit_tests.exe")
  set_tests_properties(unit_tests PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/acer/Desktop/csad2526KI407KovalOleksandrVolodymyrovych9/CMakeLists.txt;43;add_test;C:/Users/acer/Desktop/csad2526KI407KovalOleksandrVolodymyrovych9/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(unit_tests "C:/Users/acer/Desktop/csad2526KI407KovalOleksandrVolodymyrovych9/build/RelWithDebInfo/unit_tests.exe")
  set_tests_properties(unit_tests PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/acer/Desktop/csad2526KI407KovalOleksandrVolodymyrovych9/CMakeLists.txt;43;add_test;C:/Users/acer/Desktop/csad2526KI407KovalOleksandrVolodymyrovych9/CMakeLists.txt;0;")
else()
  add_test(unit_tests NOT_AVAILABLE)
endif()
subdirs("_deps/googletest-build")
