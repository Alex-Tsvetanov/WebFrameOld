
include(CMakeFindDependencyMacro)
# Library: boost::function_types
find_dependency(boost_function_types)
# Library: boost::core
find_dependency(boost_core)
# Library: boost::static_assert
find_dependency(boost_static_assert)
# Library: boost::optional
find_dependency(boost_optional)
# Library: boost::mpl
find_dependency(boost_mpl)
# Library: boost::detail
find_dependency(boost_detail)
# Library: boost::assert
find_dependency(boost_assert)
# Library: boost::fusion
find_dependency(boost_fusion)
# Library: boost::type_traits
find_dependency(boost_type_traits)
# Library: boost::concept_check
find_dependency(boost_concept_check)
# Library: boost::smart_ptr
find_dependency(boost_smart_ptr)
# Library: boost::utility
find_dependency(boost_utility)
# Library: boost::config
find_dependency(boost_config)
# Library: boost::conversion
find_dependency(boost_conversion)

include("${CMAKE_CURRENT_LIST_DIR}/boost_iterator-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_iterator-targets.cmake")
