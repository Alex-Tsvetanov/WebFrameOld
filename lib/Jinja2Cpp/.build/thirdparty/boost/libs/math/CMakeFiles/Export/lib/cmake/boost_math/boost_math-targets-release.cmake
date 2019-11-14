#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "boost::math_c99" for configuration "Release"
set_property(TARGET boost::math_c99 APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(boost::math_c99 PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libboost_math_c99.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS boost::math_c99 )
list(APPEND _IMPORT_CHECK_FILES_FOR_boost::math_c99 "${_IMPORT_PREFIX}/lib/libboost_math_c99.a" )

# Import target "boost::math_c99f" for configuration "Release"
set_property(TARGET boost::math_c99f APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(boost::math_c99f PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libboost_math_c99f.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS boost::math_c99f )
list(APPEND _IMPORT_CHECK_FILES_FOR_boost::math_c99f "${_IMPORT_PREFIX}/lib/libboost_math_c99f.a" )

# Import target "boost::math_c99l" for configuration "Release"
set_property(TARGET boost::math_c99l APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(boost::math_c99l PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libboost_math_c99l.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS boost::math_c99l )
list(APPEND _IMPORT_CHECK_FILES_FOR_boost::math_c99l "${_IMPORT_PREFIX}/lib/libboost_math_c99l.a" )

# Import target "boost::math_tr1" for configuration "Release"
set_property(TARGET boost::math_tr1 APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(boost::math_tr1 PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libboost_math_tr1.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS boost::math_tr1 )
list(APPEND _IMPORT_CHECK_FILES_FOR_boost::math_tr1 "${_IMPORT_PREFIX}/lib/libboost_math_tr1.a" )

# Import target "boost::math_tr1f" for configuration "Release"
set_property(TARGET boost::math_tr1f APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(boost::math_tr1f PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libboost_math_tr1f.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS boost::math_tr1f )
list(APPEND _IMPORT_CHECK_FILES_FOR_boost::math_tr1f "${_IMPORT_PREFIX}/lib/libboost_math_tr1f.a" )

# Import target "boost::math_tr1l" for configuration "Release"
set_property(TARGET boost::math_tr1l APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(boost::math_tr1l PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libboost_math_tr1l.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS boost::math_tr1l )
list(APPEND _IMPORT_CHECK_FILES_FOR_boost::math_tr1l "${_IMPORT_PREFIX}/lib/libboost_math_tr1l.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
