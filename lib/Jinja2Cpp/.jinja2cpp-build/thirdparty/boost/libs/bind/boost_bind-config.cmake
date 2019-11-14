
include(CMakeFindDependencyMacro)
# Library: boost::config
find_dependency(boost_config)
# Library: boost::core
find_dependency(boost_core)

include("${CMAKE_CURRENT_LIST_DIR}/boost_bind-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_bind-targets.cmake")
