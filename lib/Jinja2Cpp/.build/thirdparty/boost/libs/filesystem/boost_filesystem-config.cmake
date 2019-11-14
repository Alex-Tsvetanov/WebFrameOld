
include(CMakeFindDependencyMacro)
# Library: boost::core
find_dependency(boost_core)
# Library: boost::static_assert
find_dependency(boost_static_assert)
# Library: boost::functional
find_dependency(boost_functional)
# Library: boost::iterator
find_dependency(boost_iterator)
# Library: boost::system
find_dependency(boost_system)
# Library: boost::detail
find_dependency(boost_detail)
# Library: boost::assert
find_dependency(boost_assert)
# Library: boost::range
find_dependency(boost_range)
# Library: boost::type_traits
find_dependency(boost_type_traits)
# Library: boost::smart_ptr
find_dependency(boost_smart_ptr)
# Library: boost::io
find_dependency(boost_io)
# Library: boost::config
find_dependency(boost_config)

include("${CMAKE_CURRENT_LIST_DIR}/boost_filesystem-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_filesystem-targets.cmake")
