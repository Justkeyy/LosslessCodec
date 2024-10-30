########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

list(APPEND inih_COMPONENT_NAMES inih::libinih inih::inireader)
list(REMOVE_DUPLICATES inih_COMPONENT_NAMES)
if(DEFINED inih_FIND_DEPENDENCY_NAMES)
  list(APPEND inih_FIND_DEPENDENCY_NAMES )
  list(REMOVE_DUPLICATES inih_FIND_DEPENDENCY_NAMES)
else()
  set(inih_FIND_DEPENDENCY_NAMES )
endif()

########### VARIABLES #######################################################################
#############################################################################################
set(inih_PACKAGE_FOLDER_DEBUG "C:/Users/minec/.conan2/p/b/inihd27451109ef4d/p")
set(inih_BUILD_MODULES_PATHS_DEBUG )


set(inih_INCLUDE_DIRS_DEBUG )
set(inih_RES_DIRS_DEBUG )
set(inih_DEFINITIONS_DEBUG )
set(inih_SHARED_LINK_FLAGS_DEBUG )
set(inih_EXE_LINK_FLAGS_DEBUG )
set(inih_OBJECTS_DEBUG )
set(inih_COMPILE_DEFINITIONS_DEBUG )
set(inih_COMPILE_OPTIONS_C_DEBUG )
set(inih_COMPILE_OPTIONS_CXX_DEBUG )
set(inih_LIB_DIRS_DEBUG "${inih_PACKAGE_FOLDER_DEBUG}/lib")
set(inih_BIN_DIRS_DEBUG )
set(inih_LIBRARY_TYPE_DEBUG STATIC)
set(inih_IS_HOST_WINDOWS_DEBUG 1)
set(inih_LIBS_DEBUG INIReader inih)
set(inih_SYSTEM_LIBS_DEBUG )
set(inih_FRAMEWORK_DIRS_DEBUG )
set(inih_FRAMEWORKS_DEBUG )
set(inih_BUILD_DIRS_DEBUG )
set(inih_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(inih_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${inih_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${inih_COMPILE_OPTIONS_C_DEBUG}>")
set(inih_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${inih_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${inih_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${inih_EXE_LINK_FLAGS_DEBUG}>")


set(inih_COMPONENTS_DEBUG inih::libinih inih::inireader)
########### COMPONENT inih::inireader VARIABLES ############################################

set(inih_inih_inireader_INCLUDE_DIRS_DEBUG )
set(inih_inih_inireader_LIB_DIRS_DEBUG "${inih_PACKAGE_FOLDER_DEBUG}/lib")
set(inih_inih_inireader_BIN_DIRS_DEBUG )
set(inih_inih_inireader_LIBRARY_TYPE_DEBUG STATIC)
set(inih_inih_inireader_IS_HOST_WINDOWS_DEBUG 1)
set(inih_inih_inireader_RES_DIRS_DEBUG )
set(inih_inih_inireader_DEFINITIONS_DEBUG )
set(inih_inih_inireader_OBJECTS_DEBUG )
set(inih_inih_inireader_COMPILE_DEFINITIONS_DEBUG )
set(inih_inih_inireader_COMPILE_OPTIONS_C_DEBUG "")
set(inih_inih_inireader_COMPILE_OPTIONS_CXX_DEBUG "")
set(inih_inih_inireader_LIBS_DEBUG INIReader)
set(inih_inih_inireader_SYSTEM_LIBS_DEBUG )
set(inih_inih_inireader_FRAMEWORK_DIRS_DEBUG )
set(inih_inih_inireader_FRAMEWORKS_DEBUG )
set(inih_inih_inireader_DEPENDENCIES_DEBUG inih::libinih)
set(inih_inih_inireader_SHARED_LINK_FLAGS_DEBUG )
set(inih_inih_inireader_EXE_LINK_FLAGS_DEBUG )
set(inih_inih_inireader_NO_SONAME_MODE_DEBUG FALSE)

# COMPOUND VARIABLES
set(inih_inih_inireader_LINKER_FLAGS_DEBUG
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${inih_inih_inireader_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${inih_inih_inireader_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${inih_inih_inireader_EXE_LINK_FLAGS_DEBUG}>
)
set(inih_inih_inireader_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${inih_inih_inireader_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${inih_inih_inireader_COMPILE_OPTIONS_C_DEBUG}>")
########### COMPONENT inih::libinih VARIABLES ############################################

set(inih_inih_libinih_INCLUDE_DIRS_DEBUG )
set(inih_inih_libinih_LIB_DIRS_DEBUG "${inih_PACKAGE_FOLDER_DEBUG}/lib")
set(inih_inih_libinih_BIN_DIRS_DEBUG )
set(inih_inih_libinih_LIBRARY_TYPE_DEBUG STATIC)
set(inih_inih_libinih_IS_HOST_WINDOWS_DEBUG 1)
set(inih_inih_libinih_RES_DIRS_DEBUG )
set(inih_inih_libinih_DEFINITIONS_DEBUG )
set(inih_inih_libinih_OBJECTS_DEBUG )
set(inih_inih_libinih_COMPILE_DEFINITIONS_DEBUG )
set(inih_inih_libinih_COMPILE_OPTIONS_C_DEBUG "")
set(inih_inih_libinih_COMPILE_OPTIONS_CXX_DEBUG "")
set(inih_inih_libinih_LIBS_DEBUG inih)
set(inih_inih_libinih_SYSTEM_LIBS_DEBUG )
set(inih_inih_libinih_FRAMEWORK_DIRS_DEBUG )
set(inih_inih_libinih_FRAMEWORKS_DEBUG )
set(inih_inih_libinih_DEPENDENCIES_DEBUG )
set(inih_inih_libinih_SHARED_LINK_FLAGS_DEBUG )
set(inih_inih_libinih_EXE_LINK_FLAGS_DEBUG )
set(inih_inih_libinih_NO_SONAME_MODE_DEBUG FALSE)

# COMPOUND VARIABLES
set(inih_inih_libinih_LINKER_FLAGS_DEBUG
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${inih_inih_libinih_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${inih_inih_libinih_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${inih_inih_libinih_EXE_LINK_FLAGS_DEBUG}>
)
set(inih_inih_libinih_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${inih_inih_libinih_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${inih_inih_libinih_COMPILE_OPTIONS_C_DEBUG}>")