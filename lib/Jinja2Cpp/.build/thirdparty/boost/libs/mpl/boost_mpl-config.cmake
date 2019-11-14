
include(CMakeFindDependencyMacro)
# Library: boost::core
find_dependency(boost_core)
# Library: boost::static_assert
find_dependency(boost_static_assert)
# Library: boost::predef
find_dependency(boost_predef)
# Library: boost::type_traits
find_dependency(boost_type_traits)
# Library: boost::preprocessor
find_dependency(boost_preprocessor)
# Library: boost::config
find_dependency(boost_config)
# Library: boost::utility
find_dependency(boost_utility)

include("${CMAKE_CURRENT_LIST_DIR}/boost_mpl-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_mpl-targets.cmake")
