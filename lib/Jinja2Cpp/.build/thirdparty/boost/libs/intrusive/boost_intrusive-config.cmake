
include(CMakeFindDependencyMacro)
# Library: boost::core
find_dependency(boost_core)
# Library: boost::static_assert
find_dependency(boost_static_assert)
# Library: boost::move
find_dependency(boost_move)
# Library: boost::functional
find_dependency(boost_functional)
# Library: boost::assert
find_dependency(boost_assert)
# Library: boost::config
find_dependency(boost_config)

include("${CMAKE_CURRENT_LIST_DIR}/boost_intrusive-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_intrusive-targets.cmake")
