
cmake_minimum_required(VERSION 3.5)
project(boost)

macro(find_package NAME)
    if(NOT "${NAME}" MATCHES "^boost_.*$" AND NOT "${NAME}" STREQUAL BCM)
        _find_package(${ARGV})
    else()
        set(${ARGV0}_FOUND ON )
    endif()
endmacro()

include(bcm/share/bcm/cmake/BCMConfig.cmake)

set(EXCLUDE_LIBS)

find_package(PythonLibs)
if(NOT PythonLibs_FOUND)
    list(APPEND EXCLUDE_LIBS python)
endif()

find_package(PythonLibs)
if(NOT PythonLibs_FOUND)
    list(APPEND EXCLUDE_LIBS python)
endif()

find_package(MPI)
if(NOT MPI_FOUND)
    list(APPEND EXCLUDE_LIBS mpi)
endif()

function(cmakelists_library CMakeLists LibraryName)
    get_filename_component(directory "${CMakeLists}" DIRECTORY)
    string(REPLACE "${PROJECT_SOURCE_DIR}/libs/" "" relative_path "${directory}")
    string(REPLACE "/" "_" library_name "${relative_path}")
    set(${LibraryName} "${library_name}" PARENT_SCOPE)
endfunction()

file(GLOB_RECURSE all_library_CMakeLists_files libs/*CMakeLists.txt)

foreach(CMakeLists ${all_library_CMakeLists_files})
    cmakelists_library("${CMakeLists}" LibraryName)

    if(LibraryName)
        set(LIBRARY_${LibraryName}_CMAKELISTS_FILE "${CMakeLists}" CACHE PATH "")
    endif()
endforeach()

function(get_library_cmakelists LibraryName CMakeLists)
    set(${CMakeLists} "${LIBRARY_${LibraryName}_CMAKELISTS_FILE}" PARENT_SCOPE)
endfunction()

option(BOOST_CMAKE_BUILD_TESTS "Build unit tests" ON)

if(NOT BOOST_CMAKE_LIBRARIES)
    set(BOOST_CMAKE_LIBRARIES)
endif()
list(REMOVE_DUPLICATES BOOST_CMAKE_LIBRARIES)
set(BOOST_CMAKE_LIBRARIES_STRING "${BOOST_CMAKE_LIBRARIES}")
string(REGEX REPLACE " " ";" BOOST_CMAKE_LIBRARIES "${BOOST_CMAKE_LIBRARIES}")

function(parse_dependencies CMakeLists Library Dependencies)
    message(STATUS "Parsing dependencies of library ${Library}")
    set(dependency_regex "target_link_libraries\\(boost_${Library} (PUBLIC|PRIVATE|INTERFACE) boost::(.+)\\)")
    file(STRINGS "${CMakeLists}" lines REGEX "${dependency_regex}")

    set(dependencies)

    foreach(line ${lines})
        set(dependency)
        string(REGEX REPLACE "${dependency_regex}" "\\2" dependency "${line}")

        if(dependency)
            message(STATUS " - found dependency ${dependency} of ${Library}")
            list(APPEND dependencies "${dependency}")
        endif()
    endforeach()

    set(${Library} "${library}" PARENT_SCOPE)
    set(${Dependencies} ${dependencies} PARENT_SCOPE)
endfunction()

function(check_library_source_directory LibraryName)
    set(checked_property "__${LibraryName}_CHECKED")
    get_property(checked GLOBAL PROPERTY "${checked_property}")

    if(NOT checked)
        message(STATUS "Checking ${LibraryName} library")
        set_property(GLOBAL PROPERTY "${checked_property}" YES)

        get_library_cmakelists("${LibraryName}" CMakeLists)

        if(EXISTS "${CMakeLists}")
            check_source_directory("${CMakeLists}")
        else()
            message(WARNING "CMakeLists file for library \"${LibraryName}\" not found")
        endif()
    endif()
endfunction()

function(check_source_directory CMakeLists)
    file(READ "${CMakeLists}" CONTENT)

    if("${CONTENT}" MATCHES "project\\(")
        get_filename_component(library_dir "${CMakeLists}" DIRECTORY)
        cmakelists_library("${CMakeLists}" library_name)

        set(included_property __${library_name}_INCLUDED)
        get_property(included GLOBAL PROPERTY "${included_property}")

        if(NOT included)
            parse_dependencies("${CMakeLists}" "${library_name}" dependencies)

            foreach(dependency ${dependencies})
                check_library_source_directory("${dependency}")
            endforeach()

            message(STATUS "Configuring ${library_name} library")
            add_subdirectory("${library_dir}")
            set_property(GLOBAL PROPERTY "${included_property}" YES)
        endif()
    endif()
endfunction()

if(BOOST_CMAKE_LIBRARIES)
    message(STATUS "Configuring libraries ${BOOST_CMAKE_LIBRARIES_STRING} ...")
    set(BOOST_CMAKE_BUILD_TESTS OFF)

    foreach(lib ${BOOST_CMAKE_LIBRARIES})
        check_library_source_directory("${lib}")
    endforeach()
else()
    message(STATUS "Configuring all libraries")


    foreach(CMakeLists ${all_library_CMakeLists_files})
        check_source_directory("${CMakeLists}")
    endforeach()
endif()
