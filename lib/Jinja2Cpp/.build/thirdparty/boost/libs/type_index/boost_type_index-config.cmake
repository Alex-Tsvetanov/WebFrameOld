
include(CMakeFindDependencyMacro)
# Library: boost::core
find_dependency(boost_core)
# Library: boost::static_assert
find_dependency(boost_static_assert)
# Library: boost::mpl
find_dependency(boost_mpl)
# Library: boost::smart_ptr
find_dependency(boost_smart_ptr)
# Library: boost::type_traits
find_dependency(boost_type_traits)
# Library: boost::config
find_dependency(boost_config)
# Library: boost::throw_exception
find_dependency(boost_throw_exception)
# Library: boost::preprocessor
find_dependency(boost_preprocessor)

include("${CMAKE_CURRENT_LIST_DIR}/boost_type_index-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_type_index-targets.cmake")
