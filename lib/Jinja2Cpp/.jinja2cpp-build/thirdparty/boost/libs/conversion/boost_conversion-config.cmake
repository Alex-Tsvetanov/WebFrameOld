
include(CMakeFindDependencyMacro)
# Library: boost::assert
find_dependency(boost_assert)
# Library: boost::type_traits
find_dependency(boost_type_traits)
# Library: boost::typeof
find_dependency(boost_typeof)
# Library: boost::config
find_dependency(boost_config)
# Library: boost::throw_exception
find_dependency(boost_throw_exception)
# Library: boost::smart_ptr
find_dependency(boost_smart_ptr)

include("${CMAKE_CURRENT_LIST_DIR}/boost_conversion-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_conversion-targets.cmake")
