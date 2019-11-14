
include(CMakeFindDependencyMacro)
# Library: boost::core
find_dependency(boost_core)
# Library: boost::static_assert
find_dependency(boost_static_assert)
# Library: boost::iterator
find_dependency(boost_iterator)
# Library: boost::predef
find_dependency(boost_predef)
# Library: boost::mpl
find_dependency(boost_mpl)
# Library: boost::functional
find_dependency(boost_functional)
# Library: boost::assert
find_dependency(boost_assert)
# Library: boost::type_traits
find_dependency(boost_type_traits)
# Library: boost::concept_check
find_dependency(boost_concept_check)
# Library: boost::smart_ptr
find_dependency(boost_smart_ptr)
# Library: boost::integer
find_dependency(boost_integer)
# Library: boost::config
find_dependency(boost_config)
# Library: boost::throw_exception
find_dependency(boost_throw_exception)

include("${CMAKE_CURRENT_LIST_DIR}/boost_regex-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_regex-targets.cmake")
