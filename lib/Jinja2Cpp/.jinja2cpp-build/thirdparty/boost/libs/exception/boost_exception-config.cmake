
include(CMakeFindDependencyMacro)
# Library: boost::core
find_dependency(boost_core)
# Library: boost::tuple
find_dependency(boost_tuple)
# Library: boost::assert
find_dependency(boost_assert)
# Library: boost::smart_ptr
find_dependency(boost_smart_ptr)
# Library: boost::config
find_dependency(boost_config)
# Library: boost::throw_exception
find_dependency(boost_throw_exception)

include("${CMAKE_CURRENT_LIST_DIR}/boost_exception-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_exception-targets.cmake")
