
include(CMakeFindDependencyMacro)
# Library: boost::regex
find_dependency(boost_regex)
# Library: boost::core
find_dependency(boost_core)
# Library: boost::exception
find_dependency(boost_exception)
# Library: boost::iterator
find_dependency(boost_iterator)
# Library: boost::tuple
find_dependency(boost_tuple)
# Library: boost::function
find_dependency(boost_function)
# Library: boost::bind
find_dependency(boost_bind)
# Library: boost::mpl
find_dependency(boost_mpl)
# Library: boost::static_assert
find_dependency(boost_static_assert)
# Library: boost::unordered
find_dependency(boost_unordered)
# Library: boost::assert
find_dependency(boost_assert)
# Library: boost::range
find_dependency(boost_range)
# Library: boost::type_traits
find_dependency(boost_type_traits)
# Library: boost::concept_check
find_dependency(boost_concept_check)
# Library: boost::array
find_dependency(boost_array)
# Library: boost::config
find_dependency(boost_config)
# Library: boost::throw_exception
find_dependency(boost_throw_exception)

include("${CMAKE_CURRENT_LIST_DIR}/boost_algorithm-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_algorithm-targets.cmake")
