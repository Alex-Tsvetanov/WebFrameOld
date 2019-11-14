
include(CMakeFindDependencyMacro)
# Library: boost::core
find_dependency(boost_core)
# Library: boost::iterator
find_dependency(boost_iterator)
# Library: boost::tuple
find_dependency(boost_tuple)
# Library: boost::bind
find_dependency(boost_bind)
# Library: boost::mpl
find_dependency(boost_mpl)
# Library: boost::detail
find_dependency(boost_detail)
# Library: boost::type_traits
find_dependency(boost_type_traits)
# Library: boost::preprocessor
find_dependency(boost_preprocessor)
# Library: boost::utility
find_dependency(boost_utility)
# Library: boost::config
find_dependency(boost_config)

include("${CMAKE_CURRENT_LIST_DIR}/boost_lambda-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_lambda-targets.cmake")
