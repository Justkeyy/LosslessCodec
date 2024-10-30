# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(inih_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(inih_FRAMEWORKS_FOUND_DEBUG "${inih_FRAMEWORKS_DEBUG}" "${inih_FRAMEWORK_DIRS_DEBUG}")

set(inih_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET inih_DEPS_TARGET)
    add_library(inih_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET inih_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${inih_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${inih_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:inih::libinih>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### inih_DEPS_TARGET to all of them
conan_package_library_targets("${inih_LIBS_DEBUG}"    # libraries
                              "${inih_LIB_DIRS_DEBUG}" # package_libdir
                              "${inih_BIN_DIRS_DEBUG}" # package_bindir
                              "${inih_LIBRARY_TYPE_DEBUG}"
                              "${inih_IS_HOST_WINDOWS_DEBUG}"
                              inih_DEPS_TARGET
                              inih_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "inih"    # package_name
                              "${inih_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${inih_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## COMPONENTS TARGET PROPERTIES Debug ########################################

    ########## COMPONENT inih::inireader #############

        set(inih_inih_inireader_FRAMEWORKS_FOUND_DEBUG "")
        conan_find_apple_frameworks(inih_inih_inireader_FRAMEWORKS_FOUND_DEBUG "${inih_inih_inireader_FRAMEWORKS_DEBUG}" "${inih_inih_inireader_FRAMEWORK_DIRS_DEBUG}")

        set(inih_inih_inireader_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET inih_inih_inireader_DEPS_TARGET)
            add_library(inih_inih_inireader_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET inih_inih_inireader_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${inih_inih_inireader_FRAMEWORKS_FOUND_DEBUG}>
                     $<$<CONFIG:Debug>:${inih_inih_inireader_SYSTEM_LIBS_DEBUG}>
                     $<$<CONFIG:Debug>:${inih_inih_inireader_DEPENDENCIES_DEBUG}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'inih_inih_inireader_DEPS_TARGET' to all of them
        conan_package_library_targets("${inih_inih_inireader_LIBS_DEBUG}"
                              "${inih_inih_inireader_LIB_DIRS_DEBUG}"
                              "${inih_inih_inireader_BIN_DIRS_DEBUG}" # package_bindir
                              "${inih_inih_inireader_LIBRARY_TYPE_DEBUG}"
                              "${inih_inih_inireader_IS_HOST_WINDOWS_DEBUG}"
                              inih_inih_inireader_DEPS_TARGET
                              inih_inih_inireader_LIBRARIES_TARGETS
                              "_DEBUG"
                              "inih_inih_inireader"
                              "${inih_inih_inireader_NO_SONAME_MODE_DEBUG}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET inih::inireader
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${inih_inih_inireader_OBJECTS_DEBUG}>
                     $<$<CONFIG:Debug>:${inih_inih_inireader_LIBRARIES_TARGETS}>
                     )

        if("${inih_inih_inireader_LIBS_DEBUG}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET inih::inireader
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         inih_inih_inireader_DEPS_TARGET)
        endif()

        set_property(TARGET inih::inireader APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Debug>:${inih_inih_inireader_LINKER_FLAGS_DEBUG}>)
        set_property(TARGET inih::inireader APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Debug>:${inih_inih_inireader_INCLUDE_DIRS_DEBUG}>)
        set_property(TARGET inih::inireader APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Debug>:${inih_inih_inireader_LIB_DIRS_DEBUG}>)
        set_property(TARGET inih::inireader APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Debug>:${inih_inih_inireader_COMPILE_DEFINITIONS_DEBUG}>)
        set_property(TARGET inih::inireader APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Debug>:${inih_inih_inireader_COMPILE_OPTIONS_DEBUG}>)

    ########## COMPONENT inih::libinih #############

        set(inih_inih_libinih_FRAMEWORKS_FOUND_DEBUG "")
        conan_find_apple_frameworks(inih_inih_libinih_FRAMEWORKS_FOUND_DEBUG "${inih_inih_libinih_FRAMEWORKS_DEBUG}" "${inih_inih_libinih_FRAMEWORK_DIRS_DEBUG}")

        set(inih_inih_libinih_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET inih_inih_libinih_DEPS_TARGET)
            add_library(inih_inih_libinih_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET inih_inih_libinih_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${inih_inih_libinih_FRAMEWORKS_FOUND_DEBUG}>
                     $<$<CONFIG:Debug>:${inih_inih_libinih_SYSTEM_LIBS_DEBUG}>
                     $<$<CONFIG:Debug>:${inih_inih_libinih_DEPENDENCIES_DEBUG}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'inih_inih_libinih_DEPS_TARGET' to all of them
        conan_package_library_targets("${inih_inih_libinih_LIBS_DEBUG}"
                              "${inih_inih_libinih_LIB_DIRS_DEBUG}"
                              "${inih_inih_libinih_BIN_DIRS_DEBUG}" # package_bindir
                              "${inih_inih_libinih_LIBRARY_TYPE_DEBUG}"
                              "${inih_inih_libinih_IS_HOST_WINDOWS_DEBUG}"
                              inih_inih_libinih_DEPS_TARGET
                              inih_inih_libinih_LIBRARIES_TARGETS
                              "_DEBUG"
                              "inih_inih_libinih"
                              "${inih_inih_libinih_NO_SONAME_MODE_DEBUG}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET inih::libinih
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${inih_inih_libinih_OBJECTS_DEBUG}>
                     $<$<CONFIG:Debug>:${inih_inih_libinih_LIBRARIES_TARGETS}>
                     )

        if("${inih_inih_libinih_LIBS_DEBUG}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET inih::libinih
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         inih_inih_libinih_DEPS_TARGET)
        endif()

        set_property(TARGET inih::libinih APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Debug>:${inih_inih_libinih_LINKER_FLAGS_DEBUG}>)
        set_property(TARGET inih::libinih APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Debug>:${inih_inih_libinih_INCLUDE_DIRS_DEBUG}>)
        set_property(TARGET inih::libinih APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Debug>:${inih_inih_libinih_LIB_DIRS_DEBUG}>)
        set_property(TARGET inih::libinih APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Debug>:${inih_inih_libinih_COMPILE_DEFINITIONS_DEBUG}>)
        set_property(TARGET inih::libinih APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Debug>:${inih_inih_libinih_COMPILE_OPTIONS_DEBUG}>)

    ########## AGGREGATED GLOBAL TARGET WITH THE COMPONENTS #####################
    set_property(TARGET inih::inih APPEND PROPERTY INTERFACE_LINK_LIBRARIES inih::inireader)
    set_property(TARGET inih::inih APPEND PROPERTY INTERFACE_LINK_LIBRARIES inih::libinih)

########## For the modules (FindXXX)
set(inih_LIBRARIES_DEBUG inih::inih)
