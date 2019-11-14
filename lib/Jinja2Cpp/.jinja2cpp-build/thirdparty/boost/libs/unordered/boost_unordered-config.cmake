
include(CMakeFindDependencyMacro)
# Library: boost::core
find_dependency(boost_core)
# Library: boost::container
find_dependency(boost_container)
# Library: boost::iterator
find_dependency(boost_iterator)
# Library: boost::tuple
find_dependency(boost_tuple)
# Library: boost::move
find_dependency(boost_move)
# Library: boost::functional
find_dependency(boost_functional)
# Library: boost::detail
find_dependency(boost_detail)
# Library: boost::assert
find_dependency(boost_assert)
# Library: boost::throw_exception
find_dependency(boost_throw_exception)
# Library: boost::preprocessor
find_dependency(boost_preprocessor)
# Library: boost::type_traits
find_dependency(boost_type_traits)
# Library: boost::config
find_dependency(boost_config)
# Library: boost::smart_ptr
find_dependency(boost_smart_ptr)

include("${CMAKE_CURRENT_LIST_DIR}/boost_unordered-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_unordered-targets.cmake")
