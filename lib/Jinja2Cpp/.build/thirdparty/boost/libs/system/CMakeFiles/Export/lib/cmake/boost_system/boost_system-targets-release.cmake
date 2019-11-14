#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "boost::system" for configuration "Release"
set_property(TARGET boost::system APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(boost::system PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libboost_system.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS boost::system )
list(APPEND _IMPORT_CHECK_FILES_FOR_boost::system "${_IMPORT_PREFIX}/lib/libboost_system.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
