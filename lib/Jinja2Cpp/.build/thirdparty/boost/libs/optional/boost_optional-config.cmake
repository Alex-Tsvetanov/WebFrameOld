
include(CMakeFindDependencyMacro)
# Library: boost::core
find_dependency(boost_core)
# Library: boost::static_assert
find_dependency(boost_static_assert)
# Library: boost::config
find_dependency(boost_config)
# Library: boost::mpl
find_dependency(boost_mpl)
# Library: boost::move
find_dependency(boost_move)
# Library: boost::detail
find_dependency(boost_detail)
# Library: boost::assert
find_dependency(boost_assert)
# Library: boost::type_traits
find_dependency(boost_type_traits)
# Library: boost::throw_exception
find_dependency(boost_throw_exception)
# Library: boost::utility
find_dependency(boost_utility)

include("${CMAKE_CURRENT_LIST_DIR}/boost_optional-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_optional-targets.cmake")
