
include(CMakeFindDependencyMacro)
# Library: boost::assert
find_dependency(boost_assert)
# Library: boost::type_traits
find_dependency(boost_type_traits)
# Library: boost::config
find_dependency(boost_config)

include("${CMAKE_CURRENT_LIST_DIR}/boost_atomic-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_atomic-targets.cmake")
