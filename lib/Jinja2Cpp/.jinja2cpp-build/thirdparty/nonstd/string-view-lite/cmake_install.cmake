# Install script for directory: D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/thirdparty/nonstd/string-view-lite

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/.jinja2cpp-install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/string-view-lite/string-view-lite-targets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/string-view-lite/string-view-lite-targets.cmake"
         "D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/.jinja2cpp-build/thirdparty/nonstd/string-view-lite/CMakeFiles/Export/lib/cmake/string-view-lite/string-view-lite-targets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/string-view-lite/string-view-lite-targets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/string-view-lite/string-view-lite-targets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/string-view-lite" TYPE FILE FILES "D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/.jinja2cpp-build/thirdparty/nonstd/string-view-lite/CMakeFiles/Export/lib/cmake/string-view-lite/string-view-lite-targets.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/string-view-lite" TYPE FILE FILES
    "D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/.jinja2cpp-build/thirdparty/nonstd/string-view-lite/string-view-lite-config.cmake"
    "D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/.jinja2cpp-build/thirdparty/nonstd/string-view-lite/string-view-lite-config-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/thirdparty/nonstd/string-view-lite/include/")
endif()
