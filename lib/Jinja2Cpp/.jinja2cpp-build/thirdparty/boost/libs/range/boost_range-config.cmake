
include(CMakeFindDependencyMacro)
# Library: boost::regex
find_dependency(boost_regex)
# Library: boost::core
find_dependency(boost_core)
# Library: boost::static_assert
find_dependency(boost_static_assert)
# Library: boost::iterator
find_dependency(boost_iterator)
# Library: boost::tuple
find_dependency(boost_tuple)
# Library: boost::optional
find_dependency(boost_optional)
# Library: boost::mpl
find_dependency(boost_mpl)
# Library: boost::functional
find_dependency(boost_functional)
# Library: boost::detail
find_dependency(boost_detail)
# Library: boost::assert
find_dependency(boost_assert)
# Library: boost::type_traits
find_dependency(boost_type_traits)
# Library: boost::concept_check
find_dependency(boost_concept_check)
# Library: boost::preprocessor
find_dependency(boost_preprocessor)
# Library: boost::array
find_dependency(boost_array)
# Library: boost::config
find_dependency(boost_config)
# Library: boost::numeric_conversion
find_dependency(boost_numeric_conversion)
# Library: boost::utility
find_dependency(boost_utility)

include("${CMAKE_CURRENT_LIST_DIR}/boost_range-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_range-targets.cmake")
