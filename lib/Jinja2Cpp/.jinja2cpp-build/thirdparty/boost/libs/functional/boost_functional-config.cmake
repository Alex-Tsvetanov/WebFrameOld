
include(CMakeFindDependencyMacro)
# Library: boost::function
find_dependency(boost_function)
# Library: boost::core
find_dependency(boost_core)
# Library: boost::static_assert
find_dependency(boost_static_assert)
# Library: boost::iterator
find_dependency(boost_iterator)
# Library: boost::typeof
find_dependency(boost_typeof)
# Library: boost::optional
find_dependency(boost_optional)
# Library: boost::mpl
find_dependency(boost_mpl)
# Library: boost::function_types
find_dependency(boost_function_types)
# Library: boost::detail
find_dependency(boost_detail)
# Library: boost::assert
find_dependency(boost_assert)
# Library: boost::type_traits
find_dependency(boost_type_traits)
# Library: boost::preprocessor
find_dependency(boost_preprocessor)
# Library: boost::integer
find_dependency(boost_integer)
# Library: boost::config
find_dependency(boost_config)
# Library: boost::utility
find_dependency(boost_utility)

include("${CMAKE_CURRENT_LIST_DIR}/boost_functional-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_functional-targets.cmake")
