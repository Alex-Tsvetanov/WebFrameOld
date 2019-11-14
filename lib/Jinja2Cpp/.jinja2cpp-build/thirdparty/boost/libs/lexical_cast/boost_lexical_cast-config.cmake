
include(CMakeFindDependencyMacro)
# Library: boost::core
find_dependency(boost_core)
# Library: boost::static_assert
find_dependency(boost_static_assert)
# Library: boost::container
find_dependency(boost_container)
# Library: boost::mpl
find_dependency(boost_mpl)
# Library: boost::array
find_dependency(boost_array)
# Library: boost::assert
find_dependency(boost_assert)
# Library: boost::range
find_dependency(boost_range)
# Library: boost::type_traits
find_dependency(boost_type_traits)
# Library: boost::numeric_conversion
find_dependency(boost_numeric_conversion)
# Library: boost::integer
find_dependency(boost_integer)
# Library: boost::config
find_dependency(boost_config)
# Library: boost::throw_exception
find_dependency(boost_throw_exception)
# Library: boost::math
find_dependency(boost_math)

include("${CMAKE_CURRENT_LIST_DIR}/boost_lexical_cast-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_lexical_cast-targets.cmake")
