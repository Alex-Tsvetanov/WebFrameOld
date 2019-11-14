# Install script for directory: D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/thirdparty/boost/libs/container

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/thirdparty/boost/libs/container/include/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/.jinja2cpp-build/thirdparty/boost/libs/container/libboost_container.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/.jinja2cpp-build/thirdparty/boost/libs/container/boost_container.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/boost_container" TYPE FILE FILES "D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/.jinja2cpp-build/thirdparty/boost/libs/container/properties-boost_container-targets.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/boost_container/boost_container-targets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/boost_container/boost_container-targets.cmake"
         "D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/.jinja2cpp-build/thirdparty/boost/libs/container/CMakeFiles/Export/lib/cmake/boost_container/boost_container-targets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/boost_container/boost_container-targets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/boost_container/boost_container-targets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/boost_container" TYPE FILE FILES "D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/.jinja2cpp-build/thirdparty/boost/libs/container/CMakeFiles/Export/lib/cmake/boost_container/boost_container-targets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/boost_container" TYPE FILE FILES "D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/.jinja2cpp-build/thirdparty/boost/libs/container/CMakeFiles/Export/lib/cmake/boost_container/boost_container-targets-release.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/boost_container" TYPE FILE FILES
    "D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/.jinja2cpp-build/thirdparty/boost/libs/container/boost_container-config.cmake"
    "D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/.jinja2cpp-build/thirdparty/boost/libs/container/boost_container-config-version.cmake"
    )
endif()

