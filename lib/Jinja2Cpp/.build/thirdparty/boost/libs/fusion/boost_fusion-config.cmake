
include(CMakeFindDependencyMacro)
# Library: boost::function_types
find_dependency(boost_function_types)
# Library: boost::core
find_dependency(boost_core)
# Library: boost::static_assert
find_dependency(boost_static_assert)
# Library: boost::typeof
find_dependency(boost_typeof)
# Library: boost::mpl
find_dependency(boost_mpl)
# Library: boost::tuple
find_dependency(boost_tuple)
# Library: boost::functional
find_dependency(boost_functional)
# Library: boost::type_traits
find_dependency(boost_type_traits)
# Library: boost::preprocessor
find_dependency(boost_preprocessor)
# Library: boost::config
find_dependency(boost_config)
# Library: boost::utility
find_dependency(boost_utility)

include("${CMAKE_CURRENT_LIST_DIR}/boost_fusion-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_fusion-targets.cmake")
