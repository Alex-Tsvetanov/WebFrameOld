#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "boost::filesystem" for configuration "Release"
set_property(TARGET boost::filesystem APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(boost::filesystem PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libboost_filesystem.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS boost::filesystem )
list(APPEND _IMPORT_CHECK_FILES_FOR_boost::filesystem "${_IMPORT_PREFIX}/lib/libboost_filesystem.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
