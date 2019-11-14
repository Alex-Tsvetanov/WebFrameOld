
include(CMakeFindDependencyMacro)
# Library: boost::assert
find_dependency(boost_assert)
# Library: boost::core
find_dependency(boost_core)
# Library: boost::config
find_dependency(boost_config)
# Library: boost::predef
find_dependency(boost_predef)

include("${CMAKE_CURRENT_LIST_DIR}/boost_system-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_system-targets.cmake")
