
include(CMakeFindDependencyMacro)
# Library: boost::static_assert
find_dependency(boost_static_assert)
# Library: boost::config
find_dependency(boost_config)

include("${CMAKE_CURRENT_LIST_DIR}/boost_integer-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_integer-targets.cmake")
