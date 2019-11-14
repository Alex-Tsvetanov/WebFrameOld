# CMake generated Testfile for 
# Source directory: D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp
# Build directory: D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/.build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(jinja2cpp_tests "D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/.build/jinja2cpp_tests.exe")
set_tests_properties(jinja2cpp_tests PROPERTIES  _BACKTRACE_TRIPLES "D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/CMakeLists.txt;220;add_test;D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/CMakeLists.txt;0;")
subdirs("thirdparty/nonstd/expected-lite")
subdirs("thirdparty/nonstd/variant-lite")
subdirs("thirdparty/nonstd/optional-lite")
subdirs("thirdparty/nonstd/string-view-lite")
subdirs("thirdparty/fmtlib")
subdirs("thirdparty/json/rapid")
subdirs("thirdparty/json/nlohmann")
subdirs("thirdparty/boost")
subdirs("thirdparty/gtest")
