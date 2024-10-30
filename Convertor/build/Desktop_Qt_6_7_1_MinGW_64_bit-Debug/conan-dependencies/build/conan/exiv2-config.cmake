########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(exiv2_FIND_QUIETLY)
    set(exiv2_MESSAGE_MODE VERBOSE)
else()
    set(exiv2_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/exiv2Targets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${exiv2_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(exiv2_VERSION_STRING "0.28.2")
set(exiv2_INCLUDE_DIRS ${exiv2_INCLUDE_DIRS_DEBUG} )
set(exiv2_INCLUDE_DIR ${exiv2_INCLUDE_DIRS_DEBUG} )
set(exiv2_LIBRARIES ${exiv2_LIBRARIES_DEBUG} )
set(exiv2_DEFINITIONS ${exiv2_DEFINITIONS_DEBUG} )


# Only the last installed configuration BUILD_MODULES are included to avoid the collision
foreach(_BUILD_MODULE ${exiv2_BUILD_MODULES_PATHS_DEBUG} )
    message(${exiv2_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


