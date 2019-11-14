#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "jinja2cpp" for configuration "Release"
set_property(TARGET jinja2cpp APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(jinja2cpp PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/static/libjinja2cpp.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS jinja2cpp )
list(APPEND _IMPORT_CHECK_FILES_FOR_jinja2cpp "${_IMPORT_PREFIX}/lib/static/libjinja2cpp.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
