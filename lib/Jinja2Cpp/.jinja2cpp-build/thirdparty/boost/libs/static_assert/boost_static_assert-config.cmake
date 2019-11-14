
include(CMakeFindDependencyMacro)
# Library: boost::config
find_dependency(boost_config)

include("${CMAKE_CURRENT_LIST_DIR}/boost_static_assert-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_static_assert-targets.cmake")
