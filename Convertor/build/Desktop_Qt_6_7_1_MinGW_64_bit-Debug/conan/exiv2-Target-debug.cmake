# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(exiv2_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(exiv2_FRAMEWORKS_FOUND_DEBUG "${exiv2_FRAMEWORKS_DEBUG}" "${exiv2_FRAMEWORK_DIRS_DEBUG}")

set(exiv2_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET exiv2_DEPS_TARGET)
    add_library(exiv2_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET exiv2_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${exiv2_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${exiv2_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:Iconv::Iconv;PNG::PNG;ZLIB::ZLIB;brotli::brotlidec;brotli::brotlienc;inih::inireader;expat::expat>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### exiv2_DEPS_TARGET to all of them
conan_package_library_targets("${exiv2_LIBS_DEBUG}"    # libraries
                              "${exiv2_LIB_DIRS_DEBUG}" # package_libdir
                              "${exiv2_BIN_DIRS_DEBUG}" # package_bindir
                              "${exiv2_LIBRARY_TYPE_DEBUG}"
                              "${exiv2_IS_HOST_WINDOWS_DEBUG}"
                              exiv2_DEPS_TARGET
                              exiv2_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "exiv2"    # package_name
                              "${exiv2_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${exiv2_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## COMPONENTS TARGET PROPERTIES Debug ########################################

    ########## COMPONENT exiv2lib #############

        set(exiv2_exiv2lib_FRAMEWORKS_FOUND_DEBUG "")
        conan_find_apple_frameworks(exiv2_exiv2lib_FRAMEWORKS_FOUND_DEBUG "${exiv2_exiv2lib_FRAMEWORKS_DEBUG}" "${exiv2_exiv2lib_FRAMEWORK_DIRS_DEBUG}")

        set(exiv2_exiv2lib_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET exiv2_exiv2lib_DEPS_TARGET)
            add_library(exiv2_exiv2lib_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET exiv2_exiv2lib_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${exiv2_exiv2lib_FRAMEWORKS_FOUND_DEBUG}>
                     $<$<CONFIG:Debug>:${exiv2_exiv2lib_SYSTEM_LIBS_DEBUG}>
                     $<$<CONFIG:Debug>:${exiv2_exiv2lib_DEPENDENCIES_DEBUG}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'exiv2_exiv2lib_DEPS_TARGET' to all of them
        conan_package_library_targets("${exiv2_exiv2lib_LIBS_DEBUG}"
                              "${exiv2_exiv2lib_LIB_DIRS_DEBUG}"
                              "${exiv2_exiv2lib_BIN_DIRS_DEBUG}" # package_bindir
                              "${exiv2_exiv2lib_LIBRARY_TYPE_DEBUG}"
                              "${exiv2_exiv2lib_IS_HOST_WINDOWS_DEBUG}"
                              exiv2_exiv2lib_DEPS_TARGET
                              exiv2_exiv2lib_LIBRARIES_TARGETS
                              "_DEBUG"
                              "exiv2_exiv2lib"
                              "${exiv2_exiv2lib_NO_SONAME_MODE_DEBUG}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET exiv2lib
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${exiv2_exiv2lib_OBJECTS_DEBUG}>
                     $<$<CONFIG:Debug>:${exiv2_exiv2lib_LIBRARIES_TARGETS}>
                     )

        if("${exiv2_exiv2lib_LIBS_DEBUG}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET exiv2lib
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         exiv2_exiv2lib_DEPS_TARGET)
        endif()

        set_property(TARGET exiv2lib APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Debug>:${exiv2_exiv2lib_LINKER_FLAGS_DEBUG}>)
        set_property(TARGET exiv2lib APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Debug>:${exiv2_exiv2lib_INCLUDE_DIRS_DEBUG}>)
        set_property(TARGET exiv2lib APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Debug>:${exiv2_exiv2lib_LIB_DIRS_DEBUG}>)
        set_property(TARGET exiv2lib APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Debug>:${exiv2_exiv2lib_COMPILE_DEFINITIONS_DEBUG}>)
        set_property(TARGET exiv2lib APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Debug>:${exiv2_exiv2lib_COMPILE_OPTIONS_DEBUG}>)

    ########## AGGREGATED GLOBAL TARGET WITH THE COMPONENTS #####################
    set_property(TARGET exiv2::exiv2 APPEND PROPERTY INTERFACE_LINK_LIBRARIES exiv2lib)

########## For the modules (FindXXX)
set(exiv2_LIBRARIES_DEBUG exiv2::exiv2)
