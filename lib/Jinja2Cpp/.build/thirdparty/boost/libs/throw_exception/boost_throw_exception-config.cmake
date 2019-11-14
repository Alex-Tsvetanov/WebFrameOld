
include(CMakeFindDependencyMacro)
# Library: boost::assert
find_dependency(boost_assert)
# Library: boost::config
find_dependency(boost_config)

include("${CMAKE_CURRENT_LIST_DIR}/boost_throw_exception-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_throw_exception-targets.cmake")
