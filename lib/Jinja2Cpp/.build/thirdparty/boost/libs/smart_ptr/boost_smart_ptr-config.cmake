
include(CMakeFindDependencyMacro)
# Library: boost::core
find_dependency(boost_core)
# Library: boost::static_assert
find_dependency(boost_static_assert)
# Library: boost::predef
find_dependency(boost_predef)
# Library: boost::move
find_dependency(boost_move)
# Library: boost::assert
find_dependency(boost_assert)
# Library: boost::type_traits
find_dependency(boost_type_traits)
# Library: boost::config
find_dependency(boost_config)
# Library: boost::throw_exception
find_dependency(boost_throw_exception)

include("${CMAKE_CURRENT_LIST_DIR}/boost_smart_ptr-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_smart_ptr-targets.cmake")
