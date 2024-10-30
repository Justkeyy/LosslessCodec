# Load the debug and release variables
file(GLOB DATA_FILES "${CMAKE_CURRENT_LIST_DIR}/exiv2-*-data.cmake")

foreach(f ${DATA_FILES})
    include(${f})
endforeach()

# Create the targets for all the components
foreach(_COMPONENT ${exiv2_COMPONENT_NAMES} )
    if(NOT TARGET ${_COMPONENT})
        add_library(${_COMPONENT} INTERFACE IMPORTED)
        message(${exiv2_MESSAGE_MODE} "Conan: Component target declared '${_COMPONENT}'")
    endif()
endforeach()

if(NOT TARGET exiv2::exiv2)
    add_library(exiv2::exiv2 INTERFACE IMPORTED)
    message(${exiv2_MESSAGE_MODE} "Conan: Target declared 'exiv2::exiv2'")
endif()
# Load the debug and release library finders
file(GLOB CONFIG_FILES "${CMAKE_CURRENT_LIST_DIR}/exiv2-Target-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()