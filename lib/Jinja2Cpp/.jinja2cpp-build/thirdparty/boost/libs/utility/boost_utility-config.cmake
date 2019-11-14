
include(CMakeFindDependencyMacro)
# Library: boost::core
find_dependency(boost_core)
# Library: boost::static_assert
find_dependency(boost_static_assert)
# Library: boost::mpl
find_dependency(boost_mpl)
# Library: boost::type_traits
find_dependency(boost_type_traits)
# Library: boost::preprocessor
find_dependency(boost_preprocessor)
# Library: boost::config
find_dependency(boost_config)
# Library: boost::throw_exception
find_dependency(boost_throw_exception)

include("${CMAKE_CURRENT_LIST_DIR}/boost_utility-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_utility-targets.cmake")
