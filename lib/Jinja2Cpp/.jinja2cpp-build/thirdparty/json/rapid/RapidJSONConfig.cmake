################################################################################
# RapidJSON source dir
set( RapidJSON_SOURCE_DIR "D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/thirdparty/json/rapid")

################################################################################
# RapidJSON build dir
set( RapidJSON_DIR "D:/Users/atsve/OneDrive/Documents/GitHub/WebFrame/lib/Jinja2Cpp/.jinja2cpp-build/thirdparty/json/rapid")

################################################################################
# Compute paths
get_filename_component(RapidJSON_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)

set( RapidJSON_INCLUDE_DIR  "${RapidJSON_SOURCE_DIR}/include" )
set( RapidJSON_INCLUDE_DIRS  "${RapidJSON_SOURCE_DIR}/include" )
message(STATUS "RapidJSON found. Headers: ${RapidJSON_INCLUDE_DIRS}")
