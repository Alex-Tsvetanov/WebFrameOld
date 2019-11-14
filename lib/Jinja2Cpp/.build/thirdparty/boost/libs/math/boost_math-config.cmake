
include(CMakeFindDependencyMacro)
# Library: boost::function
find_dependency(boost_function)
# Library: boost::core
find_dependency(boost_core)
# Library: boost::static_assert
find_dependency(boost_static_assert)
# Library: boost::predef
find_dependency(boost_predef)
# Library: boost::tuple
find_dependency(boost_tuple)
# Library: boost::array
find_dependency(boost_array)
# Library: boost::mpl
find_dependency(boost_mpl)
# Library: boost::atomic
find_dependency(boost_atomic)
# Library: boost::detail
find_dependency(boost_detail)
# Library: boost::fusion
find_dependency(boost_fusion)
# Library: boost::assert
find_dependency(boost_assert)
# Library: boost::range
find_dependency(boost_range)
# Library: boost::type_traits
find_dependency(boost_type_traits)
# Library: boost::concept_check
find_dependency(boost_concept_check)
# Library: boost::smart_ptr
find_dependency(boost_smart_ptr)
# Library: boost::lexical_cast
find_dependency(boost_lexical_cast)
# Library: boost::utility
find_dependency(boost_utility)
# Library: boost::config
find_dependency(boost_config)
# Library: boost::throw_exception
find_dependency(boost_throw_exception)
# Library: boost::lambda
find_dependency(boost_lambda)
# Skip Library: boost_math

# Skip Library: boost_math

# Skip Library: boost_math

# Skip Library: boost_math

# Skip Library: boost_math

# Skip Library: boost_math


include("${CMAKE_CURRENT_LIST_DIR}/boost_math-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_math-targets.cmake")
