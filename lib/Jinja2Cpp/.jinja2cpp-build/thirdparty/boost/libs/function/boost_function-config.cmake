
include(CMakeFindDependencyMacro)
# Library: boost::core
find_dependency(boost_core)
# Library: boost::bind
find_dependency(boost_bind)
# Library: boost::mpl
find_dependency(boost_mpl)
# Library: boost::move
find_dependency(boost_move)
# Library: boost::type_traits
find_dependency(boost_type_traits)
# Library: boost::assert
find_dependency(boost_assert)
# Library: boost::type_index
find_dependency(boost_type_index)
# Library: boost::preprocessor
find_dependency(boost_preprocessor)
# Library: boost::integer
find_dependency(boost_integer)
# Library: boost::config
find_dependency(boost_config)
# Library: boost::throw_exception
find_dependency(boost_throw_exception)
# Library: boost::typeof
find_dependency(boost_typeof)

include("${CMAKE_CURRENT_LIST_DIR}/boost_function-targets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/properties-boost_function-targets.cmake")
