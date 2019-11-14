
include(CMakeFindDependencyMacro)
# Library: boost::core
find_dependency(boost_core)
# Library: boost::static_assert
find_dependency(boost_static_assert)
# Library: boost::config
find_dependency(boost_config)

include("${CMAKE_CURRENT_LIST_DIR}/boost_type_traits-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_type_traits-targets.cmake")
