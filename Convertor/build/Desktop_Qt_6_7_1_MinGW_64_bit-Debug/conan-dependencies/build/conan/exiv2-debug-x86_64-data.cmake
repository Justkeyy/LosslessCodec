########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

list(APPEND exiv2_COMPONENT_NAMES exiv2lib)
list(REMOVE_DUPLICATES exiv2_COMPONENT_NAMES)
if(DEFINED exiv2_FIND_DEPENDENCY_NAMES)
  list(APPEND exiv2_FIND_DEPENDENCY_NAMES Iconv PNG ZLIB expat brotli inih)
  list(REMOVE_DUPLICATES exiv2_FIND_DEPENDENCY_NAMES)
else()
  set(exiv2_FIND_DEPENDENCY_NAMES Iconv PNG ZLIB expat brotli inih)
endif()
set(Iconv_FIND_MODE "NO_MODULE")
set(PNG_FIND_MODE "NO_MODULE")
set(ZLIB_FIND_MODE "NO_MODULE")
set(expat_FIND_MODE "NO_MODULE")
set(brotli_FIND_MODE "NO_MODULE")
set(inih_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(exiv2_PACKAGE_FOLDER_DEBUG "C:/Users/minec/.conan2/p/b/exiv2f944dd59cfe03/p")
set(exiv2_BUILD_MODULES_PATHS_DEBUG )


set(exiv2_INCLUDE_DIRS_DEBUG "${exiv2_PACKAGE_FOLDER_DEBUG}/include")
set(exiv2_RES_DIRS_DEBUG )
set(exiv2_DEFINITIONS_DEBUG "-DWIN32_LEAN_AND_MEAN")
set(exiv2_SHARED_LINK_FLAGS_DEBUG )
set(exiv2_EXE_LINK_FLAGS_DEBUG )
set(exiv2_OBJECTS_DEBUG )
set(exiv2_COMPILE_DEFINITIONS_DEBUG "WIN32_LEAN_AND_MEAN")
set(exiv2_COMPILE_OPTIONS_C_DEBUG )
set(exiv2_COMPILE_OPTIONS_CXX_DEBUG )
set(exiv2_LIB_DIRS_DEBUG "${exiv2_PACKAGE_FOLDER_DEBUG}/lib")
set(exiv2_BIN_DIRS_DEBUG )
set(exiv2_LIBRARY_TYPE_DEBUG STATIC)
set(exiv2_IS_HOST_WINDOWS_DEBUG 1)
set(exiv2_LIBS_DEBUG exiv2)
set(exiv2_SYSTEM_LIBS_DEBUG psapi ws2_32)
set(exiv2_FRAMEWORK_DIRS_DEBUG )
set(exiv2_FRAMEWORKS_DEBUG )
set(exiv2_BUILD_DIRS_DEBUG )
set(exiv2_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(exiv2_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${exiv2_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${exiv2_COMPILE_OPTIONS_C_DEBUG}>")
set(exiv2_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${exiv2_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${exiv2_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${exiv2_EXE_LINK_FLAGS_DEBUG}>")


set(exiv2_COMPONENTS_DEBUG exiv2lib)
########### COMPONENT exiv2lib VARIABLES ############################################

set(exiv2_exiv2lib_INCLUDE_DIRS_DEBUG "${exiv2_PACKAGE_FOLDER_DEBUG}/include")
set(exiv2_exiv2lib_LIB_DIRS_DEBUG "${exiv2_PACKAGE_FOLDER_DEBUG}/lib")
set(exiv2_exiv2lib_BIN_DIRS_DEBUG )
set(exiv2_exiv2lib_LIBRARY_TYPE_DEBUG STATIC)
set(exiv2_exiv2lib_IS_HOST_WINDOWS_DEBUG 1)
set(exiv2_exiv2lib_RES_DIRS_DEBUG )
set(exiv2_exiv2lib_DEFINITIONS_DEBUG "-DWIN32_LEAN_AND_MEAN")
set(exiv2_exiv2lib_OBJECTS_DEBUG )
set(exiv2_exiv2lib_COMPILE_DEFINITIONS_DEBUG "WIN32_LEAN_AND_MEAN")
set(exiv2_exiv2lib_COMPILE_OPTIONS_C_DEBUG "")
set(exiv2_exiv2lib_COMPILE_OPTIONS_CXX_DEBUG "")
set(exiv2_exiv2lib_LIBS_DEBUG exiv2)
set(exiv2_exiv2lib_SYSTEM_LIBS_DEBUG psapi ws2_32)
set(exiv2_exiv2lib_FRAMEWORK_DIRS_DEBUG )
set(exiv2_exiv2lib_FRAMEWORKS_DEBUG )
set(exiv2_exiv2lib_DEPENDENCIES_DEBUG Iconv::Iconv PNG::PNG ZLIB::ZLIB brotli::brotlidec brotli::brotlienc inih::inireader expat::expat)
set(exiv2_exiv2lib_SHARED_LINK_FLAGS_DEBUG )
set(exiv2_exiv2lib_EXE_LINK_FLAGS_DEBUG )
set(exiv2_exiv2lib_NO_SONAME_MODE_DEBUG FALSE)

# COMPOUND VARIABLES
set(exiv2_exiv2lib_LINKER_FLAGS_DEBUG
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${exiv2_exiv2lib_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${exiv2_exiv2lib_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${exiv2_exiv2lib_EXE_LINK_FLAGS_DEBUG}>
)
set(exiv2_exiv2lib_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${exiv2_exiv2lib_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${exiv2_exiv2lib_COMPILE_OPTIONS_C_DEBUG}>")