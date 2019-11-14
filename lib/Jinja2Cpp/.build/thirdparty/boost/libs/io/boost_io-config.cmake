
include(CMakeFindDependencyMacro)
# Library: boost::config
find_dependency(boost_config)

include("${CMAKE_CURRENT_LIST_DIR}/boost_io-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_io-targets.cmake")
